<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="security"%>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript"	src="${cPath }/resources/js/jquery.form.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/paging.js"></script>
<link rel="styleSheet" href="${cPath }/resources/css/commons.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript" src="${cPath }/resources/ckeditor/ckeditor.js"></script>
<style type="text/css">
 
 #searchUI{
  width:540px;
	margin-top: 2.5%;
 }
 
 .input-group {
 width: 100
 }
 #searchOption{
 width: 150px;
 }
 
 #searchText{
 width: 250px;
 }
 
 .right{
 float: right;
 }
 .searchOption{
 width: 100px;
 }
 .input-group-append{
 width: 300px;
 }
 
.rtl .profile-page .profile-header .cover .cover-body .profile-name {
    margin-left: 0;
    margin-right: 17px;
}
.img-xs {
    width: 37px;
    height: 37px;
}
 
.rounded-circle {
    border-radius: 50% !important;
}
img {
    vertical-align: middle;
    border-style: none;
}

.card-header:first-child {
    border-radius: 0 0 0 0;
}
.card-header {
    padding: 0.875rem 1.5rem;
    margin-bottom: 0;
    background-color: rgba(0, 0, 0, 0);
    border-bottom: 1px solid #f2f4f9;
}

.card-footer:last-child {
    border-radius: 0 0 0 0;
}
.card-footer {
    padding: 0.875rem 1.5rem;
    background-color: rgba(0, 0, 0, 0);
    border-top: 1px solid #f2f4f9;
}

.grid-margin {
    margin-bottom: 1rem;
}

.card {
    box-shadow: 0 0 10px 0 rgba(183, 192, 206, 0.2);
    -webkit-box-shadow: 0 0 10px 0 rgba(183, 192, 206, 0.2);
    -moz-box-shadow: 0 0 10px 0 rgba(183, 192, 206, 0.2);
    -ms-box-shadow: 0 0 10px 0 rgba(183, 192, 206, 0.2);
}
.rounded {
    border-radius: 0.25rem!important;
    margin: 2%;
}
.card {
    position: relative;
    display: flex;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    background-color: #fff;
    background-clip: border-box;
    border: 1px solid #f2f4f9;
    border-radius: 0.25rem;
}
 
.infinite{

margin-top: 50px;
}
.infinite{
margin-bottom: 2%;
}
 

a#MOVE_TOP_BTN {
    position: fixed;
    right: 2%;
    bottom: 50px;
    display: none;
    z-index: 999;
}

.empty{

text-align: center;
}
.required{
color: red;

}
 
.newsLabel , .memNames{
font-size: medium;
}
#bosjInput{

width: 100%;
}
#boSjModi{

width: 100%;
}
.ml-2{
margin-right: 15px;
}
.btnArea{
text-align: right;
}

 

 
#newsUpdateModal{
display: none;
  z-index: 999;
}
.modal-body{
width: 900px;

}
.modal-dialog , .modal-content{
width: 1000px;

}

   .modal__background{
  position: fixed;
   z-index: 1; 
  top:0; left: 0; bottom: 0; right: 0;
  background: rgba(230, 230, 230, 0.8);
}    
#gridArea{
	display: grid;
	grid-template-columns : 5fr 1fr;
}
</style>


</head>
<body>
<security:authentication property="principal.adaptee" var="authMember" />
 
<div id = "gridArea">
<h1 onclick="dataSet()" style = "text-align: left; font-weight: bold; margin-left: 2%;"> <i class="fa fa-newspaper-o" aria-hidden="true"></i>&nbsp; &nbsp;뉴스</h1>
<!-- searchUI만 구성 -->

<div class="right" >
	<div  id="searchUI">
			<div class="input-group ">

				<div class="input-group-prepend">

					<select id="searchOption" class="custom-select " name="searchType">
						<option value>전체</option>
						<option value="title">제목</option>
						<option value="memId">담당자</option>
						<option value="cn">내용</option>
					</select> <input type="text" name="searchWord" id="searchText"
						placeholder="검색어 입력" class="form-control" />
					<div class="input-group-append">
						<button type="button" id="searchBtns"
							class="btnTags btn searchBtn">검색🔍</button>
						<button type="button" class="btnTags  resetBtn btn">
							<img class="resetImg" src="${cPath}/resources/imgs/img/reset.png">
						</button>
					</div>
				</div>
			</div>
		</div>
