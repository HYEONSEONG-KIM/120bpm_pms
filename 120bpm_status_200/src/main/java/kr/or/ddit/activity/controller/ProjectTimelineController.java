package kr.or.ddit.activity.controller;

import java.util.List;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.activity.service.MyTimelineService;
import kr.or.ddit.activity.vo.MyTimelineVO;

@Controller
public class ProjectTimelineController {
	
	@Inject
	MyTimelineService service;
	
	@RequestMapping("/project/{pCode}/activity/timeline")
	public String ProjectTimline(
			@PathVariable int pCode,
			@RequestParam(value="from", required=false) String termDate,
			Model model
			) {  
		MyTimelineVO timeline = new MyTimelineVO();
		timeline.setPrjctNo(pCode); 
		if(termDate==null) termDate = "";
		timeline.setTermDate(termDate);   
		if(StringUtils.isNotBlank(termDate)) {
			model.addAttribute("hasNext", "next");
		}
		List<MyTimelineVO> tlineList = service.retrievePrjctTimeline(timeline);
		if(StringUtils.isNotBlank(termDate) || tlineList.size()==0) {
			timeline = service.retrieveTermDate(termDate);
		} 
		model.addAttribute("tlineList", tlineList);
		model.addAttribute("timeline", timeline);
		return "activity/timeline"; 
	}
}
 