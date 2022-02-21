package kr.or.ddit.work.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.tiles.request.Request;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.accept.vo.AcceptMemberVO;
import kr.or.ddit.accept.vo.AcceptMemberVOWrapper;
import kr.or.ddit.accept.vo.ProjectMemVO;
import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.validate.groups.UpdateGroup;
import kr.or.ddit.work.dao.WorkDAO;
import kr.or.ddit.work.service.WorkService;
import kr.or.ddit.work.vo.CommonVO;
import kr.or.ddit.work.vo.ObserverVO;
import kr.or.ddit.work.vo.WCartegoryVO;
import kr.or.ddit.work.vo.WorkAuthVO;
import kr.or.ddit.work.vo.WorkVO;
@Controller
////project/프로젝트코드/일감코드/workForm
//@RequestMapping(value="/project/{pCode}/modify")
@RequestMapping(value="/project/{pCode}/work/modify/{workCode}")
public class WorkUpdateController {
	@Inject
	private WorkService service;
	
	@Inject
	private WorkDAO dao;
	
	@ModelAttribute("command")
	public String addCommand() {
		return "UPDATE";
	}

	@ModelAttribute("work")
	public WorkVO work() {
		return new WorkVO();
	}
	
	@ModelAttribute("cartegoryList") 
	public List<WCartegoryVO> cartegoryList(@PathVariable(name="pCode")String pCode){
		List<WCartegoryVO> cartegoryList = dao.selectCartegory(Integer.parseInt(pCode));
		return cartegoryList;
	}
 
	@ModelAttribute("commonList")
	public List<CommonVO> commonList(@PathVariable(name="pCode")String pCode ){
		List<CommonVO> commonsLists = dao.selectCommonCode("W001");
		List<CommonVO> list = new ArrayList<>();
			for(CommonVO vo : commonsLists) {
				   if(! "완료".equals((vo.getCodeNm())) ) {
					   list.add(vo);
				   } 
			}
			return list;
	}
	@ModelAttribute("priortList")
	public List<CommonVO> priortList(@PathVariable(name="pCode")String pCode){
		List<CommonVO> commonsLists = dao.selectCommonCode("W002");
		List<CommonVO> list = new ArrayList<>();
			for(CommonVO vo : commonsLists) {
				   if(! "완료".equals((vo.getCodeNm())) ) {
					   list.add(vo);
				   } 
			}
			return list;
			
	}
	@ModelAttribute("observerList") 
	public List<ObserverVO> observerList(@PathVariable(name="pCode")String pCode , @AuthenticationPrincipal AcceptMemberVOWrapper wrapper  ){
		WorkVO work = new WorkVO();
		AcceptMemberVO adaptee	=	wrapper.getAdaptee();
		String memId = adaptee.getMemId();
		work.setPrjctNo(pCode);
		work.setMemId(memId);
		List<ObserverVO>observerList =	dao.selectAllProjectMem(work);
		List<ObserverVO> obList = new ArrayList<>(); 
			for(ObserverVO vo : observerList) {
				if(!vo.getMemId().equals(memId)  ){
					obList.add(vo);
				}
			}
			return obList;
	}
	
	
	 
