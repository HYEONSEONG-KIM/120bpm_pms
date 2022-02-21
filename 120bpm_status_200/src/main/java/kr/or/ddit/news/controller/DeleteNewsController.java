package kr.or.ddit.news.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.accept.vo.AcceptMemberVO;
import kr.or.ddit.accept.vo.AcceptMemberVOWrapper;
import kr.or.ddit.accept.vo.ProjectMemVO;
import kr.or.ddit.news.service.NewsService;
import kr.or.ddit.news.vo.NewsVO;
import kr.or.ddit.validate.groups.DeleteGroup;
import kr.or.ddit.validate.groups.UpdateGroup;
@Controller
public class DeleteNewsController {
	@Inject
	private NewsService service;
	
	@RequestMapping(value="/project/{pCode}/news/remove", method=RequestMethod.POST,produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Map<String, Object>  newsUpdate(
			@PathVariable(name="pCode") String pCode,
			@Validated(DeleteGroup.class) @ModelAttribute("news") NewsVO newsVO , 
			BindingResult errors ,
			@AuthenticationPrincipal AcceptMemberVOWrapper wrapper, 
			RedirectAttributes redirectAttributes 
			
			) {
		 AcceptMemberVO authMember = wrapper.getAdaptee();
		 	
		 List<ProjectMemVO> list = authMember.getProjectMemRole();
		 newsVO.setPrjctNo(pCode);
		 newsVO.setRoleList(list);
		 newsVO.setMemId(authMember.getMemId());
		 String result = null;
		 Map<String, Object> resultMap = new HashMap<>();
		 if(!errors.hasErrors()) {
			  result = service.deleteNews(newsVO);
			 
		 }else {
			 resultMap.put("message", "검증에 걸렸습니다.");
		 }
		 resultMap.put("result", result);

		 return resultMap;
		  
	}
}
