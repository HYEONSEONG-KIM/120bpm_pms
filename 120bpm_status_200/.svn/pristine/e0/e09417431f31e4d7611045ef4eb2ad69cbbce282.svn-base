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
@EqualsAndHashCode(of="prjctNo")
@ToString
public class MyProjectVO {
 
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
	private String deletState;
	
	//상위프로젝트명
	private String upperPrjctNm;
	//내 역할
	private RoleVO role;
	 
	private String memId;
	private String memNumber;
	
	private String thismonths; 
	private int prjctcnt;
	
	private int yetcount;
	private int ingcount;
	private int donecount;
}