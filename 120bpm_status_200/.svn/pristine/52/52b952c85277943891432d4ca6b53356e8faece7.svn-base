package kr.or.ddit.wiki.vo;

import javax.validation.constraints.NotBlank;

import kr.or.ddit.work.vo.WorkVO;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//@Data
@Getter
@Setter
@ToString
@EqualsAndHashCode(of= {"prjctNo", "menuClCode", "boNo"})	//복합키
public class BoardVO {
	
	
	private String memName;
	@NotBlank
	private Integer prjctNo;	//프로젝트번호		NUMBER
	@NotBlank
	private String menuClCode;	//메뉴분류코드		VARCHAR2(500)
	@NotBlank
	private Integer boNo;		//게시글번호		NUMBER
	@NotBlank
	private String boSj;		//제목			VARCHAR2(500)
	@NotBlank
	private String boCn;		//내용			CLOB
	@NotBlank
	private String memId;		//작성자ID		VARCHAR2(500)
	private Integer parentBoNo;	//상위게시글번호	NUMBER
	@NotBlank
	private String boRgsde;		//등록일자			DATE
	@NotBlank
	private Integer likeCnt;	//좋아요수			NUMBER
	private String boParent;	//답글			CLOB
	@NotBlank
	private String othbcAt;		//공개여부			CHAR(1)
	
	private Integer rnum;
	
	private BoardVO boardInfo;
	
	 public void setBoardVO(BoardVO boardVO) {
		this.boardInfo = boardInfo;
	}

	private void BoardVO(BoardVO boardVO) {
		// TODO Auto-generated method stub
		
	}

}
