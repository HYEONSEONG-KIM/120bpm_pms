package kr.or.ddit.advice;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.crypto.spec.PSource;
import javax.inject.Inject;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.context.WebApplicationContext;

import kr.or.ddit.accept.vo.AcceptMemberVO;
import kr.or.ddit.accept.vo.AcceptMemberVOWrapper;
import kr.or.ddit.listener.customevent.PushMsgCustomEvent;
import kr.or.ddit.pushMsg.vo.PushMsgVO;
import lombok.extern.slf4j.Slf4j;


@Aspect
@Slf4j
public class pushMsgAdvice {

	@Inject
	private WebApplicationContext context;
	
	private Map<String, String> pushMsg = new HashMap<>();
	private Map<String, Object> classInfo = new HashMap<>();
	
	@Pointcut("execution(* kr.or.ddit..service.*.*(..))")
	public void pushPointCut() {}

	
	@PostConstruct
	public void init() {
		pushMsg.put("kr.or.ddit.makeProject.service.MakeProjectServiceImpl.createProject", "'%s' 프로젝트에 초대 되었습니다");
		pushMsg.put("kr.or.ddit.projectSetting.service.ProjectUpdateServiceImpl.addProjectMem", "'%s' 프로젝트에 초대 되었습니다");
		pushMsg.put("kr.or.ddit.projectSetting.service.ProjectUpdateServiceImpl.removePrtMem", "'%s' 프로젝트에서 제외 되었습니다");
		pushMsg.put("kr.or.ddit.projectSetting.service.ProjectUpdateServiceImpl.modifyMemRole", "'%s' 프로젝트의 역할이 %s로 변경되었습니다");
		pushMsg.put("kr.or.ddit.work.service.workServiceImpl.addWork","'%s' 일감의 관람자로 등록되었습니다");
		pushMsg.put("kr.or.ddit.work.service.workServiceImpl.updateWork","'%s' 일감이 수정되었습니다");
		pushMsg.put("kr.or.ddit.work.service.workServiceImpl.refuseWork","'%s' 일감이 반려되었습니다");
		pushMsg.put("kr.or.ddit.issue.service.IssueServiceImpl.addIssue","'%s' 일감의 이슈가 발생하였습니다");
	}
	
	@Around("pushPointCut()")
	public Object aroundAdvice(ProceedingJoinPoint joinPoint
		) throws Throwable{
	
		
		// 실행되는 클래스 정보 
		Object target = joinPoint.getTarget();
		// 실행되는 메서드 정보
		Signature signature = joinPoint.getSignature();
		
		//--- 호출전 위빙 포인트 ---
		// 클래스 QN + 메서드명
		String targetName = String.format("%s.%s", target.getClass().getName(), signature.getName());
		
		
		Object resultVal = joinPoint.proceed();
		// --- 호출 후 위빙 포인트
		
		// 해당 메서드의 파라미터
		Object[] args = joinPoint.getArgs();
		for(String key : pushMsg.keySet()) {
			classInfo.put("target", target);
			classInfo.put("signature", signature);
			classInfo.put("resultVal", resultVal);
			if(key.equals(targetName)) {
				context.publishEvent(new PushMsgCustomEvent(classInfo, pushMsg.get(key), args));
			}
		}
		
		return resultVal;
	}
	
}
