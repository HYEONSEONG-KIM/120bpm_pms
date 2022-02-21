package kr.or.ddit.accept.vo;

import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.SpringSecurityCoreVersion;

import lombok.Getter;
import lombok.ToString;

@ToString
@Getter
public class ProjectMemGA implements GrantedAuthority{

	private static final long serialVersionUID = SpringSecurityCoreVersion.SERIAL_VERSION_UID;
	
	private ProjectMemVO pjtMem;
	
	
	
	public ProjectMemGA(ProjectMemVO pjtMem) {
		this.pjtMem = pjtMem;
	}

	@Override
	public String getAuthority() {
		if(pjtMem.getAuthor() == null) {
			return null;
		}else {
			if(pjtMem.getAuthor().equals("ROLE_ADMIN")) {
				return pjtMem.getAuthor();
			}else {
				return pjtMem.getPrjctNo() + ":" + pjtMem.getAuthor();
			}
		}
	}
	
	
}
