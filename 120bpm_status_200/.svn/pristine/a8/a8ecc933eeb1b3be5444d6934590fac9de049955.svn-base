<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<script type="text/javascript" src="${cPath}/resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="${cPath}/resources/ckeditor/config.js"></script>
<script type="text/javascript" src="${cPath}/resources/js/jquery-validation-1.19.3/jquery.validate.min.js"></script>
<script type="text/javascript" src="${cPath}/resources/js/jquery-validation-1.19.3/additional-methods.min.js"></script>
<script src="//blueimp.github.io/JavaScript-Load-Image/js/load-image.all.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/jQuery-File-Upload-master/jQuery-File-Upload-master/js/vendor/jquery.ui.widget.js"></script>
<script src="${cPath}/resources/jQuery-File-Upload-master/jQuery-File-Upload-master/js/jquery.iframe-transport.js"></script>
<script src="${cPath}/resources/jQuery-File-Upload-master/jQuery-File-Upload-master/js/jquery.fileupload.js"></script>
<link rel="stylesheet" href="${cPath}/resources/jQuery-File-Upload-master/jQuery-File-Upload-master/css/jquery.fileupload-ui.css">
<link rel="stylesheet" href="${cPath}/resources/jQuery-File-Upload-master/jQuery-File-Upload-master/css/jquery.fileupload.css">
<script type="text/javascript" src="${cPath}/resources/jQuery-File-Upload-master/jQuery-File-Upload-master/js/jquery.fileupload-process.js"></script>


<style type="text/css">
    .insertBtn {
        float: right;
        font-size: 20px;
    }

    #saveBtn {
        font-size: 20px;

    }

    #par {
        background: #fcfcfc;
        text-align: center;
        border-radius: 15px;
    }

    table th {
        background: #F0F9FC;
    }

    .title {
        font-size: 1.8rem;
        font-weight: bold;
        color: #333;
        line-height: 1.15;
        padding-bottom: 1.2rem;
        border-bottom: 2px solid #222;
        letter-spacing: -0.03em;
    }


    #attachFile {
        text-align: left;
        padding-left: 15px;
    }
</style>

<div id="par">
    <br>
    <h2 class="title">공지사항</h2><br>
    <form method="post" id="noticeForm">
        <c:if test="${command eq 'UPDATE' }">
        </c:if>
        <table class='table'>
            <tr>
                <th>※제목</th>
                <td colspan="3">
                    <input type="text" class="form-control" name="noticeSj" required value="${notice.noticeSj }" />
                </td>
            </tr>
            <tr>
                <th>내용</th>
                <td colspan="3">
                    <textarea class="form-control" id="noticeCn" name="noticeCn">${notice.noticeCn}</textarea>
                </td>
            </tr>

        </table>
        <table class=' template-upload fade image in'>
            <thead>
                <tr>
                    <th id="attachFile">첨부파일</th>
                </tr>
            </thead>
            <tbody class='fileSet'>
                <c:if test="${command eq 'UPDATE' }">
                    <tr>
                        <td colspan="3">
                            <div class="sizing">
                                <c:forEach items="${notice.noticeFileList }" var="noticeFile">
                                    <c:if test="${not empty noticeFile.noticeFileCode }">
                                        <p class='file'>
                                            &ensp;&ensp;${noticeFile.noticeFileNm }<button type="button" data-delFileNo="${noticeFile.noticeFileCode }" class="btn btn-light del"><i class="fa fa-trash" aria-hidden="true"></i></button>
                                        </p>
                                    </c:if>
                                </c:forEach>

                            </div>
                        </td>
                    </tr>
                </c:if>
            </tbody>

        </table>
    </form>


    <form id="fileupload" enctype="multipart/form-data">
        <span class="btn btn-success fileinput-button">
            <i class="glyphicon glyphicon-plus"></i>
            <span>파일 선택</span>
            <input name="files" type="file" multiple="multiple" />
        </span>
        <input type="hidden" value="NO" name="menuClCode">
    </form>
</div>
<div class="left btnArea backgroundColor ">
    <button class="btn gobackBtn controlBtn" data-gopage="${cPath }/notice/noticeList">취소</button>
    <c:if test="${command eq 'UPDATE' }">
        <button type="button" id="sub" class="btn updateBtn">수정</button>
    </c:if>
</div>



