package kr.or.ddit.free.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.or.ddit.enumtype.ServiceResult;
import kr.or.ddit.free.service.FreeReplyService;
import kr.or.ddit.free.vo.FreePagingVO;
import kr.or.ddit.free.vo.FreeReplyVO;
import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.validate.groups.UpdateGroup;

@RestController
@RequestMapping(value="project/{pCode}/freeBoard/{boNo}/reply", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
public class ReplyFreeController {
	@Inject
	FreeReplyService service;
	
	
	@PostMapping
	public Map<String, Object> insert(
			@PathVariable String pCode ,
		@Validated(InsertGroup.class) @ModelAttribute("reply") FreeReplyVO reply, 
		BindingResult errors
	){
		ServiceResult result = null;
		Map<String, Object> resultMap = new HashMap<>();
		if(!errors.hasErrors()) {
			result = service.createReply(reply);
		}else {
			result = ServiceResult.INVALID;
			resultMap.put("message", "검증을 통과하지 못함.");
		}
		resultMap.put("result", result);
		System.out.println("resultMap : " + resultMap);
		return resultMap;
	}
	
	@PutMapping
	public Map<String, Object> update(
		@PathVariable(name="pCode" )String pCode ,
		@Validated(UpdateGroup.class) @ModelAttribute("reply") FreeReplyVO reply,
		BindingResult errors
	) {
		ServiceResult result = null;
		Map<String, Object> resultMap = new HashMap<>();
		if(!errors.hasErrors()) {
			result = service.modifyReply(reply);
			if(ServiceResult.INVALIDPASSWORD.equals(result)) {
				resultMap.put("message", "비밀번호 오류");
			}
		}else {
			result = ServiceResult.INVALID;
			resultMap.put("message", "검증에 걸렸어요");
		}
		resultMap.put("result", result);
		return resultMap;
	}
	
	@DeleteMapping
	public Map<String, Object> delete(
			@PathVariable(name="pCode" )String pCode ,
			@ModelAttribute("reply") FreeReplyVO reply) {
		ServiceResult result = service.removeReply(reply);
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("result", result);
		if(ServiceResult.INVALIDPASSWORD.equals(result)) {
			resultMap.put("message", "비밀번호 오류");
		}
		return resultMap;
	}
	@GetMapping
	public FreePagingVO<FreeReplyVO> list(
		@PathVariable(name="pCode" )String pCode ,
		@PathVariable("boNo") int boNo,   // 경로 변수로 전달된 값 수신
		@RequestParam(value="page", required=false, defaultValue="1") int currentPage
	){
//		====검색, 특정글의 댓글만 조회
		FreeReplyVO detailSearch = new FreeReplyVO();
		detailSearch.setBoNo(boNo);
		
		FreePagingVO<FreeReplyVO> pagingInfo = new FreePagingVO<>(5, 5);
		pagingInfo.setDetailSearch(detailSearch);
//		========
		pagingInfo.setCurrentPage(currentPage); // startRow, endRow, startPage, endPage
		
		service.readReplyList(pagingInfo);
		
		return pagingInfo;
	}
}	
