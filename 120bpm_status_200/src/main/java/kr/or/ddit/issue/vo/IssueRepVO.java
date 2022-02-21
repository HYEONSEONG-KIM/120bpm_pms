package kr.or.ddit.issue.vo;

import java.io.Serializable;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.groups.Default;

import kr.or.ddit.validate.groups.DeleteGroup;
import kr.or.ddit.validate.groups.InsertGroup;
import lombok.Data;

@Data
public class IssueRepVO implements Serializable{
	@NotBlank(groups=Default.class  , message="피드백 내용은 필수입력사항입니다")
	private String issueRepCn;
	private String issueRepRgsde;
	@NotNull(groups=DeleteGroup.class  , message="필수입력사항입니다")
	private Integer issueRepNo;
	@NotBlank(groups=InsertGroup.class  , message="필수입력사항입니다")
	private String prjctNo;
	@NotBlank(groups=InsertGroup.class  , message="필수입력사항입니다")
	private String ctgryCode;
	@NotBlank(groups= { InsertGroup.class} , message="일감코드는 필수입력사항입니다")
	private String workCode;
	private String issueNo;
	@NotBlank(groups=Default.class  , message="피드백 작성자는 필수입력사항입니다")
	private String memId;
	private String repWriter;
	private String repWriterId;
	private String memName;
	private String issueRepParent;
	private Integer rnum ;
	private String issueRepDeleteAt;
	private String[] memIds; // 댓글 등록 시 해당 일감 담당자와 관람자 id를 넣어둘 수 있도록 한 번 조회 해서 담아두겠음
	
}
