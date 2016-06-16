<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/tags.jsp"%>
<link rel="stylesheet" href="${ctx}/scripts/zTree_v3.5/css/demo.css" type="text/css">
<link rel="stylesheet" href="${ctx}/scripts/zTree_v3.5/css/zTreeStyle/zTreeStyle.css" type="text/css">
<SCRIPT src="${ctx}/scripts/jquery/jquery-1.8.0.js" type="text/javascript"></SCRIPT>
<script type="text/javascript" src="${ctx}/scripts/zTree_v3.5/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="${ctx}/scripts/zTree_v3.5/js/jquery.ztree.excheck-3.5.js"></script>
<script type="text/javascript" src="${ctx}/scripts/zTree_v3.5/js/jquery.ztree.exedit-3.5.js"></script>
<%-- tree --%>
<ul id="categoryTree" class="ztree" style="width: 207px;height: 750px;margin: 5px;"></ul>

<SCRIPT type="text/javascript">
var setting = {
	view: {
		addHoverDom: addHoverDom,
		removeHoverDom: removeHoverDom,
		selectedMulti: false
	},
	edit: {
		enable: true,
		editNameSelectAll: true,
		showRemoveBtn: setRemoveBtn
	},
	data: {
		simpleData: {
			enable: true
		}
	},
	callback: {
		beforeDrag: beforeDrag,
		beforeEditName: beforeEditName,
		beforeRemove: beforeRemove,
		beforeRename: beforeRename,
		onRemove: onRemove,
		onRename: onRename,
		onClick: selectDocument 
	} ,
	async: {
		enable: true,
		url: "categoryJson.do",
		autoParam: ["id", "name"]
	}
};
		
var zNodes =[
         	{id:1, pId:0, name:"jQuery", open:true},
         	{id:101, pId:1, name:"jQuery UI Widget Demo", file:"http://sandbox.runjs.cn/show/zblr8lh9"},
         	{id:102, pId:1, name:"jq_calc", file:"http://sandbox.runjs.cn/show/liqpsnxx"},
         	{id:103, pId:1, name:"jq_selector", file:"http://sandbox.runjs.cn/show/zero4sb6"},
         	
         	{id:2, pId:0, name:"JavaScript", open:false},
         	{id:201, pId:2, name:"jqapi-1.9", file:"http://www.css88.com/jqapi-1.9/old.html"},
         	
         	{id:3, pId:0, name:"CSS", open:false},
         	{id:301, pId:3, name:"搜索框样式", file:"http://sandbox.runjs.cn/show/yeecjupy"},
         		{id:302, pId:3, name:"表格框样式", file:"http://sandbox.runjs.cn/show/awl39tjt"},
         		{id:303, pId:3, name:"按钮框样式", file:"http://sandbox.runjs.cn/show/lttovegn"},
         	
         ];

