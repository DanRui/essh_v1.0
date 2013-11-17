<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript">
    $(function() {
        loadOrgan();
        initdDefaultOrgan();
        $.parser.parse();
    });

    //加载默认组织机构
    var defaultOrgan_combobox;
    function initdDefaultOrgan(){
        defaultOrgan_combobox =  $("#defaultOrganId").combobox({
            editable:false,
            valueField: 'value',
            textField: 'text',
            data:${defaultOrganComboboxData}
        });
    }

    //加载组织机构
    var organs_combogrid;
    function loadOrgan(){
        var isChange = false; //标识所属组织机构是否变更
        organs_combogrid = $('#organIds').combogrid({
            toolbar:"#organIds_cg_toolbar",
            multiple:true,
            panelWidth:500,
            panelHeight:360,
            idField:'id',
            textField:'name',
            url:'${ctx}/base/organ!combogrid.action',
            mode: 'remote',
            fitColumns: true,
            striped: true,
            editable:false,
            pagination : true,//是否分页
            rownumbers:true,//序号
            collapsible:false,//是否可折叠的
            fit: true,//自动大小
            pageSize: 10,//每页显示的记录条数，默认为10
            pageList: [10,20,30,50,100],//可以设置每页记录条数的列表
            method:'post',
            columns:[[
                {field:'ck',checkbox:true},
                {field:'id',title:'主键ID',width:100,hidden:'true'},
                {field:'name',title:'机构名称',width:80,sortable:true},
                {field:'code',title:'机构编码',width:80,sortable:true}
            ]],
            onBeforeLoad:function(param){
                param.filter_EQI_status = 0;//排除已删除的数据
            },
            onHidePanel:function(){
                if(isChange){
                    var selectionsData = $(this).combogrid('grid').datagrid("getSelections");
                    var defaultOrganData = new Array();
                    var defaultOrganValues = defaultOrgan_combobox.combobox("getValues");
                    var defaultOrganTempValues = new Array();
                    $.each(selectionsData,function(index, row) {
                        defaultOrganData.push({"value":row.id,"text":row.name});
                        $.each(defaultOrganValues,function(index, value) {
                            if(row.id == value){
                                defaultOrganTempValues.push(value);
                            }
                        });
                    });
                    defaultOrgan_combobox.combobox("setValues",defaultOrganTempValues);
                    defaultOrgan_combobox.combobox("loadData",defaultOrganData);
                }
            },
            onChange:function(newValue, oldValue){
                if((newValue.length != 0 || oldValue.length != 0) && newValue.toString() != oldValue.toString()){
                    isChange = true;
                }else{
                    isChange = false;
                }
            }
        });
    }

    //机构搜索
    function organSearch(){
        //本地已选中的值
        var organIdValues = organs_combogrid.combogrid("getValues");
        var ids = new Object();
        for(var i=0;i<organIdValues.length;i++){
            ids[i] = organIdValues[i];
        }
        organs_combogrid.combogrid('grid').datagrid("load",
                {nameOrCode:$("#nameOrCode").val(),
                    ids:ids});
    }
</script>
<div>
    <form id="user_organ_form"  method="post" novalidate>
        <input type="hidden" id="id" name="id" />
        <!-- 用户版本控制字段 version -->
        <input type="hidden" id="version" name="version" />
        <div>
            <label>所属组织机构:</label>
            <input type="select" id="organIds" name="organIds" class="easyui-combogrid" style="width: 260px;"/>
        </div>
        <div>
            <label>默认组织机构:</label>
            <input type="select" id="defaultOrganId" name="defaultOrganId" class="easyui-combobox" style="width: 260px;"/>
        </div>
    </form>
</div>
<%-- 工具栏 操作按钮 --%>
<div id="organIds_cg_toolbar">
    <form id="organIds_search_form" style="padding: 0px;">
        机构名称或编码:<input type="text" id="nameOrCode" name="nameOrCode"
                    placeholder="请输入机构名称或编码..." maxLength="25"/>
        <a href="javascript:organSearch();" class="easyui-linkbutton"
           iconCls="icon-search" plain="false" >查询</a>
    </form>
</div>