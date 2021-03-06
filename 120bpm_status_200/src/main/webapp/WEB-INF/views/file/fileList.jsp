<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
 <!DOCTYPE html>
<html>
<head> 
<script type="text/javascript" src="${cPath }/resources/js/jquery-3.6.0.min.js"></script>

<!-- 추가할 스크립트-->
<script src="//blueimp.github.io/JavaScript-Load-Image/js/load-image.all.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/jQuery-File-Upload-master/jQuery-File-Upload-master/js/vendor/jquery.ui.widget.js"></script>
<script src="${cPath}/resources/jQuery-File-Upload-master/jQuery-File-Upload-master/js/jquery.iframe-transport.js"></script>
<script src="${cPath}/resources/jQuery-File-Upload-master/jQuery-File-Upload-master/js/jquery.fileupload.js"></script>
<link rel="stylesheet" href="${cPath}/resources/jQuery-File-Upload-master/jQuery-File-Upload-master/css/jquery.fileupload-ui.css">
<link rel="stylesheet" href="${cPath}/resources/jQuery-File-Upload-master/jQuery-File-Upload-master/css/jquery.fileupload.css">
<script type="text/javascript" src="${cPath}/resources/jQuery-File-Upload-master/jQuery-File-Upload-master/js/jquery.fileupload-process.js"></script>
<!-- 여기까지만 추가하시면 됩니다 -->

<!-- 팬시트리용 -->
<script type="text/javascript" src="${cPath}/resources/js/fancytree/jquery.fancytree-all-deps.min.js"></script>
<!--  팬싵트리 디자인 여러개 넣을 경우 충돌 남 사용할 것만 넣는것이 중요-->
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery.fancytree/2.38.0/skin-bootstrap/ui.fancytree.min.css" integrity="sha512-ZNPDR7ghmCig7eBuBHYMFeJix4+wxZ37Ky5RmhU/CbpzATUO2sLhB5HJaRCWirl7YHJDQvmE3rbf4FOQOttygg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
 
 <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.fancytree/2.6.0/src/jquery.fancytree.filter.js"></script>
 <link rel="stylesheet"
    href="//cdnjs.cloudflare.com/ajax/libs/jquery-contextmenu/2.2.3/jquery.contextMenu.min.css" />
  <script src="//cdnjs.cloudflare.com/ajax/libs/jquery-contextmenu/2.2.3/jquery.contextMenu.min.js"></script>
 
 <!-- 팬시트리 ui 메뉴 삭제 -->
 <script type="text/javascript"	src="${cPath }/resources/js/jquery.form.min.js"></script>
 
 
 
 <link rel="stylesheet" href="${cPath}/resources/css/commons.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

.cost {
 
	display: grid;
	 grid-template-columns: 45% 55%;
}
 
 ul.fancytree-container {
  /*   width: 400px; */
    height: 590px;
    overflow: auto;
    position: relative;
  }
 

span.fancytree-title {
    width: 300px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}

.sizing{
overflow:auto;
height: 100px;
 background: white;
}
.detalSizing{
overflow:auto;
height: 460px;
}
 div#tree {
    /* width: 90%; */
    padding: 10px;
    margin: 10px 0;
    border: 1px solid 1px solid rgba(0,0,0,.12);
    box-shadow: 0 2px 2px 0 rgba(0,0,0,.14),0 3px 1px -2px rgba(0,0,0,.2),0 1px 5px 0 rgba(0,0,0,.12);
  }
  
    table.fancytree-container {
    table-layout: fixed;
    outline: 0;  /* No focus frame */
  }
  
  #tree{
  font-size: 1.2em;
  }
  
  .fileList{
  display: none;
  }
  
  .fontbigger{
  
  font-size: 15px;
  font-weight: 600;
  margin-top : 7px;
 
  }
 
 
.uploadDiv{
 display: flex;
  
  justify-content: flex-end;
  	/* display: grid;
	 grid-template-columns: 30% 25%; */
  
}
#fileupload{
width: 150px;

}
#saveBtn{
float: right;
}

 
  ul.ui-effects-placeholder { width:10px !important; }
 .fileSet{
background-color: white;

}
 .fileName{
grid-template-columns: 1fr 1fr;
display: grid ;
 }
 
#detailInfo{
background-color: white;
/* box-shadow:0 4px 10px 0 rgba(0,0,0,0.2),0 4px 20px 0 rgba(0,0,0,0.19); */
/*  height: 480px; */
}
 
