<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/meta.jsp"%>
<script type="text/javascript">
var dictionaryType_datagrid;
var editRow = undefined;
var dictionaryType_search_form;
$(function() {  
	dictionaryType_search_form = $('#dictionaryType_search_form').form();
	
    //数据列表
    dictionaryType_datagrid = $('#dictionaryType_datagrid').datagrid({  
	    url:'${ctx}/sys/dictionary-type!datagrid.action',  
	    pagination:true,//底部分页
	    pagePosition:'bottom',//'top','bottom','both'.
	    fitColumns:true,//自适应列宽
	    striped:true,//显示条纹
	    pageSize:20,//每页记录数
	    singleSelect:false,//单选模式
	    rownumbers:true,//显示行数
	    checkbox:true,
		nowrap : false,
		border : false,
		sortName:'orderNo',//默认排序字段
		sortOrder:'asc',//默认排序方式 'desc' 'asc'
		idField : 'id',
		fitColumns:false,//自适应宽度
		columns:[ [ {
				field : 'ck',
				checkbox : true,
				width : 60
			}, {
				field : 'id',
				title : '主键',
				hidden : true,
				sortable:true,
				align : 'right',
				width : 80
			}, {
				field : 'name',
				title : '类型名称',
				width : 260,
				editor : {
					type : 'validatebox',
					options : {
						required : true,
						validType:['minLength[1]','legalInput'],
						missingMessage:'请输入类型名称！'
					}
				}
			}, {
				field : 'code',
				title : '类型编码',
				align : 'right',
				width : 100,
				sortable:true,
				editor : {
					type : 'validatebox',
					options : {
						required : true,
						validType:['minLength[1]','alphanum'],
						missingMessage:'请输入类型编码！'
					}
				}
			}, {
				field : 'orderNo',
				title : '排序',
				align : 'right',
				width : 80,
				sortable:true,
				editor : {
					type : 'numberspinner'
				}
			} ] ],
			onDblClickRow : function(rowIndex, rowData) {
				if (editRow != undefined) {
					showMsg("请先保存正在编辑的数据！");
					//结束编辑 自动保存
					//dictionaryType_datagrid.datagrid('endEdit', editRow);
				}else{
					$(this).datagrid('beginEdit', rowIndex);
					editRow = rowIndex;
					$(this).datagrid('unselectAll');
				}
			},
			onAfterEdit : function(rowIndex, rowData, changes) {
				var inserted = dictionaryType_datagrid.datagrid('getChanges', 'inserted');
				var updated = dictionaryType_datagrid.datagrid('getChanges', 'updated');
				if (inserted.length < 1 && updated.length < 1) {
					editRow = undefined;
					$(this).datagrid('unselectAll');
					return;
				}
				$.post('${ctx}/sys/dictionary-type!save.action',rowData,
						function(data) {
					if (data.code == 1) {
						dictionaryType_datagrid.datagrid('acceptChanges');
						editRow = undefined;
						editRowData = undefined;
						dictionaryType_datagrid.datagrid('reload');
						showMsg(data.msg);
					}else if((data.code == 2)){//警告信息
						$.messager.alert('提示信息！', data.msg, 'warning',function(){
							dictionaryType_datagrid.datagrid('beginEdit', editRow);
							if(data.obj){
								var validateEdit = dictionaryType_datagrid.datagrid('getEditor',{index:rowIndex,field:data.obj});
								$(validateEdit.target).focus();
							}
						});
					} else {
						dictionaryType_datagrid.datagrid('rejectChanges');
						dictionaryType_datagrid.datagrid('beginEdit', editRow);
						showAlertMsg(data.msg, 'error');
					}
			    }, 'json');
			},
			onLoadSuccess:function(){
				$(this).datagrid('clearSelections');//取消所有的已选择项
		    	$(this).datagrid('unselectAll');//取消全选按钮为全选状态
				editRow = undefined;
			},
			onRowContextMenu : function(e, rowIndex, rowData) {
				e.preventDefault();
				$(this).datagrid('unselectAll');
				$(this).datagrid('selectRow', rowIndex);
				$('#dictionaryType_menu').menu('show', {
					left : e.pageX,
					top : e.pageY
				});
			}
		});
});
	//设置排序默认值
	function setSortValue(target) {
		$.get('${ctx}/sys/dictionary-type!maxSort.action', function(data) {
			if (data.code == 1) {
				$(target).numberbox({value:data.obj + 1});
				$(target).numberbox('validate');
			}
		}, 'json');
	}

	//新增
	function add() {
		if (editRow != undefined) {
			//showMsg("请先保存正在编辑的数据！");
			dictionaryType_datagrid.datagrid('endEdit', editRow);
		}else{
			cancelSelect();
			var row = {id : ''};
			dictionaryType_datagrid.datagrid('appendRow', row);
			editRow = dictionaryType_datagrid.datagrid('getRows').length - 1;
			dictionaryType_datagrid.datagrid('selectRow', editRow);
			dictionaryType_datagrid.datagrid('beginEdit', editRow);
			var rowIndex = dictionaryType_datagrid.datagrid('getRowIndex',row);//返回指定行的索引
			var sortEdit = dictionaryType_datagrid.datagrid('getEditor',{index:rowIndex,field:'orderNo'});
			setSortValue(sortEdit.target);
		}
	}

	//编辑
	function edit() {
		//选中的所有行
		var rows = dictionaryType_datagrid.datagrid('getSelections');
		//选中的行（第一条）
		var row = dictionaryType_datagrid.datagrid('getSelected');
		if (row){
			if (rows.length > 1) {
				showMsg("您选择了多个操作对象，默认操作第一条选中记录！");
			}
			if (editRow != undefined) {
				showMsg("请先保存正在编辑的数据！");
				//结束编辑 自动保存
				//dictionaryType_datagrid.datagrid('endEdit', editRow);
			} else {
				editRow = dictionaryType_datagrid.datagrid('getRowIndex', row);
				dictionaryType_datagrid.datagrid('beginEdit', editRow);
				dictionaryType_datagrid.datagrid('unselectAll');
			}
		}else  {
			if(editRow != undefined){
				showMsg("请先保存正在编辑的数据！");
			} else{
			    showMsg("请选择要操作的对象！");
			}
		}
	}

	//保存
	function save(rowData) {
		if (editRow != undefined) {
			//结束编辑 自动保存
			dictionaryType_datagrid.datagrid('endEdit', editRow);
		} else {
			showMsg("请选择要操作的对象！");
		}
	}
	
	//取消编辑
	function cancelEdit() {
		cancelSelect();
		dictionaryType_datagrid.datagrid('rejectChanges');
		editRow = undefined;
		editRowData = undefined;
	}
	//取消选择
	function cancelSelect() {
		dictionaryType_datagrid.datagrid('unselectAll');
	}

	//删除
	function del() {
		var rows = dictionaryType_datagrid.datagrid('getSelections');
		if (rows.length > 0) {
			if(editRow != undefined){
				showMsg("请先保存正在编辑的数据！");
				return;
			}
			$.messager.confirm('确认提示！', '您确定要删除当前选中的所有行？', function(r) {
				if (r) {
					var ids = new Object();
					for(var i=0;i<rows.length;i++){
						ids[i] = rows[i].id;
					}
					$.post('${ctx}/sys/dictionary-type!remove.action',{ids : ids},
							function(data) {
								if (data.code == 1) {
									dictionaryType_datagrid.datagrid('clearSelections');//取消所有的已选择项
									dictionaryType_datagrid.datagrid('load');//重新加载列表数据
									showMsg(data.msg);//操作结果提示
								} else {
									showAlertMsg(data.msg,'error');
								}
				    }, 'json');
				}
			});
		} else {
			showMsg("请选择要操作的对象！");
		}
	}

	//搜索
	function search() {
		dictionaryType_datagrid.datagrid('load',eu.serializeObject(dictionaryType_search_form));
	}