var log, className = "dark";
function beforeDrag(treeId, treeNodes) {
	return false;
}
function beforeEditName(treeId, treeNode) {
	/* className = (className === "dark" ? "":"dark");
	showLog("[ "+getTime()+" beforeEditName ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
	var zTree = $.fn.zTree.getZTreeObj("categoryTree");
	zTree.selectNode(treeNode);
	return confirm("Start node '" + treeNode.name + "' editorial status?"); */
}
function beforeRemove(treeId, treeNode) {
	var id = treeNode.id;
	var checkDoc = $("#checkDocId").val();
	if(!!!id || !confirm("您确定删除\""+treeNode.name+"\"目录吗？")){
		return false;
	}
	if("0" == checkDoc){
		alert("删除失败，该目录下已有文档存在");
 		return false;
	}else if("1" == checkDoc){
		return confirm("该目录下存在子目录，确认删除该目录及其子目录吗？");
	}else if("2" == checkDoc){
		return true;
	}	
}
function onRemove(e, treeId, treeNode) {
	deleteNode(treeNode);
	showLog("[ "+getTime()+" onRemove ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
}
function beforeRename(treeId, treeNode, newName) {
	className = (className === "dark" ? "":"dark");
	showLog("[ "+getTime()+" beforeRename ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
	if (newName.length == 0) {
		alert("目录名称不能为空！");
		var zTree = $.fn.zTree.getZTreeObj("categoryTree");
		setTimeout(function(){zTree.editName(treeNode)}, 10);
		return false;
	}
	return true;
}
function onRename(e, treeId, treeNode) {
	addOrEditNode(treeNode);
	showLog("[ "+getTime()+" onRename ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
}

function selectDocument(event,treeId, treeNode){
// 	var ids = getChildNodes(treeNode)
// 	var text = getFilePath(treeNode);
// 	parent.refreshData();
	var ids = ztreeUtil.getSelectedChildrenIdStr() || "";
	checkDoc(ids);
	refreshData(); 
}
function setRemoveBtn(treeId, treeNode){
	if(treeNode.level == 0){
		return false;
	}else{
		return true;
	}
}
function showLog(str) {
	if (!log) log = $("#log");
	log.append("<li class='"+className+"'>"+str+"</li>");
	if(log.children("li").length > 8) {
		log.get(0).removeChild(log.children("li")[0]);
	}
}
function getTime() {
	var now= new Date(),
	h=now.getHours(),
	m=now.getMinutes(),
	s=now.getSeconds(),
	ms=now.getMilliseconds();
	return (h+":"+m+":"+s+ " " +ms);
}

var newCount = 1;
function addHoverDom(treeId, treeNode) {
	var zTree = $.fn.zTree.getZTreeObj("categoryTree");
	var sObj = $("#" + treeNode.tId + "_span");
	if (treeNode.editNameFlag || $("#addBtn_"+treeNode.id).length>0) return;
	var addStr = "<span class='button add' id='addBtn_" + treeNode.id
		+ "' title='add node' onfocus='this.blur();'></span>";
	sObj.after(addStr);
	var btn = $("#addBtn_"+treeNode.id);
	if (btn) btn.bind("click", function(){
		zTree.addNodes(treeNode, {id:"newId_"+(100 + newCount), pId:treeNode.id, name:"new node" + (newCount++)});
		var node = zTree.getNodeByParam("id","newId_"+(99+newCount));
		zTree.editName(node);
		return false;
	}); 
};
function removeHoverDom(treeId, treeNode) {
	$("#addBtn_"+treeNode.id).unbind().remove();
	
};
function selectAll() {
	var zTree = $.fn.zTree.getZTreeObj("categoryTree");
	zTree.setting.edit.editNameSelectAll =  $("#selectAll").attr("checked");
}

$(document).ready(function(){
	$.fn.zTree.init($("#categoryTree"), setting);
	$("#selectAll").bind("click", selectAll);
});

function addOrEditNode(treeNode) {
	var zTree = $.fn.zTree.getZTreeObj("categoryTree");
	var id = treeNode.id;
	var parentId = treeNode.pId;
	var name = treeNode.name;
	if(id.length<19){
		id="";
	}
	var data = {id:id,parentId:parentId,name:name};
	var url = "category_save.action";
	$.post(url,data,function(result){
		if(null != result){
			if("1" == result){
				zTree.refresh();				
				return true;
			}else{
				treeNode.id=result;
				zTree.refresh();
				return true;
			}
		}					
	}); 
}

	function deleteNode(treeNode){
	var id = treeNode.id;
	var url = "category_delete.action";
	var data = {id:id};
	$.post(url,data,function(result){
		if("1" == result){
			layer.msg("操作成功",{icon:1});
		}else{
// 			alert("删除失败");
			layer.msg("操作失败",{icon:2});
		}
	}); 
}

function checkDoc(ids){
	var url = "checkDoc.action";
	var data = {ids:ids};
	$.post(url,data,function(result){
		$("#checkDocId").val(result);
	}); 
}

</SCRIPT>
