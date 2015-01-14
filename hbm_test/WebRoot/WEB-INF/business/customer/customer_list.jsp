<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/commons/include.jsp" %>
<div id="customer_dialog"></div>
<table class="css_table_blue">
<thead>
	<tr>
		<th>序号</th>
		<th>姓名</th>
		<th>年龄</th>
		<th>生日</th>
	</tr>
</thead>
<tbody>
	<c:forEach  items="${list }" var="e" varStatus="sta">
		<tr rel="${e.id }">
			<td>${sta.count }</td>
			<td>${e.name }</td>
			<td>${e.age }</td>
			<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${e.birthDate }"/> </td>
	  	</tr>
	</c:forEach> 
</tbody>
</table>
${pageHtml }
<script>
$(function(){
	//设置奇数行样式
	$(".css_table_blue tbody tr:odd").addClass('oddtr');
	//设置鼠标移动样式
	$(".css_table_blue tbody tr").bind("mouseover mouseout",function(){
		$(this).toggleClass("overtr");
	}); 
	
	$(".css_table_blue tbody tr").click(function(){
		$(".selecttr").removeClass("selecttr");
		$(this).addClass("selecttr");
	})
	
});
function jumpPage(pageNo){
	var params = {"keyword":"","pageNo":pageNo};
	$(".content_InnerContainer").load(ctx+"/business/customer_list.do", params);
}
</script>
<!-- <div class="pager" id="pager"><span class="current">1</span><a href="http://baidu.com/?page=2">2</a><a href="http://baidu.com/?page=3">3</a><a href="http://baidu.com/?page=4">4</a><a href="http://baidu.com/?page=5">5</a><a href="http://baidu.com/?page=6">6</a><a href="http://baidu.com/?page=7">7</a><span>…</span><a href="http://baidu.com/?page=10">Last</a><a href="http://baidu.com/?page=2">下一页</a></div> -->