package kr.or.ddit.file.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.commons.exception.DataNotFoundException;
import kr.or.ddit.enumtype.ServiceResult;
import kr.or.ddit.file.dao.FileDAO;
import kr.or.ddit.file.dao.FileUtilDAO;
import kr.or.ddit.file.vo.AtchFIleVO;
import kr.or.ddit.file.vo.AttatchWrapper;
import kr.or.ddit.file.vo.BoVO;
import kr.or.ddit.file.vo.FileVO;
import kr.or.ddit.init.FileSavePathInfo;
import kr.or.ddit.issue.vo.IssueVO;
import kr.or.ddit.work.vo.WorkFileVO;
import kr.or.ddit.work.vo.WorkVO;
import sun.print.resources.serviceui;
@Service
public class FileServiceImpl implements FileService {

	@Inject
	private  FileDAO fileDao;
	
	@Inject 
	private FileUtilDAO fileUtilDao;
	
	@Inject
	private FileSavePathInfo savePathInfo;

	
	@Override
	public List<AttatchWrapper> retrieveFileList(Map<String, Object> pMap) {
		List<AtchFIleVO> attatchList = fileDao.selectAttatchList(pMap);
		List<AttatchWrapper> wrapperList = new ArrayList<>();
		attatchList.forEach((attatch)-> {
			/* if(pMap.containsKey("clCode")) {
			} */
			wrapperList.add(new AttatchWrapper(attatch));
		});
		return wrapperList;
	}

  //파일에서 업로드하는 파일
	@Override 
	public ServiceResult updateFileList(FileVO fileVO) {
		List<AtchFIleVO>  fileList =  fileVO.getAttatchList();
		ServiceResult result =  ServiceResult.NOTEXIST;
		if(fileList ==null || fileList.isEmpty()) return result;
		 List<AtchFIleVO> insertFileList = new ArrayList<>();
		 for(AtchFIleVO vo	: fileList) {
				if("0".equals(vo.getTempAt())) { //파일 삭제 여부가 0인 경우 파일을 추가해야 함
					insertFileList.add(vo);
				}
			}
		 if(insertFileList==null || insertFileList.isEmpty())  return result;
		 
		 //fileVO.setAttatchList(insertFileList);
		 int cnt =  0;
		 for( AtchFIleVO vo: insertFileList) {
			  cnt +=	fileDao.updateFileStatus(vo);
		 }
		 if(cnt> 0) {
			 result =	 ServiceResult.OK;
		 }else {
			 result = ServiceResult.FAIL;
		 }
		return result;
	}
	
	@Override
	@Transactional
	public String updateFileName(AtchFIleVO fileVO) {
		
		AtchFIleVO	saveFileInfo =	fileUtilDao.fileSelect(fileVO);
		if(saveFileInfo==null) {
			throw new DataNotFoundException(fileVO.getFileNm());
		}
		String result = "FAIL";
		int cnt =  fileDao.updateFileName(fileVO);
		if(cnt>0) {
			String menuCode = fileVO.getMenuClCode();
			switch(menuCode) {
			
			case "IS" :
				cnt =fileDao.updateIssueFileName(fileVO);
					break;
			case "WO" : 
				cnt =fileDao.updateWorkFIleName(fileVO);
				break;
			case "FI" : 
				cnt = 1;
				break; 
			default :
				cnt =fileDao.updateBoFileName(fileVO); 
				break;
			}
			if(cnt>0) {
				result = "OK";
			}
		}
		return result;
	}

