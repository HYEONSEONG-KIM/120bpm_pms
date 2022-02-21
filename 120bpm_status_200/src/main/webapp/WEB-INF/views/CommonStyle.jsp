<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div>
<!-- 버튼 UI -->
	<button type="button" class="newBtn btn">
		<img class="newImg" src="${cPath}/resources/imgs/img/new.png">
		글쓰기 
	</button>
	<button type="button" class="searchBtn btn">검색</button>
	<button type="button" class="insertBtn btn">등록</button>
	<button type="button" class="updateBtn btn">수정</button>
	<button type="button" class="deleteBtn btn">삭제</button>
	<button type="button" class="gobackBtn btn">뒤로</button>
	<button type="button" class="resetBtn btn">
		<img class="resetImg" src="${cPath}/resources/imgs/img/reset.png">
	</button>
</div>

<!-- 검색 UI  -->
<div class="newWriteBtn mb-5">
	<button type="button" class="newBtn btn">
		<img class="newImg" src="${cPath}/resources/imgs/img/new.png">
		글쓰기 
	</button> 
</div>  
<div id="searchUI" class="row">
	<div>
		<div class="searchUIInput">
			<label>검색1</label> <select>
				<option value>옵션</option>
				<option value="1">옵션1</option>
				<option value="0">옵션2</option>
			</select> <label>검색2</label> <input type="text" /> <label>날짜1</label> <input
				type="date" /> <label>날짜2</label> <input type="date" />
			<label><button type="button" class="resetBtn btn mr-5"> 
				<img class="resetImg" src="${cPath}/resources/imgs/img/reset.png">
			</button></label> 
		</div> 
		<div class="searchUIBtn">
			<button type="button" id="searchBtn" class="btnTags btn searchBtn">검색</button>
		</div>
	</div>
</div>
 
<!-- table UI -->
<table class="table">
	<thead>
		<tr>
			<th>어쩌구</th>
			<th>어쩌구</th>
			<th>어쩌구</th>
			<th>어쩌구</th>
			<th>어쩌구</th>
			<th>어쩌구</th>
			<th>어쩌구</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>저쩌구</td>
			<td>저쩌구</td>
			<td>저쩌구</td>
			<td>저쩌구</td>
			<td>저쩌구</td>
			<td>저쩌구</td>
			<td>저쩌구</td>
		</tr>
	</tbody>
	<tfoot> 
		<tr>
			<td colspan="7">
			<!-- paging UI -->
				<div class="pagingArea">
					<nav aria-label='...' class='mt-3'>
						<ul class='pagination'>
							<li class='page-item active'><a class='page-link pageLink' href='#'
								data-page=''>1</a></li>
							<li class='page-item'><a class='page-link pageLink'
								href='#' data-page=''>2</a></li>
						</ul>
					</nav>   
				</div>
			</td>
		</tr>
	</tfoot>
</table>