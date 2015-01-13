<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/commons/include.jsp" %>
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
		<tr class="oddtr">
			<td>${sta.count }</td>
			<td>${e.name }</td>
			<td>${e.age }</td>
			<td>${e.birthDate }</td>
	  	</tr>
	</c:forEach> 
</tbody>
</table>
${pageHtml }
<script>
function jumpPage(pageNo){
	var params = {"keyword":"","pageNo":pageNo};
	$(".content_InnerContainer").load(ctx+"/business/customerList.do", params);
}
</script>
<!-- <div class="pager" id="pager"><span class="current">1</span><a href="http://baidu.com/?page=2">2</a><a href="http://baidu.com/?page=3">3</a><a href="http://baidu.com/?page=4">4</a><a href="http://baidu.com/?page=5">5</a><a href="http://baidu.com/?page=6">6</a><a href="http://baidu.com/?page=7">7</a><span>…</span><a href="http://baidu.com/?page=10">Last</a><a href="http://baidu.com/?page=2">下一页</a></div> -->