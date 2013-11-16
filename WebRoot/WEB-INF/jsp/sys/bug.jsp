<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/meta.jsp"%>
<%-- 引入kindEditor插件 --%>
<link rel="stylesheet" href="${ctx}/js/kindeditor-4.1.7/themes/default/default.css">
<script type="text/javascript" src="${ctx}/js/kindeditor-4.1.7/kindeditor-all-min.js" charset="utf-8"></script>
<%--<script type="text/javascript" src="${ctx}/js/jquery/easyui-1.3.4/jquery.easyui.kindeditor.js" charset="utf-8"></script>--%>
<script type="text/javascript">
var bug_datagrid;
var bug_form;
var bug_search_form;
var bug_dialog;

var bug_import_dialog;//bug导入表单弹出对话框
var bug_import_form;
$(function() {
	bug_form = $('#bug_form').form();
	bug_search_form = $('#bug_search_form').form();
    //数据列表
    bug_datagrid = $('#bug_datagrid').datagrid({  
	    url:'${ctx}/sys/bug!datagrid.action',  
	    pagination:true,//底部分页
	    rownumbers:true,//显示行数
	    fitColumns:true,//自适应列宽
	    striped:true,//显示条纹
	    nowrap : true,
	    pageSize:20,//每页记录数
        remoteSort:false,//是否通过远程服务器对数据排序
	    sortName:'id',//默认排序字段
		sortOrder:'asc',//默认排序方式 'desc' 'asc'
		idField : 'id',
        frozenColumns:[[{field:'ck',checkbox:true},{field:'title',title:'bug标题',width:260 }]],
        columns:[[
              {field:'id',title:'主键',hidden:true,sortable:true,align:'right',width:80},
              {field:'typeName',title:'bug类型',width:120 },
              {field:'operater',title:'操作',align:'center',width:200,formatter:function(value,rowData,rowIndex){
            	  var url = $.formatString('${ctx}/sys/bug!view.action?id={0}',rowData.id);
         	      var operaterHtml = "<a class='easyui-linkbutton' iconCls='icon-add' plain='true' " +
                          "onclick='view(\""+rowData.title+"\",\""+url+"\")' >查看</a>"
                  +"<a class='easyui-linkbutton' iconCls='icon-edit' plain='true' href='#' " +
                          "onclick='edit("+rowIndex+");' >编辑</a>";
         	      return operaterHtml;
              }}
		    ]],
	    onLoadSuccess:function(){
	    	$(this).datagrid('clearSelections');//取消所有的已选择项
	    	$(this).datagrid('unselectAll');//取消全选按钮为全选状态
	    	//鼠标移动提示列表信息tooltip
			$(this).datagrid('showTooltip');
            $.parser.parse();
		},
	    onRowContextMenu : function(e, rowIndex, rowData) {
			e.preventDefault();
			$(this).datagrid('unselectAll');
			$(this).datagrid('selectRow', rowIndex);
			$('#bug_datagrid_menu').menu('show', {
				left : e.pageX,
				top : e.pageY
			});
		} ,
        onDblClickRow:function(rowIndex, rowData){
            edit(rowIndex, rowData);
        }
	});
    loadBugType();
});
</script>
<script type="text/javascript">
    //查看
    function view(title,url){
        if(window.parent.layout_center_tabs){
            bug_datagrid.datagrid('unselectAll');
            eu.addTab(window.parent.layout_center_tabs,title,url,true);
        }
    }
	//加载bug类型
	function loadBugType(){
		$('#filter_EQS_type').combobox({
	        url:'${ctx}/sys/dictionary!combobox.action?dictionaryTypeCode=bug&selectType=all',
		    multiple:false,//是否可多选
		    //editable:false,//是否可编辑
		    width:120,
		    valueField:'value',
	        displayField:'text'
		});
	}
    function formInit(){
       	bug_form = $('#bug_form').form({
			url: '${ctx}/sys/bug!save.action',
			onSubmit: function(param){  
				$.messager.progress({
					title : '提示信息！',
					text : '数据处理中，请稍后....'
				});
				if(content_kindeditor){
					content_kindeditor.sync();
				}
				var isValid = $(this).form('validate');
				if (!isValid) {
					$.messager.progress('close');
				}
				return isValid;
		    },
			success: function(data){
				$.messager.progress('close');
				var json = $.parseJSON(data);
				if (json.code ==1){
					bug_dialog.dialog('destroy');//销毁对话框 
					bug_datagrid.datagrid('reload');//重新加载列表数据
					eu.showMsg(json.msg);//操作结果提示
				}else if(json.code == 2){
					$.messager.alert('提示信息！', json.msg, 'warning',function(){
						if(json.obj){
							$('#bug_form input[name="'+json.obj+'"]').focus();
						}
					});
				}else {
					eu.showAlertMsg(json.msg,'error');
				}
			}
		});
	}
	//显示弹出窗口 新增：row为空 编辑:row有值 
	function showDialog(row){
        var inputUrl = "${ctx}/sys/bug!input.action";
        if(row != undefined && row.id){
            inputUrl = inputUrl+"?id="+row.id;
        }

		//弹出对话窗口
		bug_dialog = $('<div/>').dialog({
			title:'bug详细信息',
			width : document.body.clientWidth,
			height : document.body.clientHeight,
			modal : true,
			maximizable:true,
			href : inputUrl,
			buttons : [ {
				text : '保存',
				iconCls : 'icon-save',
				handler : function() {
					bug_form.submit();
				}
			},{
				text : '关闭',
				iconCls : 'icon-cancel',
				handler : function() {
					bug_dialog.dialog('destroy');
				}
			}],
			onClose : function() {
				$(this).dialog('destroy');
			},
			onLoad:function(){
				formInit();
				if(row){
					bug_form.form('load', row);
				}
				if(content_kindeditor){
					content_kindeditor.sync();
				}
			}
		}).dialog('open');
		
	}
	
	//编辑
    function edit(rowIndex, rowData){
        //响应双击事件
        if(rowIndex != undefined) {
            bug_datagrid.datagrid('unselectAll');
            bug_datagrid.datagrid('selectRow',rowIndex);
            var rowData = bug_datagrid.datagrid('getSelected');
            bug_datagrid.datagrid('unselectRow',rowIndex);
            showDialog(rowData);
            return;
        }
		//选中的所有行
		var rows = bug_datagrid.datagrid('getSelections');
		//选中的行（第一次选择的行）
		var row = bug_datagrid.datagrid('getSelected');
		if (row){
			if(rows.length>1){
				row = rows[rows.length-1];
				eu.showMsg("您选择了多个操作对象，默认操作最后一次被选中的记录！");
			}
			showDialog(row);
		}else{
			eu.showMsg("请选择要操作的对象！");
		}
	}
	
	//删除
	function del(){
		var rows = bug_datagrid.datagrid('getSelections');
		
		if(rows.length >0){
			$.messager.confirm('确认提示！','您确定要删除选中的所有行？',function(r){
				if (r){
					var ids = new Object();
					for(var i=0;i<rows.length;i++){
						ids[i] = rows[i].id;
					}
					$.post('${ctx}/sys/bug!remove.action',{ids:ids},function(data){
						if (data.code==1){
							bug_datagrid.datagrid('load');	// reload the user data
							eu.showMsg(data.msg);//操作结果提示
						} else {
							eu.showAlertMsg(data.msg,'error');
						}
					},'json');      
					
				}
			});
		}else{
			eu.showMsg("请选择要操作的对象！");
		}
	}
	
	//搜索
	function search(){
		bug_datagrid.datagrid('load',$.serializeObject(bug_search_form));
	}
		
	//导出Excel
	function exportExcel(){
		$('#bug_temp_iframe').attr('src','${ctx}/sys/bug!exportExcel.action');
	}
	
	function importFormInit(){
		bug_import_form = $('#bug_import_form').form({
			url: '${ctx}/sys/bug!importExcel.action',
			onSubmit: function(param){  
				$.messager.progress({
					title : '提示信息！',
					text : '数据处理中，请稍后....'
				});
		        return $(this).form('validate');
		    },
			success: function(data){
				$.messager.progress('close');
				var json = $.parseJSON(data);
				if (json.code ==1){
					bug_import_dialog.dialog('destroy');//销毁对话框 
					bug_datagrid.datagrid('reload');//重新加载列表数据
					eu.showMsg(json.msg);//操作结果提示
				}else {
					eu.showAlertMsg(json.msg,'error');
				}
			}
		});
	}
	
	//导入
	function importExcel(){
		bug_import_dialog = $('<div/>').dialog({//基于中心面板
			title:'Excel导入',
			width : 500,
			height : 360,
			modal : true,
			maximizable:true,
			href : '${ctx}/sys/bug-import.action',
			buttons : [ {
				text : '保存',
				iconCls : 'icon-save',
				handler : function() {
					bug_import_form.submit();
				}
			},{
				text : '关闭',
				iconCls : 'icon-cancel',
				handler : function() {
					bug_import_dialog.dialog('destroy');
				}
			}],
			onClose : function() {
				$(this).dialog('destroy');
			},
			onLoad:function(){
				importFormInit();
			}
		}).dialog('open');
	}
