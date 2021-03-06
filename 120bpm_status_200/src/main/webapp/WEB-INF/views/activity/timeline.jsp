<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
.x_content b:hover{
	cursor: pointer;
	background: #d4fbff; 
}  
span{
	cursor: pointer; 
	color : #42B4E6;
	font-weight: bold;
} 
h2{
	margin-bottom: 15px;
} 
.noList{
	background: #ffeca8;
}
</style>  
<h1><small>π</small>μμλ΄μ­</h1> 
<button type="button" class="preBtn searchBtn">&lt;&lt;</button>
<c:choose>
	<c:when test="${not empty tlineList }">
	<h2 class="d-inline-block"><em class="termDate">${tlineList[0].startde }</em> λΆν° <em>${tlineList[0].endde }</em> κΉμ§</h2>  
	</c:when> 
	<c:otherwise>
	<h2 class="d-inline-block"><em class="termDate">${timeline.startde }</em> λΆν° <em>${timeline.endde}</em> κΉμ§</h2>  	
	</c:otherwise>
</c:choose>

<c:if test="${not empty hasNext }">
	<button type="button" class="nextBtn searchBtn">>></button>
</c:if> 

<c:if test="${not empty tlineList }">
<c:forEach items="${tlineList }" var="tl" varStatus="stts">
	<c:set var="curDe" value="${tl.tlineRgsde }"/>
	<c:choose>      
		<c:when test="${stts.index eq 0 }">		
		<c:set var="index" value="${stts.index }"/>
		<div class="x_panel" id="${stts.index }">  
			<div class="x_title">  
				<h5>   
					π<b>${curDe}</b>
				</h5> 
				<div class="clearfix"></div>
			</div>   
			<div  class="x_content" style="display: block;">
				<h2><small>π${tl.tlineRgsdeTime }</small>  &ensp;[${tl.menuClNm}] <a href="${cPath}/project/${pCode}/user/${tl.memId}"><span>${tl.memName}</span></a> <small>λμ΄</small> <b class='goDetail'>${tl.subject }</b> <small>μ</small> <em>${tl.codeNm }</em> <small>νμμ΅λλ€.</small> </h2>
			</div> 
		</div> 
		</c:when>          
		<c:when test="${curDe ne lastDe }">	  
		<c:set var="index" value="${stts.index }"/>
		<div class="x_panel" id="${stts.index }">  
			<div class="x_title">    
				<h5>  
					π<b>${curDe}</b>
				</h5> 
				<div class="clearfix"></div>
			</div>  
			<div  class="x_content" style="display: block;">
				<h2><small>π${tl.tlineRgsdeTime }</small>  &ensp;[${tl.menuClNm}] <a href="${cPath}/project/${pCode}/user/${tl.memId}"><span>${tl.memName}</span></a> <small>λμ΄</small> <b class='goDetail'>${tl.subject }</b> <small>μ</small> <em>${tl.codeNm }</em> <small>νμμ΅λλ€.</small> </h2>
			</div>  
		</div> 
		</c:when> 
		<c:otherwise>   
			<script> 
		 	$("#${index } .x_content").append($("<h2>").html("<small>π${tl.tlineRgsdeTime }</small>  &ensp;[${tl.menuClNm}] <a href='${cPath}/project/${pCode}/user/${tl.memId}'><span>${tl.memName}</span></a> <small>λμ΄</small> <b class='goDetail'>${tl.subject }</b> <small>μ</small> <em>${tl.codeNm }</em> <small>νμμ΅λλ€.</small> "));
			</script>
		</c:otherwise> 
	</c:choose>	  
	<c:set var="lastDe" value="${tl.tlineRgsde }"/>
	<script>
		<c:choose>
			<c:when test="${not empty tl.workCode }">
				$("h2").last().attr({"data-url" : "workDetail/","id": "${tl.workCode}"});
			</c:when>
			<c:when test="${not empty tl.issueNo }">
				$("h2").last().attr({"data-url" : "issue/Detail/", "id": "${tl.issueNo}"});
			</c:when>
			<c:otherwise>   
				<c:choose>
					<c:when test="${tl.menuClCode eq 'NE'}">
					$("h2").last().attr("data-url" , "news/list");
					</c:when> 
					<c:when test="${tl.menuClCode eq 'WK'}">
					$("h2").last().attr({"data-url" : "wiki/detail/","id": "${tl.boNo}"});
					</c:when>
					<c:otherwise>   
					$("h2").last().attr({"data-url" : "freeboard/detail/","id": "${tl.boNo}"});
					</c:otherwise>   
				</c:choose>
			</c:otherwise> 
		</c:choose>
	</script>
</c:forEach>
</c:if> 
<c:if test="${empty tlineList }">
	<div class="x_panel noList" >
		<h2>νμν  μμλ΄μ­μ΄ μμ΅λλ€.</h2>
	</div>  
</c:if>

<button type="button" class="preBtn searchBtn">&lt;&lt;</button>
<c:if test="${not empty hasNext }">
	<button type="button" class="nextBtn searchBtn">>></button>
</c:if> 

<script>
$(function(){  

	//κ²μκΈ μμΈνμ΄μ§λ‘ μ΄λ 
	$("body").on("click", ".goDetail", function(){
		let url = $(this).parent().data("url");  
		let pk = $(this).parent().attr("id");
		if(pk!=null){
			location.href = "${cPath}/project/${pCode}/"+ url + pk;
		}else{
			location.href = "${cPath}/project/${pCode}/"+ url;
		}
	});  
	
	$("body").on("click", ".preBtn", function(){
		var termDate = $(".termDate").html();
		termDate = new Date(termDate);
		termDate.setDate(termDate.getDate() - 1);
		termDate = termDate.toLocaleDateString(); 
		termDate = termDate.substring(0, termDate.lastIndexOf(".")).replaceAll(" ", ""); 
		location.href = "?from="+ termDate;
	});

	$("body").on("click", ".nextBtn", function(){
		history.back();
	});
});
</script>   