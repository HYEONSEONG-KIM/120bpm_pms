package kr.or.ddit.notice.vo;

import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import javax.validation.groups.Default;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class NoticeVO {
	private int rnum;
	private int today;
	private String noticeCode;
	private String noticeCodes[];

	@NotBlank(groups=Default.class , message="제목은 필수입력사항입니다")
	@Size(max=150 , message="제목은 150자 이내로 작성되어야 합니다")
	private String noticeSj;
	
	@NotBlank(groups=Default.class , message="내용은 필수입력사항입니다")
	private String noticeCn;
	private String noticeRgsde;
	private String memId;
	private Integer noticeRdcnt;

	private String PrevNO;
	private String nextNO;
	
	List<NoticeFileVO> noticeFileList;
	private MultipartFile[] noticeFiles;
	
	//파일 넣을 때 
	private String[] delFileNo; //삭제할 파일이름 
	
}
