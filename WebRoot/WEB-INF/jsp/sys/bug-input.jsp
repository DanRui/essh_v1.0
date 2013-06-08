<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript">
var content_kindeditor;
$(function() {
	loadBugType();
	window.setTimeout(function() {
		content_kindeditor = KindEditor.create('#content_kindeditor', {
			width : '680px',
			height : '300px',
			items : [ 'source', '|', 'undo', 'redo', '|', 'preview', 'print', 'template', 'code', 'cut', 'copy', 'paste', 'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright', 'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript', 'superscript', 'clearhtml', 'quickformat', 'selectall', '|', 'fullscreen', '/', 'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'image', 'flash', 'media', 'insertfile', 'table', 'hr', 'emoticons', 'baidumap', 'pagebreak', 'anchor', 'link', 'unlink' ],
			uploadJson : '${ctx}/servlet/FileUploadServlet',
			fileManagerJson : '${ctx}/servlet/FileManagerServlet',
			allowFileManager : true
		});
	}, 1);
	
});

//加载bug类型
function loadBugType(){
	$('#type').combobox({  
        url:'${ctx}/sys/dictionary!combobox.action?dictionaryTypeCode=bug',
	    multiple:false,//是否可多选
	    editable:false,//是否可编辑
	    width:120,
        valueField:'value',
        displayField:'text'
	});
}
</script>
<div>
	<form id="bug_form" method="post" novalidate>
	    <input type="hidden"  name="id"></input> 
	    <!-- 用户版本控制字段 version -->
        <input type="hidden" id="version" name="version" ></input>
        <div>
			<label>bug类型:</label>
		    <input id="type" name="type" type="text" class="easyui-combobox"  data-options="required:true">
		    <span style="color: red">*</span>
		</div>
		<div>
			<label>bug标题:</label>
		    <input name="title" type="text" class="easyui-validatebox"
				maxLength="100" data-options="required:true,missingMessage:'请输入bug标题.',validType:['minLength[1]','legalInput']">
		    <span style="color: red">*</span>
		</div>
		<div>
			<label >bug描述:</label>
			<textarea id="content_kindeditor" name="content" maxLength="1000" style="width: 80%;height: 200px;"></textarea>
		</div>
	</form>
</div>