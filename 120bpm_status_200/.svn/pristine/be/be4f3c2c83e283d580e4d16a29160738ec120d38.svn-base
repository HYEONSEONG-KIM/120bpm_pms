package kr.or.ddit.security.vo;

import javax.validation.constraints.NotBlank;

import kr.or.ddit.validate.groups.InsertGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@EqualsAndHashCode(of="author")
@ToString
@NoArgsConstructor
public class AuthorityVO {

	private String author;
	@NotBlank(groups = InsertGroup.class)
	private String authorNm;
	private String authorDc;
	private String authorCreatde;
	private String authorUpdtde;
	private Integer projectCnt;
	
	private String[] resrceCode;
}
