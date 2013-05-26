<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript">
	$(function() {
		loadParentMenu();
		loadIco();
	});
	//加载父级菜单
	function loadParentMenu(){
		$('#parentId').combotree({  
	        url:'${ctx}/base/menu!parentMenu.action?selectType=select',
		    multiple:false,//是否可多选
		    editable:false,//是否可编辑
		    width:120,
	        valueField:'id',
	        displayField:'text',
	        onHidePanel:function(){
	        	//防止自关联
	        	if($(this).combotree('getValue') == $('#id').val()){
	        		$(this).combotree('setValue','');
	        	}
	        }
		});
	}
	//加载菜单图标
	function loadIco(){
		$('#ico').combobox({  
			url:'${ctx}/js/json/menu.json',
		    multiple:false,//是否可多选
		    editable:false,//是否可编辑
		    width:120,
	        valueField:'value',
	        displayField:'text',
	        formatter:function(row){    
	        	return $.formatString('<span class="tree-icon tree-file {0}"></span>{1}', row.value, row.text);
	        }
		});
	}
</script>
<div>
	<form id="menu_form" method="post">
		<input type="hidden" id="id" name="id" /> 
		<!-- 用户版本控制字段 version -->
        <input type="hidden" id="version" name="version" />
	    <div>
			<label>上级菜单:</label>
			<input id="parentId" name="parentId" class="easyui-combotree" /> 
		</div>
		<div>
			<label>菜单图标:</label> 
			<input id="ico" name="ico"
				class="easyui-combobox"
				data-options="tipPosition:'left',required:true,missingMessage:'请选择菜单图标.',url:'${ctx}/js/json/menu.json'" />
				<span style="color: red">*</span>
		</div>
		<div>
			<label>菜单名称:</label> 
			<input type="text" id="name" name="name"
				maxLength="20" class="easyui-validatebox" placeholder="请输入菜单名称..."
				data-options="required:true,missingMessage:'请输入菜单名称.',validType:['minLength[1]']" /> 
		    <span style="color: red">*</span>
		</div>
		<div>
			<label>链接地址:</label>
			<input type="text" id="url" name="url" maxLength="255" class="easyui-validatebox" />
		</div>
		<div>
			<label>标识地址:</label>
			<input type="text" id="markUrl" name="markUrl" maxLength="255" class="easyui-validatebox" />
		</div>
		<div>
			<label>排序:</label>
			<input type="text" id="orderNo" name="orderNo" class="easyui-numberspinner" data-options="min:1,max:99999999,size:9,maxlength:9" />
		</div>
		<div>
			<label>状态:</label>
            <input type="radio" name="status" style="width: 20px;" value="0" /> 启用 
            <input type="radio" name="status" style="width: 20px;" value="3" /> 停用
		    <span style="color: red">*</span>
		</div>
	</form>
</div>