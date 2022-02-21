<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>120BPM | Join Us</title>

<meta name="viewport" content="width=device-width, initial-scale=1 ">
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript"
	src="${cPath }/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet"
	href="${cPath }/resources/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="${cPath }/resources/css/joinForm.css" />
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수 

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							/*                 // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							 if(extraAddr !== ''){
							 extraAddr = ' (' + extraAddr + ')';
							 } */
							/*                 // 조합된 참고항목을 해당 필드에 넣는다.
							 document.getElementById("sample6_extraAddress").value = extraAddr;
							
							 } else {
							 document.getElementById("sample6_extraAddress").value = '';
							 } */
						}
						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById("sample6_address").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sample6_detailAddress")
								.focus();
					}
				}).open();

	}
</script>

</head>
<body>
<div class="member_join_step">
    <ul>
        <li class="step01 on">
            <div class="step01_bg">
                <img src="${cPath}/resources/imgs/img/member_join_chapter01_off.png"></br>
                <span class="step_level">STEP 1</span></br>
                <span class="step_title">가입 여부 및 본인 인증</span>
            </div>
        </li> 
        <li class="step02">
            <div class="step02_bg">
                <img src="${cPath}/resources/imgs/img/member_join_chapter02_off.png"></br>
                <span class="step_level">STEP 2</span></br>
                <span class="step_title">약관 동의</span>
            </div>
        </li> 
        <li class="step03">
            <div class="step03_bg">
                <img src="${cPath}/resources/imgs/img/member_join_chapter03.png"></br>
                <span class="step_level">STEP 3</span></br>
                <span class="step_title">회원 정보 입력</span>
            </div>
        </li>
        <li class="step04">
            <div class="step04_bg">
                <img src="${cpath}/resources/imgs/img/member_join_chapter04_off.png"></br>
                <span class="step_level">STEP 4</span></br>
                <span class="step_title">가입 완료</span>
            </div>
        </li>
    </ul>
</div> 

	<div class="container">

		<h1><span class="logotext">120BPM</span></h1> <br>
		<form class="form-horizontal">
			<div class="form-group"> 
				<label class="control-label col-sm-4" ></label>
				<span>≫영소문자로 시작하는 영소문자+숫자 5~12자리 </span><br> 
				<label class="control-label col-sm-4" for="id">※아이디</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="id" name="mem_id">
				</div>
				<button class="btn" id="idck" type="button">중복확인</button>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-4" ></label>
				<span>≫영문자+숫자+특수문자 8~12자리 </span><br> 
				<label class="control-label col-sm-4" for="pwd">※비밀번호</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" id="pwd"
						name="mem_pass">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-4" for="pass">※비밀번호 확인</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" id="checkpass">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4" for="name">※이름</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" id="name" name="mem_nm">
				</div>

			</div>

			<div class="form-group">
				<label class="control-label col-sm-4" for="hp">※휴대전화번호</label>
				<div class="col-sm-2 inline-block"> 
					<select class="form-control" id="hp1" name="">
						<option value>-없음-</option>
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="012">012</option>
						<option value="019">019</option>
					</select>
				</div>-<div class="col-sm-2 inline-block"> 
				 <input type="text" class="form-control" id="hp2" name="" >
				 </div>-<div class="col-sm-2 inline-block"> 
				 <input type="text" class="form-control" id="hp3" name="" >
				</div>
				
			</div> 

			<div class="form-group" id="v">
				<label class="control-label col-sm-4" for="email">※메일주소</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" id="email1"
						name="memEmail">
				</div>
				<div class="col-sm-3">
					<select class="form-control" id="email2" name="mem_mail2">
						<option>@naver.com</option>
						<option>@daum.net</option>
						<option>@gmail.com</option>
						<option>@nate.com</option>
						<option>@hanmail.net</option>
					</select>
				</div>
			</div>


			<div class="form-group">
				<label class="control-label col-sm-4" for="zip">우편번호</label>
				<div class="col-sm-2">
					<input type="text" class="form-control" id="sample6_postcode"
						name="mem_zip" readonly="readonly"> 
				</div>
				<div class="col-sm-5">
					<input class="btn " type="button"
						onclick="sample6_execDaumPostcode()" value="검색"><br>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-4" for="zip">주소</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="sample6_address"
						name="mem_add1" readonly="readonly">
				</div>
			</div>

			<span id="guide" style="color: #999; display: none"></span>

			<div class="form-group">
				<label class="control-label col-sm-4" for="zip">상세주소</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="sample6_detailAddress"
						name="mem_add2">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-4 vertical-top" for="career">경력사항</label>
				<div class="col-sm-6">
					<textarea rows="10" id="career"></textarea>
				</div>
			</div> 
		</form> <br>
		<div class="flex-justify-center">
			<button type="submit" class="btn submit">가입</button>
		</div>
		<br><br>
	</div>
 




</body>
</html>