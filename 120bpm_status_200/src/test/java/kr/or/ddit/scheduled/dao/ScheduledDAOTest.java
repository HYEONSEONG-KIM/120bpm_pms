package kr.or.ddit.scheduled.dao;

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
import kr.or.ddit.makeProject.vo.MakeProjectVO;

@RunWith(SpringRunner.class)
@TestWebAppConfiguration
public class ScheduledDAOTest {

	@Inject
	private ScheduledDAO dao;
	
	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
	}

	@Test
	public void test() {
		List<Integer> list = new ArrayList<Integer>();
		list.add(1);
		list.add(2);
		List<ProjectMemVO> prtMemList =dao.selectEndPrtMemList(list);
		System.out.println(prtMemList);
		
		List<MakeProjectVO> prtList = dao.selectPrtList();
		System.out.println(prtList);
		
	}

}