</script>
<%-- 列表右键 --%>
<div id="bug_datagrid_menu" class="easyui-menu" style="width:120px;display: none;">
    <%--带权限控制右键菜单--%>
    <e:operation name="新增" permission="bug:add" type="menuItem" iconCls="icon-add"  method="showDialog()" ></e:operation>
    <e:operation name="批量删除" permission="bug:remove" type="menuItem" iconCls="icon-remove"  method="del()" ></e:operation>
    <e:operation name="Excel导出" permission="bug:exportExcel" type="menuItem" iconCls="icon-edit"  method="exportExcel()" ></e:operation>
    <e:operation name="Excel导入" permission="bug:importExcel" type="menuItem" iconCls="icon-edit"  method="importExcel()" ></e:operation>

    <%--<div onclick="showDialog();" iconCls="icon-add">新增</div>--%>
	<%--<div onclick="edit();" data-options="iconCls:'icon-edit'">编辑</div>--%>
	<%--<div onclick="del();" data-options="iconCls:'icon-remove'">删除</div>--%>
	<%--<div onclick="exportExcel();" data-options="iconCls:'icon-edit'">Excel导出</div>--%>
	<%--<div onclick="importExcel();" data-options="iconCls:'icon-edit'">Excel导入</div>--%>
</div>

