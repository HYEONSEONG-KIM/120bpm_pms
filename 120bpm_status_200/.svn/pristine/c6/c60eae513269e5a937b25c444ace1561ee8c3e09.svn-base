package kr.or.ddit.file.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.accept.vo.AcceptMemberVOWrapper;
import kr.or.ddit.file.dao.FileDAO;
import kr.or.ddit.file.service.FileService;
import kr.or.ddit.file.vo.AtchFIleVO;
import kr.or.ddit.file.vo.AttatchWrapper;
import kr.or.ddit.file.vo.FileVO;

@Controller
public class FileRetrieveController {
	
 
	@Inject
	private FileService service;
 
	@Inject
	private FileDAO dao;
	
	
	@ModelAttribute("file")
	public FileVO fileVO() {
		return new FileVO();
		
	}
	 
	
	@RequestMapping(value="/project/{pCode}/file/fileList")
	public String fileListPage(
			@PathVariable(name="pCode" ,required=true) String pCode , 
			@RequestParam(value="clCode", required=false ) String clCode,
			@RequestParam(value="fileNo", required=false ) String fileNo,
			
			@AuthenticationPrincipal AcceptMemberVOWrapper wrapper  
			,Model model
			) {
	     
			Map<String , Object> pMap = new HashMap<>();
			pMap.put("pCode" , pCode);
			if(clCode!=null) {
				pMap.put("clCode", clCode);
			}
			 
			AtchFIleVO fileVO = new AtchFIleVO();
			//fileVO.setPrjctNo(pCode);
			model.addAttribute("pCode" , pCode);
		return "file/fileList";
	}
	
	
	@RequestMapping(value="/project/{pCode}/file/fileList" ,produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<AttatchWrapper> fileListJson(
			@PathVariable(name="pCode" ,required=true) String pCode , 
			@RequestParam(value="clCode", required=false ) String clCode,
			@RequestParam(value="fileNo", required=false ) String fileNo,
			@AuthenticationPrincipal AcceptMemberVOWrapper wrapper  
			,Model model
			) {
	     
			Map<String , Object> pMap = new HashMap<>();
			pMap.put("pCode" , pCode);
			if(clCode!=null) {
				pMap.put("clCode", clCode);
			}
		
		List<AttatchWrapper> attatchList = service.retrieveFileList(pMap);
		
		return attatchList;
	}
	

	
	
//이건 비동기로 가야하는데 나중에 수정하겠습니다
@RequestMapping(value="/project/{pCode}/file/fileDetail/{fileNo}")
public String fileDetail(
		@PathVariable(name="pCode" ,required=true)String pCode  
		, @PathVariable(name="fileNo")String fileNo
		) {
	return "file/fileList";
}
	
	
	


}
