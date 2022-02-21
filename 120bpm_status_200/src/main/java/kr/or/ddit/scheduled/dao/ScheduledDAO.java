package kr.or.ddit.scheduled.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.accept.vo.ProjectMemVO;
import kr.or.ddit.makeProject.vo.MakeProjectVO;
import kr.or.ddit.scheduled.vo.PrtMemUpdateVO;

@Mapper
public interface ScheduledDAO {

	/**
	 * 프로젝트 리스트 조회
	 * @return
	 */
	public List<MakeProjectVO> selectPrtList();
	
	/**
	 * 끝난 프로젝트 회원 조회
	 * @return
	 */
	public List<ProjectMemVO> selectEndPrtMemList(@Param("prtNoList") List<Integer> prtNoList);
	
	/**
	 * 마감 프로젝트 회원 조회(다른VO)
	 * @param prtNoList
	 * @return
	 */
	public List<PrtMemUpdateVO> updateMemList(@Param("prtNoList") List<Integer> prtNoList);
	
	/**
	 * 마감 프로젝트 회원정보 다른 테이블에 저장
	 * @return
	 */
	public int insertEndPrtMem(@Param("endPrtMemList") List<ProjectMemVO> endPrtMemList);
	
	/**
	 * 마감 프로젝트의 회원 역할 수정
	 * @param memList
	 * @return
	 */
	public int updateEndPrtMem(@Param("updateMemList") List<PrtMemUpdateVO> memList);
}
