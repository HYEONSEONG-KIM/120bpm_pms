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
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>


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

    textarea {
        height: 600px;
        padding: 20px;

    }

    .error {
        color: red;
    }
    
    .btn{
    	float : right;
    
    }
</style>




<div id="par">
    <br>
    <h2 class="title">????????????</h2><br>
    <form method="post" id="noticeForm">
        <table class='table'>
            <tr>
                <th>?????????</th>
                <td colspan="3">
                    <input type="text" class="form-control" name="noticeSj" required value="${notice.noticeSj }" />
                </td>
            </tr>
            <tr>
                <th>??????</th>
                <td colspan="3">
                    <textarea class="form-control" id="noticeCn" name="noticeCn">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${notice.noticeCn}</textarea>
                </td>
            </tr>

        </table>
        <table class=' template-upload fade image in'>
            <thead>
                <tr>
                    <td>???????????? </td>
                </tr>
            </thead>
            <tbody class='fileSet'>
            </tbody>
        </table>
    </form>




    <form id="fileupload" enctype="multipart/form-data">
        <span class="btn btn-success fileinput-button">
            <i class="glyphicon glyphicon-plus"></i>
            <span>?????? ??????</span>
            <input name="files" type="file" multiple="multiple" />
        </span>
        <input type="hidden" value="NO" name="menuClCode">
    </form>
</div>
<div class="right btnArea backgroundColor ">
    <button class="btn gobackBtn controlBtn" data-gopage="${cPath }/notice/noticeList">??????</button>
    <c:if test="${command eq 'INSERT' }">
        <button type="button" id="sub" class="btn insertBtn">??????</button>
    </c:if>

</div>



<script>
    $(function() {

        let validateOptions = {};
        let noticeForm = $('#noticeForm');
        let validatePrt = noticeForm.validate(validateOptions);
        let url = "${cPath}/notice/noticeList";
        let sendSumry = $('#sumry')
        validateOptions.messages = {
            noticeSj: {
                required: "???????????? ????????? ?????? ????????? ?????????"
            },
            noticeCn: {
                required: "???????????? ?????? ????????? ?????????"
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
                        location.href = url;
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

            fileSet.append(trTags); //????????? ???????????? ???????????? ????????????

        },
        fail: function(e, data) {
            alert('????????? ?????? ??? ????????? ??????????????????');
            foo = data;
        }
    });



    function makeFileBtn(file) {
        /*
        ????????? ?????? ????????? vo??? ?????? ?????? ?????????
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
                    $("<input type='hidden'>").prop("name", "noticeFileList[" + no + "].noticeFiletempAt").prop("value", '0').prop("class", "noticeFiletempAt"), //????????? ???????????? ??? ???????????? ???????????? ???????????? ???
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
        let value = $(this).parents("tr")[0]
        $(value).find(".noticeFiletempAt").val("1") //???????????? ?????? 1 ??? ???????????? ?????? ???????????? ?????????
        $(value).find(".noticeFileDelAt").val("1") // ?????? ?????? ????????? 1??? ???????????? ?????? ????????? ????????? ?????????
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
                title: "?????? ?????? ??????",
                text: "????????? ??????????????????",
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