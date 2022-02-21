package kr.or.ddit.activity.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.main.vo.MyIssueVO;
import kr.or.ddit.main.vo.MyProjectVO;
import kr.or.ddit.mypage.vo.MyWorkVO;

@Mapper
public interface GraphDAO {
	
	
	/**
	 * 프로젝트 조회
	 * @param prjctNo
	 * @return
	 */
	public MyProjectVO selectProject(int prjctNo);
	
	/**
	 * 총일감,평균진척도,  
	 * @return
	 */
	public MyWorkVO selectWorkPrgsCounts(int prjctNo);
	
	
	/**
	 * 일별 등록 일감 개수 조회
	 * @return
	 */
	public List<MyWorkVO> selectDayInsertWork(int prjctNo);
	
	/**
	 * 프로젝트 구성원 별 일감 상태 개수 
	 * @param prjctNo
	 * @return
	 */
	public List<MyWorkVO> selectMemSttsWork(int prjctNo);
	
	/**
	 * 프로젝트 발생이슈, 해결이슈 카운트 조회
	 * @param prjctNo
	 * @return
	 */
	public MyIssueVO selectIssueCount(int prjctNo);
	
	/**
	 * 프로젝트 이슈발생률, 이슈해결률
	 * @param prjctNo
	 * @return
	 */
	public List<MyIssueVO> selectIssueAvgCounts(int prjctNo);
}
