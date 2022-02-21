<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
console.log("${projectPagingInfo.dataList}")

</script>
        <h4>프로젝트 리스트</h4>
        <div></div>
        <table class="table table-striped">
            <thead class="thead-dark">
                <tr>
                    <th>프로젝트번호</th>
                    <th>프로젝트명</th>
                    <th>시작일자</th>
                    <th>종료일자</th>
                    <th>발주처명</th>
                    <th>사업규모</th>
                </tr>
            </thead>
            <tbody>
                <c:set var="projectList" value="${projectPagingInfo.dataList }"/>
      
                <c:choose>
                    <c:when test="${empty projectList }">
                        <tr>
                            <td colspan="6">조건에 맞는 프로젝트이 없음.</td>
                        </tr>
                        
                    </c:when>
                    <c:otherwise>
                        <c:forEach items="${projectList }" var="project">
                            <tr id="${project.prjctNo}">
                                <td>${project.prjctNm}</td>
                                <td>${project.prjctBeginde}</td>
                                <td>${project.prjctEndde}</td>
                                <td>${project.prjctRgsde}</td>
                                <td>${project.prjctOrnt}</td>
                            </tr>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="6">
                        <div id="pagingArea" class="d-flex justify-content-center">
                            ${projectPaingInfo.pagingHTML }
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
                <option value ="nm" >프로젝트명</option>
                <option value ="ornt">발주처명</option>
            </select>
            
            
            <input class="form-control mr-2" type="text" name="searchWord" onchange="$(this).siblings('#searchBtn').click();"/>
<!--             <input class="form-control mr-2" type="text" name="searchWord"> -->
            <button type="button" id="searchBtn" class="btn btn-success" >검색</button>
        </div>
        <script src="${pageContext.request.contextPath }/resources/js/paging.js"></script>
        <!-- 여기 js를 가져다 쓰는거야.. -->
<script type="text/javascript">
 			
            $("[name='searchType']").val("${projectPaingInfo.simpleSearch.searchType}");
            $("[name='searchWord']").val("${projectPaingInfo.simpleSearch.searchWord}");
            $("#searchForm").paging();


        </script>
