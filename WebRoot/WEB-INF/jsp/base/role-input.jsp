<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript">
    var json;
	$(function() {
		loadMenu();
	});
	//加载菜单
    function loadMenu(){
    	//树 请求数据
    	$.ajax( {
			url : "${ctx}/base/menu!tree.action",
			type : "post",
			async : false,//是否异步方式 
			success : function(data) { 
				 json = data;
		    }
		});
		
		$('#menuIds').combotree({   
			data : json,
			cascadeCheck : false,
			multiple : true,
			onClick : function(node){
				var tree = $('#menuIds').combotree('tree');//combotree组件中的tree组件
				eu.myCascadeCheck(tree,node);
			},
			onCheck:function(node, checked) {
			    checkedNode = node;
			}
		});
		var checkedNode;//被checked节点
		//选择框绑定点击事件
		//$('[span^="tree-checkbox"]').bind("click", function() {
		 $('.tree-checkbox').bind("click", function() {
			 window.setTimeout(function() {
			     var tree = $('#menuIds').combotree('tree');//combotree组件中的tree组件
			     eu.myCascadeCheck(tree,checkedNode);
			 }, 1);
	     });
    }
</script>
<div>
	<form id="role_form" method="post" novalidate>
	    <input type="hidden"  name="id"></input> 
	    <!-- 用户版本控制字段 version -->
        <input type="hidden" id="version" name="version" ></input>
        <div>
			<label>关联菜单:</label>  
		    <input id="menuIds" name="menuIds"  style="width:200px" />
		</div> 
		<div>
			<label>角色名称:</label>
		    <input name="name" type="text" class="easyui-validatebox"
				maxLength="100" data-options="required:true,missingMessage:'请输入角色名称.',validType:['minLength[1]','legalInput']">
		    <span style="color: red">*</span>
		</div>
		<div>
			<label >描述:</label>
			<textarea maxLength="100" name="description"></textarea>
		</div>
	</form>
</div>