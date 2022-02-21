package kr.or.ddit.security.controller;

import java.util.List;

import javax.inject.Inject;
import javax.validation.Valid;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.enumtype.ServiceResult;
import kr.or.ddit.security.service.SecurityService;
import kr.or.ddit.security.vo.AuthorityVO;
import kr.or.ddit.security.vo.ResourceVO;

@Controller
@RequestMapping("/admin/role/makeRole")
public class SecurityMakeRole {

	@Inject
	private SecurityService service;
	
	@GetMapping
	public String makeRoleForm(Model model) {
		
		List<ResourceVO> resList = service.retrieveProjectResource();
		model.addAttribute("resourceList", resList);
		List<AuthorityVO> roleList = service.retrieveRoleList();
		model.addAttribute("roleList", roleList);
		model.addAttribute("menu", "role");
		return "security/roleForm";
	}
	
	@RequestMapping(value = "{author}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<ResourceVO> copyAuth(
			@PathVariable String author
			){
		
		return service.retrieveResourceList();
	}
	
	@PostMapping
	public String createRole(
			@Valid AuthorityVO auth,
			Errors errors,
			RedirectAttributes redirectAttributes
			) {
		String goPage = "redirect:/admin/role/list";
		
		String authCode = "ROLE_" + auth.getAuthorNm();
		auth.setAuthor(authCode);
		
		if(!errors.hasErrors()) {
			ServiceResult result = service.createRole(auth);
			if(!ServiceResult.OK.equals(result)) {
				redirectAttributes.addFlashAttribute("message", "생성 실패");
			}
			
		}
		
		return goPage;
	}
	
	@RequestMapping(value = "duplcheck", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public boolean authDuplCheck(
				String authorNm
			) {
		boolean duleCheck = service.authCheck(authorNm);
		
		return duleCheck;
		
	}
}
