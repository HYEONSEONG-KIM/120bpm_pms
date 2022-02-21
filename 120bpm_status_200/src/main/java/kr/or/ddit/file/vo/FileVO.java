package kr.or.ddit.file.vo;

import java.io.Serializable;
import java.util.List;

import javax.validation.constraints.NotBlank;

import lombok.Data;
@Data
public class FileVO implements Serializable{
		private String attatchTemptAt;
		private String attatchtDelAt;
		private String attatchRgsde;
		private String attatchSaveFileName;
		private  List<AtchFIleVO> attatchList;
		private  String[] delFileNo;
		private int updateCount;
}
