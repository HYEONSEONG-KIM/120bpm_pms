package kr.or.ddit.file.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.accept.vo.AcceptMemberVO;
import kr.or.ddit.accept.vo.AcceptMemberVOWrapper;
import kr.or.ddit.enumtype.ServiceResult;
import kr.or.ddit.file.service.FileUtilService;
import kr.or.ddit.file.vo.AtchFIleVO;

@Controller
public class FileUploadNotice {


	@Inject
	private FileUtilService service;
 

	@RequestMapping(value = "/notice/file/fileUpload", method = RequestMethod.POST  )
	@ResponseBody
 	public   Map<String, Object>uploadFiles( 
 						@RequestPart("files")  MultipartFile[] files,
 						@RequestParam("menuClCode") String menuClCode
 						, 
 						@AuthenticationPrincipal AcceptMemberVOWrapper acceptWraper
 						
 			) throws IOException{
		if(files==null) return null;

		List<AtchFIleVO> fileList = new ArrayList<>();
		AcceptMemberVO vo = 	acceptWraper.getAdaptee();
		String memId = vo.getMemId();
		  for(MultipartFile file: files) {
			  if (!file.getOriginalFilename().isEmpty()) {
				  AtchFIleVO  fileVO= new AtchFIleVO(file);
				  fileVO.setMenuClCode(menuClCode);
				  fileVO.setTempAt("1");
				  fileVO.setMemId(memId);
				  fileList.add(fileVO);
			  }
		  } //파일 받는 것까지 확인
		 ServiceResult result =  service.fileInsert(fileList);
		 
		 Map<String, Object> resultMap = new HashMap<String ,Object>();
		 resultMap.put("result", result);
		 resultMap.put("files", fileList);
		 
		 return resultMap ;

	}
	
	
	
}
