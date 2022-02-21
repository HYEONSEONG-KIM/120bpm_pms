<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="security"%> 
<script type="text/javascript" src="${cPath }/resources/js/jquery.form.min.js"></script>
<security:authentication property="principal.adaptee" var="authMember" />

<style>
.title {
   font-size: 1.8rem;
   font-weight : bold;
   color: #333;
   line-height: 1.15;
   padding-bottom: 1.2rem;
   border-bottom: 2px solid #222;
   letter-spacing: -0.03em;
/*    text-align : center; */
}

#textCn{
	padding : 10px;
}

th{
	width:30%;
}
td{
	width:70%;
}

.listbtn{
	float : right;
/* 	padding-right: 4%; */
}

#inCn{
	padding : 10px;
	border : 1px solid none;
}


 #textCn{ 
 	height: 300px;
 	width: 100%;
 	overflow : auto;
 	}
.scroll{
	height: 200px;
}
</style>
<form id="delNotice" action="${cPath }/notice/noticeDelete" method="post">
	<input type="hidden" name="noticeCode" value="${notice.noticeCode }" required/>
	<input type="hidden" name="memId" value="${notice.memId }" />
	
</form>		
<h2 class="title">&nbsp;&nbsp;공지사항
	<div class="listbtn">
		<input type="button" class="controlBtn btn btn-secondary" value="글 목록" data-gopage="${cPath }/notice/noticeList" /> 
			<c:if test="${authMember.mngrAt eq '1'}">
				<input type="button" value="수정" class="controlBtn btn btn-success"
					data-gopage="${cPath }/notice/update/${notice.noticeCode}" />
				
				<input type="button" value="삭제" class="controlBtn btn btn-danger " id="deleteBtn" />
			</c:if>
	</div>
</h2>
<table class="table table-bordered">
<!-- 	<tbody id="listBody"> -->

		<tr id="${notice.noticeCode}">
			<th colspan="1">글번호</th>
			<td colspan="3">${notice.noticeCode }</td>
			
		</tr>
		<tr>
			<th  colspan="1">제목</th>
			<td  colspan="3">${notice.noticeSj }</td>
		</tr>
		<tr>
			<th colspan="1">작성자</th>
			<td colspan="1">${notice.memId }</td>
		</tr>
		<tr>
			<th colspan="1">조회수</th>
			<td colspan="1">${notice.noticeRdcnt}</td>
		</tr>
		<tr>
			<th colspan="1">작성일</th>
			<td colspan="3">${notice.noticeRgsde }</td>
		</tr>


		<tr>
			<td colspan="4" id="textCn"><div id ="inCn">${notice.noticeCn }</div></td>
		</tr>
		<tr>
		<th class="line section minal" colspan="1">첨부파일</th>
			<td colspan="4">
				<div class="scroll">
					<c:forEach items="${notice.noticeFileList }" var="noticeFile">
						<c:if test="${not empty noticeFile.noticeFileCode }">
							<c:url value="/notice/file/down/${noticeFile.noticeFileCode}"
								var="downloadURL">
							</c:url>
							<p class='file'>
								${noticeFile.noticeFileNm }
								<button type="button" data-downCode="${downloadURL }"
									class="btn btn-light fileDown">
									<i class="fa fa-download" aria-hidden="true"></i>
								</button>
							</p>
						</c:if>
					</c:forEach>

				</div>
			</td>
		</tr>
<!-- 	</tbody> -->
</table>

<script type="text/javascript" src="${cPath }/resources/js/custom.js"></script>
<script>

	$("#deleteBtn").on("click", function(){
		var delNotice = $("#delNotice");
		delNotice.submit();
		
	})

//파일 다운로드  
	$("tbody").on("click", ".fileDown", function() {
		let target = $(this)[0];
		var url = $(target).attr("data-downCode");
		location.href = url;
	})

	$(".controlBtn").on('click', function() {
		let gopage = $(this).data("gopage");
		if (gopage) {
			location.href = gopage
		}
	})
	$("tbody").on("click", "tr[id]" ,function(){
			let boNo = this.id;
			location.href = "${cPath}/notice/update/"+boNo;
		}).css("cursor", "pointer");	
</script>