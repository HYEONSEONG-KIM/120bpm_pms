<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="security"%> 
<script src="${pageContext.request.contextPath }/resources/js/paging.js"></script>
<script type="text/javascript" src="${cPath}/resources/js/jquery-validation-1.19.3/jquery.validate.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
/*    padding-right: 4%; */
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
.input-group{
	padding : 20px; 0px; 0px; 30px;
	margin : 10px; 0px; 0px; 0px;
}

td.replybox{
	padding-left : 35px;
	padding-top : 5px;
	padding-bottom : 0px;
}

.form-control{
	width : 50%;
}
</style>

<c:if test="${not empty message }">
	<script type="text/javascript">
	Swal.fire({
		  icon: 'error',
		  title: '전송 실패',
		  text: '전송 실패! 다시 시도 해주세요'
	});
	</script>
</c:if>
      <div class="listbtn">
         <input type="button" class="controlBtn btn btn-secondary" value="글 목록" data-gopage="${cPath }/project/${pCode}/freeboard/list" /> 
            <c:if test="${freeBoard.boDeleteAt eq '0'}">
            <c:choose>
               <c:when test="${authMember.memId eq freeBoard.memId}">
                     <button id="freeBoardUpdate" class="btn updateBtn">수정</button>
                     <button id="del" class="btn deleteBtn">삭제</button>
               </c:when>
               <c:otherwise>
               </c:otherwise>
             </c:choose>
            </c:if>
      </div>
<form id="delFreeBoard" action="${cPath}/project/${pCode}/freeboard/remove/${freeBoard.boNo}" method="post">
   <input type="hidden" name="boNo" value="${freeBoard.boNo }" required/>
   
</form>      
<h2 class="title">&nbsp;&nbsp;자유게시판</h2>
<table class="table table-bordered">
<!--    <tbody id="listBody"> -->

      <tr id="${freeBoard.boNo}">
         <th colspan="1">글번호</th>
         <td colspan="3">${freeBoard.boNo }</td>
         
      </tr>
      <tr>
         <th  colspan="1">제목</th>
         <td  colspan="3">${freeBoard.boSj }</td>
      </tr>
      <tr>
         <th colspan="1">작성자</th>
         <td colspan="3">${freeBoard.memId }</td>
      </tr>
      <tr>
         <th colspan="1">조회수</th>
         <td colspan="3">${freeBoard.boRdcnt}</td>
      </tr>
      <tr>
         <th colspan="1">작성일</th>
         <td colspan="1">${freeBoard.boRgsde }</td>
         <th colspan="1">수정일</th>
         <td colspan="1">${freeBoard.boUpdtDe }</td>
      </tr>


      <tr>
         <td colspan="4" id="textCn"><div id ="inCn">${freeBoard.boCn }</div></td>
      </tr>
   
</table>

<!-- 덧글 처리 UI 추가 -->
<h5>댓글작성</h5>	
<form method="post" class="form-inline" id="replyInsertForm"
	action="${cPath}/project/${pCode}/freeBoard/${freeBoard.boNo}/reply">
	<input type="hidden" name="prjctNo"  value="${pCode}">
	<input type="hidden" name="memId" value="${authMember.memId}">
	<input type="hidden" name="boNo" value="${freeBoard.boNo }"/>

	<table class=" table table-striped col-md-10">
		<tr >
			<td colspan="4" style = "width : 50%" class="replybox" >
				<input type="text" class="form-control mb-2" name="repWriter" placeholder="작성자" maxlength="15"/>
			</td>
			<td colspan="6" class="replybox">
				<input type="password" class="form-control mb-2" name="repPass" placeholder="비밀번호"/>
			</td>
		</tr>
		<tr>
			<td colspan="7">
				<div class="input-group"> 
				<textarea class="form-control mb-3 mr-3" rows="2" placeholder=" 200자 이내 내용입력"maxlength="200" name="repCn"></textarea>
				</div>
			</td>
			<td colspan="3">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="submit" value="입력" class="btn btn-primary" />
			</td>
		</tr>
	</table>
</form>
<table id="replyTable" class="table table-hover">
	<thead class="table">
		<tr>	
			<th class="text-center">내용</th>
			<th class="text-center">작성자</th>
			<th class="text-center">작성일</th>
			<th class="text-center">&nbsp;&nbsp;</th>
		</tr>
	</thead>
	<tbody id="listBody" class="overflow-auto">
	
	</tbody>
</table>
<div id="pagingArea"></div>
<form id="searchForm" action="${cPath }/project/${pCode}/freeBoard/${freeBoard.boNo}/reply" method="get">
	<input type="hidden" name="prjctNo"  value="${pCode}">    
	<input type="hidden" name="memId" value="${authMember.memId}">
	<input type="hidden" name="repNo" />	
	<input type="hidden" name="boNo" value="${freeBoard.boNo }" />
	<input type="hidden" name="page"  />
