<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>用户登录</title>
<%@ include file="/common/meta.jsp"%>
<script type="text/javascript">
var loginForm;
var login_linkbutton;
$(function(){
	loginForm = $('#loginForm').form();
	$('#loginName').focus();
	//refreshCheckCode();
});
//刷新验证码
function refreshCheckCode() { 
	//加上随机时间 防止IE浏览器不请求数据
	var url = '${ctx}/servlet/ValidateCodeServlet?'+ new Date().getTime();
    $('#validateCode_img').attr('src',url); 
}
//登录
function login() { 
	if(loginForm.form('validate')){
		login_linkbutton = $('#login_linkbutton').linkbutton({  
		    text:'正在登录...' ,
		    disabled:true
		});
		$.post('${ctx}/login!login.action',eu.serializeObject(loginForm), function(data) {
			if (data.code ==1){
				window.location = data.obj;//操作结果提示
			}else {
				login_linkbutton.linkbutton({  
				    text:'登录' ,
				    disabled:false
				}); 
				$('#validateCode').val('');
				showMsg(data.msg);
				//refreshCheckCode();
			}
		}, 'json');
	}
}
</script>
</head>
<body>
	<form id="loginForm" method="post" novalidate>
		<div style="font-size: 14px;text-align: center;">用户登录</div>
		<table width="56%" align="center" border="0" cellpadding="5"
			cellspacing="0">
			<tr>
				<td width="10%" align="right">用户名：</td>
				<td width="20%" align="left">
				    <input class="easyui-validatebox" placeholder="请输入登录名..." style="width: 200px" type="text" id="loginName" name="loginName" required="true" value="admin" data-options="validType:'minLength[3]',missingMessage:'请输入用户名!'"  />
				</td>
			</tr>
			<tr>
				<td align="right">密&nbsp;&nbsp;码：</td>
				<td align="left">
				    <input type="password" name="password" placeholder="请输入密码..."  class="easyui-validatebox" required="true" onkeydown="if(event.keyCode==13)login()" style="width: 200px" value="password" data-options="validType:'minLength[3]',missingMessage:'请输入密码!'" />
				</td>
			</tr>
			<!-- 
			<tr>
				<td align="right">验证码：</td>
				<td align="left">
				    <input id="validateCode" name="validateCode" type="text" onkeydown="if(event.keyCode==13)login()" class="easyui-validatebox" style="width: 100px" required="true" data-options="tipPosition:'left',validType:'alphanum',missingMessage:'请输入验证码!'" /> 
					<img id="validateCode_img" align="middle" onclick="refreshCheckCode();" />   
	                <a href="javascript:void(0)" onclick="refreshCheckCode();" > 看不清,换一个</a>
				</td>
			</tr> 
			 -->
			<tr>
				<td align="center" colspan="2">
				<a id="login_linkbutton" href="#" class="easyui-linkbutton" onclick="login()" >登录</a>
			</tr>

		</table>

	</form>
</body>
</html>
