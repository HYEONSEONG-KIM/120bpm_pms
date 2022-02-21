package kr.or.ddit.makeProject.vo;

import java.io.Serializable;
import java.util.List;

import javax.validation.constraints.NotBlank;

import kr.or.ddit.accept.vo.ProjectMemVO;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@EqualsAndHashCode(of="prjctNo")
@ToString
@NoArgsConstructor
public class MakeProjectVO implements Serializable {

	private Integer prjctNo;
	@NotBlank
	private String prjctNm;
	private String sumry;
	@NotBlank
	private String prjctBeginde;
	@NotBlank
	private String prjctEndde;
	private Integer upperPrjctNo;
	private String prjctRgsde;
	private String prjctOrnt;
	private String bsnssclae;
	private String authorNm;
	private String parentPrtNm;
	// 프로젝트 생성시 pm지정하였을시, 프로젝트 구성원 추가 혹은 제외시
	private String memId; // pm아이디
	// 프로젝트 생성시 pm이 아닌 상속된 구성원을 추가할 시
	private List<ProjectMemVO> extentMemList;
	private String deletState;	
	
	private List<ProjectWorkCategoryVO> wokrCategoryList;
	private List<ProjectMemVO> projectMemList;
	
	private int memCnt; //프로젝트 구성원 (옵저버 제외) 수
}
