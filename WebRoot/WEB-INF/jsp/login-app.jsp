<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>essh桌面版</title>
<%@ include file="/common/meta.jsp"%>
<link rel="stylesheet" type="text/css" href="${ctx}/js/jquery/easyui-1.3.5/themes/windows/app.css" />
<script type="text/javascript" src="${ctx}/js/jquery/easyui-1.3.5/jquery.app.js" charset="utf-8"></script>

<script type="text/javascript">
    $(function(){
        if($.browser.msie && parseInt($.browser.version) < 8){
            $.messager.alert("温馨提示","您当前正在使用的是IE"+$.browser.version+"。该程序支持<a style='color:green' target='_blank' href='http://windows.microsoft.com/zh-CN/internet-explorer/products/ie/home'>IE8.0</a>以上版本及谷歌，火狐..");
        }
    });
</script>
    <script type="text/javascript" src="${ctx}/js/jquery/easyui-1.3.5/initApp.js" charset="utf-8"></script>
</head>
<body>


</body>
</html>