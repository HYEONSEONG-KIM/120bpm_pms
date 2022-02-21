<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <jsp:include page="/includee/preScript.jsp"/>
    </head>
    <body>
        <h4>회원 리스트</h4>
        <div></div>
        <table class="table table-striped">
            <thead class="thead-dark">
                <tr>
                    <th>회원ID</th>
                    <th>회원명</th>
                    <th>이름</th>
                    <th>연락처</th>
                    <th>이메일</th>
                    <th>주소</th>
                    <th>가입일자</th>
                </tr>
            </thead>
            <tbody>
                <c:set var="memberList" value="${memberPagingInfo.dataList }"/>
      
                <c:choose>
                    <c:when test="${empty memberList }">
                        <tr>
                            <td colspan="6">조건에 맞는 회원이 없음.</td>
                        </tr>
                    </c:when>
                    <c:otherwise>
                        <c:forEach items="${meberList }" var="meber">
                            <tr id="${meber.memId}">
                                <td>${meber.memNm}</td>
                                <td>${meber.memHp}</td>
                                <td>${meber.memEmail}</td>
                                <td>${meber.memAddr1}</td>
                                <td>${meber.memJoinDe}</td>
                            </tr>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="6">
                        <div id="pagingArea" class="d-flex justify-content-center">
                            ${memberPagingInfo.pagingHTML }
                            <!-- 					이건 VO가면 있는거지 -->
                        </div>
                    </td>
                </tr>
            </tfoot>
        </table>
        <form id="searchForm" style="border: 5px solid red;">
            <h4>Hidden Form</h4>
            <input type="text" name="searchType" placeholder="search type"/>
            <input type="text" name="searchWord" placeholder="search word"/>
            <input type="text" name="page" placeholder=" page number"/>
                	</form>
                	<div id=" searchUI"
                		class=" form-inline mt-3 d-flex justify-content-center pb-2" style=" border: 5px solid pink;">
            <h4 class="col-12 text-center">Search UI</h4>
            <select name="searchType" class="form-control mr-2">
                <option value >전체</option>
                <option value ="id" >아이디</option>
                <option value ="nm">이름</option>
                <option value ="hp">연락처</option>
                <option value ="email">이메일</option>
                <option value ="addr1">주소</option>
                <option value ="memjoinde">가입일</option>
            </select>
            
            
            <input class="form-control mr-2" type="text" name="searchWord" onchange="$(this).siblings('#searchBtn').click();"/>
<!--             <input class="form-control mr-2" type="text" name="searchWord"> -->
            <button type="button" id="searchBtn" class="btn btn-success" >검색</button>
        </div>
        <script src="${pageContext.request.contextPath }/resources/js/paging.js"></script>
        <!-- 여기 js를 가져다 쓰는거야.. -->
<script type="text/javascript">
            
            $("[name='searchType']").val("${memberPagingInfo.simpleSearch.searchType}");
            $("[name='searchWord']").val("${memberPagingInfo.simpleSearch.searchWord}");
            $("#searchForm").paging();


        </script>
    </body>
</html>