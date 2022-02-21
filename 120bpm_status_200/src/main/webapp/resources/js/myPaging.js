/**
 * $("#searchForm").paging({
 * 		pagingArea : "#pagingArea",
 * 		pageLink : ".pageLink",
 * 		searchUI : "#searchUI",
 * 		btnSelector : "#searchBtn",
 * 		pageKey : "page",
 * 		pageParam : "page",
 * 		
 * 
 * })
 */

$.fn.paging = function(param){
	let searchForm = this;
	param = param ? param : {};
	const PAGINGAREA = param.pagingArea? $(param.pagingArea):$(this).prev().find(".pagingArea");
	const PAGELINK = param.pageLink ? param.pageLink : ".pageLink";
	const SELECTWSC = param.selectWSC ? $(param.selectWSC) : $("#selectWSC"); 
	const PAGEKEY = param.pageKey ? param.pageKey : "page";
	const PAGEPARAM = param.pageParam ? param.pageParam : "page"; 
	  
 
	PAGINGAREA.on('click', PAGELINK ,function(event){
		event.preventDefault();
		let page = $(this).data(PAGEKEY);
		$('input[name = "'+ PAGEPARAM +'"]').val(page);
		searchForm.submit();
		return false;
	}).css("cursor", "pointer")
 
	SELECTWSC.on('change', function(){
		let name = this.name;
		let value = $(this).val();
		searchForm.find("[name='"+ name+"']").val(value);
		searchForm.submit();  
	});    
	return this;
}