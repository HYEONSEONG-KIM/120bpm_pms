package kr.or.ddit.free.vo;

import java.io.Serializable;
import java.util.List;

import com.sun.istack.internal.NotNull;

import kr.or.ddit.notice.vo.NoticeFileVO;
import kr.or.ddit.wiki.vo.BoardVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of="repNo") 
public class FreeBoardVO implements Serializable{
	public FreeBoardVO() {
		// TODO Auto-generated constructor stub
	}
	private int rnum;
	private int today;
	@NotNull
	private String prjctNo;
	@NotNull
	private String menuClCode;
	@NotNull
	private Integer boNo;
	@NotNull
	private String boSj;
	@NotNull
	private String boCn;
	private String displayCn;
	@NotNull
	private String memId;
	private Integer parentBoNo;
	@NotNull
	private String boRgsde;
	private String boUpdtDe;
	//좋아요
	private Integer likeCnt;

	private String boParent;

	//공개여부
	private String othbcAt;	
	//조회수
	private Integer boRdcnt;
	private Integer boDeleteAt;
	
	List<FreeReplyVO> freeReply;
}
