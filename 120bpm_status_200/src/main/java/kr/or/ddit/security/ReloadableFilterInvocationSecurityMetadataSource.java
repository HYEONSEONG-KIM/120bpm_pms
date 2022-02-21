package kr.or.ddit.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;
import org.springframework.security.web.util.matcher.RequestMatcher;
import org.springframework.web.context.WebApplicationContext;

import kr.or.ddit.security.util.CustomConfig;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ReloadableFilterInvocationSecurityMetadataSource implements FilterInvocationSecurityMetadataSource{

	@Inject
	private WebApplicationContext container;
	
	
	private final Map<RequestMatcher, Collection<ConfigAttribute>> requestMap;
	
	public ReloadableFilterInvocationSecurityMetadataSource(
			LinkedHashMap<RequestMatcher, Collection<ConfigAttribute>> requestMap) {
		this.requestMap = requestMap;
	}

	
	@Override
	public Collection<ConfigAttribute> getAttributes(Object object) {
		final HttpServletRequest request = ((FilterInvocation)object).getRequest();
		
		Collection<ConfigAttribute> list = new ArrayList<ConfigAttribute>();
		
		for(Map.Entry<RequestMatcher, Collection<ConfigAttribute>> entry : requestMap.entrySet()) {
			if(entry.getKey().matches(request)) {
				System.out.println("key : " + entry.getKey());
				entry.getValue().forEach((ele)->{
					if(ele instanceof SecurityConfig) {
						list.add(ele);
					}else if(ele instanceof CustomConfig) {
							String uri = request.getRequestURI();
							String[] uriSplit = uri.split("/");
							String projectId = null;
							if(uri.contains("/project")) {
								projectId = uriSplit[3];
							}
							list.add(new CustomConfig(ele.getAttribute(),projectId));
							ConfigAttribute test = new CustomConfig(ele.getAttribute(),projectId);
					}
				});
				
				return list;
			}
		}
		
		return null;
	}

	@Override
	public Collection<ConfigAttribute> getAllConfigAttributes() {
	Set<ConfigAttribute> allAttribute = new HashSet<ConfigAttribute>();
		
		for(Map.Entry<RequestMatcher, Collection<ConfigAttribute>> entry : requestMap.entrySet()) {
			allAttribute.addAll(entry.getValue());
			
		}
		return allAttribute;
	}

	@Override
	public boolean supports(Class<?> clazz) {
		return FilterInvocation.class.isAssignableFrom(clazz);
	}
	
	public void reload() {
		LinkedHashMap<RequestMatcher, List<ConfigAttribute>> reloadedRequestMap 
									= container.getBean("requestMap", LinkedHashMap.class);
		synchronized (requestMap) {
			requestMap.clear();
			requestMap.putAll(reloadedRequestMap);
		}
	}
	

}
