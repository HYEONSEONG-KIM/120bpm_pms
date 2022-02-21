package kr.or.ddit.calendar.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;


import kr.or.ddit.calendar.dao.CalendarDAO;
import kr.or.ddit.mypage.vo.MyWorkVO;
import net.minidev.json.JSONArray;
import net.minidev.json.JSONObject;
 
@Service
public class CalendarServiceImpl implements CalendarService {

	@Inject 
	CalendarDAO dao;
	
	@Override
	public JSONArray retrievePrjctWorkList(int prjctNo) {
		List<MyWorkVO> workList = dao.selectPrjctWorkList(prjctNo);
		JSONArray arr = new JSONArray();
		Authentication currentUser = SecurityContextHolder.getContext().getAuthentication();
		for(MyWorkVO wo : workList) {
			JSONObject data = makeData(wo, currentUser.getName());
			arr.appendElement(data);
		}  
		return arr; 
	}

	private JSONObject makeData(MyWorkVO wo, String userId) {
		JSONObject val = new JSONObject();
		val.put("id", wo.getWorkCode());
		val.put("title", wo.getWorkSj());
		val.put("start", wo.getWorkBgnde());
		val.put("end", wo.getWorkEndde());   
		val.put("description",wo.getWorkSj() + "<br/><span>상태: "+wo.getSttusNm()
				+ "</span><br/><span>시작일자: "+wo.getWorkBgnde()+"</span><br/><span>종료일자: "+wo.getWorkEndde()
				+ "</span><br/><span>담당자: " +wo.getMemName()+ "</span><br/><span>카테고리: "+ wo.getCtgryNm() 
				+"</span><br/><span>우선순위: " + wo.getPriortNm() 
				); 
		val.put("url", "workDetail/" + wo.getWorkCode());  
		if(userId.equals(wo.getMemId())) {
			val.put("backgroundColor", "#ffeca8"); 
			val.put("borderColor", "#ffeca8");
			val.put("textColor ", "#000");      
		}else {
			val.put("backgroundColor", "#90d6f5"); 
			val.put("borderColor", "#90d6f5");
			val.put("textColor ", "#ffffff");      
		} 
		return val;   
	}
}
