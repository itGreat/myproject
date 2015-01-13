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
		
		var obj = {"客户管理":"/business/customerList.do","订单管理":""};
		var url = obj[$this.text()];
		var params = {"keyword":""};
		$(".content_InnerContainer").load(ctx+url, params);
	});
	
	
	
});