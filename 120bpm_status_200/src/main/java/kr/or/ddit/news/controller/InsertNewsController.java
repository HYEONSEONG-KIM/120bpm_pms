package kr.or.ddit.news.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.news.service.NewsService;
import kr.or.ddit.news.vo.NewsVO;
import kr.or.ddit.validate.groups.InsertGroup;
@Controller
public class InsertNewsController {
	/*@RequestMapping("/news/newsInsert")
	public String newsInsert() {
		return "";
	}*/
	
	@Inject
	private NewsService service;
	
	 @RequestMapping(value="/project/{pCode}/news/create", method=RequestMethod.POST,produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	 @ResponseBody
	 public  Map<String, Object>  newsInsert(
			@PathVariable(name="pCode") String pCode,
			@Validated(InsertGroup.class) @ModelAttribute("news") NewsVO newsVO , 
			BindingResult errors , RedirectAttributes redirectAttributes 
			) {
		 
		 String viewName = null;
		 String message = null;
		 System.out.println(newsVO);
		 String result = null;
		 Map<String, Object> resultMap = new HashMap<>();
		 if(!errors.hasErrors()) {
			  result = service.insertNews(newsVO);
			  resultMap.put("boNo", newsVO.getBoNo());
		 }else {
			 resultMap.put("message", "검증에 걸렸습니다.");
		 }
		 resultMap.put("result", result);

		 return resultMap;
	} 
}
