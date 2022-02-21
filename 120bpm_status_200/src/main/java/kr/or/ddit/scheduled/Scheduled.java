package kr.or.ddit.scheduled;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import javax.inject.Inject;

import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Component;

import kr.or.ddit.accept.vo.ProjectMemVO;
import kr.or.ddit.makeProject.vo.MakeProjectVO;
import kr.or.ddit.pushMsg.dao.PushMsgDAO;
import kr.or.ddit.pushMsg.vo.PushMsgVO;
import kr.or.ddit.scheduled.dao.ScheduledDAO;
import kr.or.ddit.scheduled.vo.PrtMemUpdateVO;

@Component
public class Scheduled {

	@Inject
	private SimpMessagingTemplate messagingTemplate;
	
	@Inject
	private ScheduledDAO dao;
	
	@Inject
	private PushMsgDAO pushDao;
	
	@org.springframework.scheduling.annotation.Scheduled(cron = "0 0 0 * * *")
	public void projectEndPushMsg() throws ParseException {
		
		List<MakeProjectVO> prtList = dao.selectPrtList();
		List<Integer> endPrtNoList = new ArrayList<>();
		List<ProjectMemVO> endPrtMemList = null;
		List<PushMsgVO> pushList = new ArrayList<>();
		
		String messageFormat = "'%s' 프로젝트가 마감 되었습니다. 프로젝트 리스트에 가셔서 마감보고서를 확인하세요";
		
		// 현재시간 원하는 포맷으로 구하기
		SimpleDateFormat format = new SimpleDateFormat("yy-MM-dd");
		Date now = new Date();
		String nowStr = format.format(now);
		Date nowTime = new Date(format.parse(nowStr).getTime());
		Calendar calendarNow = new GregorianCalendar();
		calendarNow.setTime(nowTime);
		calendarNow.add(Calendar.DATE, -1);
		long nowMilliSec = calendarNow.getTimeInMillis();
		
		Calendar prtEdnDECal = new GregorianCalendar();
		
		//프로젝트중 자정을 기준으로 끝난 프로젝트 번호 리스트 찾기
		for(MakeProjectVO prt : prtList) {
			String prtEndDE = prt.getPrjctEndde();
			Date dateDB = new Date(format.parse(prtEndDE).getTime());
			prtEdnDECal.setTime(dateDB);
			long prtEndDeMilliSec = prtEdnDECal.getTimeInMillis();
			if(nowMilliSec == prtEndDeMilliSec) {
				endPrtNoList.add(prt.getPrjctNo());
			}
		}
		
		// 끝난 프로젝트 회원 리스트 담기
		if(endPrtNoList.size() != 0) {
			endPrtMemList = dao.selectEndPrtMemList(endPrtNoList);
		}
		
		List<PrtMemUpdateVO> updateMemList = new ArrayList<>();
		
		// 푸쉬알림 전송 및 해당 새로운 테이블에 insert후 회원들 OB로 변경
		// endPrtMemList에 마감 프로젝트의 회원목록
		if(endPrtMemList != null) {
			
			// 새로운 테이블에 회원 삽입
			dao.insertEndPrtMem(endPrtMemList);
			// 프로젝트 테이블 회원정보 수정을 위한 List조회
			updateMemList = dao.updateMemList(endPrtNoList);
			// 수정
			dao.updateEndPrtMem(updateMemList);
			for(ProjectMemVO prtMem : endPrtMemList) {
				PushMsgVO push = new PushMsgVO();
				String memId = prtMem.getMemId();
				
				push.setMemId(memId);
				push.setPushMessage(String.format(messageFormat, prtMem.getPrjctNm()));
				pushList.add(push);
				messagingTemplate.convertAndSend("/topic/push/" + prtMem.getMemId(), 
						String.format(messageFormat, prtMem.getPrjctNm()));
			}
			pushDao.insertAllPushMsg(pushList);
		}
	}
	
	
}
