package kr.or.ddit.projectSetting.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.enumtype.ServiceResult;
import kr.or.ddit.projectSetting.dao.ProjectUpdateDAO;
import kr.or.ddit.projectSetting.service.ProjectUpdateService;
import kr.or.ddit.projectSetting.vo.WorkCategoryVO;
import kr.or.ddit.validate.groups.InsertGroup;

@Controller
@RequestMapping("project/{prtId}")
public class ProjectWorkCategoryController {

	@Inject
	private ProjectUpdateDAO dao;
	
	@Inject
	private ProjectUpdateService service;
	
	@RequestMapping("modify/category")
	public String categoryForm(
				@PathVariable int prtId,
				Model model
			) {
		List<String> category = new ArrayList<String>();
		List<Integer> complate = new ArrayList<>();
		List<Integer> proceeding = new ArrayList<>();
		List<Integer> newWork = new ArrayList<>();
		// 카테고리별 일감 등록 갯수
		List<Integer> categoryCnt = new ArrayList<>();
		
		service.categoryGraph(prtId, category, complate, proceeding, newWork, categoryCnt);
		
		List<WorkCategoryVO> categoryList = service.prgsAvgList(prtId);
		model.addAttribute("categoryList", categoryList);
		
		
		
		model.addAttribute("category",category );
		model.addAttribute("complate", complate);
		model.addAttribute("proceeding", proceeding);
		model.addAttribute("newWork", newWork);
		model.addAttribute("categoryCnt", categoryCnt);
		
		System.out.println("category : " + category);
		System.out.println("complate : " +  complate);
		System.out.println("proceeding : " + proceeding);
		System.out.println("newWork : " +  newWork);
		
		model.addAttribute("menu", "category");
		
		
		return "projectSetting/projectWorkCategoryUpdate";
	}
	
	@RequestMapping(value = "modify/category/create", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ServiceResult createCategory(
				@PathVariable int prtId,
				String command,
				@Validated(InsertGroup.class) @ModelAttribute("categoryVO") WorkCategoryVO categoryVO,
				Errors errors
			) {
		ServiceResult result = null;
		categoryVO.setPrjctNo(prtId);
		
		
		if(!errors.hasErrors()) {
			if(StringUtils.contains(command, "create")) {
				result = service.createCategory(categoryVO);
			}else if(StringUtils.contains(command, "modify")) {
				String categoryCode = command.substring(command.indexOf(",") + 1);
				categoryVO.setCtgryCode(categoryCode);
				
				result = service.modifyCategory(categoryVO);
			}
		}else {
			result = ServiceResult.PARAMOMISSION; 
		}
		
		return result;
		
	}
	
	
	@RequestMapping(value = "modify/category/duplcheck", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public boolean duplCheck(
				@PathVariable int prtId,
				String ctgryNm
			) {
		boolean result = true;
		List<String> categoryNmList = dao.duplNameCheck(prtId);
		for(String categoryNm : categoryNmList) {
			if(categoryNm.equals(ctgryNm)) {
				result = false;
				break;
			}
		}
		
		return result;
	}
}
