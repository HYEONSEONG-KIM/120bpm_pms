package kr.or.ddit.test;

import static org.junit.Assert.*;

import javax.inject.Inject;

import org.junit.AfterClass;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.junit4.SpringRunner;

import kr.or.ddit.TestWebAppConfiguration;
import kr.or.ddit.init.FileSavePathInfo;
import lombok.extern.slf4j.Slf4j;

@RunWith(SpringRunner.class)
@TestWebAppConfiguration
@ActiveProfiles("stage")
@Slf4j
public class FileSaveInfoTest {

	
	private FileSavePathInfo save;
	
	@Inject
	public void setSave(FileSavePathInfo save) {
		this.save = save;
		log.info("이름 : {}", save.getClass().getName());
	}
	
	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
	}

	@Test
	public void test() {
		log.info("mem : {}", save.getMemberSaveFolder());
	}

}
