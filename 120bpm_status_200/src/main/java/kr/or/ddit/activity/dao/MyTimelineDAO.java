package kr.or.ddit.activity.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.activity.vo.MyTimelineVO;


@Mapper
public interface MyTimelineDAO {

	/**
	 * 타임라인 목록 조회
	 * @param pCode
	 * @return
	 */ 
	public List<MyTimelineVO> selectPrjctTimeline(MyTimelineVO timeline);
	
	/**
	 * 타임라인 표시기간 조회
	 * @param termDate
	 * @return
	 */
	public MyTimelineVO selectTermDate(String termDate);
}
 