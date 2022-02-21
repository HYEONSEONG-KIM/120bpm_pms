<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>joinStep1. 본인 인증</title>
<script type="text/javascript" src="${cPath }/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${cPath }/resources/bootstrap/css/bootstrap.min.css" />
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
 
<link rel="stylesheet" href="${cPath }/resources/css/joinStep1.css" /> 

<script type="text/javascript">
    var joinCode = "";

    $(function() {
        setPop();

        $("#btnSMSNum").on("click", function() {
            joinCode = "";
            var sms = $("#sms").val();
        	Swal.fire({
      		  icon: 'success',
      		  title: '문자 전송',
      		  text: '문자가 전송되었습니다.'       
        	})

            $.ajax({
                url: "${cPath }/sendSMS/authSMS",
                data: {
                    sms: sms
                },
                type: "post",
                success: function(data) {
                    console.log(data);
                    if (data == "fail") {
                    	Swal.fire({
                    		  icon: 'error',
                    		  title: '전송 실패',
                    		  text: '문자전송 실패! 다시 시도 해주세요',          
                    		})
                    } else {
                        joinCode = data;
                        $("#ranNumSMS").prop("disabled", false);
                    }
                },
            });
        });

        $("#btnEmailNum").on("click", function() {
            joinCode = "";
            var email = $("#email").val();
        	Swal.fire({
        		  icon: 'success',
        		  title: '메일전송',
        		  text: '메일이 전송되었습니다.'       
          	})

            $.ajax({
                url: "${cPath }/sendMail/auth",
                data: {
                    email: email
                },
                type: "post",
                success: function(data) {
                    console.log(data);
                    if (data == "fail") {
                    	Swal.fire({
                  		  icon: 'error',
                  		  title: '전송 실패',
                  		  text: '메일전송 실패! 다시시도하세요',       
                    	})
                    } else {
                        joinCode = data;
                        $("#ranNumEmail").prop("disabled", false);
                    }
                },
            });
        });
    });

	<%--팝업 세팅--%>
    function setPop() {
        var popOpenBtn = $('.popOpenBtnCmmn');
        <%--팝업 열기--%>
        popOpenBtn.on('click', function() {
            var clickNum = $(this).attr('data-num');
            $('#popUp_' + clickNum).fadeIn(200);
        })

        <%--팝업 닫기--%>
        $('.popBg, .popCloseBtnCmmn').on('click', function() {
            var clickNum = $(this).attr('data-num');
            $('#popUp_' + clickNum).fadeOut(200);
        })
    }

    <%--SMS 인증번호 체크--%>
    function smsAuthCheck() {
    	  let userNum = $("#ranNumSMS").val();
          checkAuth(userNum);
    }
    
    <%--이메일 인증번호 체크--%>
    function emailAuthCheck() {
        <%-- let userNum = $("#ranNumEmail").val();
        if (userNum == joinCode) {
        	Swal.fire({
      		  icon: 'success',
      		  title: '인증 성공',
      		  text: '인증에 성공하였습니다.'       
        	}),
            $(".sendStep2").attr("disabled", false);
        } else {
        	Swal.fire({
      		  icon: 'error',
      		  title: '인증 실패',
      		  text: '인증에 실패하였습니다. 인증번호를 확인해주세요',       
        	})
        } --%>
        let userNum = $("#ranNumEmail").val();
        checkAuth(userNum);
    }

    function temp() {
        var email = $("#email").val();
        var sms = $("#sms").val();
        var $form = $("#actionForm");
        $form.attr("action", '${cPath }/member/joinStep2');
   		 
        	if (email != "") {
        		<%--location.href = '${cPath }/member/joinStep2?email=' + email;--%>
            	$form.find("[name=email]").val(email);
       		 }
        	else if (sms != "") {
        		<%--location.href = '${cPath }/member/joinStep2?sms=' + sms;--%>
       			$form.find("[name=sms]").val(sms);
        	}
        	else {
        		return;
        	}
        	$form.submit();
    	
    }
    
    function checkAuth(userNum) {
    	console.log("call checkAuth")
    	 $.ajax({
             url: "${cPath }/member/checkAuth",
             data: {
            	 joinCode: userNum
             },
             type: "post",
             dataType: "html",
             success: function(data) {
                 console.log(data);
                 if (data == "success") {
                 	Swal.fire({
               		  icon: 'success',
               		  title: '인증 성공',
               		  text: '인증에 성공하였습니다.'       
                 	}),
                     $(".sendStep2").attr("disabled", false);
                 } else {
                 	Swal.fire({
               		  icon: 'error',
               		  title: '인증 실패',
               		  text: '인증에 실패하였습니다. 인증번호를 확인해주세요',       
                 	})
                 }
             },
             error: function(e) {
            	 console.error(e);
             }
         });
    }
    
    $('#phLB').on('click',function(){
    	$('#sms').val('01064841200');
    })
    
</script>

