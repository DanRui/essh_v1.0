<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript">
	$(function() {
		loadParent();
		loadIco();
        loadType();
	});
	//加载父级资源
	function loadParent(){
		$('#parentId').combotree({  
	        url:'${ctx}/base/resource!parentResource.action?selectType=select',
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
	//加载资源图标
	function loadIco(){
		$('#ico').combobox({  
			url:'${ctx}/js/json/resource.json',
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
    //加载资源类型
    function loadType(){
        $('#type').combobox({
            url:'${ctx}/base/resource!resourceTypeCombobox.action',
            multiple:false,//是否可多选
            editable:false,//是否可编辑
            width:120,
            value:'0',//默认值 ‘0’即菜单
            valueField:'value',
            displayField:'text'
        });
    }
</script>
<div>
	<form id="resource_form" method="post">
		<input type="hidden" id="id" name="id" /> 
		<!-- 用户版本控制字段 version -->
        <input type="hidden" id="version" name="version" />
	    <div>
			<label>上级资源:</label>
			<input id="parentId" name="parentId" class="easyui-combotree" /> 
		</div>
		<div>
			<label>资源图标:</label>
			<input id="ico" name="ico"
				class="easyui-combobox"
				data-options="tipPosition:'left',required:true,missingMessage:'请选择资源图标.',url:'${ctx}/js/json/resource.json'" />
		</div>
		<div>
			<label>资源名称:</label>
			<input type="text" id="name" name="name"
				maxLength="20" class="easyui-validatebox" placeholder="请输入资源名称..."
				data-options="required:true,missingMessage:'请输入资源名称.',validType:['minLength[1]']" />
		</div>
        <div>
            <label>资源编码:</label>
            <input type="text" id="code" name="code"
                   maxLength="20" class="easyui-validatebox" placeholder="请输入资源编码..."
                   data-options="validType:['minLength[1]']" />
            <%--提示小图标--%>
            <span class="tree-icon tree-file icon-tip easyui-tooltip"
                  title="资源识别的唯一标识;主要用于[功能]类型的资源能够根据编码进行权限控制." ></span>
        </div>
		<div>
			<label>链接地址:</label>
			<input type="text" id="url" name="url" maxLength="255" class="easyui-validatebox" />
		</div>
		<div>
			<label>标识地址:</label>
			<input type="text" id="markUrl" name="markUrl" maxLength="2000" class="easyui-validatebox" />
            <%--提示小图标--%>
            <span class="tree-icon tree-file icon-tip easyui-tooltip"
                  title="设置标识地址的URL会被拦截器拦截；支持通配符'*';多个标识地址之间以';'分割." ></span>
		</div>
		<div>
			<label>排序:</label>
			<input type="text" id="orderNo" name="orderNo" class="easyui-numberspinner"
                   data-options="min:1,max:99999999,size:9,maxlength:9" />
		</div>
        <div>
            <label>资源类型:</label>
            <input id="type" name="type" class="easyui-combobox"
                   data-options="required:true,missingMessage:'请选择资源类型.'" />
        </div>
		<div>
			<label>状态:</label>
            <input type="radio" name="status" style="width: 20px;" value="0" /> 启用 
            <input type="radio" name="status" style="width: 20px;" value="3" /> 停用
		</div>
	</form>
</div>