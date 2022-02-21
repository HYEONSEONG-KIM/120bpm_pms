package kr.or.ddit.activity.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.activity.dao.GraphDAO;
import kr.or.ddit.commons.exception.DataNotFoundException;
import kr.or.ddit.main.vo.MyIssueVO;
import kr.or.ddit.main.vo.MyProjectVO;
import kr.or.ddit.mypage.vo.MyWorkVO;

@Service
public class GraphServiceImpl implements GraphService{

	@Inject
	GraphDAO gdao;
	
	private void prjctExistCheck(int prjctNo) {
		MyProjectVO savedPrjct = gdao.selectProject(prjctNo);
		if(savedPrjct==null) { 
			new DataNotFoundException(prjctNo + " 프로젝트 없음");
		} 
	}
	
	@Override
	public MyWorkVO retrieveWorkPrgsCounts(int prjctNo) {
		prjctExistCheck(prjctNo);
		return gdao.selectWorkPrgsCounts(prjctNo);
	}

	@Override
	public List<String> retrieveDayInsertWork(int prjctNo) {
		prjctExistCheck(prjctNo);
		List<MyWorkVO> workList = gdao.selectDayInsertWork(prjctNo);
		 
		List<String> arrayList = new ArrayList<>();
		String[] days = new String[workList.size()];
		Integer[] counts = new Integer[workList.size()];
		double[] avgPrgs = new double[workList.size()];
		int idx = 0;
		for(MyWorkVO wo : workList) { 
			days[idx] = "'" + wo.getDay() + "'"; 
			counts[idx] = wo.getDayworkcnt(); 
			avgPrgs[idx] = wo.getAvgPrgs();
			idx++;
		}
		arrayList.add(Arrays.toString(days));
		arrayList.add(Arrays.toString(counts)); 
		arrayList.add(Arrays.toString(avgPrgs));
		return arrayList;
	}

	@Override
	public List<String> retrieveMemSttsWork(int prjctNo) {
		prjctExistCheck(prjctNo);
		List<MyWorkVO> workList = gdao.selectMemSttsWork(prjctNo);
		List<String> arrayList = new ArrayList<>();
		
		int midx = 0;
		int nidx = 0;
		int gidx = 0;
		int didx = 0;
		String memId = null;
		for(MyWorkVO wo : workList) { 
			if(memId==null || !wo.getMemId().equals(memId)) {
				midx++;
			}
			if(wo.getWorkSttusCode().equals("W00101")) {
				nidx++;
			}else if(wo.getWorkSttusCode().equals("W00102")) {
				gidx++;
			}else if(wo.getWorkSttusCode().equals("W00103")) {
				didx++;
			}
			memId = wo.getMemId();
		}
		String[] mems = new String[midx];
		Integer[] newcnts = new Integer[nidx];
		Integer[] ingcnts = new Integer[gidx];
		Integer[] donecnts = new Integer[didx];
		midx = 0;
		nidx = 0;
		gidx = 0;
		didx = 0;
		for(MyWorkVO wo : workList) { 
			if(memId==null || !wo.getMemId().equals(memId)) {
				mems[midx] = "'" + wo.getMemName() + "(" + wo.getMemId() + ")'"; 
				midx++;
			} 
			if(wo.getWorkSttusCode().equals("W00101")) {
				newcnts[nidx] = wo.getTotalWork();
				nidx++;
			}else if(wo.getWorkSttusCode().equals("W00102")) {
				ingcnts[gidx] = wo.getTotalWork();
				gidx++;
			}else if(wo.getWorkSttusCode().equals("W00103")) {
				donecnts[didx] = wo.getTotalWork();
				didx++;
			} 
			memId = wo.getMemId();
		}
		arrayList.add(Arrays.toString(mems));
		arrayList.add(Arrays.toString(newcnts)); 
		arrayList.add(Arrays.toString(ingcnts)); 
		arrayList.add(Arrays.toString(donecnts)); 
		return arrayList;
	}

	@Override
	public MyIssueVO retrieveIssueCount(int prjctNo) {
		prjctExistCheck(prjctNo); 
		return gdao.selectIssueCount(prjctNo);
	}

	@Override
	public List<String> retrieveIssueAvgCounts(int prjctNo) {
		prjctExistCheck(prjctNo);
		List<MyIssueVO> issueList = gdao.selectIssueAvgCounts(prjctNo);
		 
		List<String> arrayList = new ArrayList<>();
//		double totalOcc = -1;
		int[] dayiscnt = new int[issueList.size()];
		double[] occAvgs = new double[issueList.size()];
		double[] solAvgs = new double[issueList.size()];
		int idx = 0;
		for(MyIssueVO is : issueList) { 
//			if(totalOcc<=0) {
//				totalOcc = is.getIsTotalOcc();
//			} 
			dayiscnt[idx] = is.getDayissuecnt();
			occAvgs[idx] = is.getIsOccRate();
			solAvgs[idx] = is.getIsSolutRate();
			idx++; 
		}  
//		arrayList.add(String.valueOf(totalOcc)); 
		arrayList.add(Arrays.toString(dayiscnt)); 
		arrayList.add(Arrays.toString(occAvgs)); 
		arrayList.add(Arrays.toString(solAvgs));
		return arrayList;
	}
	
	
}
