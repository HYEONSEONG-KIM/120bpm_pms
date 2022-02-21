package kr.or.ddit.work.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.http.MediaType;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.accept.vo.AcceptMemberVO;
import kr.or.ddit.accept.vo.AcceptMemberVOWrapper;
import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.work.dao.WorkDAO;
import kr.or.ddit.work.service.WorkService;
import kr.or.ddit.work.vo.CommonVO;
import kr.or.ddit.work.vo.ObserverVO;
import kr.or.ddit.work.vo.WCartegoryVO;
import kr.or.ddit.work.vo.WorkVO;

@Controller
@RequestMapping(value="/project/{pCode}/work/create")
////project/프로젝트코드/workForm
public class WorkInsertController {
	
	@Inject
	private WorkDAO dao;
	@Inject
	private WorkService service;
	
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
			if (obList==null || obList.size()==0) return null;
			
			return obList;
	}
	
	
	@ModelAttribute("command")
	public String addCommand() {
		return "INSERT";
	}
	
	@ModelAttribute("work")
	public WorkVO work() {
		return new WorkVO();
	}
	
	//@RequestMapping(value="/project/{pCode}/work/create" , method=RequestMethod.GET)
	@GetMapping
	public String insertForm(
			@ModelAttribute("work") WorkVO work,
			@PathVariable(name="pCode")String pCode,
			Model model, @AuthenticationPrincipal AcceptMemberVOWrapper wrapper 
			 
			) {
		AcceptMemberVO adaptee	=	wrapper.getAdaptee();
		String memId = adaptee.getMemId();
		work.setPrjctNo(pCode);
		 
 
		return  "work/workForm";
	}
	
	 
	
	@PostMapping
	public String workInsert(
			@Validated (InsertGroup.class) @ModelAttribute("work") WorkVO workVO ,
			BindingResult errors, Model model , @PathVariable("pCode") String pCode ,
			@AuthenticationPrincipal AcceptMemberVOWrapper wrapper, 
			RedirectAttributes redirectAttributes
			){
		 String viewName = null;
		 String message = null;
		 AcceptMemberVO authMember = wrapper.getAdaptee();
		 String success = null;
		 if (!errors.hasErrors()) {
			 String result = service.addWork(workVO);  //	service.addWork(workVO);
				switch (result) {
				case "OK":
					viewName =  "redirect:/project/" + pCode+"/workDetail/" + workVO.getWorkCode();
					  
					success = "일감 추가 성공";
					redirectAttributes.addFlashAttribute("success", success);
					redirectAttributes.addFlashAttribute("act", "일감 추가");
					break;
					
				case "FILEFAIL":
					viewName=  "work/workForm";
					message = "파일  추가 실패";
					break;
					
				case "OBSERVERFAIL":
					viewName=  "work/workForm";
					message = "일감대상관리자  추가 실패";
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
			 redirectAttributes.addFlashAttribute("message", message);
			 redirectAttributes.addFlashAttribute("memIds",workVO.getMemIds());
			 viewName=  "work/workForm";	
		 }
		 
		 redirectAttributes.addFlashAttribute("message", message);
		 
		return viewName;
		
	}
	 
}
