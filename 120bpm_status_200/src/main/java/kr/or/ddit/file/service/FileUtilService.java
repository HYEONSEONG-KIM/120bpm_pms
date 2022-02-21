package kr.or.ddit.file.service;

import java.util.List;

import kr.or.ddit.enumtype.ServiceResult;
import kr.or.ddit.file.vo.AtchFIleVO;

public interface FileUtilService {
	public ServiceResult fileInsert(List<AtchFIleVO> files);

	public AtchFIleVO fileDownload( AtchFIleVO fileVO );
	
	public List<AtchFIleVO> fileDownZips(String[] files);
}
