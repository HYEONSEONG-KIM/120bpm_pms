package kr.or.ddit.security;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.FactoryBean;

import kr.or.ddit.security.dao.AuthorityDAO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class RoleHierarchyStringFactoryBean implements FactoryBean<String>{

	@Inject
	private AuthorityDAO authDAO;
	
	@Override
	public String getObject() throws Exception {
		List<String> hierarchy = authDAO.roleHierarchy();
		String hierarchyString = hierarchy.stream().reduce((ele1, ele2) ->{
			return ele1  + "\n" + ele2;
		}).get();
		log.info("hierarchyString : {}", hierarchyString);
		return hierarchyString;
	}

	@Override
	public Class<?> getObjectType() {
		// TODO Auto-generated method stub
		return String.class;
	}

	@Override
	public boolean isSingleton() {
		// TODO Auto-generated method stub
		return false;
	}

	
	
}
