package kr.or.ddit.project.vo;

import javax.validation.constraints.NotBlank;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of="prjctNo")
@ToString
public class ProjectVO {

	@NotBlank
	private Integer prjctNo;
	@NotBlank
	private String prjctNm;
	private String sumry;
	private String prjctBeginde;
	private String prjctEndde;
	private Integer upperPrjctNo;
	@NotBlank
	private String prjctRgsde;
	private String prjctOrnt;
	private String bsnssclae;
}