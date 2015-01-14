//jQuery
$(function() {
	// 设置奇数行样式
	$(".content_item span:odd").addClass('oddtr');
	// 设置鼠标移动样式
	$(".content_item .i_span").bind("mouseover mouseout", function() {
		$(this).toggleClass("over_span");
	}).click(function(){
		var $this = $(this);
		$(".selected_span").removeClass("selected_span");
		$this.addClass("selected_span");
		
		var obj = {"客户管理":"/business/customer_list.do","订单管理":""};
		var url = obj[$this.text()];
		var params = {"keyword":""};
		$(".content_InnerContainer").load(ctx+url, params);
	});
	
	$("#add_btn").click(function(){
		$( "#customer_dialog" ).dialog({ autoOpen: false });
		$("#customer_dialog").dialog("open");
	});
	
	
	$("#del_btn").click(function(){
		var tr = $(".css_table_blue .selecttr");
		if(tr.length == 0){
			alert("请点击需要删除的记录!"); return;
		}
		var id = tr.attr("rel");
//		console.log(id);
		$.post(ctx+"/business/customer_delete.do",{id:id},function(result){
			 if(result == 1){
				 alert("删除成功!");
//				 $("span .current").trigger('click');
				 jumpPage( $("span.current").text());
			 }else{
				 alert("删除失败!");
			 }
		},'text');
	});
});