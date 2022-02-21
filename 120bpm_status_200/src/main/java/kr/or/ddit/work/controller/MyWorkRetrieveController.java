package kr.or.ddit.work.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
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
import kr.or.ddit.work.dao.WorkDAO;
import kr.or.ddit.work.service.WorkService;
import kr.or.ddit.work.vo.CommonVO;
import kr.or.ddit.work.vo.ExtendPagingVO;
import kr.or.ddit.work.vo.ExtendSearchVO;
import kr.or.ddit.work.vo.WCartegoryVO;
import kr.or.ddit.work.vo.WorkVO;

@Controller
public class MyWorkRetrieveController {
	@Inject
	private WorkService service;
	
	@Inject
	private WorkDAO dao;
	

	@ModelAttribute("command")
	public String workList() {
		return "MYWORKLIST";
		
	}
	
	
	@ModelAttribute("CommonList")
	public List<CommonVO> commonList(){
		List<CommonVO> commonsList = dao.selectCommonCode("W003");
		return commonsList;
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
	//동기
	@RequestMapping(value="/project/{pCode}/workList/myWorkList")
	public String workListView(@PathVariable(name="pCode" ,required=true)String pCode , 
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
			@AuthenticationPrincipal AcceptMemberVOWrapper wrapper ,
			@ModelAttribute("simpleSearch") ExtendSearchVO simpleSearch,
			Model model
			
			) {
		ExtendPagingVO<WorkVO> pagingVO = new ExtendPagingVO<>();
		AcceptMemberVO authMember = wrapper.getAdaptee();
		
		List<CommonVO> commonsList = dao.selectCommonCode("W003");
		List<WCartegoryVO> cartegoryList = dao.selectCartegory(Integer.parseInt(pCode));
		
		WorkVO workVO = new WorkVO();
		workVO.setPrjctNo(pCode);
		workVO.setMemId(authMember.getMemId());
		
		pagingVO.setWorkVO(workVO);
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setSimpleSearch(simpleSearch);
		

		pagingVO= mywork(pCode , wrapper, currentPage, simpleSearch, model);
		
	
		
		//model.addAttribute("command", "MYWORKLIST");
		model.addAttribute("CommonList" , commonsList);
		model.addAttribute("cartegoryList", cartegoryList);
		model.addAttribute("pagingVO" ,pagingVO );
		
		return "work/myWorkList";
	}
	
	

	
	//내 일감 목록 비동기
			@RequestMapping(value="/project/{pCode}/workList/myWorkListJson",method=RequestMethod.POST ,produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
			@ResponseBody
			public ExtendPagingVO<WorkVO> mywork(
					@PathVariable(name="pCode")String pCode,
					@AuthenticationPrincipal AcceptMemberVOWrapper wrapper ,
					@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
					@ModelAttribute(value="simpleSearch") ExtendSearchVO simpleSearch 
					,Model model
					){
				
				ExtendPagingVO<WorkVO> pagingVO = new ExtendPagingVO<>(5,5);
				WorkVO workVO = new WorkVO();
				AcceptMemberVO authMember = wrapper.getAdaptee();
				
				workVO.setPrjctNo(pCode);
				workVO.setMemId(authMember.getMemId());
				pagingVO.setWorkVO(workVO);
				
				pagingVO.setCurrentPage(currentPage);
				pagingVO.setSimpleSearch(simpleSearch);
		
				int totalRecord = service.retrieveMyWorkCount(pagingVO);
				pagingVO.setTotalRecord(totalRecord);
				service.retrieveMyWorkList(pagingVO);
			
				//model.addAttribute("pagingVO" ,pagingVO );
				 
				return pagingVO;
				
			}
			
			
			@RequestMapping(value="/project/{pCode}/workDetail/returnWhy" ,method= RequestMethod.POST ,produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
			@ResponseBody
			public Map<String ,Object> selectReturnWhy(
					@PathVariable(name="pCode")String pCode,
					@RequestParam(value="workCode") String workCode,
					@AuthenticationPrincipal AcceptMemberVOWrapper wrapper  
					
					) {
				WorkVO workVO = new WorkVO();
				workVO.setMemId(wrapper.getAdaptee().getMemId());	 
				workVO.setPrjctNo(pCode);
				workVO.setWorkCode(workCode);
				Map<String, Object> resultMap =  service.selectMyWorkCheck(workVO);
				return resultMap;
				
			}
			
			
			@RequestMapping(value="/project/{pCode}/workList/myWorkList/perMonth" ,produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
			@ResponseBody
			public  Map<String , Object> retrieveMyWorkPerMonth(
					@PathVariable(name="pCode")String pCode , 
					@AuthenticationPrincipal AcceptMemberVOWrapper wrapper  
					){
				WorkVO workVO = new WorkVO();
				workVO.setPrjctNo(pCode);
				workVO.setMemId(wrapper.getAdaptee().getMemId());	 
				Map<String , Object> result = new HashMap<>();
				List<WorkVO> workPerMonth = service.selectMyWorkPerMonth(workVO);
				
				 result.put("perMonth", workPerMonth);
						return result;
				
			}
			
			@RequestMapping(value="/project/{pCode}/workList/myWorkList/percent" ,produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
			@ResponseBody
			public Map<String , Object>retrieveMyWorkPercent(
					@PathVariable(name="pCode")String pCode , 
					@AuthenticationPrincipal AcceptMemberVOWrapper wrapper  
					){
				WorkVO workVO = new WorkVO();
				workVO.setPrjctNo(pCode);
				workVO.setMemId(wrapper.getAdaptee().getMemId());	 
				Map<String , Object> result = new HashMap<>();
				List<WorkVO> workPercent = service.selectMyWorkPercent(workVO);
				result.put("workPercent", workPercent);
				return result;
				
			}
			
}
