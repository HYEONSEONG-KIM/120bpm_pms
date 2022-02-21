package kr.or.ddit.main.vo;

import java.io.Serializable;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of="issueNo")
public class MyIssueVO implements Serializable{
	private Integer issueNo;
	private String issueSj;
	private String issueRgsde;
	private String issueOthbcAt;
	private String issueCn;
	private String workCode;
	private String memId;
	private Integer prjctNo;
	private String ctgryCode;
	private String issuePriortCode; 
	private String issueUpdtde;
	private String issueSolutAt;

	private int totalIssue;
	private int solutIssue; 
	private int dayissuecnt;
//	private double isTotalOcc;
	private double isOccRate;
	private double isSolutRate;
} 