i{
margin: 1%;
} 
/* .info{position:relative} */
#fileSaveNm{
font-size: 1.2em;
font-weight: 600;
}
#boLink{
cursor: pointer;
}

#detailInfo{
font-size: 1.2em;
}

#modiArea{
display: none;
}

th{
background-color: #F0F9FC;
width: 150px;
}
 

.smaller{
font-size: 13px;
cursor: default;
}

 .infomodi{
 
 margin-left:-1;
 margin-right:-1;
 
 }
 
#update{
width: 100px;
}
#delete{
width: 100px;
}
#downLoadAll{
width: 140px;
font-size: 15px;
}

.fileinput-button{
width: 140px;
font-size: 15px;
}

#downOne , #downLoadAll{
width: 140px;
border: 1px solid gray;

}

h5{
font-size: small;
}
h4{
font-size: 1.2rem;
}

.allArea{
display: grid;
 grid-template-columns: 30% 30%;
}

#deleteAll{
margin-left: 10px;
}
 .x_title{
display: grid;
 grid-template-columns: 40% 60%;

}
 
 .x_title span{
  
color: white;
 }
 #fileSearch{
 width: 50%;
 }
</style>
</head>
<body>
<c:if test="${not empty message }">
	<script type="text/javascript">
		Swal.fire({
			 title: "잘못된 요청입니다!",
			  text:  "${message }",
			  icon: "error",
			  button: "OK",
			}) 
		
	</script>
</c:if>
<c:if test="${not empty success }">
	<script type="text/javascript">
		Swal.fire({
			 title: "파일추가가 성공했습니다",
			  text:  "${success }",
			  icon: "success",
			  button: "OK",
			}) 
	</script>
</c:if>

<c:if test="${not empty downLoadFail }">
	<script type="text/javascript">
		Swal.fire({
			 title: "파일 다운로드 실패",
			  text:  "${downLoadFail}",
			  icon: "error",
			  button: "OK",
		}) 
 <% session.removeAttribute("downLoadFail"); %>
	</script>
 </c:if>
