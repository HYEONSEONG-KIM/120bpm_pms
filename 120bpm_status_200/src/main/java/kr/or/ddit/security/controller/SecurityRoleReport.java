package kr.or.ddit.security.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.accept.vo.ProjectMemVO;
import kr.or.ddit.security.service.SecurityService;
import kr.or.ddit.security.vo.AuthorityVO;
import kr.or.ddit.security.vo.ResourceVO;

@Controller
@RequestMapping("admin/role/report")
public class SecurityRoleReport {

	@Inject
	private SecurityService service;
	
	@GetMapping
	public String roleReport(Model model) {
		// 전체 프로젝트 대비 역할 할당 비율
		List<AuthorityVO> projectAuthCntList = service.authProjectCnt();
		List<String> authList = new ArrayList<String>();
		List<Integer> cntAvg = new ArrayList<>();
		
		// 역할별 보호자원 통계
		List<AuthorityVO> roleAuthCntList = service.roleAuthCnt();
		List<String> roleAuthList = new ArrayList<>();
		List<Integer> cntAuth = new ArrayList<>();
		
		// 사용자-역할 부여 현황
		List<ProjectMemVO> pjtMemList = service.retrieveProjectMem();
		List<Integer> roleMemCnt = new ArrayList<>();
		
		// 메뉴별 역할 보호자원 통계
		List<ResourceVO> level2Res = service.retrieveLevel2Res();
		List<AuthorityVO> allRole = service.retrieveRoleList();
		List<ResourceVO> resourceList = service.retrieveResourceList();
		
		for(AuthorityVO auth : projectAuthCntList) {
			String authStr = "'" + auth.getAuthorNm() + "'";
			authList.add(authStr);
			cntAvg.add(auth.getProjectCnt());
		}
		
		
		for(AuthorityVO auth : roleAuthCntList) {
			String authStr = "'" + auth.getAuthorNm() + "'";
			roleAuthList.add(authStr);
			cntAuth.add(auth.getProjectCnt());
		}
		
		for(String role : authList) {
			role = role.replaceAll("'", "");
			System.out.println(role);
			int cnt = 0;
			for(ProjectMemVO prjMem : pjtMemList) {
				if(prjMem.getAuthor().contains(role)) {
					cnt++;
				}
			}
			roleMemCnt.add(cnt);
		}
		
		
		
		model.addAttribute("authList", authList);
		model.addAttribute("cntAvg", cntAvg);
		
		model.addAttribute("roleAuthList", roleAuthList);
		model.addAttribute("cntAuth", cntAuth);
		
		model.addAttribute("roleMemCnt",roleMemCnt);

		model.addAttribute("level2Res",level2Res);
		model.addAttribute("allRole",allRole);
		model.addAttribute("resourceList",resourceList);
		
		model.addAttribute("menu", "report");
		
		
		
		return "security/roleReport";
	}
	
	
	
	
}
