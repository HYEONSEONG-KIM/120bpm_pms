package kr.or.ddit.main.vo;

import javax.validation.constraints.NotBlank;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of="author")
@ToString
public class RoleVO {
	
	@NotBlank
	private String author;
	@NotBlank
	private String authorNm;
	private String authorDc;
	private String authorCreatde;
	private String authorUpdtde;
}
