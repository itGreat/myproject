<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/commons/include.jsp" %>

<style>
<!--
.tTitle{
	border: none;
	margin-top: 10px;
}
-->
</style>
<script type="text/javascript">
 
</script>
	<form id="js_saveuser_fm" method="post" action="${ctx}//userdept/user_save.action">
	 <input type="hidden" name="user.id" value="${user.id }"/>
		<table id="add_user_tb" class="css_user_tb css_fm_tb">
			<tr class="table_row3">
				<td class="css_td_label" align="right">姓名：</td>
				<td class="css_td_el" align="left"><input type="text" id="username" style="width:80%" name="customer.username" value="${model.name}" maxlength="25"/><font color="#FF0000">*</font></td>
			</tr>
			<tr class="table_row3">
				<td class="css_td_label" align="right">年龄：</td>
				<td class="css_td_el" align="left"><input type="text" id="name" name="customer.age" maxlength="50" value="${model.age }" style="width:80%"><font color="#FF0000">*</font></td>
			</tr>
			<tr class="table_row3">
	        	<td class="css_td_label" align="right">生日：</td>
		        <td class="css_td_el" align="left">
		        	<input id="deptname" type="text" value="${model.birthDate }" readonly="readonly" onclick="openRadioDept();">
		        </td>
	       </tr>
			<tr class="table_row3">
				<td class="css_td_label" height="25" align="center" colspan="2">
				<input value="保存" type="button" onclick="saveUser();" /></td>
			</tr>
		</table>
	</form>