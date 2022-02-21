package kr.or.ddit.work.vo;

import javax.validation.constraints.NotBlank;
import javax.validation.groups.Default;

import kr.or.ddit.validate.groups.DeleteGroup;
import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.validate.groups.UpdateGroup;
import lombok.Data;

@Data
public class WorkRepVO {
	@NotBlank(groups=Default.class  , message="피드백 내용은 필수입력사항입니다")
	private String workRepCn; //내용
	private String repWriter;// 작성자 아이디
	private String workRepRgsde;//등록일 sysdate 
	private Integer workRepNo;//번호
	@NotBlank(groups= { InsertGroup.class} , message="일감코드는 필수입력사항입니다")
	private String workCode; // 일감코드
	@NotBlank(groups=Default.class  , message="카테고리는 필수입력사항입니다")
	private String ctgryCode; //카테고리 코드
	@NotBlank(groups=Default.class  , message="필수입력사항입니다")
	private String prjctNo;//프로젝트 코드
	private Integer rnum;
	private String repWriterId; 
	@NotBlank(groups=Default.class  , message="피드백 작성자는 필수입력사항입니다")
	private String memId;
}
