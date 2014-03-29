<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript">
    $(function() {
        loadParent();
        loadType();
    });
    //加载父级机构
    function loadParent(){
        $('#_parentId').combotree({
            url:'${ctx}/base/organ!parentOrgan.action?selectType=select',
            multiple:false,//是否可多选
            editable:false,//是否可编辑
            width:120,
            valueField:'id',
            onHidePanel:function(){
                //防止自关联
                if($('#id').val() && $(this).combotree('getValue') == $('#id').val()){
                    eu.showMsg('不允许设置上级机构为自己,请重新选择!');
                    $(this).combotree('setValue','');
                }
            },
            onBeforeLoad:function(node,param){
                param.id = "${id}";
            },
            onSelect:function(node){
                //上级机构类型 部门：0 机构：1  限制:如果上级是部门则下级只能是部门
                var parentType = node.attributes.type;
                if(parentType != undefined && parentType ==0){
                    $('#type').combobox('setValue',0).combobox('readonly',true);
                }else{
                    $('#type').combobox('readonly',false);
                }
            }

        });
    }

    //加载机构类型
    function loadType(){
        $('#type').v({
            url:'${ctx}/base/organ!organTypeCombobox.action',
            multiple:false,//是否可多选
            editable:false,//是否可编辑
            width:120,
            value:'0'//默认值 ‘0’即菜单
        });
    }
</script>
<div>
    <form id="organ_form" method="post">
        <input type="hidden" id="id" name="id" />
        <!-- 用户版本控制字段 version -->
        <input type="hidden" id="version" name="version" />
        <div>
            <label>上级机构:</label>
            <input id="_parentId" name="_parentId" class="easyui-combotree" />
        </div>
        <div>
            <label>机构类型:</label>
            <input id="type" name="type" class="easyui-combobox"
                   data-options="required:true,missingMessage:'请选择机构类型.'" />
            <%--提示小图标--%>
            <span class="tree-icon tree-file icon-tip easyui-tooltip"
                  title="上级机构的机构类型为[部门]，则机构类型默认为[部门]，并且不可更改." ></span>
        </div>
        <div>
            <label>机构名称:</label>
            <input type="text" id="name" name="name"
                   maxLength="255" class="easyui-validatebox" placeholder="请输入机构名称..."
                   data-options="required:true,missingMessage:'请输入机构名称.',validType:['minLength[1]']" />
        </div>
        <div>
            <label>机构系统编码:</label>
            <input type="text" id="sysCode" name="sysCode"
                   maxLength="36" class="easyui-validatebox" placeholder="请输入机构系统编码..."
                   data-options="required:true,missingMessage:'请输入机构系统编码.',validType:['minLength[1]']" />
        </div>
        <div>
            <label>机构编码:</label>
            <input type="text" id="code" name="code"
                   maxLength="36" class="easyui-validatebox" placeholder="请输入机构编码..."
                   data-options="validType:['minLength[1]']" />
        </div>
        <div>
            <label>地址:</label>
            <input type="text" id="address" name="address"
                   maxLength="255" class="easyui-validatebox" placeholder="请输入地址..."
                   data-options="validType:['minLength[1]']" />
        </div>
        <div>
            <label>电话号码:</label>
            <input type="text" id="phone" name="phone"
                   class="easyui-validatebox" placeholder="请输入地址..."
                   data-options="validType:['phone']" />
        </div>
        <div>
            <label>传真:</label>
            <input type="text" id="fax" name="fax"
                   class="easyui-validatebox" placeholder="请输入传真..."/>
        </div>
        <div>
            <label>排序:</label>
            <input type="text" id="orderNo" name="orderNo" class="easyui-numberspinner"
                   data-options="min:1,max:99999999,size:9,maxlength:9" />
        </div>
        <div>
            <label>状态:</label>
            <input type="radio" name="status" style="width: 20px;" value="0" /> 启用
            <input type="radio" name="status" style="width: 20px;" value="3" /> 停用
        </div>
    </form>
</div>