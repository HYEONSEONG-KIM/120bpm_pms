package kr.or.ddit.accept.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import kr.or.ddit.accept.vo.AcceptMemPagingVO;
import kr.or.ddit.accept.vo.AcceptMemberVO;
import kr.or.ddit.enumtype.ServiceResult;
import kr.or.ddit.makeProject.vo.MakeProjectVO;

public interface AcceptMemberService {

	/**
	 * 회원 리스트 조회
	 * @param paging
	 */
	public void retrieveMemList(AcceptMemPagingVO<AcceptMemberVO> paging);
	
	/**
	 * 회원 상세 조회
	 * @param memId
	 * @return
	 */
	public AcceptMemberVO retrieveMember(String memId);
	
	/**
	 * 회원의 프로젝트 현황 조회
	 * @param memId
	 * @return
	 */
	public List<MakeProjectVO> memProjectInfo(String memId);
	
	/**
	 * 승인되지 않은 회원 조회
	 * @param paging
	 */
	public void retrieveNotAcceptList(AcceptMemPagingVO<AcceptMemberVO> paging);
	
	/**
	 * 회원 승인
	 * @param memId
	 * @return
	 */
	public ServiceResult acceptMember(String memId);
	
	/**
	 * 회원 반려
	 * @param memId
	 * @return
	 */
	public ServiceResult refuseMember(String memId);
	
	/**
	 * 회원 일괄 승인
	 *  처리
	 * @param memId
	 * @return
	 */
	public ServiceResult allAcceptMember(String[] memId);
	
	
}
