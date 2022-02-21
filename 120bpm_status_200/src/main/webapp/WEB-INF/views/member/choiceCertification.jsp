<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>120bpm</title>
    <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
</head>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap');
    .member_join_step {
        overflow: hidden;
        margin-bottom: 50px;
    }
    .member_join_step ul li {
        float: left;
        width: 25%;
        list-style: none;
        text-align: center;
    }
    .member_join_area .member_join_step ul li span.step_level {
        padding-top: 140px;
        font-weight: bold;
        color: #02468a;
        font-size: 20px;
        letter-spacing: -0.08em;
    }
    .member_join_area .member_join_step ul li span {
        display: block;
    }
    body {
        font-family: 'Noto Sans KR', sans-serif;
    }
    .step_level{
        color : #02468a;
        font-weight: bold;
    }

    .confirm_area {
        display: inline-block;
        width: 275px;
        height: 404px;
        padding: 50px 70px 0;
        text-align: center;
    }

    .confirm_area.confirm_bg01 {
        margin-right: 65px;
        background: no-repeat center 103px #f3f3f1;
    }

    .confirm_area.confirm_bg02 {
        margin-right: 65px;
        background: no-repeat center 103px #f3f3f1;
    }

    #confirm-auto {
        margin-left : 370px;
    }

    button.confirm_btn {
        display: block;
        width: 100%;
        height: 50px;
        line-height: 50px;
        background-color: #3997e8;
        color : white;
        font-size: large;
        font-weight: bold;

    }
    .orange {
        color:orangered;
    }
</style>
<script type="text/javascript">



    $(document).ready(function() {

    	$("#authSMS").on("click", function(){
 			location.href = "${cPath }/member/sendSMS.do" 
		}).css("cursor", "pointer");
    	
    	
    	$("#authmail").on("click", function(){
 			location.href = "${cPath }/member/sendMail.do" 
		}).css("cursor", "pointer");
        //재동의 세션이 Y 일경우 팝업노출
        if("" === "Y"){
            $("#popup_wrap").css("display","block");
            $("#dimbg").addClass("dimbg");
        }

        //2021.08.13.
        $("a[id*='menuSelect']").each(function(i) {

            if($(this).attr('dataCd') == $(location).attr('pathname')) {
                $(this).addClass('select');
            }
        });


    });

    function reAgree(gubun){

        $.ajax({
            url: "/front/user/reAgree.do",
            dataType: "json",
            data: {
                gubun : gubun,
            },
            type: "post",
            success: function(data) {
                if(gubun === "Y"){ //완료알림창
                    $("#popup_wrap").css("display","none");
                    $("#popup_yes").css("display","block");
                }else if(gubun === "N"){ //파기알림창
                    $("#popup_wrap").css("display","none");
                    $("#popup_no").css("display","block");
                }
            }
        });
    }

    function reAgreeSubmit(gubun){
        if(gubun === "Y"){
            $("#popup_yes").css("display","none");
            $("#dimbg").removeClass("dimbg");
        }else if(gubun === "N"){
            $("#popup_no").css("display","none");
            $("#dimbg").removeClass("dimbg");
        }
    }
</script>

<body>
<div class="member_join_step">
    <ul>
        <li class="step01 on">
            <div class="step01_bg">
                <img src="${cPath }/resources/imgs/img/member_join_chapter01.png"></br>
                <span class="step_level">STEP 1</span></br>
                <span class="step_title">가입 여부 및 본인 인증</span>
            </div>
        </li>
        <li class="step02">
            <div class="step02_bg">
                <img src="${cPath }/resources/imgs/img/member_join_chapter02_off.png"></br>
                <span class="step_level">STEP 2</span></br>
                <span class="step_title">약관 동의</span>
            </div>
        </li>
        <li class="step03">
            <div class="step03_bg">
                <img src="${cPath }/resources/imgs/img/member_join_chapter03_off.png"></br>
                <span class="step_level">STEP 3</span></br>
                <span class="step_title">회원 정보 입력</span>
            </div>
        </li>
        <li class="step04">
            <div class="step04_bg">
                <img src="${cPath }/resources/imgs/img/member_join_chapter04_off.png"></br>
                <span class="step_level">STEP 4</span></br>
                <span class="step_title">가입 완료</span>
            </div>
        </li>
    </ul>
</div>

<div id = "confirm-auto">
<div class="confirm_area confirm_bg01">
    <strong class="confirm_title">
        <span class="orange">휴대전화</span> 인증
    </strong>
    <br><br><br>
    <img src ="${cPath }/resources/imgs/img/phone.png"></br>
    <div class="confirm_txt_box">
        <p class="confirm_txt01">본인 명의 휴대전화로 인증가능합니다.</p>
    </div>
    <button id="authSMS" class="btn confirm_btn">
        <span class = btnauth>인증하기</span>
    </button>
</div>

<div class="confirm_area confirm_bg02">
    <strong class="confirm_title">
        <span class="orange">E-Mail</span> 본인인증
        </br></br></br>
    </strong>
    <img src ="${cPath }/resources/imgs/img/mail.png"></br>
    <div class="confirm_txt_box">
        <p class="confirm_txt01">본인 명의 E-Mail로 인증가능합니다.</p>
    </div>
    <button id="authmail" class="btn confirm_btn">
        <span class = btnauth>인증하기</span>
    </button>
</div>
</div>
</body>