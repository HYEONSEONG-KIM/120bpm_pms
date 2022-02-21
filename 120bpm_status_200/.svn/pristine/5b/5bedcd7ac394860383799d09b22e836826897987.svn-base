package kr.or.ddit.member.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import kr.or.ddit.member.dao.MemberDAO;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.PagingVO;

@Service
public class MemberServiceImpl implements MemberService{
	@Inject
	MemberDAO memberDao;
	
	@Override
	public int retrieveTotalCount(PagingVO<MemberVO> memberPagingInfo) {
		return memberDao.selectTotalRecord(memberPagingInfo);
	}

	@Override
	public List<MemberVO> retrieveMemberList(PagingVO<MemberVO> memberPagingInfo) {		
		return memberDao.selectMemberList(memberPagingInfo);
	}

	@Override
	public MemberVO retrieveMember(String memId) throws UsernameNotFoundException {
		MemberVO member = memberDao.selectMemberById(memId);
		if(member==null)
			throw new UsernameNotFoundException(String.format("%s 회원 없음.", memId));
		return member;
	}
	
	
	
	@Override
	public boolean IdCheck(String memId) {
			
			MemberVO member = memberDao.selectMemberById(memId);
			boolean result = false;
			if(member == null) {
				result = true;
			}else {
				result = false;
			}
			
			return result;
		}
	
	
}
