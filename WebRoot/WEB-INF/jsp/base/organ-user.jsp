<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript">
    $(function() {
        loadUser();
        loadManagerUser();
    });

    //加载用户
    function loadUser(){
        $('#userIds').combogrid({
            multiple:true,
            panelWidth:420,
            //value:'006', //默认值
            idField:'id',
            textField:'loginName',
            url:'${ctx}/base/user!datagrid.action',
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
                {field:'loginName',title:'用户登录名',width:120},
                {field:'name',title:'用户姓名',width:80}
            ]],
            keyHandler : {
                enter: function() {
                    var name = $('#userIds').combogrid('getText');
                    var dg = $('#userIds').combogrid("grid");
                    dg.datagrid("reload", {'pageType':2,'filter_LIKES_loginName_OR_name':name});
                },
                query : function(q) {
                }
            },
            onBeforeLoad:function(param){
                param.filter_EQI_status = 0;//排除已删除的数据
            }
        });

    }

    //加载主管用户
    function loadManagerUser(){
        $('#managerUserId').combogrid({
//            multiple:true,
            panelWidth:420,
            //value:'006', //默认值
            idField:'id',
            textField:'loginName',
            url:'${ctx}/base/user!datagrid.action',
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
                {field:'id',title:'主键ID',width:100,hidden:'true'},
                {field:'loginName',title:'用户登录名',width:120},
                {field:'name',title:'用户姓名',width:80}
            ]],
            keyHandler : {
                enter: function() {
                    var name = $('#managerUserId').combogrid('getText');
                    var dg = $('#managerUserId').combogrid("grid");
                    dg.datagrid("reload", {'pageType':2,'filter_LIKES_loginName_OR_name':name});
                },
                query : function(q) {
                }
            },
            onBeforeLoad:function(param){
                param.filter_EQI_status = 0;//排除已删除的数据
            }
        });

    }
</script>
<div>
    <form id="organ_user_form" method="post">
        <input type="hidden" id="id" name="id" />
        <!-- 用户版本控制字段 version -->
        <input type="hidden" id="version" name="version" />
        <div>
            <label>机构用户:</label>
            <input type="select" class="easyui-combogrid" id="userIds" name="userIds" style="width: 260px;"/>
        </div>
        <div>
            <label>主管:</label>
            <input type="select" class="easyui-combogrid" id="managerUserId" name="managerUserId" style="width: 260px;"/>
        </div>
    </form>
</div>