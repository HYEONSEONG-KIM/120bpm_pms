package kr.or.ddit.accept.vo;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;

import lombok.Data;

@Data
public class AcceptMemberVOWrapper extends User{
	
	private AcceptMemberVO adaptee;
	
	public AcceptMemberVOWrapper(AcceptMemberVO adaptee) {
		super(adaptee.getMemId(), adaptee.getMemPass(), adaptee.isMemAccept(),adaptee.isMemSecession(),true,adaptee.isMemDormancy(),
				adaptee.getMngrAt().equals("1")?AuthorityUtils.createAuthorityList("ROLE_ADMIN"):
				ProjectMemAU.empAuthorityList(adaptee.getProjectMemRole()));
		this.adaptee = adaptee;
	}

	public AcceptMemberVOWrapper(String username, String password, boolean enabled, boolean accountNonExpired,
			boolean credentialsNonExpired, boolean accountNonLocked,
			Collection<? extends GrantedAuthority> authorities) {
		super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
		// TODO Auto-generated constructor stub
	}

	public AcceptMemberVOWrapper(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
		// TODO Auto-generated constructor stub
	}

	
}
