<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/commons/include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hibernate index</title>
<link type="text/css" rel="StyleSheet" href="${ctx}/css/business.css">
<link type="text/css" rel="StyleSheet" href="${ctx}/scripts/jquery/ui/css/jquery-ui-1.9.2.custom.css">
<script src="${ctx}/scripts/jquery/ui/js/jquery-1.8.3.js" type="text/javascript"></script>
<script src="${ctx}/scripts/jquery/ui/js/jquery-ui-1.9.2.custom.js" type="text/javascript"></script>
<script src="${ctx}/js/business.js" type="text/javascript"></script>
<script type="text/javascript">
var ctx = "${ctx}";
</script>
</head>
<body>
	
	<div class="container">
		<div class="c_header"></div>
		<div class="c_content">
			<div class="content_left">
				<div class="content_search"></div>
				<div class="content_item">
					<span class="i_span">客户管理</span>
					<span class="i_span">订单管理</span>
				</div>
			</div>
			
			<div style="left:205px;" class="barY"></div>
			
			<div class="content_middle">
				
				<div class="content_bar">
					<button id="add_btn" class="content_btn" type="button" name="action">新增</button>
					<button id="edit_btn" class="content_btn" type="button" name="action">修改</button>
					<button id="del_btn" class="content_btn" type="button" name="action">删除</button>
				</div>
				<div class="content_mlRule"></div>
				<div id="" class="content_InnerContainer">
					
				</div>
			</div>
		</div>
	</div>

</body>
</html>