/**
 * 包含easyui的扩展和常用的方法.
 * 
 * @version 2013-01-27
 */
/* 定义全局对象，类似于命名空间或包的作用 */
var eu = $.extend({}, eu);

/**
 * 扩展easyui属性 dategrid表头居中.
 */
eu.datagridCenter = function() {
	//datagrid列表表头居中
    $(".datagrid-cell").css('text-align', 'center');
}
/**
 * easyui title居中
 */
eu.panelCenter = function() {
    //panel标题居中
    $(".panel-title").css('text-align', 'center');
}

/**
 * Object to String
 * 不通用,因为拼成的JSON串格式不对.
 */
eu.obj2str = function(o) {
	var r = [];
	if (typeof o == "string" || o == null) {
		return "@" + o + "@";
	}
	if (typeof o == "object") {
		if (!o.sort) {
			r[0] = "{";
			for ( var i in o) {
				r[r.length] = "@" + i + "@";
				r[r.length] = ":";
				r[r.length] = obj2str(o[i]);
				r[r.length] = ",";
			}
			r[r.length - 1] = "}";
		} else {
			r[0] = "[";
			for ( var i = 0; i < o.length; i++) {
				r[r.length] = obj2str(o[i]);
				r[r.length] = ",";
			}
			r[r.length - 1] = "]";
		}
		return r.join("");
	}
	return o.toString();
}

/**
 * json字符串转换为Object对象.
 * @param json json字符串
 * @returns
 */
eu.jsonToObj = function(json){ 
    return eval("("+json+")"); 
}
/**
 * json对象转换为String字符串对象.
 * @param o Object对象
 * @returns
 */
