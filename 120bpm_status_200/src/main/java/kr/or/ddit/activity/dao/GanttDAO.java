package kr.or.ddit.activity.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.activity.vo.CmmnCodeDetailVO;
import kr.or.ddit.main.vo.MyPrjctMemVO;
import kr.or.ddit.mypage.vo.MyMemVO;
import kr.or.ddit.mypage.vo.MyWorkVO;

@Mapper
public interface GanttDAO {
	/**
	 * 간트차트에 들어갈 프로젝트 일감 목록 조회
	 * @param MyWorkVO work
	 * @return 
	 */
	public List<MyWorkVO> selectPrjctWorkInfoList(MyWorkVO work);
	
	/**
	 * 일감 상태 목록 조회
	 * @return
	 */
	public List<CmmnCodeDetailVO> selectWorkStatus();
	
	/**
	 * 일감 우선순위 목록 조회
	 * @return
	 */
	public List<CmmnCodeDetailVO> selectWorkPriort();
	
	/**
	 * 프로젝트 멤버 조회
	 * @return
	 */
	public List<MyPrjctMemVO> selectPrjctMems(MyPrjctMemVO mem);
}
