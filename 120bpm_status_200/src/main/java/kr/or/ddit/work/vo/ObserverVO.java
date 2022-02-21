package kr.or.ddit.work.vo;

import java.io.Serializable;

import lombok.Data;

@Data
public class ObserverVO implements Serializable{
	private String prjctNo;
	private String memId;
	private String workCode;
	private String ctgryCode;
	private String memFnm;
	private String memLnm;
	private String observerId;
	private String observerName;
	private String memName;
	
}