	@GetMapping
	public String updateForm(
			@ModelAttribute("work") WorkVO work,
			@PathVariable(name="pCode" ,required=true)String pCode  
			, @PathVariable(name="workCode")String workCode , 
			@AuthenticationPrincipal AcceptMemberVOWrapper wrapper ,
			RedirectAttributes redirectAttributes, HttpServletRequest req ,
			Model model
			) {
		String viewName = null;
		String message = null;
		AcceptMemberVO authMember = wrapper.getAdaptee();
		String referer = null;
		work.setPrjctNo(pCode);
		work.setWorkCode(workCode);
		work.setMemId(authMember.getMemId());
		
		List<ProjectMemVO> list = authMember.getProjectMemRole();
		WorkAuthVO authVO = new WorkAuthVO();
		authVO.setPrjctNo(pCode);
		authVO.setMemId(authMember.getMemId());
		for(ProjectMemVO vo :list) {
			String pno = vo.getPrjctNo() +"";
			if(pno.equals(pCode)) {
				authVO.setAuthor(vo.getAuthor());
			}
		}
		Map<String, Object> result = service.retrieveWorkDetails(work);
		
		
		
		
		if("SUCCESS".equals(result.get("result")) ) {
			work= (WorkVO) result.get("work");
			//List<ObserverVO> workObserverList = work.getWorkObserverList();
		 
			if(work.getMemId().equals(authMember.getMemId()) || "ROLE_PM".equals(authVO.getAuthor()) ) {
				
				if("W00301".equals(work.getWorkReqSttusCode()) || "W00302".equals(work.getWorkReqSttusCode()) ) {
					message = "이미 완료된 일감이나 승인 요청이 된 일감은 수정이 불가합니다.";
					referer = 	(String)req.getHeader("REFERER");
					viewName =  "redirect:"+ referer;
				}else {
					referer = 	(String)req.getHeader("REFERER");
					model.addAttribute("work", work);
					viewName = "work/workForm";
				}
			}else {
				 referer = 	(String)req.getHeader("REFERER");
				 viewName =  "redirect:"+ referer;
				 message = "해당 일감의 수정 권한이 없습니다.";
			}
	 
	}else {
		message = "해당 일감을 조회할 수 없습니다";
	}
		redirectAttributes.addFlashAttribute("message", message);
	
	return viewName;
	
		}
	
	
	@PostMapping
	public String workUpdate(
			@Validated (UpdateGroup.class) @ModelAttribute("work") WorkVO workVO ,
			BindingResult errors, Model model , @PathVariable("pCode") String pCode ,
			@AuthenticationPrincipal AcceptMemberVOWrapper wrapper, 
			RedirectAttributes redirectAttributes
			) {
		 String viewName = null;
		 String message = null;
		 AcceptMemberVO authMember = wrapper.getAdaptee();
		 String success = null;
		 List<ProjectMemVO> roleList = authMember.getProjectMemRole();
		 workVO.setRoleList(roleList);
		 if (!errors.hasErrors()) {
			 String result = service.updateWork(workVO);  //	service.addWork(workVO);
				switch (result) {
				case "OK":
					viewName =  "redirect:/project/" + pCode+"/workDetail/" + workVO.getWorkCode();
					  
					success = "일감 수정 성공";
					redirectAttributes.addFlashAttribute("success", success);
					redirectAttributes.addFlashAttribute("act", "일감 수정");
					break;
					
				case "FILEFAIL":
					viewName=  "work/workForm";
					message = "파일  수정 실패";
					break;
					
				case "OBSERVERFAIL":
					viewName=  "work/workForm";
					message = "일감대상관리자 수정 실패";
					break;	
				 
				default:
					viewName=  "work/workForm";
					message = "서버 오류입니다. 조금 뒤 다시 시도해주세요";
					break;
				}
		 }else {
			 
			 String errorsAttrName = BindingResult.class.getName() + ".work";
			 String[] memIds = 	workVO.getMemIds();
			 if(memIds!=null && memIds.length>0) {
				 List<ObserverVO> observerList = new ArrayList<>();
				 for(String memId :memIds) {
					 ObserverVO vo = new ObserverVO();
					 vo.setMemId(memId);
					 observerList.add(vo);
				 }
				 workVO.setWorkObserverList(observerList);
			 }
			 redirectAttributes.addFlashAttribute(errorsAttrName, errors);
			 redirectAttributes.addFlashAttribute("memIds",workVO.getMemIds());
			 viewName=  "work/workForm";	
		 }
		 
		 redirectAttributes.addFlashAttribute("message", message);
 
		return viewName;
		
	}
	
	
	
	
	
	
	
}
