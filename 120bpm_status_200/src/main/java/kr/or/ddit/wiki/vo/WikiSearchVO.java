package kr.or.ddit.wiki.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class WikiSearchVO {
	private String searchType;
	private String searchWord;
	private String sortType;
	
}