<security:authentication property="principal.adaptee" var="authMember" />
<h1 class='menuName' style = "text-align: left; font-weight: bold;"><i class="fa fa-files-o" aria-hidden="true"></i>&nbsp; &nbsp;파일 리스트</h1>
<hr>
 <div class="cost">
 	<div class="fileLeft" id="searchArea">
	<div class="input-group">
 	 <label class="fontbigger">검색 &nbsp; &nbsp; &nbsp; </label>
     <div class="input-group-prepend">
    <input name="search" placeholder="파일명" id="fileSearch" class="form-control" autocomplete="off">
     <button id="btnResetSearch" class="resetBtn btn"><img class="resetImg" src="${cPath}/resources/imgs/img/reset.png"></button>
     <button class="btn btn-light btn-sm" id="allExpand" onclick="openExpand()">전체열기</button>
   	<button class="btn btn-secondary btn-sm" id="allCollapse">전체접기</button>
    </div>
 	</div>
   
  	  
    <span id="matches"></span>
  
  
 	<div id="tree" ></div>
  
 <div class="allArea">
 	 <button id="downLoadAll" class="btn btn-light">선택 다운로드<i class="fa fa-download" aria-hidden="true"></i></button>
	 <button id="deleteAll" class="btn deleteBtn">선택 삭제<i class="fa fa-trash-o" aria-hidden="true"></i></button>
 </div>
 	</div>

 	<div class="fileRight">
 <div class="x_panel">
 <div class="x_title">  
				<h4>파일 상세 정보</h4>
			</div>
 	<div  class=" x_content">
 <div id="detailInfo detalSizing">
 		 <div class="info">
 		 
           
          
          
          <table class="table">
          	<tr>
          	<th>
          	  파일명
          	</th>
          		<td>
          		 <h2>      
            <span class="fileNm">파일 명
            </span>
               </h2> 
          		
          		</td>
          		 
          	</tr>
          
          	<tr>
          		<th>
          		<i class="fa fa-user" aria-hidden="true"></i>업로더
          		</th>
          		<td>
          		 <span id="memName" class="values">업로더</span>
          		</td>
          	</tr>
			<tr>
				<th><i class="fa fa-briefcase" aria-hidden="true"></i>프로젝트 명 </th>
				<td><span id="prjctNm" class="values">프로젝트 명</span></td>
			</tr>          	
			<tr>
				<th><i class="fa fa-file-o" aria-hidden="true"></i>파일크기</th>
				<td><span id="fileSizeStr" class="values">파일 크기</span></td>
			</tr>          	
			<tr>
				<th><i class="fa fa-calendar" aria-hidden="true"></i>파일 등록일자</th>
				<td> <span id="fileRgsde" class="values">파일 등록일자</span></td>
			</tr>          	
			<tr>
				<th><i class="fa fa-link" aria-hidden="true"></i>
				링크</th>
				<td> <p class="link"><span id="boLink" class="controlBtn values">링크 이동</span>
				<span class="smaller">(파일 폴더의 경우 이동할 수 없습니다)</span>
				</p></td>
			</tr> 
			         	
          </table>
          </div>
        	 
          		 
          		
            	<button class=" btn btn-defalut" id="downOne" >다운로드 <i class="fa fa-download" aria-hidden="true"></i></button>
          		<button class=" btn updateBtn" id="update" >수정 <i class="fa fa-pencil-square-o" aria-hidden="true"></i> </button>
            	<button id="delete" class="  fileNo btn  deleteBtn">삭제 <i class="fa fa-trash-o" aria-hidden="true"></i></button>
   <div id="modiArea">
    <div class="input-group " >
  <input type="text" class="form-control" name="fileNm"  id="fileName"   aria-describedby="basic-addon2">
  <div class="input-group-append">
  			<button class="btn btn-outline-secondary infomodi" id="modify" type="button">저장</button>
		    <button class="btn btn-outline-secondary infomodi" id="goBack" type="button">취소</button>
  	</div>
        </div>
   </div>
          	 
   			<form method="post" id="ModifyForm" action="${cPath }/project/${pCode }/file/modify">
   				<input type="hidden"  name="fileNo" >
   				<input type="hidden" name="fileNm">
   				<input type="hidden" name="memId">
   				<input type="hidden" name="menuClCode" class="menuClCode">
   				<input type="hidden" name="reFileNm">
   			</form>

   			<form method="post" id="deleteForm" action="${cPath }/project/${pCode }/file/remove">
   				<input type="hidden" name="fileNos" id="fileNos">
   				<!-- <input type="text" id="delmemId" name="memId" > -->
   			<!-- 	<input type="text" name="menuClCodes[]"  class="menuClCode"> -->
   			</form>
         
        </div>
      </div>
 </div>
     


	<div class="FormArea">
		<!-- 	<table class=' template-upload fade image in'>
			<tbody class='fileSet'> 
			</tbody>
			</table> -->
			<div   class='x_panel template-upload fade image in' > 
			<div class="x_title">  
				<h4>저장할 파일</h4> 
				  <div class="uploadDiv">
<form id="fileupload" enctype="multipart/form-data">
 <span class="btn btn-success fileinput-button">
  <i class="glyphicon glyphicon-plus"></i>
     <span class="addFile">파일 추가</span><!--  onclick="clearThis()" -->
	<input name="files" type="file"  id="fileUploadBtn" multiple="multiple"   />
	</span>
	<!-- 각자가 사용할 파일 menuClcode의 value를 지정하면 됩니다-->
	<input type="hidden" value="FI" name="menuClCode">
 </form>

