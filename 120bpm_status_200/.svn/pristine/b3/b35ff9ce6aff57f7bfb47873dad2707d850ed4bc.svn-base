package kr.or.ddit.file.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.file.vo.AtchFIleVO;
import kr.or.ddit.file.vo.BoVO;
import kr.or.ddit.issue.vo.IssueVO;
import kr.or.ddit.work.vo.WorkVO;

@Mapper
public interface FileDAO {
	
	public List<AtchFIleVO> selectAttatchList(@Param("pMap")Map<String, Object> pMap);
	//파일 상태 변경
	public int updateFileStatus(AtchFIleVO attach);
	
	public AtchFIleVO selectAttatchDetail(String fileNo);
	
	public int updateFileName(AtchFIleVO fileVO);
	
	public int updateIssueFileName(AtchFIleVO fileVO);
	
	public int updateWorkFIleName(AtchFIleVO fileVO);
	
	public int updateBoFileName(AtchFIleVO fileVO);
	
	
	public int deleteAttatchAll(AtchFIleVO fileVO);
	public int deleteWorkFile(WorkVO workVO);
	public int deleteIssueFile(IssueVO issueVO);
	public int deleteBoFile(BoVO boVO);
	 
	public List<AtchFIleVO> selectDeleteTemp();
	
}