<script>
    $(function() {
        let validateOptions = {};
        let noticeForm = $('#noticeForm');
        let validatePrt = noticeForm.validate(validateOptions);
        let url = "${cPath}/notice/detail/${notice.noticeCode}";
        let sendSumry = $('#sumry')
        validateOptions.messages = {
            noticeSj: {
                required: "공지사항 제목은 필수 입력값 입니다"
            },
            noticeCn: {
                required: "시작일은 필수 입력값 입니다"
            }
        }

        $("#saveBtn").on('click', function() {
            let sumryData = CKEDITOR.instances.sumry.getData();
            sendSumry.empty();
            sendSumry.val(sumryData);
            noticeForm.submit();
        })

        noticeForm.ajaxForm({
            dataType: 'text',
            success: function(res) {

                if (res == 'OK') {
                    Swal.fire({
                        title: 'success!',
                        icon: 'success'
                    }).then(function() {
                        location.href = url
                    });
                } else if (res == 'FAIL') {
                    Swal.fire({
                        title: 'FAIL...',
                        icon: 'error'
                    })
                }
            }

        })

    })

    CKEDITOR.replace('noticeCn', {
        language: 'en',
        toolbar: [{
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
                    items: ['Table']
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

            ,
        bodyClass: 'document-editor'



    });

    let uploadForm = $("#fileupload")[0];
    let fileSet = $(".fileSet");
    let fileArea = $("#fileArea");
    let tbody = $(".fileSet");

    $("#fileupload").fileupload({
        url: "${pageContext.request.contextPath }/notice/file/fileUpload",
        autoUpload: true,
        sequentialUploads: true,
        dataType: 'json',
        add: function(e, data) {
            var isValid = true;
            var uploadFile = data.files;

            data.submit();
        },
        progressall: function(e, data) {
            var progress = parseInt(data.loaded / data.total * 100, 10);
            $('#progress .bar').css(
                'width',
                progress + '%'
            );
        },
        done: function(e, data) {
            trTags = [];
            let fileList = data.result.files[0];
            $(fileList).each(function(index, file) {
                trTags.push(makeFileBtn(file));
            });

            fileSet.append(trTags); //여기서 테이블에 넣어주고 있습니다

        },
        fail: function(e, data) {
            alert('서버와 통신 중 문제가 발생했습니다');
            foo = data;
        }
    });

    <c:if test = "${command eq 'UPDATE'}" >
        ///////파일 삭제 버튼 누르면 파일 숨김 처리되고 delete 파일에 들어감 

        $(".sizing").on("click", ".del", function() {
            let fileNo = $(this).data("delfileno")
            $("#noticeForm").append(
                $("<input>").attr({
                    name: "delFileNo",
                    type: "hidden",
                    value: fileNo
                })
            );
            $(this).closest(".file").hide();

        }); 
    </c:if>

    function makeFileBtn(file) {
        /*
        생성될 경우 넘겨질 vo의 수를 증가 시켜줌
        */
        if ($("tr").hasClass("fileName") == true) {

            let fileName = $(".fileName").last();

            let no = parseInt($(fileName).data("no")) + 1;

            return $("<tr class='fileName'>").append(
                $("<span >").html(file.fileNm)
                .append(
                    $("<input type='hidden'>").prop("name", "noticeFileList[" + no + "].noticeFileSavedNm").prop("value", file.fileSavedNm),
                    $("<input type='hidden'>").prop("name", "noticeFileList[" + no + "].noticeFileNm").prop("value", file.fileNm),
                    $("<input type='hidden'>").prop("name", "noticeFileList[" + no + "].noticeFileRgsde").prop("value", file.fileRgsde),
                    $("<input type='hidden'>").prop("name", "noticeFileList[" + no + "].noticeFiletempAt").prop("value", '0').prop("class", "noticeFiletempAt"), //이대로 업데이트 시 템프파일 아님으로 업데이트 됨
                    $("<input type='hidden'>").prop("name", "noticeFileList[" + no + "].noticeFileDelAt").prop("value", '0').prop("class", "noticeFileDelAt")
                ).append(
                    $("<button type='button' >").prop("class", "deleteBtn").append("<i class='glyphicon glyphicon-ban-circle'></i>")
                )
            ).data("no", no);

        } else {
            return $("<tr class='fileName'>").append(
                $("<span >").html(file.fileNm)
                .append(
                    $("<input type='hidden'>").prop("name", "noticeFileList[0].noticeFileSavedNm").prop("value", file.fileSavedNm).prop("id", file.fileSavedNm),
                    $("<input type='hidden'>").prop("name", "noticeFileList[0].noticeFileNm").prop("value", file.fileNm),
                    $("<input type='hidden'>").prop("name", "noticeFileList[0].noticeFileRgsde").prop("value", file.fileRgsde),
                    $("<input type='hidden'>").prop("name", "noticeFileList[0].noticeFiletempAt").prop("value", '0').prop("class", "noticeFiletempAt"),
                    $("<input type='hidden'>").prop("name", "noticeFileList[0].noticeFileDelAt").prop("value", '0').prop("class", "noticeFileDelAt")
                ).append(
                    $("<button type='button'>").prop("class", "deleteBtn").append("<i class='glyphicon glyphicon-ban-circle'></i>")
                )
            ).data("no", "0")
        }
    }


    $(tbody).on("click", ".deleteBtn", function() {
        console.log($(this).parents("tr")[0])
        let value = $(this).parents("tr")[0]
        $(value).find(".noticeFiletempAt").val("1") //템프파일 여부 1 로 변경하여 템프 파일으로 설정함
        $(value).find(".noticeFileDelAt").val("1") // 파일 삭제 여부를 1로 변경하여 파일 삭제된 파일로 설정함
        $(value).attr('style', "display:none;");

    });

    $(".gobackBtn").on('click', function() {
        let gopage = $(this).data("gopage");
        if (gopage) {
            location.href = gopage
        }
    });

    $("#sub").on("click", function() {

        mysubmit(event);
        return false;
    });

    function mysubmit(event) {
        var noticeCn = document.getElementById("noticeCn");
		var editorContent =  CKEDITOR.instances.noticeCn.getData(); 
		var config = CKEDITOR.ENTER_BR;

        $(noticeCn).val(editorContent)
        var sendOk = false;
        if (editorContent.trim() == '' || editorContent.trim().length == 0) {
            $(noticeCn).focus();
            Swal.fire({
                title: "필수 항목 오류",
                text: "내용이 비어있습니다",
                icon: "error",
                button: "OK",
            })
        } else {
            sendOk = true;
        }
        if (sendOk == true) {
            $(noticeForm).submit();
        }

    }
</script>