package kr.or.ddit.file.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.enumtype.ServiceResult;
import kr.or.ddit.file.vo.AtchFIleVO;
import kr.or.ddit.file.vo.AttatchWrapper;
import kr.or.ddit.file.vo.FileVO;

public interface FileService {

		public List<AttatchWrapper> retrieveFileList(Map<String, Object> pMap);
		//파일 탭 자체에서 업로드한 경우 상태를 업데이트 해주기 위해 필요함
		public ServiceResult updateFileList(FileVO fileVO);
		
		//case when으로 분기
		public String updateFileName(AtchFIleVO fileVO); 
		
		public String deleteFile(AtchFIleVO fileVO);
		
		public void deleteTempFile();

}
