/**
 * 
 */
//====================댓글 CRUD==========================
	$(document).ajaxError(function(event, xhr, settings, error){
		console.log(error);
	});
	function commonSuccess(resp){
		if(resp.result == "OK"){
			replyInsertForm.get(0).reset();
			replyModal.modal("hide");
			replyChildModal.modal("hide");
			searchForm.submit();
		}else if(resp.message){
			alert(resp.message);
		}
	}
	// 대댓글
	function childReply(event){
		let reply = $(this).parents("tr:first").data("reply");
		let repParent = reply.repNo;
		replyChildForm.get(0).repParent.value = repParent;
		replyChildModal.modal("show");
	}
	// 수정
	function updateReply(event){
		let reply = $(this).parents("tr:first").data("reply");
		for(let prop in reply){
			$(replyUpdateForm).find("[name='"+prop+"']").val(reply[prop]);
		}
		replyModal.modal("show");
	}
	// 삭제
	function deleteReply(event){
		if(!confirm("댓글을 지울까요?")) return false;
		let reply = $(this).parents("tr:first").data("reply");
		$(replyDeleteForm).find("[name='repNo']").val(reply.repNo);
		replyDeleteModal.modal("show");
	}
	
	let listTable = $("#replyTable").on("click", ".replyBtn", childReply)
	 								.on("click", ".updateBtn", updateReply)
									.on("click", ".delBtn", deleteReply)
									.find("#listBody");
	
	let replyModal = $("#replyModal").on("hidden.bs.modal", function(){
		$(this).find("form").get(0).reset();
	}).on("shown.bs.modal", function(){
		$(this).find(":text:first").focus().select();
	});
	let replyChildModal = $("#replyChildModal").on("hidden.bs.modal", function(){
		$(this).find("form").get(0).reset();
	}).on("shown.bs.modal", function(){
		$(this).find(":text:first").focus().select();
	});
	let replyDeleteModal = $("#replyDeleteModal").on("hidden.bs.modal", function(){
		$(this).find("form").get(0).reset();
	}).on("shown.bs.modal", function(){
		$(this).find(":password").focus();
	});
	
	let options ={
		dataType : "json",
		success :commonSuccess,
		beforeSubmit:function(){
			replyDeleteModal.modal("hide");
		}
	}
	
	let replyInsertForm = $("#replyInsertForm").ajaxForm(options);
	let replyUpdateForm = replyModal.find("form").ajaxForm(options);
	let replyChildForm = replyChildModal.find("form").ajaxForm(options);
	let replyDeleteForm = replyDeleteModal.find("form")
							.ajaxForm(options);
	
	$('#insertReplyBtn').on('click',function(){
		replyInsertForm.submit();
	})
//========================================================	
	
//====================덧글 페이징=======================
	let pagingArea = $("#pagingArea");
	let pagingA = pagingArea.on('click', "a" ,function(){
		let page = $(this).data("page");
		searchForm.find("[name='page']").val(page);
		searchForm.submit();
		searchForm.find("[name='page']").val(1);
		return false;
	}).on("click", ".scrollTop", function(event){
		$(this).parents("[class*='overflow']:first").animate({scrollTop:0}, 1000);
	});;
	
	let searchForm = $("#searchForm").ajaxForm({
		dataType : "json",
		success : function(resp) {
			pagingArea.empty();
			let replyList = resp.dataList;
			let trTags = [];
			if(replyList){
				$(replyList).each(function(idx, reply){
					let tr = $("<tr>");
					tr.append(
							$("<td>").html(reply.displayContent)
									.addClass("text-left"),
							$("<td>").text(reply.repWriter+"("+reply.repMail+")")
									.addClass("text-center"),
							$("<td>").text(reply.repDate)
									.addClass("text-center"),	
							$("<td>").append(
								$("<input>").attr({
									type:"button",
									value:"덧글"
								}).addClass("btn btn-primary mr-2 replyBtn"),		
								$("<input>").attr({
									type:"button",
									value:"수정"
								}).addClass("btn btn-info mr-2 updateBtn"),		
								$("<input>").attr({
									type:"button",
									value:"삭제"
								}).addClass("btn btn-danger mr-2 delBtn")		
							).addClass("text-center")	
					).data("reply", reply);
					trTags.push(tr);
				});
			}else{
				trTags.push(
					$("<tr>").html(
						$("<td>").text("댓글이 없음.")									
					)
				);
			}
//			let remainRowCnt = resp.screenSize - trTags.length;
//	  		for(let i=0; i<remainRowCnt; i++){
//	  			trTags.push($("<tr>").html($("<td colspan='4'>").html("&nbsp;")));
//	  		}
			if(resp.currentPage==1)
				listTable.html(trTags);
			else
				listTable.append(trTags);
			if(replyList.length>0)
				pagingArea.html(resp.pagingHTMLReplyType);
			let scrollElement = listTable.parents("[class*='overflow']:first");
			scrollElement.animate({scrollTop:scrollElement.get(0).scrollHeight}, 1000);
		},
		error : function(errResp) {
			console.log(errResp);
		}
	}).submit(); // 페이지 로드 후 1페이지의 댓글 요청.
//========================================================