<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript">
    function changeMode(){
        var tempData =  $('#resourceIds').combotree('getValues');
        $('#resourceIds').combotree({cascadeCheck:$('#changeMode').is(':checked')});
        $('#resourceIds').combotree('setValues',tempData);
    }

    $(function() {
        loadResource();
    });
    //加载资源
    function loadResource(){
        $('#resourceIds').combotree({
            data : ${resourceTreeData},
            cascadeCheck : false,
            multiple : true
        });
    }
</script>
<div>
    <form id="role_form" method="post" novalidate>
        <input type="hidden"  name="id" />
        <!-- 用户版本控制字段 version -->
        <input type="hidden" id="version" name="version" />
        <div>
            <label>关联资源:</label>
            <input id="resourceIds" name="resourceIds"  style="width:200px" />
            级联模式<input id="changeMode" type="checkbox" onchange="$('#resourceIds').combotree({cascadeCheck:$('#changeMode').is(':checked')});"/>
        </div>
        <div>
            <label>角色名称:</label>
            <input name="name" type="text" class="easyui-validatebox"
                   maxLength="100" data-options="required:true,missingMessage:'请输入角色名称.',validType:['minLength[1]','legalInput']">
        </div>
        <div>
            <label >描述:</label>
            <textarea maxLength="100" name="description"></textarea>
        </div>
    </form>
</div>