package kr.or.ddit.init;

import java.io.File;
import java.io.IOException;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Value;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;

@Data
@Slf4j
public class FileSavePathInfoDev implements FileSavePathInfo{
	@PostConstruct
	public void init() throws IOException {
		if(!boardSaveFolder.exists()) boardSaveFolder.mkdirs();
		log.info("게시판이미지 경로(url) : {}, \n실제 경로(path) : {}", boardImagesUrl, boardSaveFolder.getCanonicalPath());
		
		if(!memberSaveFolder.exists()) memberSaveFolder.mkdirs();
		log.info("회원이미지 경로(url) : {}, \n실제 경로(path) : {}", memberImagesUrl, memberSaveFolder.getCanonicalPath());
		
		if(!issueSaveFolder.exists()) issueSaveFolder.mkdirs();
		log.info("이슈이미지 경로(url) : {}, \n실제 경로(path) : {}", issueImagesUrl, issueSaveFolder.getCanonicalPath());
		
		if(!newsSaveFolder.exists()) newsSaveFolder.mkdirs();
		log.info("뉴스이미지 경로(url) : {}, \n실제 경로(path) : {}", newsImagesUrl, newsSaveFolder.getCanonicalPath());
		
		if(!noticeSaveFolder.exists()) noticeSaveFolder.mkdirs();
		log.info("공지사항 이미지 경로(url) : {}, \n실제 경로(path) : {}", noticeImagesUrl, noticeSaveFolder.getCanonicalPath());
		
		if(!wikiSaveFolder.exists()) wikiSaveFolder.mkdirs();
		log.info("위키이미지 경로(url) : {}, \n실제 경로(path) : {}", wikiImagesUrl, wikiSaveFolder.getCanonicalPath());
		
		if(!workSaveFolder.exists()) workSaveFolder.mkdirs();
		log.info("일감이미지 경로(url) : {}, \n실제 경로(path) : {}", workImagesUrl, workSaveFolder.getCanonicalPath());
		
		if(!tempSaveFolder.exists()) tempSaveFolder.mkdirs();
		log.info("temp 파일 경로(url) : {}, \n실제 경로(path) : {}", tempFileUrl, tempSaveFolder.getCanonicalPath());
	}

	@Value("#{appInfo.boardImagesUrl}")
	private String boardImagesUrl;
	@Value("#{appInfo.boardImagesPath}")
	private File boardSaveFolder;
	
	@Value("#{appInfo.issueImagesUrl}")
	private String issueImagesUrl;
	@Value("#{appInfo.issueImagesPath}")
	private File issueSaveFolder;
	
	
	@Value("#{appInfo.memberImagesUrl}")
	private String memberImagesUrl;
	@Value("#{appInfo.memberImagesPath}")
	private File memberSaveFolder;
	
	
	@Value("#{appInfo.newsImagesUrl}")
	private String newsImagesUrl;
	@Value("#{appInfo.newsImagesPath}")
	private File newsSaveFolder;
	
	
	@Value("#{appInfo.noticeImagesUrl}")
	private String noticeImagesUrl;
	@Value("#{appInfo.noticeImagesPath}")
	private File noticeSaveFolder;
	
	
	@Value("#{appInfo.wikiImagesUrl}")
	private String wikiImagesUrl;
	@Value("#{appInfo.wikiImagesPath}")
	private File wikiSaveFolder;
	
	@Value("#{appInfo.workImagesUrl}")
	private String workImagesUrl;
	@Value("#{appInfo.workImagesPath}")
	private File workSaveFolder;
	
	@Value("#{appInfo.tempFileUrl}")
	private String tempFileUrl;
	@Value("#{appInfo.tempFilePath}")
	private File tempSaveFolder;
	
	
}
