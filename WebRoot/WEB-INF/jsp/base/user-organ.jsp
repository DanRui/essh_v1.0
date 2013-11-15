<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript">
    $(function() {
        loadOrgan();
        initdDefaultOrgan();
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
    var isChange = false;
    function loadOrgan(){
        var isChange = false; //标识所属组织机构是否变更
        organs_combogrid = $('#organIds').combogrid({
            multiple:true,
            panelWidth:420,
            //value:'006', //默认值
            idField:'id',
            textField:'name',
            url:'${ctx}/base/organ!datagrid.action',
            mode: 'remote',
            fitColumns: true,
            striped: true,
            editable:true,
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
                {field:'name',title:'机构名称',width:80},
                {field:'code',title:'机构编码',width:80}
            ]],
            keyHandler : {
                enter: function() {
                    var name = $('#organIds').combogrid('getText');
                    var dg = $('#organIds').combogrid("grid");
                    dg.datagrid("reload", {'pageType':2,'filter_LIKES_name_OR_code':name});
                },
                query : function(q) {
                }
            },
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
</script>
<div>
    <form id="user_organ_form"  method="post" novalidate>
        <input type="hidden" id="id" name="id" />
        <!-- 用户版本控制字段 version -->
        <input type="hidden" id="version" name="version" />
        <div>
            <label>所属组织机构:</label>
            <input type="select" id="organIds" name="organIds" class="easyui-combogrid"/>
        </div>
        <div>
            <label>默认组织机构:</label>
            <input type="select" id="defaultOrganId" name="defaultOrganId" class="easyui-combobox"/>
        </div>
    </form>
</div>