eu.jsonToString = function(o) {
	var r = [];
	if (typeof o == "string")
		return "\"" + o.replace(/([\'\"\\])/g, "\\$1").replace(/(\n)/g, "\\n").replace(/(\r)/g, "\\r").replace(/(\t)/g, "\\t") + "\"";
	if (typeof o == "object") {
		if (!o.sort) {
			for ( var i in o)
				r.push(i + ":" + obj2str(o[i]));
			if (!!document.all && !/^\n?function\s*toString\(\)\s*\{\n?\s*\[native code\]\n?\s*\}\n?\s*$/.test(o.toString)) {
				r.push("toString:" + o.toString.toString());
			}
			r = "{" + r.join() + "}";
		} else {
			for ( var i = 0; i < o.length; i++)
				r.push(obj2str(o[i]));
			r = "[" + r.join() + "]";
		}
		return r;
	}
	return o.toString();
};


/**
 * 
 * @requires jQuery
 * 
 * 将form表单元素的值序列化成对象
 * 
 * @returns object
 */
eu.serializeObject = function(form) {
	var o = {};
	$.each(form.serializeArray(), function(index) {
		if (o[this['name']]) {
			o[this['name']] = o[this['name']] + "," + this['value'];
		} else {
			o[this['name']] = this['value'];
		}
	});
	return o;
};

/**
 * EasyUi From扩展
 * getData 获取数据接口
 * 使用示例:$('#ff').form('getData',true);
 * @param {Object} jq
 * @param {Object} params 设置为true的话，会把string型"true"和"false"字符串值转化为boolean型。
 */
$.extend($.fn.form.methods, {
    getData: function(jq, params){
        var formArray = jq.serializeArray();
        var oRet = {};
        for (var i in formArray) {
            if (typeof(oRet[formArray[i].name]) == 'undefined') {
                if (params) {
                    oRet[formArray[i].name] = (formArray[i].value == "true" || formArray[i].value == "false") ? formArray[i].value == "true" : formArray[i].value;
                }
                else {
                    oRet[formArray[i].name] = formArray[i].value;
                }
            }
            else {
                if (params) {
                    oRet[formArray[i].name] = (formArray[i].value == "true" || formArray[i].value == "false") ? formArray[i].value == "true" : formArray[i].value;
                }
                else {
                    oRet[formArray[i].name] += "," + formArray[i].value;
                }
            }
        }
        return oRet;
    }
});


/**
 * @author 
 * 
 * @requires jQuery,EasySSH,jQuery cookie plugin
 * 
 * 更换EasySSH主题的方法
 * 
 * @param themeName
 *            主题名称
 */
eu.changeTheme = function(themeName) {
	var $easyuiTheme = $('#easyuiTheme');
	var url = $easyuiTheme.attr('href');
	var href = url.substring(0, url.indexOf('themes')) + 'themes/' + themeName + '/easyui.css';
	$easyuiTheme.attr('href', href);

	var $iframe = $('iframe');
	if ($iframe.length > 0) {
		for ( var i = 0; i < $iframe.length; i++) {
			var ifr = $iframe[i];
			$(ifr).contents().find('#easyuiTheme').attr('href', href);
		}
	}

	$.cookie('easyuiThemeName', themeName, {
		expires : 7
	});
};

/**
 * @author 
 * 
 * @requires jQuery
 * 
 * 判断浏览器是否是IE并且版本小于8
 * 
 * @returns true/false
 */
eu.isLessThanIe8 = function() {
	return ($.browser.msie && $.browser.version < 8);
};
/**
 * 获得URL参数
 * 
 * @returns 对应名称的值
 */
eu.getUrlParam = function(name) {
	var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
	var r = window.location.search.substr(1).match(reg);
	if (r != null)
		return unescape(r[2]);
	return null;
};

/**
 * 接收一个以逗号分割的字符串，返回List，list里每一项都是一个字符串
 * 
 * @returns list
 */
eu.getList = function(value) {
	if (value != undefined && value != '') {
		var values = [];
		var t = value.split(',');
		for ( var i = 0; i < t.length; i++) {
			values.push('' + t[i]);/* 避免他将ID当成数字 */
		}
		return values;
	} else {
		return [];
	}
};

/**
 * 获得项目根路径
 * 
 * 使用方法：eu.bp();
 * 
 * @returns 项目根路径
 */
eu.bp = function() {
	var curWwwPath = window.document.location.href;
	var pathName = window.document.location.pathname;
	var pos = curWwwPath.indexOf(pathName);
	var localhostPaht = curWwwPath.substring(0, pos);
	var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
	return (localhostPaht + projectName);
};

/**
 * @author 
 * 
 * 使用方法:eu.pn();
 * 
 * @returns 项目名称(/base)
 */
eu.pn = function() {
	return window.document.location.pathname.substring(0, window.document.location.pathname.indexOf('\/', 1));
};

/**
 * 
 * 增加formatString功能
 * 
 * 使用方法：eu.fs('字符串{0}字符串{1}字符串','第一个变量','第二个变量');
 * 
 * @returns 格式化后的字符串
 */
eu.fs = function(str) {
	for ( var i = 0; i < arguments.length - 1; i++) {
		str = str.replace("{" + i + "}", arguments[i + 1]);
	}
	return str;
};

/**
 * 
 * 生成UUID
 * 
 * @returns UUID字符串
 */
eu.random4 = function() {
	return (((1 + Math.random()) * 0x10000) | 0).toString(16).substring(1);
};
eu.UUID = function() {
	return (eu.random4() + eu.random4() + "-" + eu.random4() + "-" + eu.random4() + "-" + eu.random4() + "-" + eu.random4() + eu.random4() + eu.random4());
};

/**
 * 根据长度截取先使用字符串，超长部分追加...
 * @param str 对象字符串
 * @param len 目标字节长度
 * @return 处理结果字符串
 */
eu.cutString = function(str, len) {
	//length属性读出来的汉字长度为1
	if(str.length*2 <= len) {
		return str;
	}
	var strlen = 0;
	var s = "";
	for(var i = 0;i < str.length; i++) {
		s = s + str.charAt(i);
		if (str.charCodeAt(i) > 128) {
			strlen = strlen + 2;
			if(strlen >= len){
				return s.substring(0,s.length-1) + "...";
			}
		} else {
			strlen = strlen + 1;
			if(strlen >= len){
				return s.substring(0,s.length-2) + "...";
			}
		}
	}
	return s;
}

/**
 * 列表点击不选择
 * @param id datagrid的ID
 * @param rowIndex
 * @param rowData
 */
eu.unSelected = function(id,rowIndex,rowData){
	var selected = $('#'+id).datagrid('getSelections');
	// 获取所有选中的行数组，如果里边有这个，不选中 否则选中
	if(jQuery.inArray(rowData,selected)!=-1){
		$('#'+id).datagrid('unselectRow',rowIndex);
	} else {
		$('#'+id).datagrid('selectRow',rowIndex);
	}
}

/**
 * 弹出窗口 提示信息.
 * @param msg 消息内容
 */
function showMsg(msg) {
    $.messager.show({
        title: '提示信息！',
        msg: msg,
        timeout: 3000,
        showType: 'slide' //null,slide,fade,show.
    });
}

/**
 * 弹出窗口 提示信息.
 * @param msgString
 * @param msgType info,error,question,warning
 */
function showAlertMsg(msgString, msgType) {
	$.messager.alert('提示信息！', msgString, msgType);
}

/**
 * 带进度条提示信息
 * @param msg 消息内容
 * @param time 超时时间(毫秒值)
 */
function showProMsg(msg,time) {
	$.messager.progress({
		title:'提示信息！',
		msg:msg
	});
	setTimeout(function(){
		$.messager.progress('close');
	},time);
}

/**  
 * 扩展EasyUI tabs方法
 * addIframeTab方法的参数包含以下属性：
 * 名称	参数类型	描述以及默认值
 * tab	object	该参数是对象，其属性列表同于tabs自带add方法的入参属性列表
 * iframe.src	string	目标框架页面的地址，必填项
 * iframe.height	string	框架标签iframe的高度，默认值为'100%'
 * iframe.width	string	框架标签iframe的宽度，默认值为'100%'
 * iframe.frameBorder	number	框架标签iframe的边框宽度，默认值为0
 * iframe.message	string	加载中效果显示的消息，默认值为'页面加载中...'
 * update object 该参数是是否刷新,传递该参数表示是刷新tab
 */  
$.extend($.fn.tabs.methods, {   
	/**
     * 加载iframe内容  
     * @param  {jq Object} jq     [description]  
     * @param  {Object} params    params.which:tab的标题或者index;params.iframe:iframe的相关参数  
     * @return {jq Object}        [description]  
     */  
    loadTabIframe:function(jq,params){   
        return jq.each(function(){   
            var $tab = $(this).tabs('getTab',params.which);   
            if($tab==null) return;   
  
            var $tabBody = $tab.panel('body');   
  
            //销毁已有的iframe   
            var $frame=$('iframe', $tabBody);   
            if($frame.length>0){   
                $frame[0].contentWindow.document.write('');   
                $frame[0].contentWindow.close();   
                $frame.remove();   
                if($.browser.msie){   
                    CollectGarbage();   
                }   
            }   
            $tabBody.html('');   
  
            $tabBody.css({'overflow':'hidden','position':'relative'});      
            var $mask = $('<div style="position:absolute;z-index:2;width:100%;height:100%;background:#ccc;z-index:1000;opacity:0.3;filter:alpha(opacity=30);"><div>').appendTo($tabBody);      
            var $maskMessage = $('<div class="mask-message" style="z-index:3;width:auto;height:16px;line-height:16px;position:absolute;top:50%;left:50%;margin-top:-20px;margin-left:-92px;border:2px solid #d4d4d4;padding: 12px 5px 10px 30px;background: #ffffff url(\''
            		+ctx+'/js/jquery/easyui-1.3.3/themes/default/images/loading.gif\') no-repeat scroll 5px center;">' 
            		+ (params.iframe.message || '页面加载中...') + '</div>').appendTo($tabBody);
            var $containterMask = $('<div style="position:absolute;width:100%;height:100%;z-index:1;background:#fff;"></div>').appendTo($tabBody);      
            var $containter = $('<div style="position:absolute;width:100%;height:100%;z-index:0;"></div>').appendTo($tabBody);      
     
            var iframe = document.createElement("iframe");      
            iframe.src = params.iframe.src;      
            iframe.frameBorder = params.iframe.frameBorder || 0;      
            iframe.height = params.iframe.height || '100%';      
            iframe.width = params.iframe.width || '100%';      
            var finist =function(){
            	$([$mask[0],$maskMessage[0]]).fadeOut(params.iframe.delay || 'slow',function(){   
                    $(this).remove();   
                    if($(this).hasClass('mask-message')){   
                        $containterMask.fadeOut(params.iframe.delay || 'slow',function(){   
                            $(this).remove();   
                        });   
                    }   
                }); 
            }
            if (iframe.attachEvent){   
                iframe.attachEvent("onload", finist);   
            } else {   
                iframe.onload = finist;   
            }  
            $containter[0].appendChild(iframe);   
        });   
    },
    /**
     * 增加iframe模式的标签页  
     * @param {[type]} jq     
     * @param {[type]} params  
     */  
    addIframeTab:function(jq,params){   
        return jq.each(function(){   
            if(params.tab.href){   
                delete params.tab.href;   
            }   
            if(!params.update){
            	$(this).tabs('add',params.tab);   
            }
            var opts = $(this).tabs('options');   
            var $tabBody = $(this).tabs('getTab',params.tab.title).panel('body');   
            $tabBody.css({'overflow':'hidden','position':'relative'});   
            var $mask = $('<div style="position:absolute;z-index:2;width:100%;height:100%;background:#ccc;z-index:1000;opacity:0.3;filter:alpha(opacity=30);"><div>').appendTo($tabBody);   
            var $maskMessage = $('<div class="mask-message" style="z-index:3;width:auto;height:16px;line-height:16px;position:absolute;top:50%;left:50%;margin-top:-20px;margin-left:-92px;border:2px solid #d4d4d4;padding: 12px 5px 10px 30px;background: #ffffff url(\''
            		+ctx+'/js/jquery/easyui-1.3.3/themes/default/images/loading.gif\') no-repeat scroll 5px center;">' 
            		+ (params.iframe.message || '页面加载中...') + '</div>').appendTo($tabBody);   
            var $containterMask = $('<div style="position:absolute;width:100%;height:100%;z-index:1;background:#fff;"></div>').appendTo($tabBody);   
            var $containter = $('<div class="easyui-panel" style="position:absolute;width:100%;height:100%;z-index:0;"></div>').appendTo($tabBody);   
  
            var iframe = document.createElement("iframe");   
            iframe.src = params.iframe.src;   
            iframe.frameBorder = params.iframe.frameBorder || 0;   
            iframe.height = params.iframe.height || '100%';   
            iframe.width = params.iframe.width || '100%';   
            var finist =function(){
            	$([$mask[0],$maskMessage[0]]).fadeOut(params.iframe.delay || 'slow',function(){   
                    $(this).remove();   
                    if($(this).hasClass('mask-message')){   
                        $containterMask.fadeOut(params.iframe.delay || 'slow',function(){   
                            $(this).remove();   
                        });   
                    }   
                }); 
            }
            if (iframe.attachEvent){   
                iframe.attachEvent("onload", finist);   
            } else {   
                iframe.onload = finist;   
            }   
            $containter[0].appendChild(iframe);   
        });   
    }   
});  

/**
 * 添加页面到指定选项卡.
 * @param tabs 选项卡对象,或者选项卡的id
 * @param title 标题
 * @param url 链接地址
 * @param closeAble 是否允许关闭
 * @param iconCls 图标
 */
function addTab(tabs,title,url,closeAble,iconCls){
	var closable = true;
	if(undefined != typeof closeAble){
		closable = closeAble;
	}
	//如果tabs是字符串类型则代表选项卡的id
	if(typeof tabs == 'string'){
		tabs = $('#'+tabs).tabs();
	}
	//如果当前title的tab不存在则创建一个tab
	if(!tabs.tabs('exists',title)){
		tabs.tabs('addIframeTab',{      
		    tab:{title:title,closable:closable,iconCls:iconCls,cache:true},      
		    iframe:{src:url}      
		});    
	}else {
		tabs.tabs('select', title);
    }
}

/**
 * 自定义combotree级联选择（适用于jQuery easyui 1.3.2）
 * 父节点选中,子节点将全被选中；子节点选中,所有父节点也将被选中.
 * @param tree combotree下的树tree
 * @param node 选中的节点
 */
eu.myCascadeCheck = function(tree,node) {
	if(tree == 'undefined' || node == 'undefined'){
		return;
	}
	if (node.checked) {
		node.checked = false;
		tree.tree('uncheck', node.target);
	} else {
		node.checked = true;
		tree.tree('check', node.target);
	}

	var tempNode;//被点节点 临时变量
	tempNode = node;
	//循环遍历父节点
	while (tempNode) {
		var parentNode = tree.tree('getParent', tempNode.target);//父节点
		tempNode = parentNode;
		if (tempNode) {
			tree.tree('check', tempNode.target);
		}

	}
	tempNode = node;
	if (tempNode) {
		var childNodes = tree.tree('getChildren', tempNode.target);//得到该节点下的所有节点数组
		var childNode;
		for ( var i = 0; i <= childNodes.length; i++) {
			childNode = childNodes[i];
			if (childNode) {
				if (tempNode.checked) {
					tree.tree('check', childNode.target);
				} else {
					tree.tree('uncheck', childNode.target);
				}

			}
		}

	}
}
/**
 * 禁用表单(easyui表单输入框需要ID).
 * input[text、checkbox、radio] textarea、select
 * combo、combobox、combotree、combogrid、datebox、datetimebox、numberbox、slider、numberspinner
 * @param formId 表单ID
 */
eu.formReadonly = function(formId){
	$('#' + formId + ' input[type="text"],input[type="checkbox"],input[type="radio"],textarea,select').attr("disabled", "true");
	$('#' + formId + ' .easyui-combo').each(function(){
        if (this.id) {
	        $("#" + this.id).combo('disable');	
		}
	});
	$('#' + formId + ' .easyui-combobox').each(function(){
		if (this.id) { 
			$("#" + this.id).combobox('disable');
		}
	});
	$('#' + formId + ' .easyui-combotree').each(function(){
        if (this.id) {
	        $("#" + this.id).combotree('disable');	
		}
	});
	$('#' + formId + ' .easyui-combogrid').each(function(){
        if (this.id) {
	        $("#" + this.id).combogrid('disable');	
		}
	});
	$('#' + formId + ' .easyui-datebox').each(function(){
		if (this.id) {
			$("#" + this.id).datebox('disable');
		}
	});
	$('#' + formId + ' .easyui-datetimebox').each(function(){
        if (this.id) {
	        $("#" + this.id).datetimebox('disable');	
		}
	});
	
	$('#' + formId + ' .easyui-numberbox').each(function(){
        if (this.id) {
	        $("#" + this.id).numberbox('disable');	
		}
	});
	$('#' + formId + ' .easyui-slider').each(function(){
        if (this.id) {
	        $("#" + this.id).slider('disable');	
		}
	});
	$('#' + formId + ' .easyui-numberspinner').each(function(){
        if (this.id) {
	        $("#" + this.id).numberspinner('disable');	
		}
	});
}

/**
 * 启用表单(easyui表单输入框需要ID).
 * input[text、checkbox、radio] textarea、select
 * combo、combobox、combotree、combogrid、datebox、datetimebox、numberbox、slider、numberspinner
 * @param formId 表单ID
 */
eu.formUnReadonly = function(formId){
	$('#' + formId + ' input[type="text"],input[type="checkbox"],input[type="radio"],textarea,select').attr("disabled", "false");
	$('#' + formId + ' .easyui-combo').each(function(){
        if (this.id) {
	        $("#" + this.id).combo('enable');	
		}
	});
	$('#' + formId + ' .easyui-combobox').each(function(){
		if (this.id) { 
			$("#" + this.id).combobox('enable');
		}
	});
	$('#' + formId + ' .easyui-combotree').each(function(){
        if (this.id) {
	        $("#" + this.id).combotree('enable');	
		}
	});
	$('#' + formId + ' .easyui-combogrid').each(function(){
        if (this.id) {
	        $("#" + this.id).combogrid('enable');	
		}
	});
	$('#' + formId + ' .easyui-datebox').each(function(){
		if (this.id) {
			$("#" + this.id).datebox('enable');
		}
	});
	$('#' + formId + ' .easyui-datetimebox').each(function(){
        if (this.id) {
	        $("#" + this.id).datetimebox('enable');	
		}
	});
	
	$('#' + formId + ' .easyui-numberbox').each(function(){
        if (this.id) {
	        $("#" + this.id).numberbox('enable');	
		}
	});
	$('#' + formId + ' .easyui-slider').each(function(){
        if (this.id) {
	        $("#" + this.id).slider('enable');	
		}
	});
	$('#' + formId + ' .easyui-numberspinner').each(function(){
        if (this.id) {
	        $("#" + this.id).numberspinner('enable');	
		}
	});
}


/**
 * 使panel和datagrid在加载时提示
 * 
 * @author 温春平&wencp@eryansky.com.cn
 * 
 * @requires jQuery,EasyUI
 * 
 */
$.fn.panel.defaults.loadingMessage = '加载中....';
$.fn.datagrid.defaults.loadMsg = '加载中....';
/**
 * @author 温春平&wencp@eryansky.com.cn
 * 
 * @requires jQuery,EasyUI
 * 
 * 避免验证tip屏幕跑偏
 */
var removeEasyuiTipFunction = function() {
	window.setTimeout(function() {
		$('div.validatebox-tip').remove();
	}, 0);
};
$.fn.panel.defaults.onClose = removeEasyuiTipFunction;
$.fn.window.defaults.onClose = removeEasyuiTipFunction;
$.fn.dialog.defaults.onClose = removeEasyuiTipFunction;

/**
 * @author 温春平&wencp@eryansky.com.cn
 * 
 * @requires jQuery,EasyUI
 * 
 * 为datagrid、treegrid增加表头菜单，用于显示或隐藏列，注意：冻结列不在此菜单中
 */
var createGridHeaderContextMenu = function(e, field) {
	e.preventDefault();
	var grid = $(this);/* grid本身 */
	var headerContextMenu = this.headerContextMenu;/* grid上的列头菜单对象 */
	if (!headerContextMenu) {
		var tmenu = $('<div style="width:100px;"></div>').appendTo('body');
		var fields = grid.datagrid('getColumnFields');
		for ( var i = 0; i < fields.length; i++) {
			var fildOption = grid.datagrid('getColumnOption', fields[i]);
			var title = fildOption.title;
			var field = fildOption.field;
			if(field == 'ck'){
				title = "全选";		
			}
			if (!fildOption.hidden) {
				$('<div iconCls="icon-ok" field="' + fields[i] + '"/>').html(title).appendTo(tmenu);
			} else {
				$('<div iconCls="icon-empty" field="' + fields[i] + '"/>').html(title).appendTo(tmenu);
			}
		}
		headerContextMenu = this.headerContextMenu = tmenu.menu({
			onClick : function(item) {
				var field = $(item.target).attr('field');
				if (item.iconCls == 'icon-ok') {
					if(fields.length>1){
						grid.datagrid('hideColumn', field);
						$(this).menu('setIcon', {
							target : item.target,
							iconCls : 'icon-empty'
						});
					}
					
				} else {
					grid.datagrid('showColumn', field);
					$(this).menu('setIcon', {
						target : item.target,
						iconCls : 'icon-ok'
					});
				}
			}
		});
	}
	headerContextMenu.menu('show', {
		left : e.pageX,
		top : e.pageY
	});
};
$.fn.datagrid.defaults.onHeaderContextMenu = createGridHeaderContextMenu;
$.fn.treegrid.defaults.onHeaderContextMenu = createGridHeaderContextMenu;

/**
 * @author 温春平&wencp@eryansky.com.cn
 * 
 * @requires jQuery,EasyUI
 * 
 * 防止panel/window\dialog组件超出浏览器边界
 * @param left
 * @param top
 */
var easyuiPanelOnMove = function(left, top) {
	var l = left;
	var t = top;
	if (l < 1) {
		l = 1;
	}
	if (t < 1) {
		t = 1;
	}
	var width = parseInt($(this).parent().css('width')) + 14;
	var height = parseInt($(this).parent().css('height')) + 14;
	var right = l + width;
	var buttom = t + height;
	var browserWidth = $(document).width();
	var browserHeight = $(document).height();
	if (right > browserWidth) {
		l = browserWidth - width;
	}
	if (buttom > browserHeight) {
		t = browserHeight - height;
	}
	$(this).parent().css({/* 修正面板位置 */
		left : l,
		top : t
	});
};
$.fn.dialog.defaults.onMove = easyuiPanelOnMove;
$.fn.window.defaults.onMove = easyuiPanelOnMove;
$.fn.panel.defaults.onMove = easyuiPanelOnMove;

/**
 * @author 温春平&wencp@eryansky.com.cn
 * 
 * @requires jQuery,EasyUI
 * 
 * panel关闭时回收内存，主要用于layout使用iframe嵌入网页时的内存泄漏问题
 */
$.fn.panel.defaults.onBeforeDestroy = function() {
	var frame = $('iframe', this);
	try {
		if (frame.length > 0) {
			frame[0].contentWindow.document.write('');
			frame[0].contentWindow.close();
			frame.remove();
			if ($.browser.msie) {
				CollectGarbage();
			}
		}
	} catch (e) {
	}
};

/**
 * @author 温春平&wencp@eryansky.com.cn
 * 
 * @requires jQuery,EasyUI
 * 
 * 扩展datagrid，添加动态增加或删除Editor的方法,提示消息、取消提示消息方法
 * 例如：$('#dg').datagrid('doCellTip',{cls:{'background-color':'red'},delay:1000});
 * 
 * 例子如下，第二个参数可以是数组
 * 
 * datagrid.datagrid('removeEditor', 'cpwd');
 * 
 * datagrid.datagrid('addEditor', [ { field : 'ccreatedatetime', editor : { type : 'datetimebox', options : { editable : false } } }, { field : 'cmodifydatetime', editor : { type : 'datetimebox', options : { editable : false } } } ]);
 * 
 */
$.extend($.fn.datagrid.methods, {
	addEditor : function(jq, param) {
		if (param instanceof Array) {
			$.each(param, function(index, item) {
				var e = $(jq).datagrid('getColumnOption', item.field);
				e.editor = item.editor;
			});
		} else {
			var e = $(jq).datagrid('getColumnOption', param.field);
			e.editor = param.editor;
		}
	},
	removeEditor : function(jq, param) {
		if (param instanceof Array) {
			$.each(param, function(index, item) {
				var e = $(jq).datagrid('getColumnOption', item);
				e.editor = {};
			});
		} else {
			var e = $(jq).datagrid('getColumnOption', param);
			e.editor = {};
		}
	},
	/**
	 * 开打提示功能
	 * @param {} jq
	 * @param {} params 提示消息框的样式
	 * @return {}
	 */
	doCellTip : function(jq, params) {
		function showTip(data, td, e) {
			if ($(td).text() == "")
				return;
			data.tooltip.text($(td).text()).css({
						top : (e.pageY + 10) + 'px',
						left : (e.pageX + 20) + 'px',
						'z-index' : $.fn.window.defaults.zIndex,
						display : 'block'
					});
		};
		return jq.each(function() {
			var grid = $(this);
			var options = $(this).data('datagrid');
			if (!options.tooltip) {
				var panel = grid.datagrid('getPanel').panel('panel');
				var defaultCls = {
					'border' : '1px solid #333',
					'padding' : '1px',
					'color' : '#333',
					'background' : '#f7f5d1',
					'position' : 'absolute',
					'max-width' : '200px',
					'border-radius' : '4px',
					'-moz-border-radius' : '4px',
					'-webkit-border-radius' : '4px',
					'display' : 'none'
				}
				var tooltip = $("<div id='celltip'></div>").appendTo('body');
				tooltip.css($.extend({}, defaultCls, params.cls));
				options.tooltip = tooltip;
				panel.find('.datagrid-body').each(function() {
					var delegateEle = $(this).find('> div.datagrid-body-inner').length
							? $(this).find('> div.datagrid-body-inner')[0]
							: this;
					$(delegateEle).undelegate('td', 'mouseover').undelegate(
							'td', 'mouseout').undelegate('td', 'mousemove')
							.delegate('td', {
								'mouseover' : function(e) {
									if (params.delay) {
										if (options.tipDelayTime)
											clearTimeout(options.tipDelayTime);
										var that = this;
										options.tipDelayTime = setTimeout(
												function() {
													showTip(options, that, e);
												}, params.delay);
									} else {
										showTip(options, this, e);
									}

								},
								'mouseout' : function(e) {
									if (options.tipDelayTime)
										clearTimeout(options.tipDelayTime);
									options.tooltip.css({
												'display' : 'none'
											});
								},
								'mousemove' : function(e) {
									var that = this;
									if (options.tipDelayTime) {
										clearTimeout(options.tipDelayTime);
										options.tipDelayTime = setTimeout(
												function() {
													showTip(options, that, e);
												}, params.delay);
									} else {
										showTip(options, that, e);
									}
								}
							});
				});

			}

		});
	},
	/**
	 * 关闭消息提示功能
	 * @param {} jq
	 * @return {}
	 */
	cancelCellTip : function(jq) {
		return jq.each(function() {
					var data = $(this).data('datagrid');
					if (data.tooltip) {
						data.tooltip.remove();
						data.tooltip = null;
						var panel = $(this).datagrid('getPanel').panel('panel');
						panel.find('.datagrid-body').undelegate('td',
								'mouseover').undelegate('td', 'mouseout')
								.undelegate('td', 'mousemove')
					}
					if (data.tipDelayTime) {
						clearTimeout(data.tipDelayTime);
						data.tipDelayTime = null;
					}
				});
	}
});


/**
 * @author 夏悸
 * 
 * @requires jQuery,EasyUI
 * 
 * 扩展tree，使其可以获取实心节点
 */
$.extend($.fn.tree.methods, {
	getCheckedExt : function(jq) {// 获取checked节点(包括实心)
		var checked = $(jq).tree("getChecked");
		var checkbox2 = $(jq).find("span.tree-checkbox2").parent();
		$.each(checkbox2, function() {
			var node = $.extend({}, $.data(this, "tree-node"), {
				target : this
			});
			checked.push(node);
		});
		return checked;
	},
	getSolidExt : function(jq) {// 获取实心节点
		var checked = [];
		var checkbox2 = $(jq).find("span.tree-checkbox2").parent();
		$.each(checkbox2, function() {
			var node = $.extend({}, $.data(this, "tree-node"), {
				target : this
			});
			checked.push(node);
		});
		return checked;
	}
});
/**
 * @author 温春平&wencp@eryansky.com.cn
 * 
 * @requires jQuery,EasyUI
 * 
 * 扩展tree，使其支持平滑数据格式
 */
$.fn.tree.defaults.loadFilter = function(data, parent) {
	var opt = $(this).data().tree.options;
	var idFiled, textFiled, parentField;
	if (opt.parentField) {
		idFiled = opt.idFiled || 'id';
		textFiled = opt.textFiled || 'text';
		parentField = opt.parentField;
		var i, l, treeData = [], tmpMap = [];
		for (i = 0, l = data.length; i < l; i++) {
			tmpMap[data[i][idFiled]] = data[i];
		}
		for (i = 0, l = data.length; i < l; i++) {
			if (tmpMap[data[i][parentField]] && data[i][idFiled] != data[i][parentField]) {
				if (!tmpMap[data[i][parentField]]['children'])
					tmpMap[data[i][parentField]]['children'] = [];
				data[i]['text'] = data[i][textFiled];
				tmpMap[data[i][parentField]]['children'].push(data[i]);
			} else {
				data[i]['text'] = data[i][textFiled];
				treeData.push(data[i]);
			}
		}
		return treeData;
	}
	return data;
};

/**
 * @author 温春平&wencp@eryansky.com.cn
 * 
 * @requires jQuery,EasyUI
 * 
 * 扩展treegrid，使其支持平滑数据格式
 */
$.fn.treegrid.defaults.loadFilter = function(data, parentId) {
	var opt = $(this).data().treegrid.options;
	var idFiled, textFiled, parentField;
	if (opt.parentField) {
		idFiled = opt.idFiled || 'id';
		textFiled = opt.textFiled || 'text';
		parentField = opt.parentField;
		var i, l, treeData = [], tmpMap = [];
		for (i = 0, l = data.length; i < l; i++) {
			tmpMap[data[i][idFiled]] = data[i];
		}
		for (i = 0, l = data.length; i < l; i++) {
			if (tmpMap[data[i][parentField]] && data[i][idFiled] != data[i][parentField]) {
				if (!tmpMap[data[i][parentField]]['children'])
					tmpMap[data[i][parentField]]['children'] = [];
				data[i]['text'] = data[i][textFiled];
				tmpMap[data[i][parentField]]['children'].push(data[i]);
			} else {
				data[i]['text'] = data[i][textFiled];
				treeData.push(data[i]);
			}
		}
		return treeData;
	}
	return data;
};

/**
 * @author 温春平&wencp@eryansky.com.cn
 * 
 * @requires jQuery,EasyUI
 * 
 * 扩展combotree，使其支持平滑数据格式
 */
$.fn.combotree.defaults.loadFilter = $.fn.tree.defaults.loadFilter;

/**
 * @author 孙宇
 * 
 * @requires jQuery,EasyUI
 * 
 * 创建一个模式化的dialog
 * 
 * @returns $.modalDialog.handler 这个handler代表弹出的dialog句柄
 * 
 * @returns $.modalDialog.xxx 这个xxx是可以自己定义名称，主要用在弹窗关闭时，刷新某些对象的操作，可以将xxx这个对象预定义好
 */
$.modalDialog = function(options) {
	var opts = $.extend({
		title : '',
		width : 840,
		height : 680,
		modal : true,
		onClose : function() {
			$(this).dialog('destroy');
		}
	}, options);
	opts.modal = true;// 强制此dialog为模式化，无视传递过来的modal参数
	return $.modalDialog.handler = $('<div/>').dialog(opts);
};

/**
 * @author 温春平&wencp@eryansky.com.cn
 * 
 * @requires jQuery,EasyUI
 * 
 * 扩展datagrid的editor
 * 
 * 增加带复选框的下拉树
 * 
 * 增加日期时间组件editor
 * 
 * 增加多选combobox组件
 */
$.extend($.fn.datagrid.defaults.editors, {
	combogrid: {
		init: function(container, options){
			var input = $('<input type="text" class="datagrid-editable-input">').appendTo(container); 
			input.combogrid(options);
			return input;
		},
		destroy: function(target){
			$(target).combogrid('destroy');
		},
		getValue: function(target){
			return $(target).combogrid('getValue');
		},
		setValue: function(target, value){
			$(target).combogrid('setValue', value);
		},
		resize: function(target, width){
			$(target).combogrid('resize',width);
		}
	},
	combocheckboxtree : {
		init : function(container, options) {
			var editor = $('<input />').appendTo(container);
			options.multiple = true;
			editor.combotree(options);
			return editor;
		},
		destroy : function(target) {
			$(target).combotree('destroy');
		},
		getValue : function(target) {
			return $(target).combotree('getValues').join(',');
		},
		setValue : function(target, value) {
			$(target).combotree('setValues', getList(value));
		},
		resize : function(target, width) {
			$(target).combotree('resize', width);
		}
	},
	datebox: {
        init: function (container, options) {
            var editor = $('<input type="text">').appendTo(container);
            editor.datebox(options);
            return editor;
        },
        destroy: function (target) {
            $(target).datebox('destroy');
        },
        getValue: function (target) {
            return $(target).datebox('getValue');
        },
        setValue: function (target, value) {
            $(target).datebox('setValue', formatDate(value,'yyyy-MM-dd'));
        },
        resize: function (target, width) {
            $(target).datebox('resize', width);
        }
    },
	datetimebox : {
		init : function(container, options) {
			var editor = $('<input />').appendTo(container);
			editor.datetimebox(options);
			return editor;
		},
		destroy : function(target) {
			$(target).datetimebox('destroy');
		},
		getValue : function(target) {
			return $(target).datetimebox('getValue');
		},
		setValue : function(target, value) {
			$(target).datetimebox('setValue', formatDate(value,'yyyy-MM-dd HH:mm:ss'));
		},
		resize : function(target, width) {
			$(target).datetimebox('resize', width);
		}
	},
	multiplecombobox : {
		init : function(container, options) {
			var editor = $('<input />').appendTo(container);
			options.multiple = true;
			editor.combobox(options);
			return editor;
		},
		destroy : function(target) {
			$(target).combobox('destroy');
		},
		getValue : function(target) {
			return $(target).combobox('getValues').join(',');
		},
		setValue : function(target, value) {
			$(target).combobox('setValues', getList(value));
		},
		resize : function(target, width) {
			$(target).combobox('resize', width);
		}
	},
	numberspinner: {  
        init: function(container, options){  
            var input = $('<input type="text">').appendTo(container);  
            return input.numberspinner(options);  
        },  
        destroy: function(target){  
            $(target).numberspinner('destroy');  
        },  
        getValue: function(target){  
            return $(target).numberspinner('getValue');  
        },  
        setValue: function(target, value){  
            $(target).numberspinner('setValue',value);  
        },  
        resize: function(target, width){  
            $(target).numberspinner('resize',width);  
        }  
    },
    password: {
		init: function(container, options) {
			var input = $('<input class="datagrid-editable-input" type="password"/>').appendTo(container);

			if(!$.fn.validatebox.defaults.rules.safepass) {
				$.extend($.fn.validatebox.defaults.rules, {
					safepass: {
						validator: function(value, param) {
							return !(/^(([A-Z]*|[a-z]*|\d*|[-_\~!@#\$%\^&\*\.\(\)\[\]\{\}<>\?\\\/\'\"]*)|.{0,5})$|\s/.test(value));
						},
						message: '密码由字母和数字组成，至少6位'
					}
				});
			}

			input.validatebox(options);
			return input;
		},
		getValue: function(target) {
			alert($(target).val());
			alert(target.value);
			return $(target).val();
		},
		setValue: function(target, value) {
			$(target).val(value);
		},
		resize: function(target, width) {
			var input = $(target);
			if($.boxModel == true) {
				input.width(width - (input.outerWidth() - input.width()));
			} else {
				input.width(width);
			}
		}
	}
});

/**
 * 日期格式化.
 * @param value 值
 * @param format 格式化 例如："yyyy-MM-dd"、"yyyy-MM-dd HH:mm:ss"
 * @returns
 */
function formatDate(value,format) {
	if (value == null || value == '' || value == 'null' ) {
		return '';
	}
	var dt;
	if (value instanceof Date) {
		dt = value;
	} else {
		dt = new Date(value);
		if (isNaN(dt)) {
			//将那个长字符串的日期值转换成正常的JS日期格式
			value = value.replace(/\/Date\((-?\d+)\)\//, '$1'); 
			dt = new Date();
			dt.setTime(value);
		}
	}
	return dt.format(format);
}

//扩展日期格式化 例：new Date().format("yyyy-MM-dd hh:mm:ss")
Date.prototype.format = function(format) {
	var o = {
		"M+" : this.getMonth() + 1, //month 
		"d+" : this.getDate(), //day 
		"h+" : this.getHours(), //hour 
		"m+" : this.getMinutes(), //minute 
		"s+" : this.getSeconds(), //second 
		"q+" : Math.floor((this.getMonth() + 3) / 3), //quarter 
		"S" : this.getMilliseconds()
	//millisecond 
	}
	if (/(y+)/.test(format))
		format = format.replace(RegExp.$1, (this.getFullYear() + "")
				.substr(4 - RegExp.$1.length));
	for ( var k in o)
		if (new RegExp("(" + k + ")").test(format))
			format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k]
					: ("00" + o[k]).substr(("" + o[k]).length));
	return format;
}

/**
 * @author 温春平&wencp@eryansky.com.cn
 * 
 * @requires jQuery,EasyUI
 * 
 * 扩展datagrid的datebox、datetimebox格式化
 * 
 */
$.fn.datebox.defaults.formatter = function(date){
    var vDate = new Date(date);
    return vDate.format('yyyy-MM-dd');
}
$.fn.datebox.defaults.parser = function(s) {
	if (!s)
		return new Date();
	var ss = new Date(s).format('yyyy-MM-dd').split('-');
	var y = parseInt(ss[0], 10);
	var m = parseInt(ss[1], 10);
	var d = parseInt(ss[2], 10);
	if (!isNaN(y) && !isNaN(m) && !isNaN(d)) {
		return new Date(y, m - 1, d);
	} else {
		return new Date();
	}
}
$.fn.datetimebox.defaults.formatter = function(date){
    var vDate = new Date(date);
    return vDate.format('yyyy-MM-dd hh:mm:ss');
}
$.fn.datetimebox.defaults.parser = function(s) {
	if (!s)
		return new Date();
	var ss = new Date(s).format('yyyy-MM-dd hh:mm:ss').split('-');
	var y = parseInt(ss[0], 10);
	var m = parseInt(ss[1], 10);
	var d = parseInt(ss[2], 10);
	if (!isNaN(y) && !isNaN(m) && !isNaN(d)) {
		return new Date(y, m - 1, d);
	} else {
		return new Date();
	}
}

/**
 * @author 温春平&wencp@eryansky.com.cn
 * 
 * @requires jQuery,EasyUI
 * 
 * EasyUI组件加载数据通用错误提示
 * 
 * 用于datagrid/treegrid/tree/combogrid/combobox/form加载数据出错时的操作
 */
var easyuiErrorFunction = function(XMLHttpRequest) {
	$.messager.progress('close');
	var data = XMLHttpRequest.responseText;
	if(!data){
		showAlertMsg('服务器无响应.','error');
	}else{
		showAlertMsg(data,'error');
	}
};
$.fn.datagrid.defaults.onLoadError = easyuiErrorFunction;
$.fn.treegrid.defaults.onLoadError = easyuiErrorFunction;
$.fn.tree.defaults.onLoadError = easyuiErrorFunction;
$.fn.combogrid.defaults.onLoadError = easyuiErrorFunction;
$.fn.combobox.defaults.onLoadError = easyuiErrorFunction;
$.fn.form.defaults.onLoadError = easyuiErrorFunction;


/**
 * 合并单元格扩展
 * @param {Object} jq
 * @param {Object} fields
 * @memberOf {TypeName} 
 * @return {TypeName} 
 */
$.extend($.fn.datagrid.methods, {
	autoMergeCells : function (jq, fields) {
		return jq.each(function () {
			var target = $(this);
			if (!fields) {
				fields = target.datagrid("getColumnFields");
			}
			var rows = target.datagrid("getRows");
			var i = 0,
			j = 0,
			temp = {};
			for (i; i < rows.length; i++) {
				var row = rows[i];
				j = 0;
				for (j; j < fields.length; j++) {
					var field = fields[j];
					var tf = temp[field];
					if (!tf) {
						tf = temp[field] = {};
						tf[row[field]] = [i];
					} else {
						var tfv = tf[row[field]];
						if (tfv) {
							tfv.push(i);
						} else {
							tfv = tf[row[field]] = [i];
						}
					}
				}
			}
			$.each(temp, function (field, colunm) {
				$.each(colunm, function () {
					var group = this;
					
					if (group.length > 1) {
						var before,
						after,
						megerIndex = group[0];
						for (var i = 0; i < group.length; i++) {
							before = group[i];
							after = group[i + 1];
							if (after && (after - before) == 1) {
								continue;
							}
							var rowspan = before - megerIndex + 1;
							if (rowspan > 1) {
								target.datagrid('mergeCells', {
									index : megerIndex,
									field : field,
									rowspan : rowspan
								});
							}
							if (after && (after - before) != 1) {
								megerIndex = after;
							}
						}
					}
				});
			});
		});
	}
});

/**
 * @author 温春平&wencp@eryansky.com.cn
 * 
 * @requires jQuery
 * 
 * 改变jQuery的AJAX默认属性和方法
 */
$.ajaxSetup({
	type : 'POST',
	error : function(XMLHttpRequest, textStatus, errorThrown) {
		$.messager.progress('close');
		if(!data){
			showAlertMsg('服务器无响应.','error');
		}else{
			showAlertMsg(data,'error');
		}
	}
});
