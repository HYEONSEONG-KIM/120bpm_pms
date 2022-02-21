package kr.or.ddit.main.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.activity.vo.MyTimelineVO;
import kr.or.ddit.main.vo.MyPrjctMemVO;
import kr.or.ddit.main.vo.MyProjectVO;
import kr.or.ddit.mypage.vo.MyMemVO;
import kr.or.ddit.mypage.vo.MyWorkVO;

@Mapper
public interface UserDAO {
	
	/**
	 * 회원 정보 조회
	 * @param mem
	 * @return
	 */
	public MyMemVO selectMemInfo(MyPrjctMemVO mem);
	
	/**
	 * 회원 일감수 조회
	 * @param mem memId, prjctNo
	 * @return
	 */
	public List<MyWorkVO> selectMemWorkCnt(MyPrjctMemVO mem);
	
	/**
	 * 로그인사용자와 회원이 함께 참여한 프로젝트 조회 
	 * @return
	 */
	public List<MyProjectVO> selectMemPrjcts(MyPrjctMemVO mem);
	
	/**
	 * 회원의 최근 타임라인 조회
	 * @param mem memId, prjctNo
	 * @return
	 */
	public List<MyTimelineVO> selectMemTimeline(MyPrjctMemVO mem);
}