<%-- 隐藏iframe --%>
<iframe id="bug_temp_iframe" style="display: none;"></iframe>
	
<%-- 工具栏 操作按钮 --%>
<div id="bug_datagrid-toolbar">
    <div style="margin-left:10px; float: left;">
        <form id="bug_search_form" style="padding: 0px;">
            bug类型:<input type="text" id="filter_EQS_type" name="filter_EQS_type" /> 
			bug标题:<input type="text" name="filter_LIKES_title" maxLength="25" style="width: 160px" /> 
			<a href="javascript:search();" class="easyui-linkbutton"
					iconCls="icon-search" plain="true" >查 询</a>
		</form>
	</div>
	<div align="right">

        <%--按钮权限控制方式一 判断是否具有某个或几个权限 hasPermission name属性多个之间以“;”分割--%>
        <%--<e:hasPermission name="bug:add">--%>
            <%--<a href="#" class="easyui-linkbutton" iconCls="icon-add" onclick="showDialog()">新增</a>--%>
		<%--</e:hasPermission>--%>

        <%--按钮权限控制方式二 权限按钮标签--%>
        <e:operation name="新增" permission="bug:add" type="linkbutton" iconCls="icon-add"  method="showDialog()" ></e:operation>
        <e:operation name="批量删除" permission="bug:remove" type="linkbutton" iconCls="icon-remove"  method="del()" ></e:operation>
        <e:operation name="Excel导出" permission="bug:exportExcel" type="linkbutton" iconCls="icon-edit"  method="exportExcel()" ></e:operation>
        <e:operation name="Excel导入" permission="bug:importExcel" type="linkbutton" iconCls="icon-edit"  method="importExcel()" ></e:operation>


        <%--<a href="#" class="easyui-linkbutton" iconCls="icon-add" onclick="showDialog()">新增</a>--%>
		<%--<a href="#" class="easyui-linkbutton" iconCls="icon-remove" onclick="del()">批量删除</a>--%>
		<%--<a href="#" class="easyui-linkbutton" iconCls="icon-edit"  onclick="exportExcel()">Excel导出</a>--%>
		<%--<a href="#" class="easyui-linkbutton" iconCls="icon-edit" onclick="importExcel()">Excel导入</a>--%>
	</div>
</div>
<table id="bug_datagrid" toolbar="#bug_datagrid-toolbar" fit="true"></table>
   