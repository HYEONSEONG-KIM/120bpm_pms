<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<style>
.x_panel, .btnD{
	width: 95%;
}
.x_panel{
	display: grid;
	grid-template-columns: 1fr 1fr;
	grid-template-rows : 790px;
	column-gap: 2%;
}
.x_panel .x_title{
	margin-bottom: 0;
}
.x_panel ul{
	padding-left: 10px;
	list-style: none;
	float: left; 
	font-size: 1.2em;
	font-weight: bold;
}
.x_panel li:first-child{
	color : #42B4E6;
}
.x_panel hr{
/* 	max-width : 70px; */
	margin-left: 0;
	margin-top: 5px;
	margin-bottom: 10px;
	border : 2px solid #42B4E6;
	border-radius: 20px; 
}
.x_panel .profile_picture{
	width: 200px;
	margin-top: 0;
	height : 200px;
	display: block;
    overflow: hidden;
}
.x_panel .x_content{
	word-break:break-all; 
}
.x_panel span{
	cursor: pointer; 
	color : #42B4E6;
	font-weight: bold;
}
.x_panel h5,.x_panel h6{
	font-size: 1.2em;
	line-height: normal;
} 
.x_panel h6{ 
	margin-bottom: 0; 
}
.noList{   
	color: #a3a3a3;
} 
.x_panel .tltt{  
	margin-bottom : 0;
	padding-left: 0;
}
.tline{
	height: 700px;
	overflow: auto;
}
.scrollText{
	height: 110px;
	overflow: auto;
}
b{
	cursor : pointer;
}
</style>
<security:authentication property="principal.adaptee" var="authMember"/>
<div class="btnD">
	<button type="button" class="preBtn btn gobackBtn float-right">이전으로</button>
</div>
<c:if test="${not empty infoMap }">
	<c:set value="${infoMap['info'] }" var="info"/>
	<c:set value="${infoMap['workCnt'] }" var="wcList"/>
	<c:set value="${infoMap['prjcts'] }" var="prjcts"/>
	<c:set value="${infoMap['tline'] }" var="tline"/>

<div class="x_panel">
<div>
	<div class="x_content">
		<div class="float-left profile_picture ml-3">
			<img src="${cPath }/resources/imgs/member/${info.proflImgNm}" alt="프로필" class="img-circle profile_img">
		</div>
	</div>
	<div class="x_content mt-3">
		<div class="Info">
			<ul>
				<li>이름 <hr></li>
				<li>${info.memName }</li>
			</ul>
			<ul>
				<li>이메일 <hr></li>
				<li>${info.memEmail }</li>
			</ul>
			<ul>
				<li>전화번호 <hr></li>
				<li>${info.memHp }</li>
			</ul>
		</div>
	</div>
	<div class="x_content mt-1">
		<div class=" intro"> 
			<ul>
				<li>자기소개 <hr></li> 
				<li class="scrollText">${info.memIntro }</li>
			</ul>
		</div>
	</div>
	<div class="x_content mt-1">
		<div class=" work">
			<ul>
				<li>일감<hr></li>
				<li>◾ 신규 : ${wcList[0]['dayworkcnt'] }</li>
				<li>◾ 진행 : ${wcList[1]['dayworkcnt'] }</li>
				<li>◾ 완료 : ${wcList[2]['dayworkcnt'] }</li>
			</ul>
		</div>
	</div>
	<div class="x_content mt-1">
		<div class=" prjct">
			<ul>
				<li>프로젝트<hr></li>
				<li class="scrollText">
				<c:forEach items="${prjcts }" var="prjct">
				◾ <a>${prjct.prjctNm}</a><br>
				</c:forEach>
				</li>
			</ul>
		</div>
	</div>
</div>
<div>
	<div class="x_content mt-3 ">
		<div class="panel">
			<ul class="tltt">
				<li>작업내역 (10일 이내)<hr></li>
			</ul>
		</div> 
	</div> 
	<div class="x_content tline">
		<c:if test="${not empty tline }">
			<c:forEach items="${tline }" var="tl" varStatus="stts">
				<c:set var="curDe" value="${tl.tlineRgsde }"/>
				<c:choose>      
					<c:when test="${stts.index eq 0 }">		
					<c:set var="index" value="${stts.index }"/>
					<div class="panel" id="${stts.index }">  
						<div class="x_title ">  
							<h6>    
								<b>📅 ${curDe}</b>
							</h6> 
							<div class="clearfix"></div>
						</div>   
						<div  class="x_content" style="display: block;">
							<h5><small>${tl.tlineRgsdeTime }  &ensp;[${tl.menuClNm}]</small> <b class='goDetail'>${tl.subject }</b> <em>${tl.codeNm }</em> </h5>
						</div> 
					</div> 
					</c:when>           
					<c:when test="${curDe ne lastDe }">	  
					<c:set var="index" value="${stts.index }"/>
					<div class="panel" id="${stts.index }">  
						<div class="x_title mt-3">    
							<h6>     
								<b>📅 ${curDe}</b>
							</h6> 
							<div class="clearfix"></div>
						</div>  
						<div  class="x_content" style="display: block;">
							<h5><small>${tl.tlineRgsdeTime }  &ensp;[${tl.menuClNm}]</small>   <b class='goDetail'>${tl.subject }</b> <em>${tl.codeNm }</em> </h5>
						</div>   
					</div> 
					</c:when> 
					<c:otherwise>   
						<script> 
					 	$("#${index } .x_content").append($("<h5>").html("<small>${tl.tlineRgsdeTime }  &ensp;[${tl.menuClNm}]</small> <b class='goDetail'>${tl.subject }</b> <em>${tl.codeNm }</em> "));
						</script>
					</c:otherwise> 
				</c:choose>	  
				<c:set var="lastDe" value="${tl.tlineRgsde }"/>
				<script>
					<c:choose>
						<c:when test="${not empty tl.workCode }">
							$("h5").last().attr({"data-url" : "workDetail/","id": "${tl.workCode}"});
						</c:when>
						<c:when test="${not empty tl.issueNo }">
							$("h5").last().attr({"data-url" : "issue/Detail/", "id": "${tl.issueNo}"});
						</c:when>
						<c:otherwise>   
							<c:choose>
								<c:when test="${tl.menuClCode eq 'NE' }">
								$("h5").last().attr("data-url" , "news/list");
								</c:when>
								<c:when test="${tl.menuClCode eq 'WK' }">
								$("h5").last().attr({"data-url" : "wiki/detail/","id": "${tl.boNo}"});
								</c:when>
								<c:otherwise>   
								$("h5").last().attr({"data-url" : "freeboard/detail/","id": "${tl.boNo}"});
								</c:otherwise>   
							</c:choose>
						</c:otherwise> 
					</c:choose>
				</script>
		</c:forEach>
		</c:if>
		<c:if test="${empty tline }">
			<div class="panel noList" > 
			<h2>표시할 작업내역이 없습니다.</h2>
			</div>  
		</c:if>
	</div>
</div>
</div>
</c:if>
<script>
$(function(){  
	//게시글 상세페이지로 이동
	$("body").on("click", ".goDetail", function(){
		let pk = $(this).parent().attr("id");
		let url = $(this).parent().data("url");  
		location.href = "${cPath}/project/${pCode}/"+ url + pk;
	});  
	
	$("body").on("click", ".preBtn", function(){
		history.back();
	});
});
</script>   