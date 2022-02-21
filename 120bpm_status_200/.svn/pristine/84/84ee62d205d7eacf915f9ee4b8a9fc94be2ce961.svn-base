package kr.or.ddit.init;

import java.io.File;
import java.io.IOException;

import javax.annotation.PostConstruct;
import javax.servlet.ServletContext;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.web.context.WebApplicationContext;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;

@Data
@Slf4j
public class FileSavePathInfoStage implements FileSavePathInfo, ApplicationContextAware{
	private WebApplicationContext container;
	private ServletContext application;
	
	@Override
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		this.container = (WebApplicationContext) applicationContext;
		this.application = container.getServletContext();
	}
	
	@PostConstruct
	public void init() throws IOException {
		boardSaveFolder = new File( application.getRealPath(boardImagesUrl) );
		if(!boardSaveFolder.exists()) boardSaveFolder.mkdirs();
		log.info("상품이미지 경로(url) : {}, \n실제 경로(path) : {}", boardImagesUrl, boardSaveFolder.getCanonicalPath());
		
		memberSaveFolder = new File( application.getRealPath(memberImagesUrl) );
		if(!memberSaveFolder.exists()) memberSaveFolder.mkdirs();
		log.info("회원이미지 경로(url) : {}, \n실제 경로(path) : {}", memberImagesUrl, memberSaveFolder.getCanonicalPath());
		
		issueSaveFolder = new File( application.getRealPath(issueImagesUrl) );
		if(!issueSaveFolder.exists()) issueSaveFolder.mkdirs();
		log.info("이슈이미지 경로(url) : {}, \n실제 경로(path) : {}", issueImagesUrl, issueSaveFolder.getCanonicalPath());
		
		newsSaveFolder = new File( application.getRealPath(newsImagesUrl) );
		if(!newsSaveFolder.exists()) newsSaveFolder.mkdirs();
		log.info("뉴스이미지 경로(url) : {}, \n실제 경로(path) : {}", newsImagesUrl, newsSaveFolder.getCanonicalPath());
		
		noticeSaveFolder = new File( application.getRealPath(noticeImagesUrl) );
		if(!noticeSaveFolder.exists()) noticeSaveFolder.mkdirs();
		log.info("공지사항 이미지 경로(url) : {}, \n실제 경로(path) : {}", noticeImagesUrl, noticeSaveFolder.getCanonicalPath());
		
		wikiSaveFolder = new File( application.getRealPath(wikiImagesUrl) );
		if(!wikiSaveFolder.exists()) wikiSaveFolder.mkdirs();
		log.info("위키이미지 경로(url) : {}, \n실제 경로(path) : {}", wikiImagesUrl, wikiSaveFolder.getCanonicalPath());
		
		workSaveFolder = new File( application.getRealPath(workImagesUrl) );
		if(!workSaveFolder.exists()) workSaveFolder.mkdirs();
		log.info("일감이미지 경로(url) : {}, \n실제 경로(path) : {}", workImagesUrl, workSaveFolder.getCanonicalPath());
		
		tempSaveFolder = new File( application.getRealPath(tempFileUrl) );
		if(!tempSaveFolder.exists()) tempSaveFolder.mkdirs();
		log.info("일감이미지 경로(url) : {}, \n실제 경로(path) : {}", tempFileUrl, tempSaveFolder.getCanonicalPath());
		
		if(!attatchSaveFolder.exists()) attatchSaveFolder.mkdirs();
		log.info("첨부파일 저장 경로 : {}", attatchSaveFolder.getCanonicalPath());
	}

	@Value("#{appInfo.boardImagesUrl}")
	private String boardImagesUrl;
	private File boardSaveFolder;
	
	@Value("#{appInfo.issueImagesUrl}")
	private String issueImagesUrl;
	private File issueSaveFolder;
	
	
	@Value("#{appInfo.memberImagesUrl}")
	private String memberImagesUrl;
	private File memberSaveFolder;
	
	
	@Value("#{appInfo.newsImagesUrl}")
	private String newsImagesUrl;
	private File newsSaveFolder;
	
	
	@Value("#{appInfo.noticeImagesUrl}")
	private String noticeImagesUrl;
	private File noticeSaveFolder;
	
	
	@Value("#{appInfo.wikiImagesUrl}")
	private String wikiImagesUrl;
	private File wikiSaveFolder;
	
	@Value("#{appInfo.workImagesUrl}")
	private String workImagesUrl;
	private File workSaveFolder;
	
	@Value("#{appInfo.tempFileUrl}")
	private String tempFileUrl;
	private File tempSaveFolder;
	
	@Value("#{appInfo.attatchPath}")
	private File attatchSaveFolder;
	
}
