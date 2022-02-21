package kr.or.ddit.security.controller;

import java.util.List;

import javax.inject.Inject;
import javax.validation.Valid;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.commons.exception.DataNotFoundException;
import kr.or.ddit.commons.exception.DeleteImpossibleException;
import kr.or.ddit.enumtype.ServiceResult;
import kr.or.ddit.security.service.SecurityService;
import kr.or.ddit.security.vo.AuthorityVO;
import kr.or.ddit.security.vo.ResourceVO;
import kr.or.ddit.validate.groups.UpdateGroup;

@Controller
@RequestMapping("/admin/role")
public class SecurityRoleController {
	
	@Inject
	private SecurityService service;
	
	@RequestMapping("list")
	public String roleListView(Model model) {
		
		List<AuthorityVO> roleList = service.retrieveRoleList();
		model.addAttribute("roleList", roleList);
		model.addAttribute("menu", "role");
		return "security/roleList";
	}
	
	@RequestMapping("detail/{roleId}")
	public String datailView(
			@PathVariable() String roleId,
			Model model
			) {
		List<Integer> monthList = service.roleProjectMonthCnt(roleId);
		model.addAttribute("monthList", monthList);
		
		AuthorityVO role = service.retrieveRole(roleId);
		model.addAttribute("role", role);
		
		List<ResourceVO> resList = service.retrieveResourceList();
		model.addAttribute("resourceList", resList);
		
		return "security/roleView";
	}
	
	
	@RequestMapping(value = "updateRole", method = RequestMethod.POST)
	public String updateRole(
				@Validated(UpdateGroup.class) AuthorityVO roleVO,
				Errors errors,
				RedirectAttributes redirectAttributes
			) {
		System.out.println(roleVO.getAuthor());
		String goPage = "redirect:/admin/role/detail";
		ServiceResult result = service.updateResourceMapping(roleVO);
		if(!errors.hasErrors()) {
			if(!ServiceResult.OK.equals(result)) {
				redirectAttributes.addFlashAttribute("message", "설정 변경 실패");
			}
			goPage += "/"+roleVO.getAuthor();
			System.out.println("check : " + goPage );
		}
		
		return goPage;
	}
	
	
	
	@RequestMapping(value = "deleteRole/{auth}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ServiceResult deleteRole(
			@PathVariable() String auth 
			) {
		ServiceResult result = null;
		
		result = service.removeRole(auth);
		System.out.println(result);	
		return result;
	}

	
}