</script>
<div class="easyui-layout" fit="true" style="margin: 0px;border: 0px;overflow: hidden;width:100%;height:100%;">
	
	<!-- 中间部分 列表 -->
	<div data-options="region:'center',split:false,border:false" 
		style="padding: 0px; height: 100%;width:100%; overflow-y: hidden;">
		
		<!-- 列表右键 -->
		<div id="dictionaryType_menu" class="easyui-menu" style="width:120px;display: none;">
			<div onclick="add();" data-options="iconCls:'icon-add'">新增</div>
			<div onclick="edit();" data-options="iconCls:'icon-edit'">编辑</div>
			<div onclick="del();" data-options="iconCls:'icon-remove'">删除</div>
		</div>
		
	   <!-- 工具栏 操作按钮 -->
	   <div id="dictionaryType_toolbar">
			<div style="margin-bottom:5px">    
		       <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="add()">新增</a>
				<span style="border-left: 1px solid #CCC;border-right: 1px solid white;margin: 2px 1px;"></span>
				<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="edit()">编辑</a>
				<span style="border-left: 1px solid #CCC;border-right: 1px solid white;margin: 2px 1px;"></span>
				<a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="del()">删除</a> 
				<span style="border-left: 1px solid #CCC;border-right: 1px solid white;margin: 2px 1px;"></span>
				<a href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="save()">保存</a> 
				<span style="border-left: 1px solid #CCC;border-right: 1px solid white;margin: 2px 1px;"></span>
				<a href="#" class="easyui-linkbutton" iconCls="icon-undo" plain="true" onclick="cancelEdit()">取消编辑</a> 
				<span style="border-left: 1px solid #CCC;border-right: 1px solid white;margin: 2px 1px;"></span>
				<a href="#" class="easyui-linkbutton" iconCls="icon-undo" plain="true" onclick="cancelSelect()">取消选中</a> 
		    </div>    
		    <div>    
			    <form id="dictionaryType_search_form" style="padding: 0px;">
				          类型名称或编码: <input type="text" id="filter_LIKES_name_OR_code" name="filter_LIKES_name_OR_code" placeholder="请输入类型名称或编码..." maxLength="25" style="width: 160px"></input> 
					<a href="javascript:search();" class="easyui-linkbutton"
							iconCls="icon-search" plain="true" >查 询</a>  
				</form>  
		    </div>  
		</div>
	   <table id="dictionaryType_datagrid" toolbar="#dictionaryType_toolbar" fit="true"></table>

	</div>
</div>