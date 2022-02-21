package kr.or.ddit.settings.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.enumtype.ServiceResult;
import kr.or.ddit.settings.service.SettingsService;
import kr.or.ddit.settings.vo.SetupDetailVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class SettingsController {
	
	@Inject
	SettingsService service;
	
	@RequestMapping("/admin/settings")
	public String adminDisplaySettings(
			@RequestParam(value="setup", required=false, defaultValue="defaultSetting") String setup,
			Model model 
			) {
		String viewName = "settings/" + setup;
		String setupCode = null;
		if(setup.equals("defaultSetting")) {
			setupCode = "S00101"; 
		}else if(setup.equals("display")) {
			setupCode = "S00102";
		}else if(setup.equals("attatchments")) {
			setupCode = "S00103";
		}else if(setup.equals("mailNotice")) {
			setupCode = "S00104";
		}
		List<SetupDetailVO> setupDetailList = service.retrieveSetupValues(setupCode);
		model.addAttribute("setupDetailList", setupDetailList);
		model.addAttribute("menu", setup);  
		model.addAttribute("setupCode",setupCode); 
		return viewName; 
	}
	
	@RequestMapping(value="/admin/settings", method=RequestMethod.POST)
	public String UpdateDefaultSet(
			@ModelAttribute("setupDetail") SetupDetailVO setupDetail,
			@RequestParam(value="pagename", required=false) String pagename,
			RedirectAttributes redirectAttributes
			) {
		log.info("size : " + setupDetail.getSetupDetailList().size());
		log.info("list(0) : " + setupDetail.getSetupDetailList().get(0)); 
		log.info("list(1) : " + setupDetail.getSetupDetailList().get(1));
		String viewName = "redirect:/admin/settings";
		if(pagename!=null) { 
			viewName = "redirect:/admin/settings?setup=" + pagename;
		}  
		String message = null;
		ServiceResult result = service.createSetupDetail(setupDetail);
		switch(result) {  
		case OK:  
			message = "OK";
			break;      
		default:    
			message = "ERROR"; 
			break;
		}
		 
		redirectAttributes.addFlashAttribute("setupmessage", message);
		return viewName;
	}
		
	

}
