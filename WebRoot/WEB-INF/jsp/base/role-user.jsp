<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript">
    var user_combogrid;
    $(function() {
        loadUser();
        $.parser.parse();
    });

    //加载用户
    function loadUser(){
        var isChange = false;
        user_combogrid = $('#userIds').combogrid({
            toolbar:"#userIds_cg_toolbar",
            multiple:true,
            panelWidth:500,
            panelHeight:360,
            idField:'id',
            textField:'loginName',
            url:'${ctx}/base/user!combogrid.action',
            mode: 'remote',
            fitColumns: true,
            striped: true,
            editable:false,
            pagination : true,//是否分页
            rownumbers:true,//序号
            collapsible:false,//是否可折叠的
            fit: true,//自动大小
            pageSize: 10,//每页显示的记录条数，默认为10
            pageList: [10,50,500,1000,10000],//可以设置每页记录条数的列表
            method:'post',
            columns:[[
                {field:'ck',checkbox:true},
                {field:'id',title:'主键ID',width:100,hidden:'true'},
                {field:'loginName',title:'用户登录名',width:120,sortable:true},
                {field:'name',title:'用户姓名',width:80,sortable:true}
            ]],
            onBeforeLoad:function(param){
                param.filter_EQI_status = 0;//排除已删除的数据
            }
        });

    }

    //用户搜索
    function userSearch(){
        //本地已选中的值
        var userIdValues = user_combogrid.combogrid("getValues");
        var ids = new Object();
        for(var i=0;i<userIdValues.length;i++){
            ids[i] = userIdValues[i];
        }
        user_combogrid.combogrid('grid').datagrid("load",
                {loginNameOrName:$("#loginNameOrName").val(),
                    ids:ids});
    }
</script>
<div>
    <form id="role_user_form" method="post">
        <input type="hidden" id="id" name="id" />
        <!-- 用户版本控制字段 version -->
        <input type="hidden" id="version" name="version" />
        <div>
            <label>角色用户:</label>
            <input type="select" class="easyui-combogrid" id="userIds" name="userIds" style="width: 260px;"/>
        </div>
    </form>
</div>
<%-- 工具栏 操作按钮 --%>
<div id="userIds_cg_toolbar">
    <form id="userIds_search_form" style="padding: 0px;">
        登录名或姓名:<input type="text" id="loginNameOrName" name="loginNameOrName"
                      placeholder="请输入登录名或姓名..." maxLength="25"/>
        <a href="javascript:userSearch();" class="easyui-linkbutton"
           iconCls="icon-search" plain="false" >查询</a>
    </form>
</div>