package kr.or.ddit.news.vo;

import java.io.Serializable;
import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.databind.ser.std.StdKeySerializers.Default;

import kr.or.ddit.accept.vo.ProjectMemVO;
import kr.or.ddit.validate.groups.DeleteGroup;
import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.validate.groups.UpdateGroup;
import lombok.Data;

@Data
public class NewsVO implements Serializable {
	@NotBlank(groups=InsertGroup.class)
	private String prjctNo;
	
	@NotBlank(groups=InsertGroup.class)
	private String menuClCode;
	
	@NotNull(groups= {UpdateGroup.class,DeleteGroup.class})
	private Integer boNo;
	
	@NotBlank(groups=Default.class)
	private String boSj;
	
	@NotBlank(groups=Default.class)
	private String boCn;
	
	@NotBlank(groups=InsertGroup.class)
	private String memId;
	private String memName;
	private String proflImgNm;
	//==========================
	private Integer parentBoNo;
	private String boRgsde;
	private Integer likeCnt;//좋아요
	private String boParent;
	private String othbcAt;
	private String boUpdtde;
	private Integer boRdcnt;
	private Integer boDeleteAt;
	
	private	List<ProjectMemVO>  roleList;
	private List<NewsRepVO> newRepList;
	private List<NewsFileVO> newsFileList;
	private String[] delFileNo; //삭제할 파일이름 
	private  String[] boNos ;
}
