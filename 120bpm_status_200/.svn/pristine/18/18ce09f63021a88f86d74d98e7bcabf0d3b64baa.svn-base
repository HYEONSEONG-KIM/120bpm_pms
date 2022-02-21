package kr.or.ddit.work.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.accept.vo.AcceptMemberVO;
import kr.or.ddit.accept.vo.AcceptMemberVOWrapper;
import kr.or.ddit.member.service.MailService;
import kr.or.ddit.work.dao.WorkDAO;
import kr.or.ddit.work.service.WorkService;
import kr.or.ddit.work.vo.CommonVO;
import kr.or.ddit.work.vo.ExtendPagingVO;
import kr.or.ddit.work.vo.ExtendSearchVO;
import kr.or.ddit.work.vo.ObserverVO;
import kr.or.ddit.work.vo.WCartegoryVO;
import kr.or.ddit.work.vo.WorkVO;

@Controller
public class WorkManagerController {

	@Inject
	private WorkService service;
	
	@Inject
	private WorkDAO dao;
	@Inject
    private MailService mailService;

	@Inject
	private PasswordEncoder passwordEncoder;

	@Value("${email.sendId}")
	String id;

	@ModelAttribute("cartegoryList") 
	public List<WCartegoryVO> cartegoryList(@PathVariable(name="pCode")String pCode){
		List<WCartegoryVO> cartegoryList = dao.selectCartegory(Integer.parseInt(pCode));
		return cartegoryList;
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
	
	
	@ModelAttribute("pMember") 
	public List<ObserverVO> observerList(@PathVariable(name="pCode")String pCode    ){
		WorkVO work = new WorkVO();
		work.setPrjctNo(pCode);
		List<ObserverVO>pMember =	dao.selectAllProjectMem(work);
			return pMember;
	}
	
	
	@ModelAttribute("CommonList") //완료상태에 따라
	public List<CommonVO> commonList(){
		List<CommonVO> commonsList = dao.selectCommonCode("W003");
		return commonsList;
	}
 
	 

	
	@ModelAttribute("pCode")
	public String projectCode(@PathVariable(name="pCode" ,required=true)String pCode ) {
		return pCode;
	}
	
	@ModelAttribute("defalutReq ")
	public String reqCode() {
		return "W00301";
	}
	 
	
	
	@RequestMapping(value="/project/{pCode}/work/manage/workList")
	public String adminWorklist(
			@PathVariable(name="pCode")String pCode,
			Model model , @AuthenticationPrincipal AcceptMemberVOWrapper wrapper
			) {
			//ExtendPagingVO<WorkVO> pagingVO = new ExtendPagingVO<>();
			WorkVO workVO = new WorkVO();
			workVO.setPrjctNo(pCode);
			workVO.setWorkReqSttusCode("W00301");
			int reqCount=	dao.selectWorkCountBySttus(workVO);
			workVO.setWorkReqSttusCode("W00302");
			int acceptCount = dao.selectWorkCountBySttus(workVO);
			workVO.setWorkReqSttusCode("W00303");
			int rejectCount  = dao.selectWorkCountBySttus(workVO);
			 
			model.addAttribute("reqCount", reqCount);
			model.addAttribute("acceptCount", acceptCount);
			model.addAttribute("rejectCount", rejectCount);
		
			return "work/workAcceptList";
		
	}
	
 
	
	
	
	
	@RequestMapping(value="/project/{pCode}/work/manage/workList" , method=RequestMethod.POST , produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ExtendPagingVO<WorkVO> adminWorkListJson(
			@PathVariable(name="pCode")String pCode,
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
			@ModelAttribute(value="simpleSearch") ExtendSearchVO simpleSearch 
			
			
			){
		ExtendPagingVO<WorkVO> pagingVO = new ExtendPagingVO<WorkVO>();
		WorkVO workVO = new WorkVO();
		workVO.setPrjctNo(pCode);
		pagingVO.setWorkVO(workVO); 
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setSimpleSearch(simpleSearch);
		int totalRecord = service.retrieveAllProjectCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		 
		service.retrieveAllProjectList(pagingVO);
		return pagingVO;
			
			}
	
	@RequestMapping(value="/project/{pCode}/work/manage/create/refuse" ,method=RequestMethod.POST ,produces="text/plan;charset=utf-8")
	@ResponseBody
		public String refuseAccountCheck(
				@PathVariable(name="pCode")String pCode,
				@RequestParam("memPass") String memPass,
				@ModelAttribute  WorkVO workVO,
				@AuthenticationPrincipal AcceptMemberVOWrapper wrapper
				) {
		
			String result = null;
			AcceptMemberVO authMember = wrapper.getAdaptee();
			workVO.setPrjctNo(pCode);
			
			 if(passwordEncoder.matches(memPass, authMember.getMemPass())) {
				// service.acceptAllWork(workVO);
				 result =  	service.refuseWork(workVO);
			 }else {
				 result = "NOTAUTH";
			 }
			 return result ;
		
		
	}
	@RequestMapping(value="/project/{pCode}/work/manage/create/acceptChcek" ,method=RequestMethod.POST ,produces="text/plan;charset=utf-8")
	@ResponseBody
	public String acceptAccountCheck(
			@PathVariable(name="pCode")String pCode,
			@RequestParam("memPass") String memPass,
			@ModelAttribute  WorkVO workVO,
			@AuthenticationPrincipal AcceptMemberVOWrapper wrapper
			) {
		AcceptMemberVO authMember = wrapper.getAdaptee();
		String result = null;
		workVO.setPrjctNo(pCode);
		
		 if(passwordEncoder.matches(memPass, authMember.getMemPass())) {
			// service.acceptAllWork(workVO);
			 result =  	service.acceptAllWork(workVO);
		 
		 }else {
			 result = "NOTAUTH";
		 }
		 return result ;
		
	}
	
	
	
	
}
