package kr.or.ddit.file.view;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.compress.archivers.zip.ZipArchiveEntry;
import org.apache.commons.compress.archivers.zip.ZipArchiveOutputStream;
import org.apache.commons.io.FileUtils;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

import kr.or.ddit.enumtype.BrowserType;
import kr.or.ddit.file.vo.AtchFIleVO;
import kr.or.ddit.init.FileSavePathInfo;

public class ZipDownloadView extends AbstractView{

	@Inject
	private FileSavePathInfo savePathInfo;

	private static final String  DISPOSITION = "Content-Disposition";

	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest req,
			HttpServletResponse resp) throws Exception {
			List<AtchFIleVO> fileList =		(List<AtchFIleVO>) model.get("fileList");
			if(fileList.size() == 0 ) return ; 
			LocalDate now = LocalDate.now();
			// 포맷 정의
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy.MM.dd");
			// 포맷 적용
			String zipName  = now.format(formatter);
			
			File saveFolder = savePathInfo.getTempSaveFolder();
		//	File createFile = new File("압축파일.zip");
			FileOutputStream fout = new FileOutputStream(zipName +".zip");
			//커먼즈 zip 파일 유틸임 
			ZipArchiveOutputStream zos  =new ZipArchiveOutputStream(fout);
			zos.setEncoding("UTF-8");
			 
			byte[] buff = new byte[1024];
			
			for(AtchFIleVO vo : fileList)  {
				File file = new File(saveFolder , vo.getFileSavedNm());	 
				//일단 기존에 존재하는 파일을 읽어옹
				FileInputStream fis = new FileInputStream(file);
				//새로운 엔트리를 만들어서 넣는다.
				ZipArchiveEntry ze = new ZipArchiveEntry(vo.getFileNm());
				zos.putArchiveEntry(ze);
				 
				int len;
				//하나씩 읽어서 파일
	            while((len = fis.read(buff)) > 0) {
	                zos.write(buff, 0, len);
	            }
	            zos.closeArchiveEntry();
	            fis.close();
			}
			
			zos.close();
			
			String orgFileName = "download.zip";
			File zipFile = new File(zipName+".zip");
			resp.setContentLength((int)zipFile.length());
			//파일 다운로드 헤더 설정
			//구글 메일 용량큰 zip 파일 다운로드 받을 때 컨텐츠 타입 이거임
			resp.setContentType("application/zip");
			
			resp.setHeader(DISPOSITION, "attatchment;fileName=\"" +orgFileName +"\";" );
			//resp.setHeader("Content-Transfer-Encoding", "binary");
			resp.setHeader("Content-Transfer-Encoding", "binary");

			String userAgent = req.getHeader("User-Agent");
			BrowserType browserType = BrowserType.findBrowserType(userAgent); //이넘 
			

			switch (browserType) {
			case MSIE :
			case TRIDENT :
				orgFileName = URLEncoder.encode(orgFileName , "UTF-8");
				orgFileName = orgFileName.replace("+", " ");
				break;
			default :
				byte[] bytes = orgFileName.getBytes();
				orgFileName = new String(bytes ,  "ISO-8859-1");
				break; 
			}
			
	        try(	
	        		 FileInputStream fis2 = new FileInputStream(zipFile);
	        		OutputStream out = resp.getOutputStream();
	        		){
	        		//	FileUtils.copyFile(zipFile, out);
	        	  	FileCopyUtils.copy(fis2, out);
	        	  	
	        		}finally {
	        			 zipFile.delete();
					} 
	         
			 
	}

}