</div>
</div>
<hr>
 <div id="background">
   <!-- 수정 모달 -->
 <div class="modal fade" id="newsUpdateModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog modal-fullscreen-lg-down  modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h2 class="modal-title" id="staticBackdropLabel">
		     <i class="fa fa-pencil-square-o" aria-hidden="true"></i>     
		        	뉴스 수정</h2>
		      		 <a class="btn-close trigger closeModal" href="#">
       					 <i class="fa fa-times" aria-hidden="true"></i>
    				  </a>
		      </div>
		      <div class="modal-body">
		            <div class="card rounded newsContent">
							<div class="card-header">
								<div class="d-flex align-items-center justify-content-between">
									<div class="d-flex align-items-center">
										<div class="ml-2">
											<p class="memNames">
												<img  class='img-xs rounded-circle'
													src="${cPath }/resources/imgs/member/${authMember.proflImgNm }">
												&nbsp; &nbsp;${authMember.memName }
											</p>
											<form:form commandName="news" id="modiForm" method="post">

												<div class="form-inline form-group">
													<label class="newsLabel control-label newsSjLabel">제목
														&nbsp;<span class="required">※ &nbsp;</span>
													</label>
													<div class="col-sm-10">
														<input class="form-control" id="boSjModi" maxlength="150"
															required type="text" name="boSj" value="${news.boSj }"
															placeholder="150자 이내" />
														<form:errors path="boSj" element="label" cssClass="error"
															id="boSj-error" for="boSj" />
													</div>
												</div>

												<label class="newsLabel control-label">내용 &nbsp;<span
													class="required">※ &nbsp;</span>
												</label>
												<textarea required class="form-control boCnVal"
													id="boCnModiArea" name="boCn">${news.boCn }</textarea>
												<form:errors path="boCn" cssClass="error" element="label"
													id="boCn-error" for="boCn" />


												<input type="hidden" name="boNo" placeholder="뉴스번호" />
											</form:form>
											<div class='right'>
												<button type="button" class="btn updateBtn" id="updateNews">저장</button>
												<button type="button" class="btn btn-dark closeModal"
													id="goBackBtn">취소</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>  
		      </div>
		    </div>
		  </div>
		</div>
 </div>
 

 
 
 
 
 <!-- 생성 페이지 -->
 	   <div class="card rounded newsContent">
			   <div class="card-header">
			     <div class="d-flex align-items-center justify-content-between"> 
			   <div class="d-flex align-items-center"> 
			    <div class="ml-2"><p class="memNames">
			    
			     <img class='img-xs rounded-circle' src="${cPath }/resources/imgs/member/${authMember.proflImgNm }">  &nbsp; &nbsp;${authMember.memName }   </p> 
  <form:form commandName="news"  id="newsInsertForm" method="post">
  		
   		<div class="form-inline form-group" >
 
 <label class="newsLabel newsSjLabel control-label"  >제목 &nbsp;<span class="required">※ &nbsp;</span></label>  
    <div class="col-sm-10">
 <input class="form-control" id="bosjInput" maxlength="150"  required  type="text" name="boSj" value="${news.boSj }" placeholder="150자 이내"/>
 	 	 <form:errors path="boSj"  element="label" cssClass="error" id="boSj-error" for="boSj" />
	</div>