</div>  
				
			</div>
					<div class="clearfix"></div>
		   <form:form commandName="file" id="fileForm"  method="Post" action="${cPath }/project/${pCode}/file/create">
		   <div class="sizing">
					<div  class="x_content fileSet"  style="display: block;">
					
					</div>	
			</div>
		  </form:form>
			<div>
			    <button type="button" class="btn insertBtn" id="saveBtn">저장</button>	
			</div>
			</div>
			
			<!-- ex) 일감폼의 경우(일감제출버튼  -->
		
 		</div>



      </div>
      
  	
	 
     		  		
  </div>
 		 


 
		
	
		<div>
  
  
  </div>
  
  
   
  <form id="filesDownForm" method="post" action="${cPath}/project/${pCode}/file/down/zip">
	  		<input type="hidden" name="files" id="downLoadFiles"  >	
	   </form>
 
 


<script type="text/javascript">
var allExpand = $("#allExpand")
var allCollapse = $("#allCollapse");

 
 $("#boLink").on("click" , function(){
	
		let gopage = $(this).data("gopage");
		if(gopage){
			location.href ="${cPath}" +  gopage
		}
	 
	
});
  

 function showArea(){
	 $(".FormArea").show();
	 $("#saveBtn").show(); 
 }

 
$("#saveBtn").on("click" , function(){
	$("#fileForm").submit();
})

 function openExpand(){
	$.ui.fancytree.getTree("#tree").expandAll(true);
}

$(allExpand).on("click" , function(){
	$.ui.fancytree.getTree("#tree").expandAll(true);
})

$(allCollapse).on("click" , function(){
	 $.ui.fancytree.getTree("#tree").expandAll(false);
})
//===============================================================

	
 $("#downOne").on("click" , function(){
	 let target = $(this);
	  var url = $(target).data("downCode") 
     if(url){
    	 location.href= url;
     }
 
}) 

	
	
var glyph_opts = {
		 preset: "bootstrap3",// 팬시트리의 디자인 옵션을 부트스트랩의 아이콘으로 변경
	        	 map: {  
	        	  _addClass: "glyphicon",
	        	  checkbox: "glyphicon-unchecked",
	        	  checkboxSelected: "glyphicon-check",
	        	  checkboxUnknown: "glyphicon-expand",  // "glyphicon-share",
	        	  dragHelper: "glyphicon-play",
	        	  dropMarker: "glyphicon-arrow-right",
	        	  error: "glyphicon-warning-sign",
	        	  expanderClosed: "glyphicon-chevron-right",  // glyphicon-plus-sign
	        	  expanderLazy: "glyphicon-chevron-right",  // glyphicon-expand
      	          expanderOpen: "glyphicon-chevron-down",
	        	  loading: "glyphicon-refresh fancytree-helper-spin",
	        	  nodata: "glyphicon-info-sign",
	        	  noExpander: "",
	        	  radio: "glyphicon-remove-circle",  // "glyphicon-unchecked",
	        	  radioSelected: "glyphicon-ok-circle",  // "glyphicon-check",
	        	  // Default node icons.
	        	  // (Use tree.options.icon callback to define custom icons based on node data)
	        	  doc: "glyphicon-file",
	        	  docOpen: "glyphicon-file",
	        	  folder: "glyphicon-folder-close",
	        	  folderOpen: "glyphicon-folder-open"  
	        	}
}


$(function(){
	
	var tree = $("#tree").fancytree("getTree");
	
	$("#tree span.fancytree-title").tooltip(); //어댑터에서 tooltip을 타이틀로 설정해줬음 
	
	
	 $("input[name=search]").on("focus", function(e){
			$.ui.fancytree.getTree("#tree").expandAll(true);
	 })
	 
	 $("input[name=search]").on("focusout", function(e){
			$.ui.fancytree.getTree("#tree").expandAll(false);
	 })
	 
	 
	 
	 $("input[name=search]").on("keyup", function(e){
	      	var n,
	        tree = $.ui.fancytree.getTree(),
	        args = "autoApply autoExpand fuzzy hideExpanders highlight leavesOnly nodata".split(" "),  
	        opts = {},
	        filterFunc = $("#branchMode").is(":checked") ? tree.filterNodes : tree.filterNodes,
	        match = $(this).val();
			
			opts.mode = "hide"
	      if(e && e.which === $.ui.keyCode.ESCAPE || $.trim(match) === ""){
	        $("button#btnResetSearch").click();
	        return;
	      }
	      
	      var rex = new RegExp(match , "i"); //검색창의 값과 일치하는 노드 있는지 확인

	      $.ui.fancytree.getTree("#tree").filterNodes(function(node) {
	    	 n  =  filterFunc.call(tree, match, opts);
	        return rex.test(node.title) ;
	      });
	  
	     
	   
	     //리셋버튼 가능하도록 만들고 
	     $("button#btnResetSearch").attr("disabled", false);
	      $("span#matches").text("(" + n + " matches)"); //일치하는 수를 형성함
	    }).focus();

	    $("button#btnResetSearch").click(function(e){
	      $("input[name=search]").val("");
	      $.ui.fancytree.getTree("#tree").expandAll(false);
	      $("span#matches").text("");
	      
	      tree.clearFilter(); //검색창 초기화 
	    }).attr("disabled", true);

	   
	 //   $.ui.fancytree.getTree("#tree").expandAll(true);
	   
	   
})
	  let fileNm = "";
		 
///============================================
	  //강제 클릭 이벤트
	 let authMember = "${authMember.memId}"
	$("#tree").fancytree({
		  checkbox: true,
		  selectMode :3, //여러개 선택가능하도록 
		  autoScroll: true,
		  autoActivate: true, // Automatically activate a node when it is focused (using keys).
		  extensions: ["filter" , "glyph" ],
		  quicksearch: true,
		  expand: true,
	      glyph:  glyph_opts,  //아이콘 새롭게 만들기 
	        source:{
	    		url:location.pathname,
	    		cache:true,
	    	} 
	    	,tooltip: function(event, data) { //툴팁 adaptee에서 title 로 설정해줬음
	    	    
    	      },
	    	lazyLoad: function(event, data){
		      var node = data.node;
		      data.result = {
		    	url: location.pathname,
		        data: {clCode:node.key},
		        expanded:true,
		        cache: false
		      };
		  
		} , 
			activate: function(event, data){
		     var node = data.node;
			 var attatch = node.adaptee;
		 		
		    },
		    click : function(event, data){
		    	 var node = data.node;
		    	 
				if( !data.node.isFolder() ){
				 console.log(node.data.adaptee);
				 var fileInfo = node.data.adaptee;
				 for(let prop in fileInfo){
				 	if(prop=="boLink"){
				 		if(fileInfo['menuClCode']=="FI"){
				 			$(".link").hide();
				 		}else{
				 			$(".link").show();
					 		$("#boLink").data("gopage" , fileInfo[prop]);
					 		$("#boLink").prop("class" , fileInfo['menuClCode']);
				 		}
				 	}else{
					    $("#" + prop).text(fileInfo[prop]);
					    //$("#fileName").text(fileInfo['fileNm'])
					    $(".fileNm").text(fileInfo['fileNm'])
					    $("#fileName").val(fileInfo['fileNm'])
					    $("#modiArea").hide();	
					    $("input[name='fileNm']").val(fileInfo['fileNm'])
					   	fileNo =  fileInfo['fileNo']
					    console.log(fileNo)
					       $("#downOne").data("downCode" ,"${cPath}/project/${pCode}/file/down/"+fileNo )
						fileNm  = fileInfo['fileNm'];
					    var ownerId =fileInfo['memId']
					    if(ownerId==authMember){
					    	$("#update").data('fileNo' , fileInfo['fileNo']);
					    	$("#delete").data('fileNo' , fileInfo['fileNo']);
					    	//$(".")
					    	$("#update").show();
					    	$("#delete").show();
					    	
					    	$("input[name='fileNo']").val(fileInfo['fileNo']);
						 	$("input[name='menuClCode']").val(fileInfo['menuClCode']);
						 	 
						 	$(".fileNo").data("memId" , fileInfo['memId']);
					    }else{
					    	$("#update").hide();
					    	$("#delete").hide();
					    }
					  
						 
				 	}
				 }         
			  }//if 폴더의 경우
				 
		    },
		    filter: {
		    	 autoApply: true,   // Re-apply last filter if lazy data is loaded
		         autoExpand: true, // 포함하는 거 있을 경우 자동으로 열기
		         counter: true,     // Show a badge with number of matching child nodes near parent icons
		         fuzzy: false,      // Match single characters in order, e.g. 'fb' will match 'FooBar'
		         hideExpandedCounter: true,  // Hide counter badge if parent is expanded
		         hideExpanders: false,       // Hide expanders if all child nodes are hidden by filter
		         highlight: true,   // Highlight matches by wrapping inside <mark> tags
		         leavesOnly: false, // Match end nodes only
		         nodata: true,         // Display a 'no data' status node if result is empty
				 mode: "hide"       // Grayout unmatched nodes (pass "hide" to remove unmatched node instead)
				// mode: "dimm"       // Grayout unmatched nodes (pass "hide" to remove unmatched node instead)
			},
			select :function(event , data){
 					if(data.node.folder==true){
 						// data.node.setExpanded(true);
 						 var node = data.node;
 						var selRootNodes = data.tree.getSelectedNodes(true);
 				        // ... and convert to a key array:
 				        var selRootKeys = $.map(selRootNodes, function(node){
 				        	console.log(node.key)
 				          return node.key;
 				        });
 			 
						}
 				}  ,loadChildren: function(event, data) { //자식 요소들이 로드 된 다음 열었다가 다 닫게 함
 				  //이유 ---> 지금 sql 맵이 clCode 가 비어있을 경우 menu 만 가져옴 --> 이 경우 폴더에서 체크를 클릭했을 때 안에 있는 파일에 대한 데이터는 비어있는 상태라서 체크가 안됨
 					 $("#allExpand").trigger("click");
 					 $("#allCollapse").trigger("click");
 				  }
 				    
			});	//닫기
  	
		let fileExtense ="";
	//=======================================
		$("#update").on("click" , function(evnet){
			var fileNo = $(this).data("fileNo")
			console.log(fileNo)
			if(fileNo){
				$("#modiArea").show();
				 var modiName = $("#fileName").val()
				 var fileLen = modiName.length;
				 var lastDot = modiName.lastIndexOf('.');
				 var onlyFileName = modiName.substring(fileName,lastDot);
				 fileExtension = modiName.substring(lastDot,fileLen);
				 $("#fileName").val(onlyFileName);
				 
			 	/*  ModifyForm.find("input[name='fileExtense']").val(fileExtension) */
				/*  console.log("파일명만" + onlyFileName )
				 console.log("확장자만" + fileExtension ) */
			 } 
				event.preventDefault()
		})
			
		
  
		$("#modify").on("click" , function(event){
			 var modiName = $("#fileName").val();
			 console.log(modiName)
			/*  var fileExtension = ("input[name='fileExtense']").val(); */  
			 modiName =	modiName.trim();
			 modiName = modiName.replace(/(\s*)/g, '')
			 if(modiName.length>0){	
			 modiName = modiName+fileExtension
			 ModifyForm.find("input[name='reFileNm']").val(modiName)
			 ModifyForm.submit();
				 
			 }else{
				 Swal.fire({
					 title: "파일명 변경 실패 ",
					  text:  "필수 데이터가 입력되지 않았습니다",
					  icon: "error",
					  button: "OK",
				}) 
			 }
			
			 
		});
	
	
	 $("#delete").on("click" , function(){
					
			var fileNo = $(this).data("fileNo")
			if(fileNo){
				$("#fileNos").val(fileNo);
				//$("#delmemId").val("${authMember.memId}")
				//$("#deleteForm").submit();
				console.log(fileNo)
				
				  Swal.fire({
				             title: '삭제하시겠습니까?',
				             text:  "파일을 삭제하시겠습니까? 삭제한 파일은 복구할 수 없습니다",
				             icon: 'warning',
				             showCancelButton: true,
				             confirmButtonColor: '#3085d6',
				             cancelButtonColor: '#d33',
				             confirmButtonText: '삭제',
				             cancelButtonText: '취소'
				         }).then((result) => {
				             if (result.isConfirmed) {
				            	 $(deleteForm).submit();
				             }
				         })
				
			}
		})
	
		
		
 
	$("#goBack").on("click" , function(){
		
		$("#fileName").val(fileNm);
		$("#modiArea").hide();
	})		
			
	var	deleteForm = $("#deleteForm").ajaxForm({
		 dataType :"text",
		 success: function(resp){
			 if(resp=="OK"){
				 
				 Swal.fire({
					 title: "파일 삭제 성공",
					  text:  "파일이 성공적으로 삭제되었습니다",
					  icon: "success",
					  button: "OK",
				 }).then(function(){
					 jQuery.ui.fancytree.getTree("#tree").reload();
					 $("#deleteForm").hide();
					 ModifyForm.get(0).reset();
					 deleteForm.get(0).reset(); 
			    });
			
			 }else if(resp=="BLANKDATA"){
					Swal.fire({
						 title:  "파일 삭제 실패 ",
						  text:  "필수 데이터가 등록되지 않았습니다",
						  icon:  "error",
						  button: "OK",
					}) 
			 }else{
					Swal.fire({
						 title: "파일명 변경 실패 ",
						  text:  "서버 오류입니다 잠시 후 다시 시도하세요",
						  icon: "error",
						  button: "OK",
					}) 
			  }
		 	}
	 	});			 
				
 ///========================
 var ModifyForm= $("#ModifyForm").ajaxForm({
	 dataType :"text",
	 success: function(resp){
		 if(resp=="OK"){
			 
			 Swal.fire({
				 title: "파일명 수정 성공",
				  text:  "파일명이 성공적으로 수정되었습니다",
				  icon: "success",
				  button: "OK",
			 }).then(function(){
				 jQuery.ui.fancytree.getTree("#tree").reload();
				 $("#modiArea").hide();
				 ModifyForm.get(0).reset();
				 deleteForm.get(0).reset(); 
		    });
		
		 }else if(resp=="BLANKDATA"){
				Swal.fire({
					 title: "파일명 변경 실패 ",
					  text:  "필수 데이터가 등록되지 않았습니다",
					  icon: "error",
					  button: "OK",
				}) 
		 }else{
				Swal.fire({
					 title: "파일명 변경 실패 ",
					  text:  "서버 오류입니다 잠시 후 다시 시도하세요",
					  icon: "error",
					  button: "OK",
				}) 
		  }
	 	}
 	});			 
			
 //================================================
	 var filesDownForm = $("#filesDownForm")
	 var fileNos = $("#fileNos")
	 var send = false;
 	 var fileSize = 0 ; 
 	 
 	  
 	 
 	 $("#deleteAll").on("click" , function(){
 		 var trees =	 $.ui.fancytree.getTree("#tree")
		 var selectItems = [];
 		 var authId =  "${authMember.memId}";
 		 var fileNM = "";
		  $(trees).each(function(index, item){
		  			var selKeys = $.map(item.getSelectedNodes(), function(node){
					 var adaptee =node.data.adaptee;
					  
					 if(adaptee.fileNo!=null){
					 	 if(adaptee.memId==authId){
					 		selectItems.push(adaptee.fileNo);
					 	 }else{
					 		fileNM +=adaptee.fileNm + " , "
					 	 }
					 }
				})
					 
			});//for문 끝
			
			
			if(selectItems.length>0){
				if(fileNM!=null && fileNM.length>0){
					  Swal.fire({
				             title: '삭제하시겠습니까?',
				             text:  "삭제권한이 없는 " +fileNM + "을 제외한 파일을 삭제하시겠습니까? 삭제한 파일은 복구할 수 없습니다",
				             icon: 'warning',
				             showCancelButton: true,
				             confirmButtonColor: '#3085d6',
				             cancelButtonColor: '#d33',
				             confirmButtonText: '삭제',
				             cancelButtonText: '취소'
				         }).then((result) => {
				             if (result.isConfirmed) {
				            	 $("#fileNos").val(selectItems)
				            	 $(deleteForm).submit();
				            	 $("#deleteAll").prop("disabled") 
				             }
				         })
					
				}else{
					 Swal.fire({
			             title: '파일을 삭제하시겠습니까?',
			             text:  "삭제한 파일은 복구할 수 없습니다",
			             icon: 'warning',
			             showCancelButton: true,
			             confirmButtonColor: '#3085d6',
			             cancelButtonColor: '#d33',
			             confirmButtonText: '삭제',
			             cancelButtonText: '취소'
			         }).then((result) => {
			             if (result.isConfirmed) {
			            	 $("#fileNos").val(selectItems)
			            	 $(deleteForm).submit();
			             }
			         })
					
					
				}
			}else{
				 send = false;
				 Swal.fire({
					 title: "선택 파일 없음",
					  text: "선택된 파일이 존재하지 않습니다.",
					  icon: "error",
					  button: "OK",
					}) 
			}
		 
		   
		  
 		 
 	 })//전부 삭제 처리
 	 
	 $("#downLoadAll").on("click" , function(){
		 var trees =	 $.ui.fancytree.getTree("#tree")
		 var selectItems = [];
		  $(trees).each(function(index, item){
		  		var selKeys = $.map(item.getSelectedNodes(), function(node){
					 //console.log(node.key)//WO
					// console.log(node.data.adaptee)	
					 var adaptee =node.data.adaptee;
					  
					 if(adaptee.fileNo!=null){
					 	fileSize += adaptee.fileSize;
					 	selectItems.push(adaptee.fileNo);
					 }
				})
					 
			});  //for문  tree 부분 끝
		if(selectItems.length>0){
			  if(fileSize>=104857600){//
				  Swal.fire({
						 title: "최대 크기 초과",
						  text: "100메가 이상의 파일은 개별 다운로드해야합니다",
						  icon: "error",
						  button: "OK",
						}) 
				
				}else{
					  send = true
					if(selectItems.length==1){
						location.href="${cPath}/project/${pCode}/file/down/"+selectItems[0]
					}else{
						$("#downLoadFiles").val(selectItems);
			 				  if(send == true){
							  $("#filesDownForm").submit();
			 				}  
					}
					
				}  
		}else{
			 send = false;
			 Swal.fire({
				 title: "선택 파일 없음",
				  text: "선택된 파일이 존재하지 않습니다.",
				  icon: "error",
				  button: "OK",
				}) 
		}
			
		
		  
	 }); 
		  
		
		  
				
	 
 //================================================
 
let uploadForm = $("#fileupload")[0];
let fileSet = $(".fileSet");
let fileArea = $("#fileArea");  
let tbody = $(".fileSet");
 
// 파일 업로드를 위한  url 변경 마시오 

 	$("#fileupload").fileupload({
	 		url:  "${pageContext.request.contextPath }/project/${pCode}/file/fileUpload",
			autoUpload: true,
			sequentialUploads: true,
			dataType: 'json',
			add: function(e, data){
				 var isValid = true;
				 var uploadFile = data.files;
				 if(uploadFile.size > 5000000){
					 alert('파일 용량은 5메가를 초과할 수 없습니다.');
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
if( $("h5").hasClass("fileName")==true){
	 				  
	 				 let fileName = $(".fileName").last();
	 				 
	 				 let no =	parseInt($(fileName).data("no")) +1 ;
	 /*
	 workFileList는 workVO에 파일을 담기위해 추가한 workFile을 담기위한 List 입니다.
	 workFileList 는 각자의 파일 명을 담는 VO의 파일 명 변수 를 입력하시면 됩니다  
	 workFileList[" + no +"].workFileSavedNm" 
	.workFileSavedNm 의 명은 각 파일 vo의 변수명을 의미합니다 저장명과 파일이름 파일 저장 일자 삭제 여부 그리고 테이블에는 없지만 TEMP 여부를 담을 변수명을추가해주세요h
	 				 
	 $("<input type='hidden'>").prop("name","workFileList[" + no +"].workFileSavedNm").prop("value", file.fileSavedNm)
	 */
	 				return	$("<h5 class='fileName'>").append(
	 						$("<span >").html(file.fileNm+ " &nbsp; &nbsp;")
	 								   .append(
	 						$("<input type='hidden'>").prop("name","attatchList[" + no +"].fileSavedNm").prop("value", file.fileSavedNm).prop("id" , file.fileSavedNm), 
	 						 $("<input type='hidden'>").prop("name","attatchList[" + no +"].fileRgsde").prop("value", file.fileRgsde),
	 						 $("<input type='hidden'>").prop("name","attatchList[" + no +"].tempAt").prop("value",'0').prop("class" , "attatchtemptAt") //이대로 업데이트 시 템프파일 아님으로 업데이트 됨
	 								   ).append(
	 										   $("<button type='button' >").prop("class","deleteBtn").append("<i class='glyphicon glyphicon-ban-circle'></i>")
	 								   	)
	 								).data("no" ,  no);
	 			  
}else{
	 				 return	$("<h5 class='fileName'>").append(
	 						$("<span >").html(file.fileNm+ " &nbsp; &nbsp;")
	 								   .append(
	 					     $("<input type='hidden'>").prop("name","attatchList[0].fileSavedNm").prop("value", file.fileSavedNm).prop("id" , file.fileSavedNm), 
	 						 $("<input type='hidden'>").prop("name","attatchList[0].fileRgsde").prop("value", file.fileRgsde),
	 						 $("<input type='hidden'>").prop("name","attatchList[0].tempAt").prop("value",'0').prop("class" , "attatchtemptAt")
	 								   ).append(
	 										   $("<button type='button'>").prop("class","deleteBtn").append("<i class='glyphicon glyphicon-ban-circle'></i>")
	 								   	)
	 								).data("no" , "0")
	 			 		}
	 
	 
	 
 			  }
 			
 			  
 
  
  	$(tbody).on("click", ".deleteBtn" , function(){
  			/* console.log($(this).parents("tr")[0]) */
  		 let  value = $(this).parents("h5")[0]
  		 $(value).find(".attatchtemptAt").val("1") //템프파일 여부 1 로 변경하여 템프 파일으로 설정함
  		 $(value).find(".attatchtDelAt").val("1") // 파일 삭제 여부를 1로 변경하여 파일 삭제된 파일로 설정함
 		 $(value).attr('style', "display:none;");
  	});
 		  
  	
 

  	

       
</script>
   
    
</body>
</html>