</head>
<body>
<form id="actionForm" action="" method="post">
<input type="hidden" name="email" value="">
<input type="hidden" name="sms" value="">
</form>
	<div class="line_dot">
	 	 <img id="logo" src="${cPath }/resources/imgs/img/logo.png"  alt="120BPM"><br>
	 	 			<h1><hr class="inline-hr"><span class="logotext">120BPM</span><hr class="inline-hr"></h1>			
			    <div class="member_join_step">
        <ul>
            <li class="step01 on">
                <div class="step01_bg">
                    <img src="../resources/imgs/img/member_join_chapter01.png"><br>
                    <span class="step_level">STEP 1</span><br> <span class="step_title">가입 여부 및 본인 인증</span>
                </div>
            </li>
            <li class="step02">
                <div class="step02_bg">
                    <img src="../resources/imgs/img/member_join_chapter02_off.png"><br>
                    <span class="step_level">STEP 2</span><br> <span class="step_title">약관 동의</span>
                </div>
            </li>
            <li class="step03">
                <div class="step03_bg">
                    <img src="../resources/imgs/img/member_join_chapter03_off.png"><br>
                    <span class="step_level">STEP 3</span><br> <span class="step_title">회원 정보 입력</span>
                </div>
            </li>
            <li class="step04">
                <div class="step04_bg">
                    <img src="../resources/imgs/img/member_join_chapter04_off.png"><br>
                    <span class="step_level">STEP 4</span><br> <span class="step_title">가입 완료</span>
                </div>
            </li>
        </ul>
    </div>
 		<div class="box_step box_step2">
        <div class="row">
        <div class="col-md-3"></div> 
        <div class="col-md-6 boxes">
            <div class="confirm_area confirm_bg01">
                <strong class="confirm_title"> <span class="orange">휴대전화</span> 인증
                </strong> <br> <br> <br> <img src="../resources/imgs/img/phone.png"><br>
                <div class="confirm_txt_box">
                <br>
                    <p class="confirm_txt01">본인 명의 휴대전화로 인증가능합니다.</p>
                </div>
                <button id="authSMS" class="btn confirm_btn popOpenBtnCmmn" data-num="1">
                    <span class="btnauth ">인증하기</span>
                </button>
            </div>

            <div class="confirm_area confirm_bg02">
                <strong class="confirm_title"> <span class="orange">E-Mail</span>
                   	 본인인증 <br> <br> <br>
                </strong> <img src="../resources/imgs/img/mail.png"><br>
                <div class="confirm_txt_box">
                    <br>
                    <p class="confirm_txt01">본인 명의 E-Mail로 인증가능합니다.</p>
                </div>
                <button id="authmail" class="btn confirm_btn popOpenBtnCmmn" data-num="2">
                    <span class=btnauth>인증하기</span>
                </button>
            </div>
        </div>
        <div class="col-md-3">
        </div>
    </div> 
	</div>

    <form action="${cPath }/sendSMS/authSMS" class="authForm" method="post">
        <div id="popUp_1" class="popCmmn">
            <div class="popBg" data-num="1"></div>
            <div class="popInnerBox">
                <div id = "phLB" class="popHead">[ 휴대폰인증 ]</div>
                <div class="popBody">
                    <label>휴대폰번호&nbsp;:&nbsp; </label> <input type="text" id="sms" name="sms" />
                    <button type="button" id="btnSMSNum">&nbsp;&nbsp;sms전송</button>
            		<br>
                	<label>인증코드&nbsp;:&nbsp; </label> <input type="text" id="ranNumSMS" name="ranNumSMS" disabled />
                    <button type="button" id="smsAuth" onclick="smsAuthCheck()">코드 확인</button>
                </div>
                <div class="popFoot">
                    <button class="popCloseBtnCmmn sendStep2" onclick="temp();" type="button" data-num="1" disabled>확인</button>
                </div>
            </div>
       </div>
    </form>

    <form action="${cPath }/sendMail/auth" class="authForm" method="post">
        <div id="popUp_2" class="popCmmn">
            <div class="popBg" data-num="2"></div>
            <div class="popInnerBox">
                <div class="popHead">[ email 인증 ]</div>
                <div class="popBody">
                    <label>이메일&nbsp;:&nbsp;&nbsp; </label> <input type="text" id="email" name="email" />
                    <button type="button" class="btn" id="btnEmailNum">&nbsp;메일전송</button>     
                    <br> <label>인증코드:&nbsp;&nbsp;</label> <input type="text" id="ranNumEmail" name="ranNumEmail" disabled />
                    <button type="button" class="btn" id="emailAuth" onclick="emailAuthCheck();">코드 확인</button>
                </div>
                <div class="popFoot">
                    <button class="popCloseBtnCmmn sendStep2" onclick="temp();" type="button" data-num="2" disabled>확인</button>
                </div>
            </div>
        </div>
    </form>
   </div>    
</body>

</html>