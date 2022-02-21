package kr.or.ddit.issue.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.io.FileUtils;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.accept.vo.ProjectMemVO;
import kr.or.ddit.commons.exception.DataNotFoundException;
import kr.or.ddit.enumtype.ServiceResult;
import kr.or.ddit.init.FileSavePathInfo;
import kr.or.ddit.issue.dao.IssueDAO;
import kr.or.ddit.issue.dao.IssueFileDAO;
import kr.or.ddit.issue.vo.IssueFileVO;
import kr.or.ddit.issue.vo.IssueVO;
import kr.or.ddit.mypage.vo.MemSetVO;
import kr.or.ddit.pushMsg.dao.PushMsgDAO;
import kr.or.ddit.pushMsg.vo.PushMsgVO;
import kr.or.ddit.work.dao.WorkDAO;
import kr.or.ddit.work.service.WorkService;
import kr.or.ddit.work.vo.ExtendPagingVO;
import kr.or.ddit.work.vo.ObserverVO;
import kr.or.ddit.work.vo.WorkFileVO;
import kr.or.ddit.work.vo.WorkVO;

@Service
public class IssueServiceImpl implements IssueService {
	@Inject
	private IssueDAO issueDao;
	
	@Inject 
	private IssueFileDAO issueFileDao;
	
	@Inject
	private FileSavePathInfo savePathInfo;
	
	

	@Override
	public String updateSoluteIssue(IssueVO issueVO) {
		 String result = "FAIL";
		 String[] issueNos =	issueVO.getIssueNos();
		 int cnt = 0 ;
		 
		 for(int i =0 ; i<issueNos.length;i++) {
				cnt += issueDao.updateSolute(issueNos[i]);
		}
		 	if(cnt==issueNos.length) {
		 		result ="OK";
		 	}
		 
		return result;
	}

	
	
	@Override
	@Transactional
	public String addIssue(IssueVO issueVO) {
		 String result = "FAIL";
		 ServiceResult end = ServiceResult.FAIL;
		 List<ObserverVO> observerList = new ArrayList<>();
		 List<ObserverVO>  observerAndMe = new ArrayList<>();
		 WorkVO saved =  issueDao.selectWorkDetailInfo(issueVO);
		 System.out.println(saved);
		if(saved!=null) {
			 int cnt = issueDao.insertIssue(issueVO);
			 
			 	if(cnt>0) {
			 		end = insertIssueFile(issueVO);
			 		if(ServiceResult.OK.equals(end)) {
			 			observerAndMe=saved.getWorkObserverList();
			 			 
			 			for(int i =0 ; i<observerAndMe.size(); i++) {
		 					ObserverVO vo =observerAndMe.get(i);
		 					if(vo.getMemId().equals(issueVO.getMemId())) {
		 						 continue;
		 					}else {
		 						observerList.add(vo);
		 					}
		 				}
			 			if(observerList!=null || observerList.size()>0 ) {
			 				String[] memIds =new String[observerList.size()];
			 				for(int i =0 ; i<observerList.size(); i++) {
			 					ObserverVO vo =observerList.get(i);
			 					memIds[i] = vo.getObserverId();
			 				}
			 				issueVO.setMemIds(memIds);
			 				issueVO.setWorkObserverList(observerList);
			 			}
			 			result ="OK";
			 			}
			 		}else {
			 			result = "FILEFAIL";
			 		}
		}
		return result;
	}
	
	
	
	
	
	//temp 파일 여부 변경
	@Transactional
	private int updateFile(IssueVO issueVO)  {
		List<IssueFileVO> issueFileList =	issueVO.getIssueFileList();
		if(issueFileList==null || issueFileList.isEmpty()) return 0;
		int cnt = issueFileDao.updateIssueFile(issueVO);
		System.out.println(" 파일 cnt 결과 " + cnt);
		return cnt; 
		
	}
	
	@Transactional
	public ServiceResult insertIssueFile(IssueVO issueVO) {
		ServiceResult result = ServiceResult.FAIL;
		List<IssueFileVO> issueFileList =	issueVO.getIssueFileList();
		if(issueFileList==null || issueFileList.isEmpty()) return ServiceResult.OK;
		List<IssueFileVO> insertFileList = new ArrayList<>();
		for(IssueFileVO vo : issueFileList) {
			if("0".equals(vo.getIssueFiletempAt())) {
				insertFileList.add(vo);
			}
		}
		if(insertFileList==null || insertFileList.isEmpty()) return ServiceResult.OK;
		issueVO.setIssueFileList(insertFileList);//위에서 필터링된 리스트 다시 넣어줍니다.
		int cnt = issueFileDao.insertIssueFiles(issueVO);
		 if(cnt>0) {
			cnt += updateFile(issueVO);
			return ServiceResult.OK;
		 }else {
			return ServiceResult.FAIL;
		 }
		
	}
	
	@Override
	public void retrieveIssueList(ExtendPagingVO<IssueVO> pagingVO) {
		pagingVO.setTotalRecord(issueDao.selectIssueListCount(pagingVO));
		pagingVO.setDataList(issueDao.selectIssueList(pagingVO));
	}

 

	@Override
	public IssueVO retrieveWorkDetail(IssueVO issueVO) {
		IssueVO issue = issueDao.selectIssueDetails(issueVO);
		if(issue==null) throw new DataNotFoundException(issueVO.getIssueNo() +"");
		
		return issue;
	}

