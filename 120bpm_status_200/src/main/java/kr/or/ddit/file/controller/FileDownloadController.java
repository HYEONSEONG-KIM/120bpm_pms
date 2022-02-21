package kr.or.ddit.file.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.accept.vo.AcceptMemberVO;
import kr.or.ddit.accept.vo.AcceptMemberVOWrapper;
import kr.or.ddit.file.service.FileUtilService;
import kr.or.ddit.file.service.FileUtilServiceImpl;
import kr.or.ddit.file.vo.AtchFIleVO;
import kr.or.ddit.notice.dao.AttatchDAO;
import kr.or.ddit.work.vo.WorkFileVO;
@Controller
public class FileDownloadController {
	
	@Inject
	private FileUtilService service;
	
	@RequestMapping(value="/project/{pCode}/file/down/zip" ,method=RequestMethod.POST)
	public Object fileZipDownLoad(
			Model model,	@PathVariable(name="pCode" ,required=true)String pCode  
			,@RequestParam(name="files") String[] files
			) {
		if(files==null) return null;
 		//System.out.println(files);
 		List<AtchFIleVO> fileList =	service.fileDownZips(files);
 		model.addAttribute("fileList" , fileList);
		 
		return "zipDownloadView";
	}
	
	
	@RequestMapping(value="/project/{pCode}/file/down/{fileNo}")
	public Object fileDownLoad(
			@PathVariable(name="pCode" ,required=true)String pCode  
			,@PathVariable(name="fileNo")String fileNo,
			Model model,
			@AuthenticationPrincipal AcceptMemberVOWrapper wrapper
			) {
		
		AtchFIleVO fileVO = new AtchFIleVO();
		AcceptMemberVO authMember = wrapper.getAdaptee();
//		authMember.
		fileVO.setFileNo(fileNo);
		
		//파일을 다운 받을 수 있는 권한을 확인하는 부분 필요하다
		//파일 다운 권한을 어디에서 받을 수 있는지 추가
		
		fileVO = service.fileDownload(fileVO);
		model.addAttribute("file" , fileVO);
		 
		return "downloadView";
	}
	
}
