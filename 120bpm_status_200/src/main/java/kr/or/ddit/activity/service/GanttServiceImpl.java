package kr.or.ddit.activity.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.activity.dao.GanttDAO;
import kr.or.ddit.activity.vo.CmmnCodeDetailVO;
import kr.or.ddit.main.vo.MyPrjctMemVO;
import kr.or.ddit.mypage.vo.MyWorkVO;
import net.minidev.json.JSONArray;
import net.minidev.json.JSONObject;

@Service
public class GanttServiceImpl implements GanttService {

	@Inject
	GanttDAO dao;
	
	@Override
	public JSONArray retrievePrjctWorkInfoList(MyWorkVO work) throws ParseException {
		List<MyWorkVO> workInfoList = dao.selectPrjctWorkInfoList(work);
		JSONArray arr = new JSONArray();
		
		for(MyWorkVO workVO : workInfoList) {
			JSONObject  data = makeData(workInfoList, workVO, work.getMemId());
			if(data==null) continue; 
			arr.appendElement(data);
		}   
		 
		return arr;
	}
	
	 
	/**
	 * 간트차트에 넣을 data jsonObject로 만들기
	 * @param workInfoList
	 * @param work
	 * @param memId
	 * @return
	 * @throws ParseException
	 */
	private JSONObject makeData(List<MyWorkVO> workInfoList, MyWorkVO work, String memId) throws ParseException {
		boolean hasCode = false;
		if(work.getUpperWorkCode()!=null) {
			for(MyWorkVO wo : workInfoList) {
				if(wo.getWorkCode().equals(work.getUpperWorkCode())) {
					hasCode = true;
					break;
				}else {
					hasCode = false;
					continue;
				}
			} 
		}
		String sj = work.getWorkSj();
		String subSj = "";
		if(sj.length() > 15){
			subSj = sj.substring(0,14) + "...";
		}else {  
			subSj = sj;
		}
		JSONObject val = new JSONObject();
		JSONObject amount = new JSONObject(); 
		amount.put("amount", (work.getWorkPrgsDgreePoint() / 100.0));
		val.put("id", work.getWorkCode()); 
//		if("0".equals(work.getWorkOthbcAt()) && memId.equals(work.getMemId())) {
//			color = "lightgrey";  
//		}
		Date bd = new SimpleDateFormat("yyyy-MM-dd").parse(work.getWorkBgnde());
		if(work.getWorkBgnde()!=null) {
			val.put("start", bd.getTime()); 
		} 
		Date ed = new SimpleDateFormat("yyyy-MM-dd").parse(work.getWorkEndde());
		if(work.getWorkEndde()!=null) {
			val.put("end", ed.getTime()); 
		}
		
		String color = "";   
		Date today = new Date();
		long dayms = 1000 * 60 * 60 * 24;
		if(today.getTime() > ed.getTime()){  
			color = "rgb(211, 211, 211)";    
		}else if((ed.getTime() - today.getTime() + dayms) / dayms <= 3.0){
			color = "rgb(255, 145, 145)"; 
		}else if((ed.getTime() - today.getTime() + dayms) / dayms <= 7.0){
			color = "rgb(255, 255, 0)"; 
		}else{    
			color = "rgb(77, 201, 255)"; 
		} 
		val.put("completed", amount);
		val.put("name", subSj);    
		val.put("fullname", sj.replace("└", ""));  
		if(work.getLevel()!=1 && hasCode){    
			val.put("parent", work.getUpperWorkCode());
			val.put("dependency", work.getUpperWorkCode());
		} 
		if(!hasCode) { 
			val.put("name", subSj.replace("└", ""));
		}
		val.put("owner", work.getMemName());
		val.put("color", color); 
		val.put("sttus", work.getSttusNm()); 
		val.put("priort", work.getPriortNm()); 
		
		return val;     
	}


	@Override
	public List<CmmnCodeDetailVO> retrieveWorkStatus() { 
		return dao.selectWorkStatus(); 
	}


	@Override
	public List<CmmnCodeDetailVO> retrieveWorkPriort() {
		return dao.selectWorkPriort(); 
	}


	@Override
	public List<MyPrjctMemVO> retrievePrjctMems(MyPrjctMemVO mem) {
		return dao.selectPrjctMems(mem);
	}

}
