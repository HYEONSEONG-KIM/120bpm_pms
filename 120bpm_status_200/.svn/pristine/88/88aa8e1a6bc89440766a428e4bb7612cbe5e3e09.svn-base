package kr.or.ddit.member.service;

import java.util.List;

import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.PagingVO;


public interface MemberService {
	public int retrieveTotalCount(PagingVO<MemberVO> memberPagingInfo);
	public List<MemberVO> retrieveMemberList(PagingVO<MemberVO> memberPagingInfo);
	public MemberVO retrieveMember(String memId);
	
	/**
	 * 역할 중복체크
	 * @param IDCheck
	 * @return
	 */
	public boolean IdCheck(String memId);
}
