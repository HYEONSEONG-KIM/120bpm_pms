package kr.or.ddit.mypage.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.http.MediaType;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.accept.vo.AcceptMemberVO;
import kr.or.ddit.accept.vo.AcceptMemberVOWrapper;
import kr.or.ddit.enumtype.ServiceResult;
import kr.or.ddit.mypage.CustomCollectionValidator;
import kr.or.ddit.mypage.service.MyAccountService;
import kr.or.ddit.mypage.vo.CareerListVO;
import kr.or.ddit.mypage.vo.MyCareerVO;
import kr.or.ddit.mypage.vo.MyMemVO;
import kr.or.ddit.validate.groups.UpdateGroup;
import kr.or.ddit.validate.groups.UpdatePassGroup;

@Controller 
public class MyAccountController<T> {
	
	@Inject
	private PasswordEncoder passwordEncoder;
	
	@Inject
	private MyAccountService service;
	
	@Inject
	private CustomCollectionValidator validator;
	
	//마이페이지 개인정보수정페이지 이동 - member정보
	@RequestMapping("/mypage/myAccount")
	public String myAccount(
			@AuthenticationPrincipal AcceptMemberVOWrapper wrapper,
			Model model
			) {
		AcceptMemberVO authMember = wrapper.getAdaptee();
		MyMemVO memvo = service.retrieveMyAccountInfo(authMember.getMemId());
		model.addAttribute("mem", memvo);  
		model.addAttribute("menu", "myAccount");  
		return "mypage/myAccount";
	}
	
	//마이페이지 경력사항관리페이지 이동
	@RequestMapping("/mypage/myCareer")
	public String myCareer(
			@AuthenticationPrincipal AcceptMemberVOWrapper wrapper,
			Model model
			) {
		 AcceptMemberVO authMember = wrapper.getAdaptee();	
		 List<MyCareerVO> careerList = service.retrieveMyCareer(authMember.getMemId());
		 model.addAttribute("careerList", careerList);  
		 model.addAttribute("menu", "myCareer");  
		 return "mypage/myCareer";   
	}
	
