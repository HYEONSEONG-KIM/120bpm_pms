package kr.or.ddit.file.controller;

import javax.inject.Inject;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.accept.vo.AcceptMemberVO;
import kr.or.ddit.accept.vo.AcceptMemberVOWrapper;
import kr.or.ddit.file.service.FileUtilService;
import kr.or.ddit.file.vo.AtchFIleVO;
@Controller
public class NoticeFileDownLoadController {

	@Inject
	private FileUtilService service;
	@RequestMapping(value="/notice/file/down/{fileNo}")
	public Object fileDownLoad(
			@PathVariable(name="fileNo")String fileNo,
			Model model
			
			) {
		
		AtchFIleVO fileVO = new AtchFIleVO();
		 
//		authMember.
		fileVO.setFileNo(fileNo);
		
		//파일을 다운 받을 수 있는 권한을 확인하는 부분 필요하다
		//파일 다운 권한을 어디에서 받을 수 있는지 추가
		
		fileVO = service.fileDownload(fileVO);
		model.addAttribute("file" , fileVO);
		 
		return "downloadView";
	}
	
}
