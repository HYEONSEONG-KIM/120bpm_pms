package kr.or.ddit.file.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.file.service.FileService;
import kr.or.ddit.file.vo.AtchFIleVO;
import kr.or.ddit.validate.groups.DeleteGroup;
@Controller
public class FileDeleteController {
	@Inject
	private FileService service; 
	
	
	@RequestMapping(value="/project/{pCode}/file/remove",method=RequestMethod.POST ,produces="text/plan;charset=utf-8")
	@ResponseBody
	public String fileDownLoad(
			@PathVariable(name="pCode" ,required=true)String pCode  
			, Model model , @Validated(DeleteGroup.class) @ModelAttribute AtchFIleVO fileVO , BindingResult errors
			
			) {
		
		String result = null;
		
			if(!errors.hasErrors()) {
				result = service.deleteFile(fileVO);
			}else {
				result = "BLANKDATA";
			}
		
		
		return result;
	}
	
	
	
	
}
