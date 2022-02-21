package kr.or.ddit.webIDE.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.accept.vo.AcceptMemberVO;
import kr.or.ddit.accept.vo.AcceptMemberVOWrapper;
import kr.or.ddit.enumtype.ServiceResult;
import kr.or.ddit.webIDE.service.CodeEditorService;
import kr.or.ddit.webIDE.vo.CodeEditorVO;

@Controller
@RequestMapping("project/{prtId}/webIDE/editor")
public class CodeEditorController {

	@Inject
	private CodeEditorService service;
	
	@RequestMapping("List")
	public String editorList(
				@PathVariable int prtId,
				@AuthenticationPrincipal AcceptMemberVOWrapper wrapper,
				Model model
			) {
		AcceptMemberVO auth = wrapper.getAdaptee();
		CodeEditorVO editVO = new CodeEditorVO();
		editVO.setMemId(auth.getMemId());
		editVO.setPrjctNo(prtId);
		
		List<CodeEditorVO> editorList = service.selectCodeEditorList(prtId);
		int editCnt = service.editCnt(editVO);
		
		model.addAttribute("editList", editorList);
		model.addAttribute("menu", "editor");
		model.addAttribute("editCnt", editCnt);
		
		return "webIDE/codeEditorList";
	}
	
	@RequestMapping("entrance/{editId}")
	public String goEditor(
			@PathVariable int editId,
			Model model
			) {
		CodeEditorVO editVO = service.selectCodeEditor(editId);
		model.addAttribute("editId", editId);
		model.addAttribute("editVO", editVO);
		return "webIDE/codeEditor";
	}
	
	@RequestMapping(value = "create", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ServiceResult createEdit(
				@ModelAttribute("editVO") CodeEditorVO editVO,
				Errors errors,
				@PathVariable int prtId,
				@AuthenticationPrincipal AcceptMemberVOWrapper wrapper
			) {
		ServiceResult result = null;
		
		if(!errors.hasErrors()) {
			AcceptMemberVO auth = wrapper.getAdaptee();
			editVO.setPrjctNo(prtId);
			editVO.setMemId(auth.getMemId());
			result = service.createCodeEditor(editVO);
		}else {
			result = ServiceResult.PARAMOMISSION;
		}
		
		
		
		return result;
	}
	
	@RequestMapping(value = "duplCheck",produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public boolean duplCheck(
				@PathVariable int prtId,
				String editorNm
			) {
		
		boolean flag = true;
		List<CodeEditorVO> editList = service.selectCodeEditorList(prtId);
		for(CodeEditorVO codeEdit : editList) {
			if(codeEdit.getEditorNm().equals(editorNm)) {
				flag = false;
			}
		}
		
		return flag;
		
	}
	
	@RequestMapping(value = "delete/{editCode}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ServiceResult deleteEdit(
				@PathVariable int editCode
			) {
		ServiceResult result = null;
		
		result = service.removeCodeEditor(editCode);
		
		return result;
	}
}






