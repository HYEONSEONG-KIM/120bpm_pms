package kr.or.ddit.security.util;

import org.springframework.security.access.ConfigAttribute;

public class CustomConfig implements ConfigAttribute{
	

	private final String attrib;


	public CustomConfig(String config) {
		this.attrib = config;
	}
	
	public CustomConfig(String config, String projectId) {
		this.attrib = projectId + ":" + config;
	}
	
	@Override
	public String getAttribute() {
		return attrib;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((attrib == null) ? 0 : attrib.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CustomConfig other = (CustomConfig) obj;
		if (attrib == null) {
			if (other.attrib != null)
				return false;
		} else if (!attrib.equals(other.attrib))
			return false;
		return true;
	}
	
	
	

}
