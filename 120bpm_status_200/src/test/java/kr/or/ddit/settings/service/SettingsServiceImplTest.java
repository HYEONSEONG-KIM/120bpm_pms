package kr.or.ddit.settings.service;

import static org.junit.Assert.assertEquals;

import javax.inject.Inject;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.junit4.SpringRunner;

import kr.or.ddit.TestWebAppConfiguration;
import kr.or.ddit.settings.dao.SettingsDAO;

@RunWith(SpringRunner.class)
@TestWebAppConfiguration
public class SettingsServiceImplTest {

	@Inject
	private SettingsDAO dao;
	
	@Before
	public void setUp() throws Exception {
	}

	@Test
	public void testCreateSetupDetail() {
		int cnt = dao.deleteSetupDetail("S00101");
		System.out.println(cnt);
	} 

}
