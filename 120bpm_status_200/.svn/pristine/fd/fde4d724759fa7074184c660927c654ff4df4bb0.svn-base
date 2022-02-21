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

        <h2 class="title">&nbsp;&nbsp;공지사항</h2>
        <div class="ui program--search">
            <div class="float-md-left form-inline-left row pb-2">
                <div class="ui program--count">
                    <span>
                        &nbsp;&nbsp;&nbsp;전체&nbsp; <strong class="cnt"> ${noticePagingInfo.totalRecord }</strong>건 / 오늘&nbsp; <strong id="todayRecord"></strong>건
                    </span>
                </div>
            </div>
            <div id="searchUI" class="form-inline row justify-content pb-2 ">
                <div class="xs-12">
                    &nbsp; 검색조건 &nbsp; <select name="searchType" class="form-control mr-2">
                        <option value="">전체</option>
                        <option value="noticeSj">제목</option>
                        <option value="noticeCn">내용</option>
                    </select> <input class="form-control mr-2" type="text" name="searchWord" onchange="$(this).siblings('#searchBtn').click();" />
                    <button type="button" id="searchBtn" class="btn btn-success">검색</button>
                    <c:if test="${authMember.mngrAt eq '1'}">
                        <button type="button" class="controlBtn btn btn-primary" data-gopage="${cPath }/notice/create">새글쓰기</button>
                    </c:if>
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
            <c:set var="noticeList" value="${noticePagingInfo.dataList }" />
            <c:choose>
                <c:when test="${empty noticeList }">
                    <tr>
                        <td colspan="8">조건에 맞는 해당 글이 없음.</td>
                    </tr>
                </c:when>
                <c:otherwise>
                    <c:forEach items="${noticeList }" var="notice">
                        <c:set var="today" value="${notice.today}" />
                        <tr id="${notice.noticeCode}">
                            <td colspan="1">${notice.noticeCode}</td>
                            <td colspan="4" class="noticeSj">${notice.noticeSj}</td>
                            <td colspan="2">${notice.noticeRgsde}</td>
                            <td colspan="1">${notice.noticeRdcnt}</td>
                        </tr>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </tbody>

        <tfoot>
            <tr>
                <td colspan="8">
                    <div id="pagingArea" class="d-flex justify-content-center">
                        ${noticePagingInfo.pagingHTMLBS }
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

            $("[name='searchType']").val("${noticePagingInfo.simpleSearch.searchType}");
            $("[name='searchWord']").val("${noticePagingInfo.simpleSearch.searchWord}");
            $("[name='sortType']").val("${pagingVO.simpleSearch.sortType}");



            function makeTrTag(notice) {
                return $("<tr>").append(
                    $("<td colspan='1'>").html(notice.noticeCode),
                    $("<td colspan='4'>").html(notice.noticeSj),
                    $("<td colspan='2'>").html(notice.noticeRgsde),
                    $("<td colspan='1'>").html(notice.noticeRdcnt)
                ).prop("id", notice.noticeCode);
            }
            let tbody = $("#listBody");
            let pagingArea = $("#pagingArea");

            let searchForm = $("#searchForm").paging()
                .ajaxForm({
                    dataType: "json",
                    success: function(noticePagingInfo) {
                        tbody.empty();
                        pagingArea.empty();
                        let boardList = noticePagingInfo.dataList;
                        let trTags = [];
                        if (boardList && boardList.length > 0) {
                            $(boardList).each(function(idx, board) {
                                trTags.push(makeTrTag(board));
                            });
                            pagingArea.html(noticePagingInfo.pagingHTMLBS);
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
                location.href = "${cPath}/notice/detail/" + boNo;
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