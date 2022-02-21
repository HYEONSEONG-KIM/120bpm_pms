package kr.or.ddit.makeProject.vo;

import java.util.List;

import kr.or.ddit.accept.vo.AcceptMemSearchVO;
import lombok.Getter;
import lombok.NoArgsConstructor;

/**
 * 페이징 처리에 관련된 속성의 집합.
 *
 */
@NoArgsConstructor
@Getter
public class MakeProjectPagingVO<T> {
	
	public MakeProjectPagingVO(int screenSize, int blockSize) {
		super();
		this.screenSize = screenSize;
		this.blockSize = blockSize;
	}

	private int totalRecord;
	private int screenSize = 10;
	private int blockSize = 5;
	private int totalPage;
	private int currentPage;
	private int startRow;
	private int endRow;
	private int startPage;
	private int endPage;
	
	//개인 프로젝트목록 조회를 위한 변수
	private String memId;
	public void setMemId(String memId) {
		this.memId = memId;
	}
	
	//전체, 진행중, 완료된 프로젝트를 체크하기 위한 변수
	private String checkDate = "whole";
	
	public void setCheckDate(String checkDate) {
		this.checkDate = checkDate;
	}
	
	private MakeProjectSearchVO simpleSearch; // 단순 키워드 검색
	public void setSimpleSearch(MakeProjectSearchVO simpleSearch) {
		this.simpleSearch = simpleSearch;
	}
	private T detailSearch; // 상세검색
	public void setDetailSearch(T detailSearch) {
		this.detailSearch = detailSearch;
	}
	private List<T> dataList;
	
	public void setDataList(List<T> dataList) {
		this.dataList = dataList;
	}
	
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
		totalPage = (int)(Math.ceil(totalRecord/(double)screenSize));
	}
	
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
		endRow = currentPage * screenSize;
		startRow = endRow - (screenSize - 1);
		startPage = blockSize * ((currentPage - 1)/blockSize) + 1;
		endPage = startPage + (blockSize - 1);
	}
	
	private static final String LINKPTRN = "<a class='pageLink' href='#' data-page='%d'>%s</a>\n";
	public String getPagingHTML() {
//		<a href="?page=1">1</a>
		StringBuffer html = new StringBuffer();
		
		if(startPage>1) {
			html.append(String.format(LINKPTRN, startPage-1, "이전"));
		}
		endPage = endPage > totalPage ? totalPage : endPage; 
		for(int page=startPage; page<=endPage; page++) {
			if(page == currentPage) {
				html.append("["+page+"]");
			}else {
				html.append(String.format(LINKPTRN, page, page));
			}
		}
		if(endPage<totalPage) {
			html.append(String.format(LINKPTRN, endPage + 1, "다음"));
		}
		
		return html.toString();
	}
	
	   private static final String PAGEITEM = "<li class='page-item %s' %s>"
               +"<a class='page-link pageLink' href='#' data-page='%d'>%s</a>"
               + "</li>";
   
   public String getPagingHTMLBS() {
      StringBuffer html = new StringBuffer();
      html.append("<nav aria-label='...' class='mt-3'>");
      html.append("<ul class='pagination'>");
      String first = null;
      String second = null;
      int third = -1; 
      String fourth = "<";
      if(startPage > 1) {
         first = "";
         second = "";
         third = startPage - 1;
      }else {
         first ="disabled";
         second = "tabindex='-1' aria-disabled='true'";
         third = -1;
      }
      html.append(
         String.format(PAGEITEM, first, second, third, fourth)   
      );
      endPage = endPage < totalPage ? endPage : totalPage;
      for(int page=startPage; page<=endPage; page++) {
         second = "";
         third = page;
         fourth = page + "";
         if(page==currentPage) {
            first = "active";
         }else {
            first = "";
         }
         html.append(
            String.format(PAGEITEM, first, second, third, fourth)   
         );
      }
      fourth = ">";
      if(endPage < totalPage) {
         first = "";
         second = "";
         third = endPage + 1;
      }else {
         first ="disabled";
         second = "tabindex='-1' aria-disabled='true'";
         third = -1;
      }
      html.append(
         String.format(PAGEITEM, first, second, third, fourth)   
      );
      html.append("</ul>");
      html.append("</nav>");
      return html.toString();
   }
	
	public String getPagingHTMLReplyType() {
		StringBuffer html = new StringBuffer();
		if(currentPage<totalPage) {
			html.append("<a class='btn border-success w-75' data-page='"+(currentPage+1)+"'>더보기</a>");
		}
		html.append("<button type='button' class='m-3 btn btn-secondary scrollTop'>↑</button>");
		return html.toString();
	}
	
	
}
































