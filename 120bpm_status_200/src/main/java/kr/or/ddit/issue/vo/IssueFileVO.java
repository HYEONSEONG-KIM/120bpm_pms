package kr.or.ddit.issue.vo;

import java.io.Serializable;

import lombok.Data;
@Data
public class IssueFileVO  implements Serializable{
	private String issueFileNm;
	private String issueFileRgsde;
	private String issueFileSavedNm;
	private String issueFileCode;
	private String issueFileDelAt;
	private Integer prjctNo;
	private String ctgryCode;
	private String workCode;
	private Integer issueNo;
	private String issueFiletempAt;
	
}
