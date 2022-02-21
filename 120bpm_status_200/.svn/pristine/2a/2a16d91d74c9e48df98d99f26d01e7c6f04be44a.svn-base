package kr.or.ddit.file.view;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
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

import kr.or.ddit.accept.vo.AcceptMemberVOWrapper;
import kr.or.ddit.enumtype.ServiceResult;
import kr.or.ddit.file.service.FileService;
import kr.or.ddit.file.vo.FileVO;
import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.validate.groups.UpdateGroup;
import kr.or.ddit.work.vo.WorkVO;

@Controller
public class FileInsertController {

	@Inject
	FileService service;
	
	@RequestMapping(value="/project/{pCode}/file/create" , method=RequestMethod.POST)
	public String fileInsert(
			@Validated (UpdateGroup.class) @ModelAttribute("file") FileVO fileVO,
			BindingResult errors, Model model , @PathVariable("pCode") String pCode ,
			@AuthenticationPrincipal AcceptMemberVOWrapper wrapper, 
			RedirectAttributes redirectAttributes
			
			
			) {
		 String viewName=  "redirect:/project/"+ pCode+"/file/fileList";
		 String message = null;
		 if (!errors.hasErrors()) {
	//		 String result = service.
			 ServiceResult result = service.updateFileList(fileVO);
			 
			 switch(result) {
			 case OK :
					
				 
				 redirectAttributes.addFlashAttribute("success", "파일 추가 성공");
				 break;
			 case NOTEXIST :
				 message = "업로드할 수 있는 파일이 없습니다";
				 break;
			 case FAIL :
				 message = "파일 추가에 실패했습니다.";
				 break;
			 
			 }
			
			 
		 }else {
			 String errorsAttrName = BindingResult.class.getName() + ".work";
			 redirectAttributes.addFlashAttribute(errorsAttrName, errors);
		 }
		 
		 redirectAttributes.addFlashAttribute("message", message);
		
		return viewName ;
		 
		
	}
	
}
