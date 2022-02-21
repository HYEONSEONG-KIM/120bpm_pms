package kr.or.ddit.file.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.file.vo.AtchFIleVO;
@Mapper
public interface FileUtilDAO {

	public int fileUploadInfo(@Param("list")List<AtchFIleVO> files);
    
	public AtchFIleVO fileSelect(AtchFIleVO atchVO);
	
	public List<AtchFIleVO> fileSelectAll(String[] files);
}
