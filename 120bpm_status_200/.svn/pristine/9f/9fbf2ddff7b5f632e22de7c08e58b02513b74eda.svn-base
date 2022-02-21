package kr.or.ddit.listener;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.ServletContext;

import org.apache.commons.lang3.StringUtils;
import org.aspectj.lang.Signature;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.context.event.EventListener;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;

import kr.or.ddit.accept.vo.ProjectMemVO;
import kr.or.ddit.enumtype.ServiceResult;
import kr.or.ddit.issue.service.IssueServiceImpl;
import kr.or.ddit.issue.vo.IssueVO;
import kr.or.ddit.listener.customevent.PushMsgCustomEvent;
import kr.or.ddit.makeProject.service.MakeProjectServiceImpl;
import kr.or.ddit.makeProject.vo.MakeProjectVO;
import kr.or.ddit.mypage.vo.MemSetVO;
import kr.or.ddit.projectSetting.service.ProjectUpdateServiceImpl;
import kr.or.ddit.pushMsg.dao.PushMsgDAO;
import kr.or.ddit.pushMsg.vo.PushMsgVO;
import kr.or.ddit.settings.dao.SettingsDAO;
import kr.or.ddit.settings.vo.SetupDetailVO;
import kr.or.ddit.work.service.WorkRepServiceImpl;
import kr.or.ddit.work.service.workServiceImpl;
import kr.or.ddit.work.vo.WorkVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import oracle.net.aso.e;

@Component
@Slf4j
@RequiredArgsConstructor
public class CustomEventListener {
	@Inject
	private final SettingsDAO setDetailDAO;
	
	@Inject
	private SimpMessagingTemplate messageTemplate;
	
