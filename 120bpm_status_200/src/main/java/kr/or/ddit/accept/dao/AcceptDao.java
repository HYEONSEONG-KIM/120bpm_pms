package kr.or.ddit.accept.dao;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.accept.vo.AcceptMemPagingVO;
import kr.or.ddit.accept.vo.AcceptMemberVO;
import kr.or.ddit.accept.vo.LogginInfoVO;
import kr.or.ddit.makeProject.vo.MakeProjectVO;

@Mapper
public interface AcceptDao {

	/**
	 * 로그인 인증을 위한 회원 찾기 
	 * @param memId
	 * @return
	 */
	public AcceptMemberVO selectMemById(String memId);
	
	/**
	 * 로그인 성공시 시간,ip,세션ID담기위한 로직
	 * @param log
	 * @return
	 */
	public int insertLog(LogginInfoVO log);
	
	/**
	 * 로그인 성공시 로그인 시간 회원테이블에 저장
	 * @param log
	 * @return
	 */
	public int updateLastLoginDate(String memId);

	/**
	 * 회원테이블 토탈 레코드 조회
	 * @param paging
	 * @return
	 */
	public int totalMemRecord(AcceptMemPagingVO<AcceptMemberVO> paging);
	
	/**
	 * 회원 리스트 조회
	 * @param paging
	 * @return
	 */
	public List<AcceptMemberVO> selectMemList(AcceptMemPagingVO<AcceptMemberVO> paging);
	
	/**
	 * 승인되지않은 전체 회원수 조회
	 * @param paging
	 * @return
	 */
	public int totalNotAcceptRecord(AcceptMemPagingVO<AcceptMemberVO> paging);
	/**
	 * 승인되지 않은 회원 리스트 조회
	 * @param pagingVO
	 * @return
	 */
	public List<AcceptMemberVO> selectNotAcceptList(AcceptMemPagingVO<AcceptMemberVO> pagingVO);
	
	/**
	 * 한명의 회원 조회
	 * @param memId
	 * @return
	 */
	public AcceptMemberVO selectMember(String memId);
	
	/**
	 * 회원의 프로젝트 현황 조회
	 * @param memId
	 * @return
	 * 
	 */
	public List<MakeProjectVO> memProjectInfo(String memId);
	
	/**
	 * 회원 승인상태로 변경
	 * @param memId
	 * @return
	 */
	public int memberAccept(String memId);
	
	/**
	 * 회원 반려
	 * @param memId
	 * @return
	 */
	public int refuseMem(String memId);
	
	/**
	 * 회원 일괄 승인
	 * @param memId
	 * @return
	 */
	public int allAccept(@Param("memId") List<String> memId);
	
	/**
	 * 한명의 회원에 대한 프로젝트 리스트 조회
	 * @param memId
	 * @return
	 */
	public List<MakeProjectVO> memPrtList(String memId);
	
	
	/**
	 * 로그인 성공시 해당 회원의 푸시알리 메세지 개수
	 * @param memId
	 * @return
	 */
	public int memPushCnt(String memId);
}
