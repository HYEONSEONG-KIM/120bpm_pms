package kr.or.ddit.security.vo;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@EqualsAndHashCode(of="resrceCode")
@ToString
@NoArgsConstructor
public class ResourceVO {
	
	private Integer level;
	private String resrceCode;
	private String resrceNm;
	private String resrcePttrn;
	private String resrceDc;
	private String resrceTy;
	private Integer reserceSortOrdr;
	private String resrceCreatde;
	private String resrceUpdtde;
	private String menuClCode;
	private String httpMethod;
	private String resrceParent;
	
	private List<AuthorityVO> authorities;
}