</form>
<div class="modal fade" id="replyModal" tabindex="-1" aria-labelledby="replyModalLabel" aria-hidden="true">
 <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="replyModalLabel">댓글 수정</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        	<span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="${pageContext.request.contextPath }/project/${pCode}/freeBoard/${freeBoard.boNo}/reply" method="POST">
      	<input type="hidden" name="_method" value="put">
      	<input type="hidden" name="repNo" required/>
      	<input type="hidden" name="prjctNo"  value="${pCode}">    
		<input type="hidden" name="memId" value="${authMember.memId}">
      	<input type="hidden" name="boNo"  required value="${freeBoard.boNo }"/>
	      <div class="modal-body">
	      	<table class="table thead-light form-inline">
	      		<tr>
	      			<td>
	      				<input type="text" required name="repWriter" class="form-control" placeholder="작성자" />
	      			</td>
	      			<td>
	      				<input type="password" required name="repPass" class="form-control" placeholder="비밀번호"/>
	      			</td>
	      		</tr>
	      		<tr>
	      			<td colspan="2">
						<div class="input-group">
						<textarea class="form-control mb-2 mr-2" rows="2" placeholder="내용 200자 이내"maxlength="200" name="repCn"></textarea>
						</div>
					</td>
	      		</tr>
	      	</table>
	      </div>
	      <div class="modal-footer">
	        <button type="button" id = "updateReplyBtn" class="btn btn-primary">저장</button>
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	      </div>
      </form>
    </div>
  </div>
</div>
<div class="modal fade" id="replyChildModal" tabindex="-1" aria-labelledby="replyChildModalLabel" aria-hidden="true">
 <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="replyChildModalLabel">대댓글</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        	<span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="${cPath }/project/${pCode}/freeBoard/${freeBoard.boNo}/reply" method="post">
      	<input type="hidden" name="repParent" required/>
      	<input type="hidden" name="prjctNo"  value="${pCode}">    
		<input type="hidden" name="memId" value="${authMember.memId}">
      	<input type="hidden" name="boNo"  required value="${freeBoard.boNo }"/>
      	<input type="hidden" name="boNo"  required value="${freeBoard.prjctNo }"/>
	      <div class="modal-body">
	      	<table class="table form-inline">
	      		<tr>
	      			<td>
	      				<input type="text" required name="repWriter" class="form-control" placeholder="작성자" />
	      			</td>
	      			<td>
	      				<input type="password" required name="repPass" class="form-control" placeholder="비밀번호"/>
	      			</td>
	      		</tr>
	      		<tr>
	      			<td colspan="2">
						<div class="input-group">
						<textarea class="form-control mb-2 mr-2" rows="2" placeholder="내용 200자 이내"maxlength="200" name="repCn"></textarea>
						</div>
					</td>
	      		</tr>
	      	</table>
	      </div>
	      <div class="modal-footer">
	        <button type="submit" class="btn btn-primary">등록</button>
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	      </div>
      </form>
    </div>
  </div>
</div>
<div class="modal fade" id="replyDeleteModal" tabindex="-1" aria-labelledby="replyDeleteModalLabel" aria-hidden="true">
 <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="replyModalLabel">댓글 삭제</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        	<span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="${pageContext.request.contextPath}/project/${pCode}/freeBoard/${freeBoard.boNo}/reply" method="post">
      	<input type="hidden" name="_method" value="delete">
      	<input type="hidden" name="prjctNo"  value="${pCode}">    
		<input type="hidden" name="memId" value="${authMember.memId}">
      	<input type="hidden" name="repNo" required/>
      	<input type="hidden" name="boNo"  required value="${freeBoard.boNo }"/>
	      <div class="modal-body">
   				<input type="password" required name="repPass" class="form-control" placeholder="비밀번호"/>
	      </div>
	      <div class="modal-footer">
	        <button type="submit" class="btn btn-primary">삭제</button>
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	      </div>
      </form>
    </div>
  </div>
</div>
	



<script>


   $(".deleteBtn").on("click", function(){
      var delFreeBoard = $("#delFreeBoard");
      
      delFreeBoard.submit();
      
   })

   $(".controlBtn").on('click', function() {
      let gopage = $(this).data("gopage");
      if (gopage) {
         location.href = gopage
      }
   })

   
   $(".updateBtn").on("click" ,function(){
         location.href = "${cPath }/project/${pCode}/freeboard/update/${freeBoard.boNo}";
      }).css("cursor", "pointer");
   
   
   
   <c:if test="${not empty message }">

		Swal.fire({
			 title: "잘못된 요청입니다!",
			  text:  "${message }",
			  icon: "error",
			  button: "OK"
			}) 
	</c:if>

		
