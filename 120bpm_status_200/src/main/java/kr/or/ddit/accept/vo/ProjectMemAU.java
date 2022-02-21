package kr.or.ddit.accept.vo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

import lombok.ToString;

@ToString
public class ProjectMemAU extends AuthorityUtils{

	public static List<GrantedAuthority> empAuthorityList(List<ProjectMemVO> pjtMem) {
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>(pjtMem.size());

		for (ProjectMemVO role : pjtMem) {
			authorities.add(new ProjectMemGA(role));
		}

		return authorities;
	}
	
}
