package kr.or.ddit.work.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.work.vo.CntcWorkVO;

@Mapper
public interface CntcWorkDAO {

	//연계 일감 등록되어있는지 확인
	public int checkCntAt(CntcWorkVO cntWorkVO) ;
	
	//
	public List<CntcWorkVO> selectCntcWorkList(String workCode);
	
}
