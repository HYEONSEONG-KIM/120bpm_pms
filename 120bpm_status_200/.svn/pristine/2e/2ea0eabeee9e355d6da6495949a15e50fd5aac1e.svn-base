package kr.or.ddit.file.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.inject.Inject;
import javax.mail.Folder;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.commons.exception.DataNotFoundException;
import kr.or.ddit.enumtype.ServiceResult;
import kr.or.ddit.file.dao.FileUtilDAO;
import kr.or.ddit.file.vo.AtchFIleVO;
import kr.or.ddit.init.FileSavePathInfo;

@Service 
public class FileUtilServiceImpl implements FileUtilService{

	@Inject
	private FileUtilDAO dao ;
	
/*	@Value("#{appInfo.attatchPath}")
	private File saveFolder;*/
	@Inject
	private FileSavePathInfo savePathInfo;
	
	@Override
	public List<AtchFIleVO> fileDownZips(String[] files) {
		List<AtchFIleVO> fileList = dao.fileSelectAll(files);
		return fileList;
	}
	
	@Override
	public AtchFIleVO fileDownload(AtchFIleVO fileVO) {
		AtchFIleVO targetFile = dao.fileSelect(fileVO);
		
		if(targetFile==null) throw new DataNotFoundException("파일");
		
		return targetFile;
	}
	
	@Transactional
	@Override
	public ServiceResult fileInsert(List<AtchFIleVO> files)  {
		
		ServiceResult result = ServiceResult.FAIL;
		if(files==null || files.size() ==0) return result ; 
		  
		//return result;
		
 		 int rowcnt = dao.fileUploadInfo(files);//insert부터 치는 이유--> 롤백이 가능하고 이미 저장할 파일 명이 생성되어 있는 상태
		 File saveFolder = savePathInfo.getTempSaveFolder();
		 try {
		 
			 for(int i =0 ; i < files.size();i++) {
				 AtchFIleVO vo = files.get(i);
				vo.getFile().transferTo(new File( saveFolder, vo.getFileSavedNm()));
			}
		 //성공 실패 여부 확인 불가
			 if(rowcnt>0) {
				 result=ServiceResult.OK;
			 }
			 return result;
		 } catch (IllegalStateException | IOException e) {
				throw new RuntimeException(e);
			}  
		//스케줄러가 돌아가야 하나 - 어떤 정책에 의해 주기적 삭제 --> y메타 ㅔ이터 조회 해서 그 이름으로 저장된 파일고 삭제 해줠야
		 //프로시저글 만들어서 임시변수를 프로시저를 ㅎ출하여 ㅘㅇ번의 커넥션으로 ㅜ 개를 한번에 webstudy06 프로시저
	}


	
	
}
