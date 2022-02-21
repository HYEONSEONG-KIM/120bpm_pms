package kr.or.ddit.free.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.enumtype.ServiceResult;
import kr.or.ddit.free.service.FreeBoardService;
import kr.or.ddit.free.vo.FreeBoardVO;
import kr.or.ddit.validate.groups.InsertGroup;

@Controller
@RequestMapping(value="/project/{pCode}/freeboard/create")
public class InsertFreeController {
	
	@Inject
	private FreeBoardService service;
	
	@GetMapping
	public String insertFreeBoard(
		@ModelAttribute("freeBoard") FreeBoardVO freeBoardInfo,
		Model model
		) {
	model.addAttribute("freeBoard", freeBoardInfo);
	return  "freeboard/freeForm";
	}	
	
	@ModelAttribute("command")
	public String addCommand() {
		return "INSERT";
	}
	
	@PostMapping
	@ResponseBody
	public String freeCreate(
		@Validated(InsertGroup.class) FreeBoardVO freeBoardInfo,
		BindingResult errors
		) {
		String viewName= null;
		if(!errors.hasErrors()) {
			ServiceResult result = service.createBoard(freeBoardInfo);
			switch(result) {
			case OK:
				viewName = "OK";
				break;
			default:
				viewName = "FAIL";
				break;
			}
		} else {
			viewName = "freeboard/freeForm";
			}
		
		return viewName;
		}
	
	}
	
	
