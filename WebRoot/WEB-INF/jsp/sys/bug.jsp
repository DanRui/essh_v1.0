<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/meta.jsp"%>
<script type="text/javascript">
var bug_datagrid;
var bug_form;
var bug_search_form;
var bug_dialog;
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
	    pageSize:10,//每页记录数
	    sortName:'id',//默认排序字段
		sortOrder:'asc',//默认排序方式 'desc' 'asc'
		idField : 'id',
		frozenColumns:[[ 
              {field:'ck',checkbox:true},
              {field:'id',title:'主键',hidden:true,sortable:true,align:'right',width:80},
              {field:'title',title:'bug标题',width:360,formatter:function(value,rowData,rowIndex){    
         	      var title = eu.fs("<span title='{0}'>{1}</span>",value, value);
         	      return title;
                  }
              },
              {field:'operater',title:'操作',align:'center',width:80,formatter:function(value,rowData,rowIndex){ 
            	  var url = eu.fs('${ctx}/sys/bug!view.action?id={0}',rowData.id);
         	      var title = eu.fs("<a href='javascript:addTab(window.parent.layout_center_tabs, \"{0}\",\"{1}\", true)' title='{2}'>{3}</a>",rowData.title,url,'查看', '查看');
         	      return title;
              }}
		    ]],
	    columns:[[  
              //{field:'content',title:'bug描述',width:800}           
	    ]],
	    onLoadSuccess:function(){
	    	$(this).datagrid('clearSelections');//取消所有的已选择项
	    	$(this).datagrid('unselectAll');//取消全选按钮为全选状态
		},
	    onRowContextMenu : function(e, rowIndex, rowData) {
			e.preventDefault();
			$(this).datagrid('unselectAll');
			$(this).datagrid('selectRow', rowIndex);
			$('#bug_datagrid_menu').menu('show', {
				left : e.pageX,
				top : e.pageY
			});
		}
	});
    
});
</script>
<script type="text/javascript">
        function formInit(){
        	bug_form = $('#bug_form').form({
				url: '${ctx}/sys/bug!save.action',
				onSubmit: function(param){  
			        return $(this).form('validate');
			    },
				success: function(data){
					var json = eval('('+ data+')'); //将后台传递的json字符串转换为javascript json对象 
					if (json.code ==1){
						bug_dialog.dialog('destroy');//销毁对话框 
						bug_datagrid.datagrid('reload');//重新加载列表数据
						showMsg(json.msg);//操作结果提示
					}else if(json.code == 2){
						$.messager.alert('提示信息！', json.msg, 'warning',function(){
							if(json.obj){
								$('#bug_form input[name="'+json.obj+'"]').focus();
							}
						});
					}else {
						showAlertMsg(json.msg,'error');
					}
				}
			});
		}
		//显示弹出窗口 新增：row为空 编辑:row有值 
		function showDialog(row){
			//弹出对话窗口
			bug_dialog = $('<div/>').dialog({
				title:'bug详细信息',
				width : 500,
				height : 360,
				modal : true,
				maximizable:true,
				href : '${ctx}/sys/bug-input.action',
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
					
				}
			}).dialog('open');
			
		}
		
		//编辑
		function edit(){
			//选中的所有行
			var rows = bug_datagrid.datagrid('getSelections');
			//选中的行（第一次选择的行）
			var row = bug_datagrid.datagrid('getSelected');
			if (row){
				if(rows.length>1){
					row = rows[rows.length-1];
					showMsg("您选择了多个操作对象，默认操作最后一次被选中的记录！");
				}
				showDialog(row);
			}else{
				showMsg("请选择要操作的对象！");
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
								showMsg(data.msg);//操作结果提示
							} else {
								showAlertMsg(data.msg,'error');
							}
						},'json');      
						
					}
				});
			}else{
				showMsg("请选择要操作的对象！");
			}
		}
		
		//搜索
		function search(){
			bug_datagrid.datagrid('load',eu.serializeObject(bug_search_form));
		}
		
</script>
<%-- 列表右键 --%>
<div id="bug_datagrid_menu" class="easyui-menu" style="width:120px;display: none;">
	<div onclick="showDialog();" data-options="iconCls:'icon-add'">新增</div>
	<div onclick="edit();" data-options="iconCls:'icon-edit'">编辑</div>
	<div onclick="del();" data-options="iconCls:'icon-remove'">删除</div>
</div>
		
<%-- 工具栏 操作按钮 --%>
<div id="bug_datagrid-toolbar">
    <div style="margin-left:10px; float: left;">
        <form id="bug_search_form" style="padding: 0px;">
			bug标题:<input type="text" name="filter_LIKES_title" maxLength="25" style="width: 160px" /> 
			<a href="javascript:search();" class="easyui-linkbutton"
					iconCls="icon-search" plain="true" >查 询</a>
		</form>
	</div>
	<div align="right">
		<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="showDialog()">新增</a>
		<span class="toolbar-btn-separator"></span>
		<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="edit()">编辑</a>
		<span class="toolbar-btn-separator"></span>
		<a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="del()">删除</a> 
	</div>
</div>
<table id="bug_datagrid" toolbar="#bug_datagrid-toolbar" fit="true"></table>
   