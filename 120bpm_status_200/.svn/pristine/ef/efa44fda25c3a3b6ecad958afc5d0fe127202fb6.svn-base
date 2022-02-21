package kr.or.ddit.accept.service;

import javax.inject.Inject;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import kr.or.ddit.accept.dao.AcceptDao;
import kr.or.ddit.accept.vo.AcceptMemberVO;
import kr.or.ddit.accept.vo.AcceptMemberVOWrapper;
import kr.or.ddit.accept.vo.LogginInfoVO;

@Service("authService")
public class AuthenticateServiceImpl implements UserDetailsService {

	@Inject
	private AcceptDao dao;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		AcceptMemberVO saveMem = dao.selectMemById(username);
		
		if(saveMem==null) {
			throw new UsernameNotFoundException(username+" 회원이 없음.");
		}
		System.out.println(saveMem);
		return new AcceptMemberVOWrapper(saveMem);
	}
		

	

	
}







