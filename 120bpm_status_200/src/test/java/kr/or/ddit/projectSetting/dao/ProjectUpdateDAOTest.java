package kr.or.ddit.projectSetting.dao;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.junit.AfterClass;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.junit4.SpringRunner;

import kr.or.ddit.TestWebAppConfiguration;
import kr.or.ddit.accept.vo.ProjectMemVO;
import kr.or.ddit.projectSetting.vo.TimeLineVO;

@RunWith(SpringRunner.class)
@TestWebAppConfiguration
public class ProjectUpdateDAOTest {
	
	@Inject
	private ProjectUpdateDAO dao;

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
	}

	@Test
	public void test() {
		List<ProjectMemVO> prtMemList = dao.projectMemList(1);
		List<TimeLineVO> timeLineList = dao.timeLineList(1);
		
		List<String> memList = new ArrayList<String>();
		List<Integer> activityAvg = new ArrayList<>();
		
		int size = timeLineList.size();
		System.out.println("size : " + size);
		for(ProjectMemVO prtMem : prtMemList) {
			memList.add("'" + prtMem.getMemName() + "'");
			double total = 0;
			int avg = 0;
			for(TimeLineVO timeline : timeLineList) {
				if(timeline.getMemId().equals(prtMem.getMemId())) {
					total++;
				}
			}
			System.out.println("total : " + total);
			avg = (int)((total/size) * 100);
			System.out.println(avg);
			activityAvg.add(avg);
		}
	}
}