//===============================================
//=============댓글처리====================
	$(document).ajaxError(function(event, xhr, settings, error){
		console.log(error);
	});
	function commonSuccess(resp){
		if(resp.result == "OK"){
			replyInsertForm.get(0).reset();
			replyModal.modal("hide");
			replyChildModal.modal("hide");
			searchForm.submit();
		}else if(resp.message){
			alert(resp.message);
		}
	}
	// 대댓글
	function childReply(event){
		let reply = $(this).parents("tr:first").data("reply");
		let repParent = reply.repNo;
		replyChildForm.get(0).repParent.value = repParent;
		replyChildModal.modal("show");
	}
	// 수정
	function updateReply(event){
		let reply = $(this).parents("tr:first").data("reply");
		for(let prop in reply){
			$(replyUpdateForm).find("[name='"+prop+"']").val(reply[prop]);
		}
		replyModal.modal("show");
	}
	// 삭제
	function deleteReply(event){
		if(!confirm("댓글을 삭제할까요?")) return false;
		let reply = $(this).parents("tr:first").data("reply");
		$(replyDeleteForm).find("[name='repNo']").val(reply.repNo);
		replyDeleteModal.modal("show");
	}
	
	let listTable = $("#replyTable").on("click", ".replyBtn", childReply)
	 								.on("click", ".updateBtn", updateReply)
									.on("click", ".delBtn", deleteReply)
									.find("#listBody");
	
	let replyModal = $("#replyModal").on("hidden.bs.modal", function(){
		$(this).find("form").get(0).reset();
	}).on("shown.bs.modal", function(){
		$(this).find(":text:first").focus().select();
	});
	let replyChildModal = $("#replyChildModal").on("hidden.bs.modal", function(){
		$(this).find("form").get(0).reset();
	}).on("shown.bs.modal", function(){
		$(this).find(":text:first").focus().select();
	});
	let replyDeleteModal = $("#replyDeleteModal").on("hidden.bs.modal", function(){
		$(this).find("form").get(0).reset();
	}).on("shown.bs.modal", function(){
		$(this).find(":password").focus();
	});
	
	let options ={
		dataType : "json",
		success :commonSuccess,
		beforeSubmit:function(){
			replyDeleteModal.modal("hide");
		}
	}
	
	let replyInsertForm = $("#replyInsertForm").ajaxForm(options);
	let replyUpdateForm = replyModal.find("form").ajaxForm(options);
	let replyChildForm = replyChildModal.find("form").ajaxForm(options);
	let replyDeleteForm = replyDeleteModal.find("form").ajaxForm(options);
	
	$('#insertReplyBtn').on('click',function(){
		replyInsertForm.submit();
	})
	
	$('#updateReplyBtn').on('click',function(){
		replyUpdateForm.submit();
	})
//========================================================	
	
//====================덧글 페이징=======================
	let pagingArea = $("#pagingArea");
	let pagingA = pagingArea.on('click', "a" ,function(){
		let page = $(this).data("page");
		searchForm.find("[name='page']").val(page);
		searchForm.submit();
		searchForm.find("[name='page']").val(1);
		return false;
	}).on("click", ".scrollTop", function(event){
		$(this).parents("[class*='overflow']:first").animate({scrollTop:0}, 1000);
	});;
	
	let searchForm = $("#searchForm").ajaxForm({
		dataType : "json",
		success : function(resp) {
			pagingArea.empty();
			let replyList = resp.dataList;
			let trTags = [];
			if(replyList){
				$(replyList).each(function(idx, reply){
					let tr = $("<tr>");
					tr.append(
							$("<td style='width: 45%'>").html(reply.displayCn)
									.addClass("text-left"),
							$("<td style='width: 20%'>").text(reply.repWriter)
									.addClass("text-center"),
							$("<td style='width: 20%'>").text(reply.repRgsde)
									.addClass("text-center"),	
							$("<td style='width: 30%'>").append(
								$("<input>").attr({
									type:"button",
									value:"답글"
								}).addClass("btn btn-primary mr-1 replyBtn"),		
								$("<input>").attr({
									type:"button",
									value:"수정"
								}).addClass("btn btn-info mr-1 updateBtn"),		
								$("<input>").attr({
									type:"button",
									value:"삭제"
								}).addClass("btn btn-danger mr-1 delBtn")		
							).addClass("text-left")
					).data("reply", reply);
					trTags.push(tr);
				});
			}else{
				trTags.push(
					$("<tr>").html(
						$("<td>").text("댓글이 없음.")									
					)
				);
			}

			if(resp.currentPage==1)
				listTable.html(trTags);
			else
				listTable.append(trTags);
			if(replyList.length>0)
				pagingArea.html(resp.pagingHTMLReplyType);
			let scrollElement = listTable.parents("[class*='overflow']:first");
			scrollElement.animate({scrollTop:scrollElement.get(0).scrollHeight}, 1000);
		},
		error : function(errResp) {
			console.log(errResp);
		}
	}).submit(); // 페이지 로드 후 1페이지의 댓글 요청.
</script>
