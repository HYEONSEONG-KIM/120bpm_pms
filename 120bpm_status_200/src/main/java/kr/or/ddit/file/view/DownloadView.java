package kr.or.ddit.file.view;

import java.io.File;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;
import org.springframework.web.servlet.view.AbstractView;

import kr.or.ddit.enumtype.BrowserType;
import kr.or.ddit.file.vo.AtchFIleVO;
import kr.or.ddit.init.FileSavePathInfo;

public class DownloadView extends AbstractView  {

	/*@Value("#{appInfo.attatchPath}")
	private File saveFolder;*/
	
	@Inject
	private FileSavePathInfo savePathInfo;

	private static final String  DISPOSITION = "Content-Disposition";

 
	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest req,
			HttpServletResponse resp
			) throws Exception {
		
		AtchFIleVO fileVO = (AtchFIleVO)model.get("file");
		File saveFolder = savePathInfo.getTempSaveFolder();
		File saveFile = new File(saveFolder, fileVO.getFileSavedNm());
		
		if(!saveFile.exists()) {
			String referer = (String)req.getHeader("REFERER");
			HttpSession session = 	req.getSession();
			session.setAttribute("downLoadFail", "파일이 손상되었습니다");
			resp.sendRedirect(referer);
			
		}else { 
			String userAgent = req.getHeader("User-Agent");
			BrowserType browserType = BrowserType.findBrowserType(userAgent); //이넘 
			String fileName = fileVO.getFileNm(); 
			
			switch (browserType) {
			case MSIE :
			case TRIDENT :
				fileName = URLEncoder.encode(fileName , "UTF-8");
				fileName = fileName.replace("+", " ");
				break;
			default :
				byte[] bytes = fileName.getBytes();
				fileName = new String(bytes ,  "ISO-8859-1");
				break; 
			}
			//파일 다운로드 헤더 설정
			resp.setContentType("application/octet-stream");
			resp.setHeader("Content-Length", fileVO.getFileSize()+"");
			resp.setHeader(DISPOSITION, "attatchment;fileName=\"" +fileName +"\"" );
			try(
					OutputStream os = resp.getOutputStream();
					){
				FileUtils.copyFile(saveFile, os);
			}
		
		}
		
	}
	
	
	  
}
