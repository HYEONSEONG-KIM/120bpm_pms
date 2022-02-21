package kr.or.ddit.file.controller;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.file.service.FileService;
import kr.or.ddit.file.vo.AtchFIleVO;

@Controller
public class FileUpdateController {
	@Inject
	private FileService service; 
	
	@RequestMapping(value="/project/{pCode}/file/modify",method=RequestMethod.POST ,produces="text/plan;charset=utf-8")
	@ResponseBody
	public String fileUpdateController(
		 @Validated	@ModelAttribute(name="file") AtchFIleVO fileVO , BindingResult errors,
			@PathVariable(name="pCode" ,required=true)String pCode
			) {
			String result =  null;
		    System.out.println(fileVO);
			if(!errors.hasErrors()) {
				result = service.updateFileName(fileVO);
			}else {
				result = "BLANKDATA";
			}
			
		return result;
		
	}
	
}