</div>

 <label class="newsLabel control-label"  >내용 &nbsp;<span class="required">※ &nbsp;</span> </label>
  		<textarea required class="form-control boCnVal" id="boCnArea" name="boCn" >${news.boCn }</textarea>
		<form:errors path="boCn" cssClass="error"  element="label" id="boCn-error" for="boCn" />
 
 		<input type="hidden" name="menuClCode" value="NE">
 		<input type="hidden" name="memId" value="${authMember.memId }">
 		<input type="hidden" name="prjctNo"  value="${pCode}">
 		<input type="hidden" name="othbcAt"  value="1">
 
 </form:form>
 <div class="btnArea">
 	<button type="button"  class="btn insertBtn" id="insertNews">추가</button>
 <!-- 	-->
 	</div>
 </div>
 </div>
 </div>
 </div>
 </div>
 <!--            피드 부분                   -->
 <div class="infinite">
	 <div id="contents" class="">
	 
	 
	 </div>
	 
 <!--  -->
 
 <a id="MOVE_TOP_BTN" href="#"><i class="fa fa-angle-double-up fa-5x" aria-hidden="true"></i></a>

 </div>	
  
 <!-- saearchForm -->
 
	 <form id="searchForm" action="${cPath }/project/${pCode}/news/list">
	 					<input type="hidden" name="searchWord">
						<input type="hidden" name="searchType">
	 					<input type="hidden" id="nowPage" name="page" value="${pagingVO.currentPage }">
	 </form>
	 <form id="deleteForm" action="${cPath }/project/${pCode}/news/remove">
	 				 <input type="hidden"   name="boNo" placeholder="뉴스번호"/>
	 </form>
	 <form id="likeForm" method="post" action="${cPath }/project/${pCode}/news/modify/like">
	 				 <input type="hidden"   name="boNo" placeholder="뉴스번호"/>
	 				 <input type="hidden"   name="type" placeholder="처리 여부"/>
	 </form>
 	
 	
 <script type="text/javascript">
 

	let contents = $("#contents");
 	let ok = false;
 	let nextPage = false;
 	let current ;
 	var emptyStatus =false;
 	let totalPage ;
 	var nowPage = $("#nowPage").val();
 	var boCnArea =	document.getElementById("boCnArea");
 	var boCnModiArea = document.getElementById("boCnModiArea"); 
    var offset = $("#contents").offset();
 	function loadContents(){  
 	     
 	}
 	
 	function dataSet(){
	 $("#bosjInput").val("코로나로 인해 프로젝트 관리 시스템의 수요 증가");
		var editorContent =  CKEDITOR.instances.boCnArea.setData(
				
				"실제로 각 회사의 프로젝트 관리 시스템을 필요호 하는 회사가 증가했습니다	특히 공유된 프로젝트의 업무 일정과 개인의 일정을 함께 볼 수 있는 기능을 지원 하는 "
				+  "회사의 제품이 더 수요가 있다. 멤버 별 진행도와 그래프 수치에 대한 확인이 될 수 있는 시각화가 필요하다. 각 네트워크 장애시 문제 해결을 위해 별도의 DB 구성에 대한  처리가 가능할 경우 협업의 효율이	"
				+ " 높아질 것으로 보인다. "
				); 
 }
 
 	
 		$("#insertNews").on("click" , function(){
 				var boCnArea =	document.getElementById("boCnArea");
	  			var editorContent =  CKEDITOR.instances.boCnArea.getData(); 
	  			
	  			editorContent = editorContent.replace(/<p\/>/ig, "\n");
	  			/* editorContent = editorContent.replace(/<(\/)?([a-zA-Z]*)(\s[a-zA-Z]*=[^>]*)?(\s)*(\/)?>/ig, "");
 				*/
	  			editorContent = editorContent.replace(/(<([^>]+)>)/gi, "");
	  			editorContent = editorContent.replace(/&nbsp;/gi,"");
	  			$(boCnArea).val(editorContent)
	  			CKEDITOR.instances.boCnArea.setData(editorContent); 
	  			
	  		if(editorContent.trim() =='' ||editorContent.trim().length ==0){
	  		     
	  		    $(boCnArea).focus();
	  		    
	  		    Swal.fire({
	  				 title: "필수 항목 오류",
	  				  text: "내용이 비어있습니다",
	  				  icon: "error",
	  				  button: "OK",
	  				}) 
	  		}else{
	  			
	  			let code = $("#bosjInput").val();
 	  			if(code.trim() =='' ||code.trim().length ==0){
 	  			    Swal.fire({
 	 	  				 title: "필수 항목 오류",
 	 	  				  text: "제목이  비어있습니다",
 	 	  				  icon: "error",
 	 	  				  button: "OK",
 	 	  				})
	  			
	  			}else{
	  				$.ajax({
	  					url : "${cPath}/project/${pCode}/news/create",
	  					method : "post",
	  					dataType : "json",
	  					data : $("#newsInsertForm").serialize(),
	  					success:function(resp){
	  						if(resp.result == "SUCCESS"){
	  							 
	  							Swal.fire({
	  								 title: "뉴스 등록",
	  								  text:  "뉴스 등록 성공",
	  								  icon: "success",
	  								  button: "OK",
	  							}).then(function(){
	  								 $("#bosjInput").val("");
	  								/*  $("#cke_boCnArea").val(""); */
	  								  CKEDITOR.instances.boCnArea.setData(''); 
		  							  $("#nowPage").val("");
		  							  
		  							  contents.empty();
	  								  searchForm.submit();
	  								  var boNo = resp.boNo
	  								  var offset = $("." +boNo).offset(); //해당 위치 반환
	  								  $("html, body").animate({scrollTop: offset.top},400); 
	  								 
	  							})  
	  						  
	  							 
	  						}else if(resp.message){
	  							 Swal.fire({
	  		 	 	  				 title: "필수 항목 오류",
	  		 	 	  				  text: resp.message ,
	  		 	 	  				  icon: "error",
	  		 	 	  				  button: "OK",
	  		 	 	  				})
	  						}
	  						
	  					}
	  					
	  					
	  					
	  				})
	  			}
	  		}
 			
 		})
 	
 		$("#updateNews").on("click" , function(){
 				var boCnArea =	document.getElementById("boCnModiArea");
	  			var editorContent =  CKEDITOR.instances.boCnModiArea.getData(); 
	  			
	  			editorContent = editorContent.replace(/<p\/>/ig, "\n");
	  			editorContent = editorContent.replace(/<(\/)?([a-zA-Z]*)(\s[a-zA-Z]*=[^>]*)?(\s)*(\/)?>/ig, "");

	  			editorContent = editorContent.replace(/(<([^>]+)>)/gi, "");
	  			editorContent = editorContent.replace(/&nbsp;/gi,"");
	  			$(boCnArea).val(editorContent)
	  		/* 	 CKEDITOR.instances.boCnModiArea.setData(editorContent);  */
	  			
	  		if(editorContent.trim() =='' ||editorContent.trim().length ==0){
	  		     
	  		    Swal.fire({
	  				 title: "필수 항목 오류",
	  				  text: "내용이 비어있습니다",
	  				  icon: "error",
	  				  button: "OK",
	  				}) 
	  		}else{
	  			
	  			let code = $("#boSjModi").val();
 	  			if(code.trim() =='' ||code.trim().length ==0){
 	  			    Swal.fire({
 	 	  				 title: "필수 항목 오류",
 	 	  				  text: "제목이  비어있습니다",
 	 	  				  icon: "error",
 	 	  				  button: "OK",
 	 	  				})
	  			
	  			}else{
	  				$.ajax({
	  					url : "${cPath}/project/${pCode}/news/modify",
	  					method : "post",
	  					dataType : "json",
	  					data : $("#modiForm").serialize(),
	  					success:function(resp){
	  						if(resp.result == "SUCCESS"){
	  							 
	  							Swal.fire({
	  								 title: "뉴스 수정",
	  								  text:  "뉴스 수정 성공",
	  								  icon: "success",
	  								  button: "OK",
	  							}).then(function(){
		  							  contents.empty();
	  								  updateBack()
	  								  $("[name='boNo']").val('')
	  								  $("#nowPage").val("");
	  								 searchForm.submit();
	  								  var boNo = resp.boNo
	  								var offset = $("." +boNo).offset(); //해당 위치 반환
	  								$("html, body").animate({scrollTop: offset.top},400); 
	  							}) 
	  						  
	  							 
	  						}else if(resp.message){
	  							 Swal.fire({
	  		 	 	  				 title: "필수 항목 오류",
	  		 	 	  				  text: resp.message ,
	  		 	 	  				  icon: "error",
	  		 	 	  				  button: "OK",
	  		 	 	  				})
	  						}
	  						
	  					}
	  					
	  					
	  				})
	  			}
	  		}
 			
 		})
 
 //==================================================
 



 
 /////////////////////////////////
  
 
  $("#contents").on("click" , '.modify' ,function(e){
	 var newsContents =  $(this).closest('.newsContent')  
	 var boNo = $(newsContents).data('newsno')
	 var cn =	$(newsContents).find('.newsCn').text()
	 var sj =	$(newsContents).find('.boSj').text()
	 
	 $("[name='boNo']").val(boNo)
	 $("#boSjModi").val(sj)
	 CKEDITOR.instances.boCnModiArea.setData(cn); 
	 $("#newsUpdateModal").show();		 	
	 $( '#background' ).addClass( 'modal__background' );
	 $('body').css("overflow", "hidden")
		e.preventDefault();
	 })
	 
	 
	 $("#likeForm").ajaxForm({
		 dataType:'json',
		 success:function(resp){
				if(resp.result == "SUCCESS"){
					 
					Swal.fire({
						 title:  resp.type ,
						  text:   resp.type + " 성공",
						  icon: "success",
						  button: "OK",
					}).then(function(){
						  contents.empty();
						  updateBack()
						  $("[name='boNo']").val('')
						  $("#nowPage").val("");
						 searchForm.submit();
						  var boNo = resp.boNo
						var offset = $("." +boNo).offset(); //해당 위치 반환
						$("html, body").animate({scrollTop: offset.top},400); 
						 
					}) 
				  
					 
				}else if(resp.message){
					 Swal.fire({
	 	  				 title: "서버오류",
	 	  				  text: '서버 오류' ,
	 	  				  icon: "error",
	 	  				  button: "OK",
	 	  				})
				}
				
			}
		 
		 
	 })
			 
		 	 $("#contents").on("click" , '.like' ,function(e){
		 		 var colsValue =[];
		 		 colsValue = getColsInfo();
		 		 
		 		 var newsContents =  $(this).closest('.newsContent')  
		 		 var boNo = $(newsContents).data('newsno')
		 		 
		 		 $("#likeForm [name='boNo']").val(boNo)
		 		 $("#likeForm [name='type']").val('like');
		 		 $("#likeForm").submit();
		 		 
		 		 colsValue.push(boNo)
		 		 saveColsInfo(colsValue);
		 		
			 })
			 
			 
		 	 $("#contents").on("click" , '.dislike' ,function(e){
		 		 var colsValue =[];
		 		 colsValue = getColsInfo();
		 		 
		 		 var newsContents =  $(this).closest('.newsContent')  
		 		 var boNo = $(newsContents).data('newsno')
		 		 
		 		 $("#likeForm [name='boNo']").val(boNo)
		 		 $("#likeForm [name='type']").val('dislike');
		 		 $("#likeForm").submit();
		 		
		 		 let filtered 
				  = colsValue.filter((element) => element !== boNo);
		 		saveColsInfo(filtered);
		 		 
		 		 
			 })
			 
			 
		function saveColsInfo(colsValue){
			 localStorage.setItem("${authMember.memId}likeInfo" , JSON.stringify(colsValue));
		 }
			 
			 

 		 function getColsInfo(){
 			 var colsInfo =  localStorage.getItem("${authMember.memId}likeInfo");
 			 if(colsInfo!=null){
 				 return  JSON.parse(colsInfo);
 			 }else{
 				 return null;
 			 }
 		 }
	 
	 
  $("#contents").on("click" , '.delete' ,function(e){
	 var newsContents =  $(this).closest('.newsContent')  
	 var boNo = $(newsContents).data('newsno')
	  $("[name='boNo']").val(boNo)
		$("#deleteForm").submit();
	 
		e.preventDefault();
	 })
	 
	 		
