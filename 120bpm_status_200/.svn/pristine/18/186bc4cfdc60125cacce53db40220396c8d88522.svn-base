package kr.or.ddit.security.dao;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.collections.map.HashedMap;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.junit4.SpringRunner;

import kr.or.ddit.TestWebAppConfiguration;
import kr.or.ddit.accept.vo.ProjectMemVO;
import kr.or.ddit.security.vo.AuthorityVO;
import kr.or.ddit.security.vo.ResourceVO;
import lombok.extern.slf4j.Slf4j;

@RunWith(SpringRunner.class)
@TestWebAppConfiguration
@Slf4j
public class ResourceDAOTest {

	@Inject
	private ResourceDAO dao;
	
	@Inject
	private AuthorityDAO auth;
	
	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
	}

	@Test
	public void testSelectAllSortedResources() {
	
		List<ResourceVO> level2Res = dao.selectLevel2Res();
		List<AuthorityVO> allRole = auth.selectAllRole();
		List<ResourceVO> resourceList = dao.selectAllResource();
		Map<String,Integer> map = new HashMap<>();
		
		for(AuthorityVO authVO : allRole) {
			int cnt = 0;
			for(ResourceVO res : level2Res) { //부모 자원
				for(ResourceVO allRes : resourceList) {
					
					for(AuthorityVO authVO2 : allRes.getAuthorities()) {
						if(authVO.getAuthor().equals(authVO2.getAuthor()) && allRes.getResrceParent().equals(res.getResrceCode())) {
							cnt++;
						}
					}
			
				}
				System.out.println(authVO.getAuthor() + "-" + res.getResrceDc()  + " : " + cnt);
				cnt = 0;
			}
			
		}
		
	}

}
