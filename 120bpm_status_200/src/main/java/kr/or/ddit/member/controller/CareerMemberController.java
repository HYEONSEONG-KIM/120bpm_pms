package kr.or.ddit.member.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.member.service.CareerService;
import kr.or.ddit.member.vo.CareerVO;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.validate.groups.InsertGroup;

@Controller
@SessionAttributes(names = "member")
public class CareerMemberController {

    @Inject
    private CareerService service;
    
    @ModelAttribute("member")
    public MemberVO member() {
        return new MemberVO();
    }

    @RequestMapping(value = "/member/joinStep3", method = RequestMethod.GET)
    public String careerForm(HttpSession session, Model model, @RequestParam(required = false) String email, @RequestParam(required = false) String sms) {
    	
		if(email == null && sms==null) {			
			return "redirect:/member/joinStep1";
		}
		
		model.addAttribute("memberVO", new MemberVO());
		model.addAttribute("careerVO", new CareerVO());
		model.addAttribute("email", email);
		model.addAttribute("sms", sms);
        
        // forwarding
        return "/member/addCareer";
    }
    
    @RequestMapping(value = "/member/joinStep3", method = RequestMethod.POST)
    public String joinForm(
    		String email,
    		String sms
    		) {
    	return "/member/addCareer";
    }
    
    
    
    @RequestMapping(value = "/submitCareer", method = RequestMethod.POST)
    public String submitCareer(
        @Validated(InsertGroup.class) @ModelAttribute("member") MemberVO memberInfo,
        BindingResult errors, RedirectAttributes redirectAttributes,
        SessionStatus sessionStatus) {

        if (!errors.hasErrors()) {

            service.insertCareer(memberInfo);
            redirectAttributes.addFlashAttribute("joinSuccess", "joinSuccess");
            return "redirect:/";
        }
        String errorsAttrName = BindingResult.class.getName() + ".member";
        redirectAttributes.addFlashAttribute(errorsAttrName, errors);
        return "member/addCareer";
    }

    
    
}