	//마이페이지 경력사항 정보 모달창
	@RequestMapping(value="/mypage/myCareer", method=RequestMethod.GET, produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody 
	public List<MyCareerVO> myCareerAjax(
			@AuthenticationPrincipal AcceptMemberVOWrapper wrapper
			){ 
		AcceptMemberVO authMember = wrapper.getAdaptee();
		return service.retrieveMyCareer(authMember.getMemId());
	}
	
	
	//이동 후 수정전 본인확인 - 비밀번호
	@RequestMapping(value="/mypage/accountCheck", method=RequestMethod.POST, produces="text/plan;charset=utf-8")
	@ResponseBody
	public String AccountCheck(
			@AuthenticationPrincipal AcceptMemberVOWrapper wrapper,
			@RequestParam("memberPass") String memberPass
			) { 
		String result = null;
		AcceptMemberVO authMember = wrapper.getAdaptee();
		if(passwordEncoder.matches(memberPass, authMember.getMemPass())) {
			result = "OK";
		}else {   
			result = "FAIL";
		
		}
		return result;
	}
	
	//마이페이지 개인정보수정
	@RequestMapping(value="/mypage/myAccount", method=RequestMethod.POST)
	public String modifyProfile(
			@Validated(UpdateGroup.class)
			@ModelAttribute("mem") MyMemVO mem,
			BindingResult errors,
			RedirectAttributes redirectAttributes
			) {
		String message = null;
		if(!errors.hasErrors()) {
			ServiceResult result = service.modifyMyAccountInfo(mem);
			switch (result) {
			case OK:
				message = "OK";
				break;

			default:
				message = "FAIL"; 
				break;
			}  
		}else { 
			message = "ERROR";
		} 
		redirectAttributes.addFlashAttribute("updateResultMsg", message);
		return "redirect:/mypage/myAccount";
	} 
	
	//마이페이지 경력사항 수정 & 추가
	@RequestMapping(value="/mypage/myCareer", method=RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ServiceResult modifyMyCareer(  
			@Valid @RequestBody String params, 
			BindingResult errors,   
			@AuthenticationPrincipal AcceptMemberVOWrapper wrapper
			) {   
		AcceptMemberVO authMember = wrapper.getAdaptee();
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObject;
		CareerListVO vo = new CareerListVO();
		 try { 
			 	
	            jsonObject = (JSONObject) jsonParser.parse(params);
	            JSONArray jsonArray1 = (JSONArray) jsonObject.get("myCareerList");
	            List<MyCareerVO> myCareerlist = new ArrayList<>();
	            if(jsonArray1!=null && !jsonArray1.isEmpty()) {
		            for(int i=0; i<jsonArray1.size(); i++){ 
		                MyCareerVO career = new MyCareerVO();
		                JSONObject objectInArray1 = (JSONObject) jsonArray1.get(i); 
		                career.setMemId((String) objectInArray1.get("memId")); 
		                career.setCareerMatterNo(Integer.parseInt( (String) objectInArray1.get("careerMatterNo")));
		                career.setPartcptnBiz((String) objectInArray1.get("partcptnBiz"));
		                career.setBeginde((String) objectInArray1.get("beginde"));
		                career.setEndde((String) objectInArray1.get("endde"));
		                career.setOfcpsNm((String) objectInArray1.get("ofcpsNm"));
		                career.setWrkplcNm((String) objectInArray1.get("wrkplcNm"));
		                career.setOrntNm((String) objectInArray1.get("orntNm"));
		                career.setAtnddu((String) objectInArray1.get("atnddu"));  
		                myCareerlist.add(career);
		            }
		            validator.validate(myCareerlist, errors);
		            vo.setMyCareerList(myCareerlist); 
	           }
	           JSONArray jsonArray2 = (JSONArray) jsonObject.get("newCareerList");
	           List<MyCareerVO> newCareerList = new ArrayList<>();
	           if(jsonArray2!=null && !jsonArray2.isEmpty()) {
	        	   for(int i=0; i<jsonArray2.size(); i++){
	        		   MyCareerVO career = new MyCareerVO();
	        		   JSONObject objectInArray2 = (JSONObject) jsonArray2.get(i); 
	        		   career.setMemId(authMember.getMemId());  
	        		   career.setCareerMatterNo(Integer.parseInt( (String) objectInArray2.get("careerMatterNo")));
	        		   career.setPartcptnBiz((String) objectInArray2.get("partcptnBiz"));
	        		   career.setBeginde((String) objectInArray2.get("beginde"));
	        		   career.setEndde((String) objectInArray2.get("endde"));
	        		   career.setOfcpsNm((String) objectInArray2.get("ofcpsNm"));
	        		   career.setWrkplcNm((String) objectInArray2.get("wrkplcNm"));
	        		   career.setOrntNm((String) objectInArray2.get("orntNm"));
	        		   career.setAtnddu((String) objectInArray2.get("atnddu"));  
	        		   newCareerList.add(career);
	        	   }
	        	   validator.validate(newCareerList, errors); 
	        	   vo.setNewCareerList(newCareerList); 
	           }
	            
	        } catch (ParseException e) {
	            e.printStackTrace();
	        }
		 ServiceResult result = null;
		if(!errors.hasErrors()) {      
			vo.setMemId(authMember.getMemId());
			ServiceResult res = service.modifyMyCareer(vo);
			switch (res) {  
			case OK: 
				result = ServiceResult.OK;
				break; 
				
			default: 
				result = ServiceResult.FAIL;
				break;  
			}  
		}else { 
			result = ServiceResult.NOTEXIST;
		} 
		
		return result;
	}
	
	
	//경력사항 삭제
	@RequestMapping(value="/mypage/myCareer", method=RequestMethod.POST)
	public String delCareers(
			@ModelAttribute CareerListVO career,
			RedirectAttributes redirectAttributes
			) {
		ServiceResult result = service.removeCareer(career);
		String message = null;
		switch (result) {  
		case OK: 
			message = "OK";
			break; 
			
		default: 
			message = "FAIL";
			break;    
		}  
		redirectAttributes.addFlashAttribute("deleteResultMsg", message);
		return "redirect:/mypage/myCareer";
	}
	
	//마이페이지 비밀번호 변경
	@RequestMapping(value="/mypage/mypassword",  method=RequestMethod.POST)
	public String modifyPass(
		@Validated(UpdatePassGroup.class)
		@ModelAttribute("mem") MyMemVO mem,
		@RequestParam("originPass") String originPass,
		BindingResult errors, 
		RedirectAttributes redirectAttributes
		) {
		String message = null;
		if(!errors.hasErrors()) {
			ServiceResult  result = service.changePassword(originPass, mem.getMemPass());
			switch (result) { 
			case OK:
				message = "OK";
				break; 
			default: 
				message = "FAIL"; 
				break;
			}  
		}else {
			message = "ERROR";
		}
		redirectAttributes.addFlashAttribute("changeResultMsg", message);
		return "redirect:/mypage/myAccount";
	} 

}	
