package kr.or.ddit.makeProject.dao;

import static org.junit.Assert.*;

import java.util.List;

import javax.inject.Inject;

import org.junit.AfterClass;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.junit4.SpringRunner;

import kr.or.ddit.TestWebAppConfiguration;
import kr.or.ddit.makeProject.vo.MakeProjectVO;

@RunWith(SpringRunner.class)
@TestWebAppConfiguration
public class MakeProjectDAOTest {
	
	@Inject
	private MakeProjectDAO dao;

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
	}

	@Test
	public void testTotalRecord() {
		fail("Not yet implemented");
	}

	@Test
	public void testSelectProjectList() {
	}

}
