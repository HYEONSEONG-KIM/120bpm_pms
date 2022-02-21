<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드 예시</title>
<!-- 추가할 스크립트-->
<script src="//blueimp.github.io/JavaScript-Load-Image/js/load-image.all.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/jQuery-File-Upload-master/jQuery-File-Upload-master/js/vendor/jquery.ui.widget.js"></script>
<script src="${cPath}/resources/jQuery-File-Upload-master/jQuery-File-Upload-master/js/jquery.iframe-transport.js"></script>
<script src="${cPath}/resources/jQuery-File-Upload-master/jQuery-File-Upload-master/js/jquery.fileupload.js"></script>
<link rel="stylesheet" href="${cPath}/resources/jQuery-File-Upload-master/jQuery-File-Upload-master/css/jquery.fileupload-ui.css">
<link rel="stylesheet" href="${cPath}/resources/jQuery-File-Upload-master/jQuery-File-Upload-master/css/jquery.fileupload.css">
<script type="text/javascript" src="${cPath}/resources/jQuery-File-Upload-master/jQuery-File-Upload-master/js/jquery.fileupload-process.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- 여기까지만 추가하시면 됩니다 -->
<style type="text/css">

.box {
 width: 30%;
	background-color: #99ccff;
	
	}

 .sizeLength{
 
 }

</style>
</head>
<body>
  <!-- 파일 업로드를 위한 폼 
  버튼을 클릭하면 파일 추가를 위한 창이 열립니다 버튼 추가될 필요 없습니다.  -->
 
 
 <!-- 각자가 사용하는 폼 
ex) 일갘 추가 입력 폼
	공지사항  입력 폼
	위키 입력 폼
