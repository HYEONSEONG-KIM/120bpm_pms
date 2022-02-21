package kr.or.ddit.file.controller;

import java.awt.PageAttributes.MediaType;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.accept.vo.AcceptMemberVO;
import kr.or.ddit.accept.vo.AcceptMemberVOWrapper;
import kr.or.ddit.enumtype.ServiceResult;
import kr.or.ddit.file.service.FileUtilService;
import kr.or.ddit.file.service.FileUtilServiceImpl;
import kr.or.ddit.file.vo.AtchFIleVO;
import kr.or.ddit.work.service.WorkService;
import kr.or.ddit.work.vo.WorkFileVO;
import kr.or.ddit.work.vo.WorkVO;

@Controller
public class FileUploadController {
 
	@Inject
	private FileUtilService service;
	@Inject
	private WorkService workService;
	/*
	 예시  각자 serviceImpl에서 처리하면 되는 코드
	 */
	@RequestMapping(value="/project/{pCode}/file/fileExample")
	public String fileListPage(
			@PathVariable(name="pCode" ,required=true) String pCode , 
			@AuthenticationPrincipal AcceptMemberVOWrapper wrapper  
			,Model model
			) {
	AtchFIleVO fileVO = new AtchFIleVO();
	fileVO.setPrjctNo(pCode);
	model.addAttribute("fileVO" , fileVO);
		return "file/fileUploadEx";
	}
	
	
	@RequestMapping("/project/{pCode}/work/create/example")
	public String fileSet(
			@ModelAttribute("WorkVO") WorkVO workVO 
			, Model model , @PathVariable("pCode") String pCode ,
			@AuthenticationPrincipal AcceptMemberVOWrapper wrapper, 
			RedirectAttributes redirectAttributes
			){
		
		 String viewName = null;
		 String message = null;
		 AcceptMemberVO authMember = wrapper.getAdaptee();
		 //실제로는 form으로 넘겨서 model attribute로 받으시면 됩니다 
		 //지금은 예시라 하드코딩함
		 workVO.setPrjctNo(pCode);
		 workVO.setMemId(authMember.getMemId());
		 workVO.setCtgryCode("1");
		 workVO.setWorkPrgsDgreePoint(0);
		 //workVO.setWorkSj("파일을 경로 수정");
		 workVO.setWorkOthbcAt("1");
		 //workVO.setWorkCn("파일을 필터링해서 넣는 파일 ");
		 workVO.setWorkSttusCode("W00101");
		 workVO.setWorkPriortCode("W00201");
		  
		 workService.insertWork(workVO); 
		 viewName = "redirect:/project/"+ pCode +"/workList";
		return viewName;
		
	}
	 

	
	@RequestMapping(value = "/project/{pCode}/file/fileUpload", method = RequestMethod.POST  )
	@ResponseBody
 	public   Map<String, Object>uploadFiles( 
 						@RequestPart("files")  MultipartFile[] files,
  						@PathVariable("pCode") String pCode,
  						@AuthenticationPrincipal AcceptMemberVOWrapper wrapper, 
 						@RequestParam("menuClCode") String menuClCode
 			) throws IOException{
		if(files==null) return null;
		 AcceptMemberVO authMember = wrapper.getAdaptee();
		 String uploadId = authMember.getMemId();
		List<AtchFIleVO> fileList = new ArrayList<>();
		  for(MultipartFile file: files) {
			  if (!file.getOriginalFilename().isEmpty()) {
				  AtchFIleVO  fileVO= new AtchFIleVO(file);
				  fileVO.setPrjctNo(pCode);
				  fileVO.setMenuClCode(menuClCode);
				  fileVO.setTempAt("1");//템프여부는 템프파일이다의 상태로 업로드됨
				  fileVO.setMemId(uploadId);
				  fileList.add(fileVO);
			  }
		  } //파일 받는 것까지 확인
		 //System.out.println(fileList);
		 ServiceResult result =  service.fileInsert(fileList);
		 
		 Map<String, Object> resultMap = new HashMap<String ,Object>();
		 resultMap.put("result", result);
		 resultMap.put("files", fileList);
		 
		 return resultMap ;

	}
	
	 
	
}
