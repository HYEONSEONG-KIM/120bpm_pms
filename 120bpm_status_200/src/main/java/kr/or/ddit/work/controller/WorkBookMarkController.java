package kr.or.ddit.work.controller;

import java.util.ArrayList;
import java.util.List;

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
import kr.or.ddit.accept.vo.ProjectMemVO;
import kr.or.ddit.enumtype.ServiceResult;
import kr.or.ddit.work.dao.WorkDAO;
import kr.or.ddit.work.service.WorkService;
import kr.or.ddit.work.vo.CommonVO;
import kr.or.ddit.work.vo.ExtendPagingVO;
import kr.or.ddit.work.vo.ExtendSearchVO;
import kr.or.ddit.work.vo.WCartegoryVO;
import kr.or.ddit.work.vo.WorkAuthVO;
import kr.or.ddit.work.vo.WorkBkmkVO;
import kr.or.ddit.work.vo.WorkVO;

@Controller
public class WorkBookMarkController {
	@Inject
	private WorkService service;
	
	@Inject
	private WorkDAO dao;
	
	
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
	
	

	
	@RequestMapping(value="/project/{pCode}/workList/myBookmarkList")
	public String workBookMark(
			@PathVariable(name="pCode" ,required=true)String pCode ,
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
			@ModelAttribute(value="simpleSearch") ExtendSearchVO simpleSearch ,
			@AuthenticationPrincipal AcceptMemberVOWrapper wrapper  
			, Model model
			) {
		
		List<WCartegoryVO> cartegoryList = dao.selectCartegory(Integer.parseInt(pCode));
		ExtendPagingVO<WorkVO> pagingVO =  new ExtendPagingVO<>();
		AcceptMemberVO authMember = wrapper.getAdaptee();
		WorkAuthVO authVO = new WorkAuthVO();
		authVO.setPrjctNo(pCode);
		authVO.setMemId(authMember.getMemId());
		List<ProjectMemVO> list = authMember.getProjectMemRole();
		for(ProjectMemVO vo :list) {
			String pno = vo.getPrjctNo() +"";
			if(pno.equals(pCode)) {
				authVO.setAuthor(vo.getAuthor());
			}
		}
		model.addAttribute("authVO" ,authVO );
		//검색전 레코드 수 
		model.addAttribute("cartegoryList", cartegoryList);
		WorkVO workVO = new WorkVO();
		workVO.setPrjctNo(pCode);
		workVO.setMemId(authMember.getMemId());
		pagingVO.setWorkVO(workVO);
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setSimpleSearch(simpleSearch);
		model.addAttribute("pagingVO", pagingVO);
			return"work/booMarkList";
		
	}
	
	
	@RequestMapping(value="/project/{pCode}/workList/myBookmarkList" ,method=RequestMethod.POST ,produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ExtendPagingVO<WorkVO> workList(
			@PathVariable(name="pCode")String pCode,
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage,
			@ModelAttribute(value="simpleSearch") ExtendSearchVO simpleSearch ,
			@AuthenticationPrincipal AcceptMemberVOWrapper wrapper  
			){
		
		ExtendPagingVO<WorkVO> pagingVO =  new ExtendPagingVO<>(10,5);
		AcceptMemberVO authMember = wrapper.getAdaptee();
		//검색전 레코드 수 
		WorkVO workVO = new WorkVO();
		workVO.setPrjctNo(pCode);
		pagingVO.setWorkVO(workVO);
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setSimpleSearch(simpleSearch);
		workVO.setMemId(authMember.getMemId());
		int totalRecord = service.selectAllBookMarkCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		 
		 service.selectAllBookMarkList(pagingVO);
		return pagingVO; //여기서 data 를 리턴
	}
	
	
	
	@RequestMapping(value="/project/{pCode}/work/remove/{bookMarkCode}" ,method=RequestMethod.POST ,produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ServiceResult deleteBookMark(
			@PathVariable(name="pCode")String pCode,
			@PathVariable(name="bookMarkCode")String bookMarkCode,
			@AuthenticationPrincipal AcceptMemberVOWrapper wrapper  
			) {
		WorkBkmkVO bookMarkVO = new WorkBkmkVO();
		AcceptMemberVO authMember = wrapper.getAdaptee();
		bookMarkVO.setPrjctNo(pCode);
		bookMarkVO.setMemId(authMember.getMemId());
		bookMarkVO.setWorkBkmkCode(bookMarkCode);
		ServiceResult result =	service.deleteBookMark(bookMarkVO);
		return result;
		
	}
	
	
	@RequestMapping(value="/project/{pCode}/work/create/bkmk", method=RequestMethod.POST ,produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ServiceResult insertBookMark(
			@PathVariable(name="pCode")String pCode,
			@AuthenticationPrincipal AcceptMemberVOWrapper wrapper ,
			@RequestParam(name="workCode") String workCode,
			@RequestParam(name="ctgryCode") String ctgryCode 
			) {
		    //System.out.println(work);
			 AcceptMemberVO authMember = wrapper.getAdaptee();
			 WorkBkmkVO bookMarkVO =new WorkBkmkVO();
			 bookMarkVO.setCtgryCode(ctgryCode);
			 bookMarkVO.setPrjctNo(pCode);
			 bookMarkVO.setMemId(authMember.getMemId());
			 bookMarkVO.setWorkCode(workCode);
			 
			ServiceResult result = service.insertBookMark(bookMarkVO);
			return result;
		
		
		
	}
	
	
	
}
