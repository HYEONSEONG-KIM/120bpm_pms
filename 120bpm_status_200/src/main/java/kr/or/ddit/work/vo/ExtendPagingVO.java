package kr.or.ddit.work.vo;

import java.util.List;

import kr.or.ddit.accept.vo.AcceptMemberVO;
import kr.or.ddit.accept.vo.AcceptMemberVOWrapper;
import kr.or.ddit.issue.vo.IssueVO;
import kr.or.ddit.member.vo.PagingVO;
import kr.or.ddit.member.vo.SearchVO;
import lombok.Getter;
import lombok.NoArgsConstructor;
@NoArgsConstructor //파라미터가 없는 기본 생성자를 생성
@Getter //getter메소드 생성 - 결정되어있는 값들 꺼내기
public class ExtendPagingVO<T>  extends PagingVO<T>{
	
 
	public ExtendPagingVO(int screenSize, int blockSize) { //필요하다면 두개의 생성자를 이용해 값을 바꿀 수 있다.
		super(); //생성자를 만들어준건...이걸 꼭 써야한다는 의미!!!!
		this.screenSize = screenSize;
		this.blockSize = blockSize;
	}
	
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
		endRow = currentPage * screenSize;
		startRow = endRow - (screenSize - 1);
		startPage = blockSize * ((currentPage - 1)/blockSize) + 1;
		endPage = startPage + (blockSize - 1);
	}
	
	//9가지 property + data ==> 10가지 	
		private int totalRecord; //db에서 레코드 건수 조회를 해야 결정 - 적어도 1번 이상 setter호출해야 넣어줄 수 있음.
		private int screenSize = 10; //화면에 보이는 개수
		private int blockSize = 5; //개발자가 임의로 결정(using Fields) //기본생성자
		private int currentPage;  
		private int startRow;
		private int endRow;
		private int startPage;
		private int endPage;
		
		private int totalPage; //screenSize결정, totalRecord가 결정될 때 totalPage도 결정


		public void setStartRow(int startRow) {
			this.startRow = startRow;
		}
		
		private IssueVO issueVO;
		public void setIssueVO(IssueVO issueVO) {
			this.issueVO = issueVO;
		}
		
		private List<T> dataList; //페이징처리를 하면 그 결과로 data라는게 조회, 그 data 포함! 
		//타입변수T로 객체가 선언X 생성O될 때 element타입 결정
		//타입은 바구니야. List면 바구니안에 공을 여러개 담는거지.
		
		public void setDataList(List<T> dataList) {
			this.dataList = dataList;
		}
		
		
		public void setTotalRecord(int totalRecord) { //total레코드가 결정되었다면, 1번은 호출 //totalPage연산
			this.totalRecord = totalRecord; //이것도 생성자로 만들었으니 1번은 호출
			
			totalPage = (int)(Math.ceil(totalRecord/(double)screenSize));
		}
		
		private WorkVO workVO;
		
		 public void setWorkVO(WorkVO workVO) {
			this.workVO = workVO;
		}
		
		private SearchVO simpleSearch; // 단순 키워드 검색 //예-레코드100개, 
		public void setSimpleSearch(SearchVO simpleSearch) {
			this.simpleSearch = simpleSearch;
		}
		
		private T detailSearch; // 상세검색 //레코드100개안에서 키워드 '대전'추가시 SIMPLE이후 조건잡혀야해
		public void setDetailSearch(T detailSearch) {
			this.detailSearch = detailSearch;
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
		
		
	
		
		
}
