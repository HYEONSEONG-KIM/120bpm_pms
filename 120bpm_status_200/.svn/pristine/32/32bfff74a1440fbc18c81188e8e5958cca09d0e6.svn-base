<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/js/DataTables/datatables.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/DataTables/datatables.min.js"></script>
<script type="text/javascript" src="${cPath }/resources/js/jquery.form.min.js"></script>
<script src="https://cdn.datatables.net/plug-ins/1.10.12/sorting/date-eu.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/paging.js"></script>
<link rel="stylesheet" href="${cPath }/resources/css/noitceList.css" />
<link rel="stylesheet" href="${cPath }/resources/css/commons.css">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>
    .title {
        font-size: 1.8rem;
        font-weight: bold;
        color: #333;
        line-height: 1.15;
        padding-bottom: 1.2rem;
        border-bottom: 2px solid #222;
        letter-spacing: -0.03em;
    }

    .noticeSj {
        text-align: left;

    }

    table {
        text-align: center;
    }
</style>
</head>
<c:if test="${not empty deleteSuccess}">
<script>    
$(function(){
       	 Swal.fire({
       		  icon: 'success',
        	  title: '삭제 완료!', 
        	  text: '게시글 삭제가 완료되었습니다.',
        	  confirmButtonText: '확인!'
        	})
})
</script>
</c:if>
<body>

    <security:authentication property="principal.adaptee" var="authMember" />
    <security:authentication property="authorities" var="authMemRoles" />


    <form>

        <h1 class="title">&nbsp;&nbsp;자유게시판</h1>
        <div class="ui program--search">
            <div class="float-md-left form-inline-left row pb-2">
                <div class="ui program--count">
                    <span>
                        &nbsp;&nbsp;&nbsp;전체&nbsp; <strong class="cnt"> ${freePagingInfo.totalRecord }</strong>건 / 오늘&nbsp; <strong id="todayRecord"></strong>건
                    </span>
                </div>
            </div>
            <div id="searchUI" class="form-inline row justify-content pb-2 ">
                <div class="xs-12">
                    &nbsp; 검색조건 &nbsp; <select name="searchType" class="form-control mr-2">
                        <option value>전체</option>
                        <option value="noticeSj">제목</option>
                        <option value="noticeCn">내용</option>
                    </select> <input class="form-control mr-2" type="text" name="searchWord" onchange="$(this).siblings('#searchBtn').click();" />
                    <button type="button" id="searchBtn" class="btn btn-success">검색</button>
                        <button type="button" class="controlBtn btn btn-primary" data-gopage="${cPath }/project/${pCode}/freeboard/create">새글쓰기</button>
                    
                </div>
            </div>
        </div>
    </form>
    <table id="tableList" class="table table-hover">
        <thead class="listHeader thead-dark">
            <tr>
                <th colspan="1">번호</th>
                <th colspan="4">제목</th>
                <th colspan="2">작성일</th>
                <th colspan="1">조회수</th>
            </tr>
        </thead>

        <tbody id="listBody">
            <c:set var="freeBoardList" value="${freePagingInfo.dataList }" />
            <c:choose>
                <c:when test="${empty freeBoardList }">
                    <tr>
                        <td colspan="8">조건에 맞는 해당 글이 없음.</td>
                    </tr>
                </c:when>
                <c:otherwise>
                    <c:forEach items="${freeBoardList }" var="freeBoard">
                        <c:set var="today" value="${freeBoard.today}" />
                        <tr id="${freeBoard.boNo}">
                            <td colspan="1">${freeBoard.rnum}</td>
                            <td colspan="4" class="boSj">${freeBoard.boSj}</td>
                            <td colspan="2">${freeBoard.boRgsde}</td>
                            <td colspan="1">${freeBoard.boRdcnt}</td>
                        </tr>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </tbody>

        <tfoot>
            <tr>
                <td colspan="8">
                    <div id="pagingArea" class="d-flex justify-content-center">
                        ${freePagingInfo.pagingHTMLBS }
                        <!-- 이건 VO가면 있는거지 -->
                    </div>
                </td>
            </tr>
        </tfoot>
    </table>

    <form id="searchForm">
        <input type="hidden" name="page" placeholder="page number" />
        <input type="hidden" name="searchType" placeholder="search type" />
        <input type="hidden" name="searchWord" placeholder="search word" />
        <input type="hidden" name="sortType" />
    </form>

    <script src="${pageContext.request.contextPath }/resources/js/paging.js"></script>
    <script type="text/javascript">
        $(function() {
            $(document).ajaxComplete(function(event, xhr, options) {
                searchForm.find("[name='page']").val("");
            }).ajaxError(function(event, xhr, options, error) {
                console.log(event);
                console.log(xhr);
                console.log(options);
                console.log(error);
            });

            $("#todayRecord").html("${today}")

            $("[name='searchType']").val("${freePagingInfo.simpleSearch.searchType}");
            $("[name='searchWord']").val("${freePagingInfo.simpleSearch.searchWord}");
            $("[name='sortType']").val("${pagingVO.simpleSearch.sortType}");



            function makeTrTag(freeBoard) {
                return $("<tr>").append(
                    $("<td colspan='1'>").html(freeBoard.boNo),
                    $("<td colspan='4'>").html(freeBoard.boSj),
                    $("<td colspan='2'>").html(freeBoard.boRgsde),
                    $("<td colspan='1'>").html(freeBoard.boRdcnt)
                ).prop("id", freeBoard.boNo);
            }
            let tbody = $("#listBody");
            let pagingArea = $("#pagingArea");

            let searchForm = $("#searchForm").paging()
                .ajaxForm({
                    dataType: "json",
                    success: function(freePagingInfo) {
                        tbody.empty();
                        pagingArea.empty();
                        let boardList = freePagingInfo.dataList;
                        let trTags = [];
                        if (boardList && boardList.length > 0) {
                            $(boardList).each(function(idx, board) {
                                trTags.push(makeTrTag(board));
                            });
                            pagingArea.html(freePagingInfo.pagingHTMLBS);
                        } else {
                            trTags.push(
                                $("<tr>").html(
                                    $("<td>").attr("colspan", "8").html("조건에 맞는 결과가 없음.")
                                )
                            );
                        }
                        tbody.append(trTags);
                    }
                });

            $("tbody").on("click", "tr[id]", function() {
                let boNo = this.id;
                location.href = "${cPath}/project/${pCode}/freeboard/detail/"+boNo;
            }).css("cursor", "pointer");

            $(".sortBtn").on("click", function() {
                $("[name='sortType']").val(this.id);
                searchForm.submit();
            }).css("cursor", "pointer");


            $(".controlBtn").on('click', function() {
                let gopage = $(this).data("gopage");
                if (gopage) {
                    location.href = gopage
                }
            });

        });
    </script>