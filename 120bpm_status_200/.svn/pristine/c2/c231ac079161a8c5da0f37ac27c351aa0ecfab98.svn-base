package kr.or.ddit.wiki.vo;

import java.util.List;

import kr.or.ddit.member.vo.SearchVO;
import lombok.Getter;
import lombok.NoArgsConstructor;

/**
 * 페이징 처리 관련 속성 집합 페이징처리는 전체 데이터를 대상으로 구간별로 쪼개어 조회하는 구조. 페이징 속성 - 한 구간안에 몇개의
 * 데이터를 포함시킬것인가, 한 화면안에 몇개의 구간에 대한 정보를 제공할 것인가
 * 
 * 1. 토탈레코드 - 100 (DB로 조회) 2. 스크린사이즈 - 10(데이터건수(스타트로우(첫번째건수), 엔드로우) //임의로 정해 3.
 * 토탈페이지 - 10 4. 블록사이즈 - 한페이지 안에서 다른링크로 이동할수 있는 페이지 제공하는 것. << 6,7,8,9,10 >>
 * 
 * startPage = > 블록사이즈 규정, * 0~4까지 곱한다.
 * 
 */
@NoArgsConstructor // 파라미터가 없는 기본 생성자를 생성
@Getter // getter메소드 생성 - 결정되어있는 값들 꺼내기
//setter를 쓰지 않는건 아래 startrow나 endrow 값을 연산의 결과로만 얻어야하는 값이기에 값을 변경할수 없도록 막고있음.
public class WikiPagingVO<T> { // 최초만들어질때 pagingVO-> Controller ->memberdao시그니처 처리위해 2개의 메소드(totalRecord,
							// 구간별조회레코드 메소드) ->마바
	// 타입변수T로 객체가 선언X 생성O될 때 element타입 결정

	// 9가지 property + data ==> 10가지
	private int totalRecord; // db에서 레코드 건수 조회를 해야 결정 - 적어도 1번 이상 setter호출해야 넣어줄 수 있음.
	private int screenSize = 10; // 개발자가 임의로 결정
	private int blockSize = 5; // 개발자가 임의로 결정(using Fields) //기본생성자
	private int currentPage; // 개발자가 임의로 결정(using Fields) //기본생성자
	private int startRow;
	private int endRow;
	private int startPage;
	private int endPage;

	private int totalPage; // screenSize결정, totalRecord가 결정될 때 totalPage도 결정

	private List<T> dataList; // 페이징처리를 하면 그 결과로 data라는게 조회, 그 data 포함!
	// 타입변수T로 객체가 선언X 생성O될 때 element타입 결정
	// 타입은 바구니야. List면 바구니안에 공을 여러개 담는거지.

	public void setDataList(List<T> dataList) {
		this.dataList = dataList;
	}

	public WikiPagingVO(int screenSize, int blockSize) { // 필요하다면 두개의 생성자를 이용해 값을 바꿀 수 있다.
		super(); // 생성자를 만들어준건...이걸 꼭 써야한다는 의미!!!!
		this.screenSize = screenSize;
		this.blockSize = blockSize;
	}

	public void setTotalRecord(int totalRecord) { // total레코드가 결정되었다면, 1번은 호출 //totalPage연산
		this.totalRecord = totalRecord; // 이것도 생성자로 만들었으니 1번은 호출

		totalPage = (int) (Math.ceil(totalRecord / (double) screenSize));
	}

	private WikiSearchVO simpleSearch; // 단순 키워드 검색 //예-레코드100개,

	public void setSimpleSearch(WikiSearchVO simpleSearch) {
		this.simpleSearch = simpleSearch;
	}

	private T detailSearch; // 상세검색 //레코드100개안에서 키워드 '대전'추가시 SIMPLE이후 조건잡혀야해

	public void setDetailSearch(T detailSearch) {
		this.detailSearch = detailSearch;
	}

	private static final String LINKPTRN = "<a class='pageLink' href='#' data-page='%d'>%s</a>\n";

	//
	public String getPagingHTML() { // 페이지 링크만들기
//		<a href="?page=1">1</a>
		StringBuffer html = new StringBuffer();

		if (startPage > 1) {
			html.append(String.format(LINKPTRN, startPage - 1, "이전"));
		}
		endPage = endPage > totalPage ? totalPage : endPage;
		for (int page = startPage; page <= endPage; page++) {
			if (page == currentPage) {
				html.append("[" + page + "]");
			} else {
				html.append(String.format(LINKPTRN, page, page));
			}
		}
		if (endPage < totalPage) { // 다음페이지가 있냐없냐.
			html.append(String.format(LINKPTRN, endPage + 1, "다음"));
		}

		return html.toString();
	}

	public void setCurrentPage(int currentPage) { // current page가결정되었다면 1번은 호출
		this.currentPage = currentPage;
		endRow = currentPage * screenSize;
		startRow = endRow - (screenSize - 1);
		startPage = blockSize * ((currentPage - 1) / blockSize) + 1;
		endPage = startPage + (blockSize - 1);
	}

	private static final String PAGEITEM = "<li class='page-item %s' %s>"
			+ "<a class='page-link pageLink' href='#' data-page='%d'>%s</a>" + "</li>";

	public String getPagingHTMLBS() {
		StringBuffer html = new StringBuffer();
		html.append("<nav aria-label='...' class='mt-3'>");
		html.append("<ul class='pagination'>");
		String first = null;
		String second = null;
		int third = -1;
		String fourth = "<";
		if (startPage > 1) {
			first = "";
			second = "";
			third = startPage - 1;
		} else {
			first = "disabled";
			second = "tabindex='-1' aria-disabled='true'";
			third = -1;
		}
		html.append(String.format(PAGEITEM, first, second, third, fourth));
		endPage = endPage < totalPage ? endPage : totalPage;
		for (int page = startPage; page <= endPage; page++) {
			second = "";
			third = page;
			fourth = page + "";
			if (page == currentPage) {
				first = "active";
			} else {
				first = "";
			}
			html.append(String.format(PAGEITEM, first, second, third, fourth));
		}
		fourth = ">";
		if (endPage < totalPage) {
			first = "";
			second = "";
			third = endPage + 1;
		} else {
			first = "disabled";
			second = "tabindex='-1' aria-disabled='true'";
			third = -1;
		}
		html.append(String.format(PAGEITEM, first, second, third, fourth));
		html.append("</ul>");
		html.append("</nav>");
		return html.toString();
	}

}
