package kr.or.ddit.security;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.FactoryBean;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.security.web.util.matcher.RequestMatcher;

import kr.or.ddit.security.dao.ResourceDAO;
import kr.or.ddit.security.util.CustomConfig;
import kr.or.ddit.security.vo.AuthorityVO;
import kr.or.ddit.security.vo.ResourceVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class RequestMapFactoryBean implements FactoryBean<LinkedHashMap<RequestMatcher, List<ConfigAttribute>>>{

	@Inject
	private ResourceDAO resDAO;
	
	
	@Override
	public LinkedHashMap<RequestMatcher, List<ConfigAttribute>> getObject() throws Exception {

		LinkedHashMap<RequestMatcher, List<ConfigAttribute>> requestMap = new LinkedHashMap<>();
		List<ResourceVO> securityResources = resDAO.selectAllSortedResources();
		
		log.info("ResourceInfo : {} {}", securityResources.size(), securityResources);
		// securityResources에는 보호자원 - 역할에 대한 정보 List로 담음
		securityResources.forEach((resource)->{
			String url = resource.getResrcePttrn();	// url주소 가져오기
			List<AuthorityVO> authorities = resource.getAuthorities(); // Role에대한 정보
			if(authorities == null || authorities.size() == 0) return;
			
			AntPathRequestMatcher requestMatcher = null;
			requestMatcher = new AntPathRequestMatcher(url);
			
			List<ConfigAttribute> configList = new ArrayList<>();
			authorities.forEach((authorityVO)->{
				
				if(StringUtils.isNoneBlank(authorityVO.getAuthor())) { // getAuthor -> ROLE_...
					if(url.startsWith("/project/") && !authorityVO.getAuthor().equals("ROLE_ADMIN")) {
						configList.add(new CustomConfig(authorityVO.getAuthor()));
						
					}else {
						configList.add(new SecurityConfig(authorityVO.getAuthor()));
						
					}
				}
				
			});
			requestMap.put(requestMatcher, configList);
		});
		
		log.info("resultmapInfo : {}", requestMap.size());
		
		return requestMap;
	}

	@Override
	public Class<?> getObjectType() {
		return LinkedHashMap.class;
	}

	@Override
	public boolean isSingleton() {
		return false;
	}

}

