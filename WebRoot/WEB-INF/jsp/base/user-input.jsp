<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript">
    $(function() {
        loadSex();
        loadOrgan();
    });
    //性别
    function loadSex(){
        $('#sex').combobox({
            url: '${ctx}/js/json/sex.json',
            width: 120,
            editable:false,
            value:'2',
            valueField: 'value',
            displayField: 'text'
        });
    }

    function loadOrgan(){
        $('#organIds').combogrid({
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
            }
        });
    }
</script>
<div>
    <form id="user_form"  method="post" novalidate>
        <input type="hidden" id="id" name="id" />
        <!-- 用户版本控制字段 version -->
        <input type="hidden" id="version" name="version" />
        <!--
        <div class="fitem">
            <label>角色设置:</label>
            <select id="roleIds" name="roleIds" class="easyui-combobox"></select>
        </div>
        -->
        <div>
            <label>所属组织机构:</label>
            <input type="select" id="organIds" name="organIds" class="easyui-combogrid"/>
        </div>
        <div>
            <label>登录名:</label>
            <input type="text" id="loginName" name="loginName" maxLength="36"
                   class="easyui-validatebox"
                   data-options="required:true,missingMessage:'请输入登录名.',validType:['minLength[1]','legalInput']"/>
        </div>
        <div id="password_div">
            <label>密码:</label>
            <input type="password" id="password"
                   name="password" class="easyui-validatebox" maxLength="36"
                   data-options="required:true,missingMessage:'请输入密码.',validType:['safepass']">
        </div>
        <div id="repassword_div">
            <label>确认密码:</label>
            <input type="password" id="repassword"
                   name="repassword" class="easyui-validatebox" required="true"
                   missingMessage="请再次填写密码." validType="equalTo['#password']"
                   invalidMessage="两次输入密码不匹配.">
        </div>
        <div>
            <label>姓名:</label>
            <input name="name" type="text" maxLength="6" class="easyui-validatebox" data-options="validType:['CHS','length[2,6]']" />
        </div>
        <div>
            <label>性别:</label>
            <input id="sex" name="sex" type="text" class="easyui-combobox" />
        </div>
        <div>
            <label>邮箱:</label>
            <input name="email" type="text" class="easyui-validatebox" validType="email" maxLength="255" />
        </div>
        <div>
            <label>地址:</label>
            <input name="address" type="text" class="easyui-validatebox" validType="legalInput" maxLength="255" />
        </div>
        <div>
            <label>电话:</label>
            <input name="tel" type="text" class="easyui-validatebox" validType="phone">
        </div>
        <div>
            <label>状态:</label>
            <input type="radio" name="status" style="width: 20px;" value="0" /> 启用
            <input type="radio" name="status" style="width: 20px;" value="3" /> 停用
        </div>
    </form>
</div>