<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>


<script type="text/javascript" src="${cPath}/resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="${cPath}/resources/ckeditor/config.js"></script>
<script type="text/javascript" src="${cPath}/resources/js/jquery-validation-1.19.3/jquery.validate.min.js"></script>
<script type="text/javascript" src="${cPath}/resources/js/jquery-validation-1.19.3/additional-methods.min.js"></script>
<script src="//blueimp.github.io/JavaScript-Load-Image/js/load-image.all.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/jQuery-File-Upload-master/jQuery-File-Upload-master/js/vendor/jquery.ui.widget.js"></script>
<script src="${cPath}/resources/jQuery-File-Upload-master/jQuery-File-Upload-master/js/jquery.iframe-transport.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>


<style type="text/css">
    .insertBtn, .gobackBtn  {
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



<body>
<security:authentication property="principal.adaptee" var="authMember" />
<div id="par">
    <br>
    	<h2 class="title">자유게시판</h2><br><br></button>
		
    <form method="post" id="freeBoardForm">
        <table class='table'>
            <tr>
                <th>※제목</th>
                <td colspan="3">
                    <input type="text" class="form-control" name="boSj" required value="${freeBoard.boSj }" />
                </td>
            </tr>
            <tr>
                <th>내용</th>
                <td colspan="3">
                    <textarea class="form-control" id="boCn" name="boCn">&nbsp;${freeBoard.boCn}</textarea>
                </td>
            </tr>
        </table>
        <input type="hidden" name="memId" value="${authMember.memId}">
		<input type="hidden" name="prjctNo"  value="${pCode}">
    </form>

</div>
<div class="right btnArea backgroundColor ">
    <button class="btn gobackBtn" data-gopage="${cPath }/project/${pCode}/freeboard/list">이전</button>
    <c:if test="${command eq 'INSERT' }">
        <button type="button" id="sub" class="btn insertBtn ">등록</button>
    </c:if>

</div>

</body>
<script>
    $(function() {

        let validateOptions = {};
        let freeBoardForm = $('#freeBoardForm');
        let validatePrt = freeBoardForm.validate(validateOptions);
        let url = "${cPath }/project/${pCode}/freeboard/list";
        let sendSumry = $('#sumry')
        validateOptions.messages = {
        	bjSj: {
                required: "제목은 필수 입력값 입니다"
            },
            boCn: {
                required: "내용은 필수 입력값 입니다"
            }
        }
        
        $("#saveBtn").on('click', function() {
            let sumryData = CKEDITOR.instances.sumry.getData();
            sendSumry.empty();
            sendSumry.val(sumryData);
            freeBoardForm.submit();
        })

        freeBoardForm.ajaxForm({
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

    CKEDITOR.replace('boCn', {
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
        var boCn = document.getElementById("boCn");
		var editorContent =  CKEDITOR.instances.boCn.getData(); 
		var config = CKEDITOR.ENTER_BR;
	   
        $(boCn).val(editorContent)

        var sendOk = false;
        if (editorContent.trim() == '' || editorContent.trim().length == 0) {
            $(boCn).focus();
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
            $(freeBoardForm).submit();
        }
    
    };
	  $("h2").on('click', function() {
	 	freeData();
	 });

    
	 function freeData(){
		 	//제목
			$("input[name='boSj']").val('우와 프로젝트가 드디어 완성됐어요!!!');
			//내용
		/* 	$("input[name='boCn']").val('프로젝트가 시작했어요 좋네용ㅎㅎㅎㅎ 404호파이팅!!');
			
 */
			CKEDITOR.instances.boCn.setData('프로젝트가 시작했어요 좋네용ㅎㅎㅎㅎ 404호파이팅!!');

		}
</script>