	@Transactional
	@Override
	public String deleteFile(AtchFIleVO fileVO) {
		String	result = "FAIL";
		int total = 0;
		List<String> saveNames = new ArrayList<>();
		//일단 파일들의 번호 꺼냄
		String[] delFileNos = fileVO.getFileNos();
		List<String> fileList = 	new ArrayList<>();
		List<String>  workFileList = 	new ArrayList<>();
		List<String> issueFileList = 	new ArrayList<>();
		List<String>  BoardFileList= 	new ArrayList<>();
		int fileCnt = 0 ;
		int workCnt = 0 ; 
		int issueCnt = 0 ; 
		int boardCnt = 0 ;
		 WorkVO workVO = new WorkVO();
		 IssueVO issueVO = new IssueVO();
		 BoVO boVO = new BoVO();
			if(delFileNos!=null && delFileNos.length>0) {
				for(int i =0 ; i<delFileNos.length ; i++) {
					//삭제핧 파일의 정보를 얻어옴 --> 파일 번호 만큼 
					AtchFIleVO saveFileVO =  fileDao.selectAttatchDetail(delFileNos[i]);
					//파일명 string list 받아옴
					 saveNames.add(saveFileVO.getFileSavedNm());
					 String menu= saveFileVO.getMenuClCode();
					
					 switch(menu) {
						case "IS" :
							issueFileList.add(saveFileVO.getFileNo());
							break;
						case "WO" : 
							workFileList.add(saveFileVO.getFileNo());
							break;
						case "FI" : 
							fileList.add(saveFileVO.getFileNo());
							break; 
						default :
							BoardFileList.add(saveFileVO.getFileNo());
							break;
						}
							//switch case 를 통해 분기 --> bofile의 경우 
							 //work file의 경우 
							 //file의 경우엔 그냥 성공 
								
					 }
				fileCnt = fileList.size(); // 파일은 attatch에서만 삭제 해주면 됨
				if(issueFileList!=null && issueFileList.size()>0) {
					issueVO.setDelFileNo(issueFileList.toArray(new String[issueFileList.size()] ));
					issueCnt = fileDao.deleteIssueFile(issueVO);
				}
				if(workFileList!=null && workFileList.size()>0) {
					workVO.setDelFileNo(workFileList.toArray(new String[workFileList.size()] ));
					workCnt = fileDao.deleteWorkFile(workVO);
				}
				if(BoardFileList!=null && BoardFileList.size()>0) {
					issueVO.setDelFileNo(BoardFileList.toArray(new String[BoardFileList.size()] ));
					boardCnt = fileDao.deleteBoFile(boVO);
				}
				
				total =	fileDao.deleteAttatchAll(fileVO);
							
				int num = fileCnt + issueCnt + workCnt+boardCnt;
				if(total == num) {
					 deleteBinaryFiles(saveNames);
					 result = "OK";
				}
					 
				} 
		 
	 
		
		return result;
	}
	@Transactional
	private void deleteBinaryFiles(List<String> saveNames) {
		 File saveFolder = savePathInfo.getTempSaveFolder();
		if(saveNames==null || saveNames.size()==0) return;
		for(String saveName : saveNames) {
			FileUtils.deleteQuietly(new File(saveFolder, saveName));
		}
	}

	@Override
	@Transactional
	public void deleteTempFile() {
		
		List<AtchFIleVO> tempFileList =	fileDao.selectDeleteTemp();
		List<String> saveNames =new  ArrayList<>();
		
		AtchFIleVO attatch = new AtchFIleVO();
		List<String> tempFileNos = 	new ArrayList<>();
		int boardCnt = 0 ;
		if(tempFileList!=null && tempFileList.size()>0) {
			/*workVO.setDelFileNo(tempFileList.toArray(new String[tempFileList.size()] ));*/
			 
			for(AtchFIleVO vo :  tempFileList ) {
				saveNames.add( vo.getFileSavedNm());
				tempFileNos.add(vo.getFileNo());
			}
			attatch.setFileNos(tempFileNos.toArray(new String[tempFileNos.size()] ));
			System.out.println(tempFileNos);
			
			boardCnt = fileDao.deleteAttatchAll(attatch);
		}
		
		if(boardCnt== saveNames.size()) {
			deleteBinaryFiles(saveNames);
		}
		
	}
 
}
