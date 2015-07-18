<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="tags.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>Index</title>
    
      <link rel="stylesheet" href="${ctx}/jquery.bsgrid/builds/merged/bsgrid.all.min.css"/>
    <script type="text/javascript" src="${ctx}/jquery.bsgrid/plugins/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="${ctx}/jquery.bsgrid/builds/js/lang/grid.zh-CN.min.js"></script>
    <script type="text/javascript" src="${ctx}/jquery.bsgrid/builds/merged/bsgrid.all.min.js"></script>
  </head>
  <body>
  
  <table id="searchTable">
    <tr>
        <th w_index="XH" width="5%;">XH</th>
        <th w_index="ID" width="5%;">ID</th>
        <th w_index="CHAR" w_align="left" width="15%;">CHAR</th>
        <th w_index="TEXT" w_align="left" width="30%;">TEXT</th>
        <th w_index="DATE" width="15%;">DATE</th>
        <th w_index="TIME" width="15%;">TIME</th>
        <th w_index="NUM" width="5%;">NUM</th>
        <th w_render="operate" width="10%;">Operate</th>
    </tr>
</table>
<script type="text/javascript">
    var gridObj;
    $(function () {
        gridObj = $.fn.bsgrid.init('searchTable', {
            url: '${ctx}/jquery.bsgrid/examples/grid/data/json.jsp',
            // autoLoad: false,
            pageSizeSelect: true,
            pageSize: 10
        });
    });

    function operate(record, rowIndex, colIndex, options) {
        return '<a href="#" onclick="alert(\'ID=' + gridObj.getRecordIndexValue(record, 'ID') + '\');">Operate</a>';
    }
</script>
  
    <!-- Welcome!! <br>
    
    <table>
    	<thead>
    		<tr>
    			<th></th>
    			<th></th>
    			<th></th>
    		</tr>
    	</thead>
    	<tbody>
    		<tr>
    			<td></td>
    			<td></td>
    			<td></td>
    		</tr>
    	</tbody>
    </table> -->
  </body>
</html>
 