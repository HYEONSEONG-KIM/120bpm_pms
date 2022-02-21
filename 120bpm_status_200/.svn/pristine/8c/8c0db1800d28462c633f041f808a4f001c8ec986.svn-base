package kr.or.ddit.makeProject.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.enumtype.ServiceResult;
import kr.or.ddit.makeProject.service.MakeProjectService;
import kr.or.ddit.makeProject.vo.MakeProjectVO;

@Controller
@RequestMapping("admin/project")
public class DeleteProjectController {

	@Inject
	private MakeProjectService service;
	
	@RequestMapping(value = "delete/{prtId}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ServiceResult deleteProjectInfo(
			@PathVariable int prtId,
			Model model
			) {
		ServiceResult result = service.removeProject(prtId);
		
		return result;
	}
}