	@Override
	public String deleteAllIssue(IssueVO issueVO) {
		int cnt = 0 ;
		int end = 0 ;
		
		ServiceResult result = ServiceResult.FAIL;
		String resultId = "DELFAIL";
		String[] issueNos =	issueVO.getIssueNos();
		List<String> saveNames = new ArrayList<>();
		IssueVO vo = new IssueVO();
		
		List<ProjectMemVO> roles=issueVO.getRoleList();
		 String memRole = "";
		 String pCode =	issueVO.getPrjctNo();
		 
		 for(ProjectMemVO pMember :	roles ) {
			 String findPcode=pMember.getPrjctNo() +"";
			 if(pCode.equals(findPcode)) {
				 memRole=	pMember.getAuthor();
			 }
		 }
		 
		for(int i =0 ; i<issueNos.length;i++) {
			issueVO.setIssueNo(issueNos[i]);
			vo = issueDao.selectIssueDetails(issueVO);
			if(vo==null) throw new DataNotFoundException(issueNos[i]);
			if(vo.getMemId().equals(issueVO.getMemId())||"ROLE_PM".equals(memRole)) {
				cnt ++;
				List<IssueFileVO> fileList = vo.getIssueFileList();
					if(! fileList.isEmpty()) {
						for(IssueFileVO fileVO : fileList) {
							  if(fileVO.getIssueFileSavedNm() != null) {
								  saveNames.add( fileVO.getIssueFileSavedNm());
							  }
						}
					}
				
				}
		}
		 int rowcnt = 0 ;
		 int Info = 0;
		 
		 if(cnt == issueNos.length) {
			 
			 rowcnt = 	issueFileDao.deleteAllIssueFile(issueVO);
			 end = issueFileDao.deleteAttatchAll(issueVO);
			 if(rowcnt == end) {
				 for(int i = 0; i <cnt;i++) {
					 issueDao.deleteIssue(issueNos[i]);
					 Info ++ ;
				 }
			 }
			 if(Info > 0) {
				 deleteBinaryFiles(saveNames);
					result = ServiceResult.OK;
					resultId = "OK";
			 }
			 
		 }
		
		 
		return resultId;
	}
	

	@Override
	public String deleteIssue(IssueVO issueVO) {
		return null;
		
			 		
			 		 
		}
	





	@Transactional
	@Override
	public String updateIssue(IssueVO issueVO) {
		IssueVO saved = issueDao.selectIssueForUpdate(issueVO);
		if(saved==null) throw new DataNotFoundException(issueVO.getIssueNo());
		ServiceResult result = null;
		String resultId = null;
		int cnt= 0 ;
		int end = 0;
		int obListSize = saved.getWorkObserverList().size();
		List<ProjectMemVO> roles=issueVO.getRoleList();
		 String memRole = "";
		 String pCode =	issueVO.getPrjctNo();
		 
		 for(ProjectMemVO vo :	roles ) {
			 String findPcode=vo.getPrjctNo() +"";
			 if(pCode.equals(findPcode)) {
				 memRole=	vo.getAuthor();
			 }
		 }
		
		String[] obList = new String[obListSize];
		int idx = 0;
		for(ObserverVO obVO : saved.getWorkObserverList()) {
			obList[idx] = obVO.getMemId();
			idx++;
		}
		issueVO.setMemIds(obList);
		
		if(saved.getMemId().equals(issueVO.getMemId())||"ROLE_PM".equals(memRole)) {
			cnt = issueDao.updatetIssue(issueVO);
			if(cnt>0) {
				 result = insertIssueFile(issueVO);
				 if(ServiceResult.OK.equals(result)) {
						result = ServiceResult.OK;
							deleteFiles(issueVO);
							resultId = "OK";
						}else {
							resultId = "FILEUPLOADFAIL";
						}
			}
		}else {
			 result = ServiceResult.FAIL; //실패 
			 resultId ="UPDATEFAIL";
		 } 
		return resultId;
	}
	
	 @Transactional
		private int deleteFiles(IssueVO issueVO) {
		 
			 int rowcnt = 0 ; 
				int cnt = 0 ; 
				int end = 0 ;
			  String[] delFileNo = 	issueVO.getDelFileNo() ;
			   if(delFileNo != null && delFileNo.length>0) {
				   List<String> saveNames = new ArrayList<>();
				   for(int i = 0 ; i< delFileNo.length ; i++) {
					   IssueFileVO issueFile= issueFileDao.selectWorkFileInfo(delFileNo[i]);
					   saveNames.add(issueFile.getIssueFileSavedNm()) ;
				   }
				   cnt = issueFileDao.deleteAttatches(issueVO);
				   end =issueFileDao.deleteIssueFile(issueVO); 
				   if(cnt==end) {
					   deleteBinaryFiles(saveNames);
				   }
				   
			   }
			return rowcnt;
			
		}
	

	private void deleteBinaryFiles(List<String> saveNames) {
		 File saveFolder = savePathInfo.getTempSaveFolder();
			if(saveNames==null || saveNames.size()==0) return;
			for(String saveName : saveNames) {
				FileUtils.deleteQuietly(new File(saveFolder, saveName));
			}
		
	}





	@Override
	public Map<String ,Object> retriveIssuePercent(String pCode) {
		Map<String , Object> map = new HashMap<String, Object>();
			List<IssueVO>  issueList= issueDao.selectIssuePercent(pCode);
			int total = issueDao.selectIssueTotalCount(pCode);
			map.put("percenet", issueList);
			map.put("total", total);
		return map;
	}

	@Override
	public IssueVO retrieveWorkForUpdate(IssueVO issueVO) {
			
		IssueVO issue = issueDao.selectIssueForUpdate(issueVO);
		if(issue==null) throw new DataNotFoundException(issueVO.getIssueNo() +"");
		
		return issue;
	}

	@Override
	public void retrieveMyIssueList(ExtendPagingVO<IssueVO> pagingVO) {
		pagingVO.setTotalRecord(issueDao.selectMyIssueListCount(pagingVO));
		pagingVO.setDataList(issueDao.selectMyIssueList(pagingVO));
		
	}









	
}
