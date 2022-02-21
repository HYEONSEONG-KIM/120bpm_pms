package kr.or.ddit.file.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Component;

import kr.or.ddit.file.service.FileService;

@Component
public class FileSheduledController {
	@Inject
	private FileService service; 
	
	// * * * * * * 
	// 초 분(0-59) 시간(0-23) 일(1-31) 월(1-12)  요일(0-7)
	//1 : 월요일  2: 화 3: 수  4: 목 5: 금 6: 토 7:일
	@org.springframework.scheduling.annotation.Scheduled(cron="0 0 0 * * 1")
	public void deleteFileDAO() {
		service.deleteTempFile();
	}
}
