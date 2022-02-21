package kr.or.ddit.issue.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.annotation.PostConstruct;
import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.init.FileSavePathInfo;

@Controller
public class IssueImageUploadController {
 
	@Inject
	private FileSavePathInfo savePathInfo;
	
	private File saveFolder;
	@Inject
	private WebApplicationContext container;
	private ServletContext application;
	
	@PostConstruct
	public void init() {
		this.application = container.getServletContext();
	}
	
	@RequestMapping(value="/project/{pCode}/issue/create/uploadImage", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> uploadImage(
		@RequestPart("upload") MultipartFile uploadedImage
		,@PathVariable(name="pCode") String pCode
		,HttpServletRequest req 
			) throws IOException {
		Map<String, Object> result = new HashMap<>();
		saveFolder = savePathInfo.getTempSaveFolder();
		if(!uploadedImage.isEmpty()) {
				String saveName = UUID.randomUUID().toString();	
				File saveFile = new File(saveFolder, saveName);
				String saveFileUrl =  application.getContextPath() + savePathInfo.getTempFileUrl()+"/"+saveName;
						//+"/"+saveName;//savePathInfo.getIssueImagesUrl()+"/"+saveName;
				
				
				System.out.println(saveFileUrl);
				uploadedImage.transferTo(saveFile);
				result.put("uploaded", 1);
				result.put("fileName", uploadedImage.getOriginalFilename());
				result.put("url", saveFileUrl); 
			}
		return result;
	}
}