$("#deleteForm").ajaxForm({
	 dataType : "json",
	 method : "post",
	 success :function(resp){
		 if(resp.result == "SUCCESS"){
				
			 Swal.fire({
					 title: "뉴스 삭제",
					  text:  "뉴스 삭제에 성공했습니다",
					  icon: "success",
					  button: "OK",
				}).then(function(){
					 	  contents.empty(); 
						  $("[name='boNo']").val('')
						   $("#nowPage").val("");
						  searchForm.submit(); 
						 	 
			    });
				
		 }else{
					Swal.fire({
						 title:"뉴스 삭제",
						  text:  "뉴스 삭제에 실패했습니다",
						  icon: "error",
						  button: "OK",
					}).then(function(){
						  $("[name='boNo']").val('')
						 
			    	});
						 
					
		 }
	 }
})  
	 
	 
	 
	 let newPage = false;
 function updateBack(){
 			 $("#boSjModi").val("");
 			 CKEDITOR.instances.boCnModiArea.setData(''); 
 			 $( '#background' ).removeClass( 'modal__background' ); 
 			 $('body').css("overflow", "scroll");
 			 $("#newsUpdateModal").hide();
 			 newPage =true;
 			 
 		}
 //====================================================		
 		
 $(".closeModal").on("click" , function(e){
	 updateBack();
	 e.preventDefault();
}) 

 //====================================================	

 	$("#searchBtns").on("click" , function(){
 		contents.empty();
 		$("#nowPage").val("");
 		$("#searchForm").find('[name="searchType"]').val($("#searchOption").val())
 		$("#searchForm").find('[name="searchWord"]').val($("#searchText").val())
		$(searchForm).submit(); 		
 	})
 	
 	
 	$("#contents").on("click" ,"#addNew",function(){
 		 $("#bosjInput").focus();
 	})
 	
  $(function(){
	  //=========================
	  window.onload = function() {
			setTimeout (function () {
				scrollTo(0,0);

			},100);

		}
	  
	 //=========================================================
	  
	  $("#MOVE_TOP_BTN").click(function() {
          $('html, body').animate({
              scrollTop : 0
          }, 400);
          return false;
      });
  

	 //=========================================================
        $(window).scroll(function(){
            let $window = $(this);
            let scrollTop = $window.scrollTop();
            let windowHeight = $window.height();
            let documentHeight = $(document).height();
            
          
            if ($(this).scrollTop() > 500) {
                $('#MOVE_TOP_BTN').fadeIn();
            } else {
                $('#MOVE_TOP_BTN').fadeOut();
            }
       


            // scrollbar의 thumb가 바닥 전 30px까지 도달 하면 리스트를 가져온다.
            if( scrollTop + windowHeight + 30 > documentHeight ){
            	console.log(nowPage)
		    		if(nowPage<=totalPage  )	{
		    			morePage(event); 
		    		} 
    			event.preventDefault();
            	 
            }
        })
	 //=========================================================
       
    })
 	
 	
 	let searchForm =  $("#searchForm").paging().ajaxForm({
 	 		dataType :"json",
 	 		success:function(pagingVO){
 		 		let newsList = pagingVO.dataList;
 		 		let divTag = [] ;
 		 	 	leftCount=	pagingVO.totalRecord - (pagingVO.screenSize * pagingVO.currentPage)
 		 	 	console.log(leftCount)///-9 나온 경우 21-10 =11 
 		 	 	console.log(pagingVO.totalRecord + " - "+ (pagingVO.screenSize +" * "+ pagingVO.currentPage))///-9 나온 경우 21-10 =11 
 		 	 	//21 -2*10 
 		 	 	totalPage = pagingVO.totalPage;
 		 	 	if(pagingVO.totalPage<pagingVO.currentPage) return false; 
 		 	 	
 		 	 	if(
 		 	 			(newsList && leftCount>=0 && pagingVO.totalRecord>=10) || (newsList && (pagingVO.totalRecord<10 && pagingVO.totalRecord>0 && pagingVO.currentPage==1)  )
 		 	 	){
 		 	 		$(newsList).each(function(idx , issue){
	 					  divTag.push( makeCardTag(issue));  
	 					});
 		 	 		ok=true;
			 	
 		 	 }else{
 		 		 
 		 		 if(!emptyStatus){
 		 			divTag.push( 
 		 					
		 					 '<div class="card rounded"  >' +
							   '<div class="card-header">'+
							   '<div class="d-flex align-items-center justify-content-between">'+
							   '<div class="d-flex align-items-center">'+
							  
							   '<div class="ml-2"><p> </p>'+
							   '<p class="tx-11 text-muted"> </p>'+
							   '</div></div>'+
	 			    '   </div>   '                                                                                                                                                                                                                                                     +
				  ' </div>  '                                                                                                                                                                                                                                                          +
						   		'<div class="card-body empty">'+                                                                                                                                                                                                                             
						   		'<p class="mb-3 tx-14">표시할 뉴스가 존재하지 않습니다 '+
						   		'</p>'+
						   		'</div>'+
						   '<a href="javascript:;" class="d-flex align-items-center text-muted mr-4">' 
							+'<p id="addNew">새 뉴스 작성<i class="fa fa-plus" aria-hidden="true"></i></p>'	
		 			) 
		 			emptyStatus = true;
 		 		 }
		 			
 		 			ok=false;	 
 		 		}	
 		 		 $(contents).append(divTag);
 		 		 newPage = false;
 		 		 
 	 		}
 	 		
 	 		
 	 	}).submit() 
 	
 
 	function morePage(event){
 	/* 	var nowPage = $("#nowPage").val(); */
 			 current= parseInt(nowPage) +1 ;
  
 			$("#nowPage").val(current)
 			searchForm.submit();
 			if(nowPage<=totalPage)	{
 				nowPage = parseInt(nowPage) +1
    		} 
 			event.preventDefault();
 		 
 		
 	} 
	
   function makeCardTag(news){
	   let tdTags = [];
	   let likeList =[] ;
	   likeList =   getColsInfo();
	   var heartStatus = '';
	   
		   $(likeList).each(function(i, cols){
			   console.log("여가 탄다")
			   console.log(cols)
				  if(cols==news.boNo){
					  heartStatus =1; //이미 있는 경우
				  }
			 })	
			 
	    	if(heartStatus==1){
	    		str ='<span class="dislike"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16"> <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/></svg><span >dislike</span> </span>' 
	    	}else{
	    		str = '<span class="like"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-heart icon-md"> <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path><span >like</span> </span>' 	    		
	    	}
		 
	    if(news.memId == "${authMember.memId}"){  
	    	
			tdTags.push(
		   '<div class="card rounded newsContent ' +news.boNo+ '" data-newsno="'+news.boNo+ '">' +
			   '<div class="card-header">'+
			   '<div class="d-flex align-items-center justify-content-between">'+
			   '<div class="d-flex align-items-center">'+
			  '<img class="img-xs rounded-circle" src="${cPath }/resources/imgs/member/'+news.proflImgNm+'">'	+
			   '<div class="ml-2"><p class="memNames">'+ news.memName + '</p>'+
			   '<span class="tx-11 text-muted">' + news.boRgsde +'</span>'+
			   '</div>'+
			   '<h5> 제목 : </h5> <h5 class="boSj">'+ news.boSj + '</h5>'+
			   '</div>'+
			   
	'		   <div class="dropdown dropleft">'+
    '           <button class="btn p-0 " type="button" id="dropdownMenuButton2" data-toggle="dropdown"  aria-haspopup="true" aria-expanded="false">'+
    '               <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-more-horizontal icon-lg pb-3px">      '+
    '                   <circle cx="12" cy="12" r="1"></circle>                                                                                                                                                                                                       '+
    '                   <circle cx="19" cy="12" r="1"></circle>                                                                                                                                                                                                       '+
    '                   <circle cx="5" cy="12" r="1"></circle>                                                                                                                                                                                                        '+
    '               </svg>                                                                                                                                                                                                                                            '+
    '           </button>                                                                                                                                                                                                                                             '+
    '           <div class="dropdown-menu" aria-labelledby="dropdownMenuButton2">                                                                                                                                                                                     '+
    '               <a class="dropdown-item d-flex align-items-center modify" href="#">                                                                                                                                                                                      '+
    '               <span class=""><i class="fa fa-pencil-square-o" aria-hidden="true"></i>수정</span></a>                                                                                                                                                                                                     '+
    '               <a class="dropdown-item d-flex align-items-center delete" href="#">                                                                                                                                                                                      '+
    '  					<span class=""><i class="fa fa-trash-o" aria-hidden="true"></i>삭제</span></a>                                                                                                                                                                                                   '+
    '           </div>                                                                                                                                                                                                                                                '+
    '       </div>                                                                                                                                                                                                                                                    '+
    '   </div>   '                                                                                                                                                                                                                                                     +
  ' </div>  '                                                                                                                                                                                                                                                          +
		   		'<div class="card-body">'+
		   		'<p class="mb-3 tx-14 newsCn">'+
				news.boCn + 
		   		'</p>'+
		   		'</div>'+
		   '<a href="javascript:;" class="d-flex align-items-center text-muted mr-4" >'+
		   str + 
    	"&nbsp;&nbsp;"+'<span class="comment" > <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-message-square icon-md"> <path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"></path> </svg><span >Comment</span> </span></a> '
		)
	  }else{
			tdTags.push(
					   '<div class="card rounded" data-newsno="' +news.boNo+ '">' +
						   '<div class="card-header">'+
						   '<div class="d-flex align-items-center justify-content-between">'+
						   '<div class="d-flex align-items-center">'+
						  '<img class="img-xs rounded-circle"  src="${cPath }/resources/imgs/member/'+news.proflImgNm+'">'	+
						   '<div class="ml-2"><p>'+ news.memName + '</p>'+
						   '<p class="tx-11 text-muted">' + news.boRgsde +'</p>'+
						   '</div>'+
						   '<h5> 제목 : '+ news.boSj + '</h5>'+
						   '</div>'+
 			   				 '   </div>   '                                                                                                                                                                                                                                                     +
			  					' </div>  '                                                                                                                                                                                                                                                          +
					   		'<div class="card-body">'+    
					   		'<p class="mb-3 tx-14">'+
							news.boCn + 
					   		'</p>'+
					   		'</div>'+
					   	 '<a href="javascript:;" class="d-flex align-items-center text-muted mr-4">'+
						   str + 
				    	"&nbsp;&nbsp;"+'<span class="comment"> <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-message-square icon-md"> <path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"></path> </svg><span >Comment</span> </a> </span>'
					) 
	   } 
		
		return tdTags
		
   }
   
   var areas = Array('boCnModiArea', 'boCnArea');
   $.each(areas, function (i, area) {
	     CKEDITOR.replace(area, {
	    		height :'180px',	
		  	    language : 'en',
		  	 	 filebrowserImageUploadUrl:"${cPath}/project/${pCode}/issue/create/uploadImage?type=Images",  
		  		 toolbar: [ 
		  	       { 
		  	         name: 'basicstyles',
		  	         items: ['Bold', 'Italic', 'Underline', 'Strike', 'RemoveFormat', 'Subscript', 'Superscript']
		  	       },
		  	       {
		  	         name: 'links',
		  	         items: ['Link', 'Unlink']
		  	       },
		  	       {
		  	         name: 'paragraph',
		  	         items: ['NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote']
		  	       },
		  	       {
		  	         name: 'insert',
		  	         items: ['Image', 'Table']
		  	       },
		  	       {
		  	         name: 'editing',
		  	         items: ['Scayt']
		  	       },
		  	       '/',
		  	       {
		  	         name: 'styles',
		  	         items: ['Format', 'Font', 'FontSize']
		  	       },
		  	       {
		  	         name: 'colors',
		  	         items: ['TextColor', 'BGColor', 'CopyFormatting']
		  	       },
		  	       {
		  	         name: 'align',
		  	         items: ['JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock']
		  	       },
		  	       {
		  	         name: 'document',
		  	         items: ['PageBreak', 'Source']
		  	       }
		  	     ] 
		  				
		  		,bodyClass: 'document-editor'
		  	     
	     });
	    });
   
 
 	
 	</script>
 	
</body>
</html>