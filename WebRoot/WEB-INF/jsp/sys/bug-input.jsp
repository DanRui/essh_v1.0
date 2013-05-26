<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript">
var content_xheditor;
$(function() {
	content_xheditor = $('#content_xheditor').xheditor({
		tools:'Cut,Copy,Paste,Pastetext,Blocktag,Fontface,FontSize,Bold,Italic,Underline,Strikethrough,Table,FontColor,BackColor,Img,Link,Unlink,|,Source,Fullscreen,Preview',
		html5Upload : true,
		upMultiple : 4,
		upLinkUrl : '${ctx}/sys/bug!upload.action',
		upLinkExt : 'zip,rar,txt,doc,docx,xls,xlsx',
		upImgUrl : '${ctx}/sys/bug!upload.action',
		upImgExt : 'jpg,jpeg,gif,png'
	});
});
</script>
<div>
	<form id="bug_form" method="post" novalidate>
	    <input type="hidden"  name="id"></input> 
	    <!-- 用户版本控制字段 version -->
        <input type="hidden" id="version" name="version" ></input>
		<div>
			<label>bug标题:</label>
		    <input name="title" type="text" class="easyui-validatebox"
				maxLength="100" data-options="required:true,missingMessage:'请输入bug标题.',validType:['minLength[1]','legalInput']">
		    <span style="color: red">*</span>
		</div>
		<div>
			<label >bug描述:</label>
			<textarea id="content_xheditor" name="content" maxLength="1000" style="width: 80%;height: 200px;"></textarea>
		</div>
	</form>
</div>