	@Inject
	private PushMsgDAO pushDao;
	
	
	@EventListener(PushMsgCustomEvent.class)
	public void pushMsgEventHandler(PushMsgCustomEvent event) {
		
		// 이벤트가 발생한 클래스의 정보가 담기 map
		Map<String, Object> classInfo = event.getSource();
		// 이벤트가 발생한 클래스 정보
		Object target = classInfo.get("target");
		// 이벤트가 발생한 메서드
		Signature signature = (Signature) classInfo.get("signature");
		// 이벤트가 발생한 후 결과값
		Object resultVal = classInfo.get("resultVal");
		// 이벤트가 발생한 클래스의 파라미터
		Object[] args = event.getArgs();
		// 메세지
		String message = event.getMessage();
		
		// 푸쉬알림 받을 회원 ID
		String memId = null;
		// 푸쉬알림 받을 회원이 여러명일 경우
		List<String> memIdList = null;
		// 푸쉬알림 전송 여부(사용자 설정값 가져와 적용)
		boolean flag = true;
		// 푸쉬알림 전송 여부(사용자 설정값 가져와 적용) - 여러명일때
		List<Boolean> flags = new ArrayList<>();
		
		
		// 프로젝트 생성시 구성원에게 알림 메세지 전송
		if(target instanceof MakeProjectServiceImpl && signature.getName().equals("createProject")) {
			if(resultVal.equals(ServiceResult.OK)) {
				for(Object obj : args) {
					if(obj instanceof MakeProjectVO) {
						String prtNm = ((MakeProjectVO) obj).getPrjctNm();
						message = String.format(message, prtNm);
						if(StringUtils.isNoneBlank(((MakeProjectVO) obj).getMemId())) {
							memId = ((MakeProjectVO) obj).getMemId();
							// 회원별 알림 설정내역으로 보내는지의 여부 판단
							flag = memSetCheck(memId,1);
						}else {
							memIdList = new ArrayList<String>();
							for( ProjectMemVO id : ((MakeProjectVO) obj).getExtentMemList()) {
								memIdList.add(id.getMemId());
								// 회원별 알림 설정내역으로 보내는지의 여부 판단
								boolean check = memSetCheck(id.getMemId(),1);
								flags.add(check);
							} // end for
						}
					}
				}
			}else {
				return;
			}
		} // end if
		
		// 프로젝트 구성원 관리시 추가 된 구성원에게 메세지 전송
		else if(target instanceof ProjectUpdateServiceImpl && signature.getName().equals("addProjectMem")) {
			if(resultVal.equals(ServiceResult.OK)) {
				for(Object obj : args) {
					if(obj instanceof ProjectMemVO) {
						String prtNm = ((ProjectMemVO) obj).getPrjctNm();
						message = String.format(message, prtNm);
						memId = ((ProjectMemVO) obj).getMemId();
						flag = memSetCheck(memId,1);
					}
				}
			}else {
				return;
			}
		}
		// 프로젝트 구성원 관리시 제외된 구성원에게 메세지 전송
		else if(target instanceof ProjectUpdateServiceImpl && signature.getName().equals("removePrtMem")) {
			if(resultVal.equals(ServiceResult.OK)) {
				for(Object obj : args) {
					if(obj instanceof ProjectMemVO) {
						String prtNm = ((ProjectMemVO) obj).getPrjctNm();
						message = String.format(message, prtNm);
						memId = ((ProjectMemVO) obj).getMemId();
						flag = memSetCheck(memId,2);
					}
				}
			}else {
				return;
			}
		}
		//프로젝트 구성원 역할 변경시 해당 구성원에게 메세지 전송
		else if(target instanceof ProjectUpdateServiceImpl && signature.getName().equals("modifyMemRole")) {
			if(resultVal.equals(ServiceResult.OK)) {
				for(Object obj : args) {
					if(obj instanceof ProjectMemVO) {
						String prtNm = ((ProjectMemVO) obj).getPrjctNm();
						String role = ((ProjectMemVO) obj).getAuthor().substring(5);
						message = String.format(message, prtNm, role);
						memId = ((ProjectMemVO) obj).getMemId();
						flag = memSetCheck(memId,3);
					}
				}
			}else {
				return;
			}
		}
		// 일감 등록,수정 시 관람자에게 메세지 전송
		else if((target instanceof workServiceImpl && signature.getName().equals("addWork")) ||
				(target instanceof workServiceImpl && signature.getName().equals("updateWork"))) {
			System.out.println("check!!");
			if(resultVal.equals("OK")) {
				for(Object obj : args) {
					if(obj instanceof WorkVO) {
						String[] obMemIds = ((WorkVO) obj).getMemIds();
						String workNm = ((WorkVO) obj).getWorkSj();
						if(obMemIds == null) {
							return;
						}
						message = String.format(message, workNm);
						memIdList = new ArrayList<>();
						for(String obMemId : obMemIds) {
							memIdList.add(obMemId);
							boolean check = memSetCheck(obMemId,5);
							flags.add(check);
						}
					}
				}
			}else {
				return;
			}
		}
		// 일감 승인, 반려시 해당 회원에게 메세지 전송
		else if(target instanceof workServiceImpl && signature.getName().equals("refuseWork")) {
			
			if(resultVal.equals("OK")) {
				for(Object obj : args) {
					if(obj instanceof WorkVO) {
						String workNm = ((WorkVO) obj).getWorkSj();
						message = String.format(message, workNm);
						String[] memIds = ((WorkVO) obj).getMemIds();
						memId = memIds[0];
						flag = memSetCheck(memId,4);
					}
				}
			}else {
				return;
			}
		}
		// 이슈 등록, 수정 시 관람자에게 메세지 전송
		else if((target instanceof IssueServiceImpl && signature.getName().equals("addIssue"))) {
				
			if(resultVal.equals("OK")) {
				for(Object obj : args) {
					if(obj instanceof IssueVO) {
						String[] obMemIds = ((IssueVO) obj).getMemIds();
						String workNm = ((IssueVO) obj).getWorkSj();
						if(obMemIds == null) {
							return;
						}
						memIdList = new ArrayList<String>();
						message = String.format(message, workNm);
						for(String obMemId : obMemIds) {
							System.out.println(obMemId);
							memIdList.add(obMemId);
							boolean check = memSetCheck(obMemId,6);
							flags.add(check);
						}
					}
				}
			}else {
				return;
			}
			
		}
		
		
		
		// 푸쉬알림 메세지 전송 및 DB저장
		if(StringUtils.isNotBlank(memId)) {
			if(!flag) {
				return;
			}
			PushMsgVO pushMsg = new PushMsgVO(message,memId);
			pushDao.insertPushMsg(pushMsg);
			messageTemplate.convertAndSend("/topic/push/" + memId, message);
		}else if(memIdList.size() > 0 && memIdList != null) {
			List<PushMsgVO> pushList = new ArrayList<>();
			int checkCnt = 0;
			for(String id : memIdList) {
				if(flags.get(checkCnt)) {
					PushMsgVO push = new PushMsgVO(message, id);
					pushList.add(push);
				}
				checkCnt++;
			}
			pushDao.insertAllPushMsg(pushList);
			checkCnt = 0;
			for(String id : memIdList) {
				if(flags.get(checkCnt)) {
					messageTemplate.convertAndSend("/topic/push/" + id, message);
				}
				checkCnt++;
			}
		}
		
		
	}
	
	public boolean memSetCheck(String memId, int setUpCnNo) {
		boolean check = true;
		List<MemSetVO> memSetList = pushDao.memSetList();
		
		for(MemSetVO memSet : memSetList) {
			if(memSet.getMemId().equals(memId) && memSet.getSetupCnNo() == setUpCnNo && memSet.getSetupValue().equals("0")) {
				check = false;
			}
		}
		
		return check;
	}


	//reload event
	@EventListener(ContextRefreshedEvent.class)
	public void eventHandler(ContextRefreshedEvent event) {
		WebApplicationContext container = (WebApplicationContext) event.getApplicationContext();
		ServletContext application = container.getServletContext();
		if(application.getAttribute("cPath")==null)
			application.setAttribute("cPath", application.getContextPath());
		
		List<SetupDetailVO> sdList = setDetailDAO.selectSetupDetailList();
		String argName = null;
		for(SetupDetailVO sd : sdList) {
			argName = sd.getSetupCode() + sd.getSetupCnNo() + sd.getSetupDetailNo();
			if(application.getAttribute(argName)==null) {
				application.setAttribute(argName, sd.getSetupValue());
			} 
		}
		
		Map<String, String> exitingMsg = new HashMap<String, String>();
		if(application.getAttribute("exitingMsg") == null) {
			application.setAttribute("exitingMsg", exitingMsg);
		}
		
		log.info("시작된 컨테이너 : {}", container); 
		log.info("가져온 SetupDetailList 첫번째 vo : {}", sdList.get(0));
		log.info("마지막 argName : {}", argName); 
	}
	

}
