-->
 
 <form id="fileList" method="Post" action="${cPath }/project/${fileVO.prjctNo}/work/create/example">
		<p>
		제목
	 	<input class="form-control textTag" type="text" name="workSj" placeholder="일감 제목"/>
	</p>
  	<p>
		내용
	 	<textarea class="form-control"  name="workCn"> </textarea>
	</p> 
	
	<!--각자의 폼에 이 테이블을 넣어주면 됩니다. -->
	<table class=' template-upload fade image in'>
	<tbody class='fileSet'> 
	
	</tbody>
	</table>
	<!-- ex) 일감폼의 경우(일감제출버튼  -->
	
	<!-- 각자가 사용할 파일 menuClcode의 value를 지정하면 됩니다
	파일	FI	자유게시판	FR	이슈	IS
	회의록	MI	뉴스	NE	공지사항	NO
	프로젝트	PR	WEB_ERD	WE	작업내역	WH
	WEB_IDE	WI	위키	WK	일감	WO
	-->

	
 	
 </form>
 
 <div class="sizeLength">
 <form id="fileupload" enctype="multipart/form-data">
 <span class="btn btn-success fileinput-button">
  <i class="glyphicon glyphicon-plus"></i>
     <span>파일 선택</span>
	<input name="files" type="file" multiple="multiple"  />
	</span>
	<input type="hidden" value="WO" name="menuClCode">
</form> 

</div>




<button class="btn insertBtn">제출</button>
 <script type="text/javascript">
 
 <!-- 파일 업로드를 위한 변수 설정-->
 let uploadForm = $("#fileupload")[0];
 let fileSet = $(".fileSet");
 let fileArea = $("#fileArea");  
 let tbody = $(".fileSet");
  
 $(".insertBtn").on("click" , function(){
	 $("#fileList").submit();
	 
 })
 
 
 // 파일 업로드를 위한  url 변경 마시오 

 // 파일 업로드를 위한  url 변경 마시오 

 	$("#fileupload").fileupload({
	 		url:  "${pageContext.request.contextPath }/project/${fileVO.prjctNo}/file/fileUpload",
			autoUpload: true,
			sequentialUploads: true,
			dataType: 'json',
			add: function(e, data){
				 var isValid = true;
				 var uploadFile = data.files;
				// console.log(uploadFile[0].size)
				 let maxsize =  5 * 1024 * 1024; //임의로 지정해뒀습니다. 필요 없으실 경우 data.submit()만 해도 됩니다
				   if(uploadFile[0].size > maxsize){
						swal({
							title : "잘못된 요청입니다!",
							text : '각 파일 용량은 5메가를 초과할 수 없습니다.',
							icon : "error",
						});
					 
					 isValid = false;
				 }  
				  if (isValid) {
			          data.submit();
				}    
			 }, progressall: function(e,data) {
			        var progress = parseInt(data.loaded / data.total * 100, 10);
			        $('#progress .bar').css(
			          'width',
			          progress + '%'
			        );
			      }, done: function (e, data) {
			    	  trTags = [];
			    	 let fileList  = data.result.files[0];
			 			 $(fileList).each(function(index, file){
			 				trTags.push(makeFileBtn(file));
			 			 });
			 		  
			 			fileSet.append(trTags);//여기서 테이블에 넣어주고 있습니다
			 		  	 
			      }, fail: function(e, data){
			        alert('서버와 통신 중 문제가 발생했습니다');
			        foo = data;
			      }
			    });
			  
			
 	
 function makeFileBtn(file){
 /*
 생성될 경우 넘겨질 vo의 수를 증가 시켜줌
 */
 			  if( $("tr").hasClass("fileName")==true){
 				  
 				 let fileName = $(".fileName").last();
 				 
 				 let no =	parseInt($(fileName).data("no")) +1 ;
 /*
 workFileList는 workVO에 파일을 담기위해 추가한 workFile을 담기위한 List 입니다.
 workFileList 는 각자의 파일 명을 담는 VO의 파일 명 변수 를 입력하시면 됩니다  
 workFileList[" + no +"].workFileSavedNm" 
.workFileSavedNm 의 명은 각 파일 vo의 변수명을 의미합니다 저장명과 파일이름 파일 저장 일자 삭제 여부 그리고 테이블에는 없지만 TEMP 여부를 담을 변수명을추가해주세요h
 				 
 $("<input type='hidden'>").prop("name","workFileList[" + no +"].workFileSavedNm").prop("value", file.fileSavedNm)
 */
 				return	$("<tr class='fileName'>").append(
 						$("<span >").html(file.fileNm)
 								   .append(
 						 $("<input type='hidden'>").prop("name","workFileList[" + no +"].workFileSavedNm").prop("value", file.fileSavedNm), 
 						 $("<input type='hidden'>").prop("name","workFileList[" + no +"].workFileNm").prop("value", file.fileNm),
 						 $("<input type='hidden'>").prop("name","workFileList[" + no +"].workFileRgsde").prop("value", file.fileRgsde),
 						 $("<input type='hidden'>").prop("name","workFileList[" + no +"].workFiletempAt").prop("value",'0').prop("class" , "workFiletempAt"), //이대로 업데이트 시 템프파일 아님으로 업데이트 됨
 						 $("<input type='hidden'>").prop("name","workFileList[" + no +"].workFileDelAt").prop("value",'0').prop("class" , "workFileDelAt")
 								   ).append(
 										   $("<button type='button' >").prop("class","deleteBtn").append("<i class='glyphicon glyphicon-ban-circle'></i>")
 								   	)
 								).data("no" ,  no);
 			  
 			  }else{
 				 return	$("<tr class='fileName'>").append(
 						$("<span >").html(file.fileNm)
 								   .append(
 						 $("<input type='hidden'>").prop("name","workFileList[0].workFileSavedNm").prop("value", file.fileSavedNm).prop("id" , file.fileSavedNm), 
 						 $("<input type='hidden'>").prop("name","workFileList[0].workFileNm").prop("value", file.fileNm),
 						 $("<input type='hidden'>").prop("name","workFileList[0].workFileRgsde").prop("value", file.fileRgsde),
 						 $("<input type='hidden'>").prop("name","workFileList[0].workFiletempAt").prop("value",'0').prop("class" , "workFiletempAt"),
 						 $("<input type='hidden'>").prop("name","workFileList[0].workFileDelAt").prop("value",'0').prop("class" , "workFileDelAt")
 								   ).append(
 										   $("<button type='button'>").prop("class","deleteBtn").append("<i class='glyphicon glyphicon-ban-circle'></i>")
 								   	)
 								).data("no" , "0")
 			 		}
 			  }
 			
 			  
  	$(tbody).on("click", ".deleteBtn" , function(){
  			console.log($(this).parents("tr")[0])
  		 let  value = $(this).parents("tr")[0]
  		 $(value).find(".workFiletempAt").val("1") //템프파일 여부 1 로 변경하여 템프 파일으로 설정함
  		 $(value).find(".workFileDelAt").val("1") // 파일 삭제 여부를 1로 변경하여 파일 삭제된 파일로 설정함
 		 $(value).attr('style', "display:none;");

  	});
 		  
  	
 </script>
 
 
 
</body>
</html>