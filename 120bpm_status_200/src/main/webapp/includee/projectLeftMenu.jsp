<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<style>
#logo{
	width : 40px;
	 border-radius: 70%;
    overflow: hidden;
} 

.profile {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
}
.goProject{
	cursor: pointer; 
} 
.nav_title{ 
	height: 120px;
}
.nav_title > h5, .nav_title > h3{
	padding-left: 5%;
    width: 95%; 
}
.nav_title > h3{
	font-size: x-large; 
} 
.navbar{  
	margin-bottom: 0; 
}
.authorNm{
	color : #42B4E6;
	font-weight: bold;
}   
#sidebar-menu{ 
	height : 800px;
	overflow: auto;
}
#newChatState{
	font-size: 12px;
	font-weight : bold;
	background-color: #69C780;
	border-radius: 100%;
	text-shadow: 0px 0px 0px;
	position: absolute;
}
.menu_section{
	margin-bottom: 0;
}
.menu_section>ul{
	margin-top: 0;
}
.nav.side-menu>li>a{
	margin-bottom: 0;
}
.nav.child_menu>li>a{ 
	padding: 11px 15px 10px 18px;
}
.left_col {
	background: #f2fbff;
} 
</style> 

<!-- 사용자 정보 -->
	
	<security:authentication property="principal.adaptee" var="authMember"/>
	<security:authentication property="authorities" var="authMemRoles"/>  
	
	<c:if test="${(not empty authMemRoles) and (authMember.mngrAt ne '1')}">
		<c:forEach items="${authMemRoles}" var="roles"> 
			<c:if test="${roles.pjtMem.prjctNo eq pCode}">
				<c:set value="${fn:split(roles.pjtMem.author,'_')}" var="roleSplit"/>
				<c:forEach var="roleIdx" items="${roleSplit}" varStatus="idx">
					<c:if test="${idx.count == 2}">
						<c:set var="roleNm" value="${roleIdx}"></c:set>
					</c:if>
				</c:forEach>
			</c:if>
		</c:forEach>
	</c:if>
	<c:if test="${authMember.mngrAt eq '1' }">
		<c:set var="roleNm" value="admin"></c:set>
	</c:if>
<div class="col-md-3 left_col">
	<div class="left_col scroll-view">
		<div class="navbar nav_title" style="border: 0;">
			<h3>${leftMenuPrt.prjctNm }</h3>     
			<h5>${authMember.memLnm}${authMember.memFnm} (<span class="authorNm"> ${roleNm}</span> )</h5> 
		</div>
		<security:authorize access="isFullyAuthenticated()">
 		
		<div class="clearfix"></div>

					<br>
							<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
								<div class="menu_section active">
									<ul class="nav side-menu" style="">
										 
										<li data-menu="outline"><a href="${cPath}/project/${pCode}/main"><i class="fa fa-qrcode"></i> 개요 </a>
										</li> 
										<li><a ><i class="fa fa-bar-chart-o"></i> 작업내역<span
											class="fa fa-chevron-down"></span></a>  
										<ul class="nav child_menu">  
											<li data-menu="gantt"><a  href="${cPath}/project/${pCode}/activity/gantt ">간트차트</a></li>  
											<li data-menu="timeline"><a  href="${cPath }/project/${pCode}/activity/timeline">타임라인</a></li>
											<li data-menu="graph"><a  href="${cPath }/project/${pCode}/activity/graph">일감그래프</a></li>
										</ul></li> 
										<li ><a ><i class="fa fa-user"></i> 일감 <span
											class="fa fa-chevron-down"></span></a>
										<ul class="nav child_menu">  
											<li data-menu="pmWorkmanage"><a  href="${cPath }/project/${pCode}/work/manage/workList">PM일감관리</a></li> 
											<li data-menu="userWork"><a  href="${cPath }/project/${pCode}/workList">사용자 일감</a></li>
										</ul></li> 
										<li data-menu="calendar"><a href="${cPath}/project/${pCode}/calendar"><i class="fa fa-calendar"></i> 달력 </a>
										</li>     
										<li data-menu="chat"><a href="${cPath}/project/${pCode}/chatting"><i class="fa fa-wechat"></i>
										 채팅 <span id = "newChatState"></span></a>
										</li> 
										<li data-menu="news"><a href="${cPath}/project/${pCode}/news/list"><i class="fa fa-newspaper-o"></i> 뉴스 </a>
										</li> 
										<li data-menu="issue"><a href="${cPath}/project/${pCode}/issue/issueList"><i class="fa fa-chain-broken"></i> 이슈 </a>
<!-- 										</li>   -->
<%-- 										<li data-menu="wiki"><a href="${cPath}/project/"><i class="fa fa-question"></i> 위키 </a> --%>
<!-- 										</li>  -->
										<li data-menu="file"><a href="${cPath}/project/${pCode}/file/fileList"><i class="fa fa-file-pdf-o"></i> 파일 </a>
										</li>  
										
										<li>
											 <a><i class="fa fa-pencil-square-o"></i> WebIDE <span class="fa fa-chevron-down"></span></a>
											 <ul class="nav child_menu">  
												<li data-menu="editor"><a  href="${cPath}/project/${pCode}/webIDE/editor/List">코드 에디터</a></li> 
											</ul>
										</li>
										
										<li data-menu="freeboard"><a href="${cPath}/project/${pCode }/freeboard/list"><i class="fa fa-desktop"></i> 자유게시판 </a>
										</li>  
										 
										 <c:if test="${(roleNm eq 'PM') or (authMember.mngrAt eq '1')}">
										 <li>
											 <a><i class="fa fa-user"></i> 설정 <span class="fa fa-chevron-down"></span></a>
											 <ul class="nav child_menu">  
												<li data-menu="modify"><a  href="${cPath}/project/${pCode}/modify">기본설정</a></li> 
												<li data-menu="mem"><a  href="${cPath }/project/${pCode}/modify/mem">구성원 관리</a></li>
												<li data-menu="category"><a  href="${cPath }/project/${pCode}/modify/category">일감 카테고리 관리</a></li>
											</ul>
										</li>
										</c:if> 
									</ul> 
								</div>
							</div>
							<!-- /sidebar menu -->
		</security:authorize>
		
		<security:authorize access="!isFullyAuthenticated()">
			<h4>로그인 후 이용 가능</h4>
		</security:authorize>

	





		<!-- /sidebar menu -->
	</div>
</div>

    
    
    
    
    
<script>
	


 	$(function(){  
 		$("#setting").addClass("active");
 		$(".datamenu").css("display", "block");
 		let lis = $("li");
 		$.each(lis, function(i,li){ 
 			if($(li).data("menu")=="${menu}"){
 				$(li).addClass("current-page");
 			}	 
 		})   
 		
 		function state(){
	 		let memPrtStateStorageKey = '${authMember.memId}:state';
	 		localStorage.setItem(memPrtStateStorageKey, 0);
 		}
 		state(); 	
 	})
 </script>