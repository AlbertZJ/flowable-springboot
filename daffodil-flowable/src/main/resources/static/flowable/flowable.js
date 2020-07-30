/**
 * 流程引擎内部方法
 * @author yweijian
 * @date 2020-07-08
 */
$(function(){
	/**
	 * 流程引擎实例化
	 */
	flowableEngineInit();
	renderFlowNodeState();
	renderFlowButton();
	renderFlowItems();
	
});

/**
 * 初始化流程引擎实例
 * 
 */
function flowableEngineInit(){
	
	var deployId = $('input[name="deployId"]').val();
	if(deployId){
		//加载流程信息
		$.ajax({
	        url: ctx + "flowable/engine/info/" + deployId,
	        type: "get",
	        dataType: "json",
	        beforeSend: function () {
	        	$.modal.loading("正在处理中，请稍后...");
	        	$.modal.disable();
	        },
	        success: function(res) {
	        	if(res.code == 0){
	        		if(res.data){
	        			renderFlowTopLabel(res.data);
	        			renderFlowFormField(res.data);
	        		}else{
		    			renderFormReadonly();
		    		}
		        	$.modal.closeLoading();
		            $.modal.enable();
	        	}
	        }
		});
	}else{
		var flowTypeId = $('input[name="flowTypeId"]').val();
		if(!flowTypeId){
			$.modal.alertError('流程引擎实例失败，流程类型【flowTypeId】不能为空');
			renderFormReadonly();
			return false;
		}
		//加载流程信息
		$.ajax({
	        url: ctx + "flowable/engine/infos/" + flowTypeId,
	        type: "get",
	        dataType: "json",
	        beforeSend: function () {
	        	$.modal.loading("正在处理中，请稍后...");
	        	$.modal.disable();
	        },
	        success: function(res) {
	        	if(res.code == 0){
	        		if(res.data && res.data.length > 1){//多个流程提供用户自行选择
	        			var index  = openFlowSelectModel(res.data);
	            		$('.df-flow-select li').click(function(e){
	            			layer.close(index);
	            			var i = parseInt($(this).find('span').text()) - 1;
	            			renderFlowTopLabel(res.data[i]);
	            			renderFlowFormField(res.data[i]);
	            		});
	        		}else if(res.data && res.data.length == 1){//只有一个流程，直接写入
	        			renderFlowTopLabel(res.data[0]);
	        			renderFlowFormField(res.data[0]);
	        		}
	    		}else{
	    			$.modal.alertError(res.msg);
	    			renderFormReadonly();
	    		}
	        	$.modal.closeLoading();
	            $.modal.enable();
	        }
	    });
	}
}

/**
 * 渲染流程节点状态
 */
function renderFlowNodeState(){
	var businessKey = $('input[name="businessKey"]').val();
	if(businessKey){
		$.ajax({
	        url: ctx + "flowable/engine/node/" + businessKey,
	        type: "get",
	        dataType: "json",
	        success: function(res) {
	        	if(res.data){
	        		$('.df-flow-info').find('li').eq(2).find('span').html(res.data.name);
	        	}else{
	        		$('.df-flow-info').find('li').eq(2).find('span').html('结束');
	        	}
	        }
		});
	}
}

/**
 * 渲染表单按钮
 */
function renderFlowButton(){
	var $button = $('.df-flow-head-btn');
	$button.empty();
	var businessKey = $('input[name="businessKey"]').val() || 0;
	$.ajax({
        url: ctx + "flowable/engine/button/" + businessKey,
        type: "get",
        dataType: "json",
        success: function(res) {
        	if(res.code == 0){
        		if(res.data){
        			var isReadonly = true;
        			for(var i = 0; i < res.data.length; i++){
        				$button.append(FLOW_BUTTON[res.data[i]]);
        				if(res.data[i] == 'actFormSave'){
        					isReadonly = false;
        				}
        			}
        			if(isReadonly){
        				renderFormReadonly();
        			}
        		}
        	}
        }
	});
}

/**
 * 渲染流程记录
 */
function renderFlowItems(){
	var businessKey = $('input[name="businessKey"]').val();
	if(businessKey){
		$.ajax({
	        url: ctx + "flowable/engine/detail/" + businessKey,
	        type: "get",
	        dataType: "json",
	        success: function(res) {
	        	if(res.code == 0){
	        		if(res.data && res.data.length > 0){
	        			$('#flowItems').empty();
	        			$('#flowItems').css({'padding-top' : '10px'});
	        			var lastAssignee = '';
	        			for(var i = 0; i < res.data.length; i++){
	        				var str = '<ul class="connectList agile-list">';
	        				str += '<li class="' + (i % 2 == 0 ? 'success-element' : 'warning-element') + '">';
	        				str += '<div>环节名称：' + res.data[i].activityName + ' </div>';
	        				if(res.data[i].deleteReason){
	        					str += '<div>办理意见：' + res.data[i].deleteReason + '</div>';
	        				}else if(res.data[i].comment){
	        					str += '<div>办理意见：' + res.data[i].comment + '</div>';
	        				}
	        				str += '<div class="agile-detail">';
	        				if(res.data[i].assignee){
	        					str += '<a class="pull-right btn btn-xs btn-white">执行人：' + res.data[i].assignee + '</a>';
	        				}
	        				str += '<i class="fa fa-clock-o"></i>';
	        				str += dateFormat('yyyy-MM-dd hh:mm:ss', res.data[i].startTime) + " ~ "; 
	        				str += (res.data[i].endTime != null ? dateFormat('yyyy-MM-dd hh:mm:ss', new Date()) : '正在办理 . . . ');
	        				str += '</div></li></ul>';
	        				$('#flowItems').append(str);
	        			}
	        			
	        			setTimeout(function() {
	        				if($('.df-flow-main').height() < $('#flowItems').height()){
	        					$('.df-flow-main').css('height', $('#flowItems').height() + 160);
	        				}
	        			}, 500);
	        		}
	        	}else{
	        		$.modal.alertError(res.msg);
	        	}
	        }
		});
	}
}

/**
 * 渲染表单只读属性
 */
function renderFormReadonly(){
	$('input').attr("readonly", 'readonly');
	$('textarea').attr("readonly", 'readonly');
}

/**
 * 打开流程选择弹出层
 */
function openFlowSelectModel(datas){
	var content = '<ul class="df-flow-select">';
	for(var i = 0; i < datas.length; i++){
		content += '<li><span>' + (i + 1) +'、</span>' + datas[i].category + " / " + datas[i].name + '</li>';
	}
	content += '</ul>';
	var index = layer.open({
		type: 1,
		area: ['500px', '400px'],
		fix: false,
		maxmin: true,//不固定
		shade: 0.3,
		title: '选择流程',
		content: content,
		closeBtn: 0,
		shadeClose: false // 弹层外区域不关闭
	});
	return index;
}

/**
 * 渲染表单顶部标签
 */
function renderFlowTopLabel(data){
	$('.df-flow-info').empty();
	var $ul = $('<ul></ul>')
		.append('<li>流程类型：<span>' + data.category + '</span></li>')
		.append('<li>流程名称：<span>' + data.name + '</span></li>')
		.append('<li>当前环节：<span>开始</span></li>');
	$('.df-flow-info').append($ul);
}

/**
 * 渲染表单流程关键字段
 */
function renderFlowFormField(data){
	if(data.tenantId){
		$('input[name="flowTypeId"]').val(data.tenantId);
	}
	if(data.deployId){
		$('input[name="deployId"]').val(data.deployId);
	}
	if(data.modelKey){
		$('input[name="modelKey"]').val(data.modelKey);
	}
	if(data.name){
		$('input[name="modelName"]').val(data.name);
	}
	if(data.instanceId){
		$('input[name="instanceId"]').val(data.instanceId);
	}
}


var FLOW_BUTTON = {
	actFormSave : '<a class="btn btn-primary btn-rounded btn-sm" onclick="flowEngine.actFormSave()">保存</a>',
	actFlowSend : '<a class="btn btn-primary btn-rounded btn-sm" onclick="flowEngine.actFlowSend()">发送</a>',
	actFlowBack : '<a class="btn btn-primary btn-rounded btn-sm" onclick="flowEngine.actFlowBack()">撤办</a>',
	actFlowReject : '<a class="btn btn-primary btn-rounded btn-sm" onclick="flowEngine.actFlowReject()">驳回</a>',
	actFlowTrash : '<a class="btn btn-primary btn-rounded btn-sm" onclick="flowEngine.actFlowTrash()">作废</a>',
	actFormClose : '<a class="btn btn-default btn-rounded btn-sm" onclick="flowEngine.actFormClose()">关闭</a>'
}

var flowEngine = {
	/**
	 * 保存（表单保存）
	 */
	actFormSave : function(){
		if(typeof submitHandler == 'function'){
			submitHandler();
		}
	},
	/**
	 * 保存（表单提交）
	 */
	actFormPost : function(url, data, callback){
		var config = {
	        url: url,
	        type: "post",
	        dataType: "json",
	        data: data,
	        beforeSend: function () {
	        	$.modal.loading("正在处理中，请稍后...");
	        	$.modal.disable();
	        },
	        success: function(res) {
	        	if(res.code == 0){
	        		layer.msg("保存成功,正在刷新数据请稍后……", {
                	    icon: $.modal.icon('success'),
                	    time: 500,
                	    shade: [0.1, '#8F8F8F']
                	});
	        		if(typeof callback == 'function'){
		        		callback(res);
		        	}
	        	}else{
	        		$.modal.alertError(res.msg);
	        	}
	        	$.modal.closeLoading();
	            $.modal.enable();
	        }
	    };
	    $.ajax(config);
	},
	/**
	 * 发送
	 */
	actFlowSend : function(){
		var businessKey = $('input[name="businessKey"]').val();
		if(businessKey){
			$.modal.open("任务办理", ctx + "flowable/task/submit/" + businessKey);
		}
	},	
	/**
	 * 撤办
	 */
	actFlowBack : function(){
		var businessKey = $('input[name="businessKey"]').val();
		if(businessKey){
			$.modal.confirm("确定要撤回办理吗？", function() {
				$.ajax({
			        url: ctx + "flowable/engine/back",
			        type: "post",
			        dataType: "json",
			        data: {'businessKey' : businessKey},
			        success: function(res) {
			        	if(res.code == 0){
			        		layer.msg("保存成功,正在刷新数据请稍后……", {
		                	    icon: $.modal.icon('success'),
		                	    time: 500,
		                	    shade: [0.1, '#8F8F8F'],
		                	    end: function(){
		                	    	refreshItem();
		                	    }
		                	});
			        	}else{
			        		$.modal.alertError(res.msg);
			        	}
			        }
				});
			});
		}
	},
	/**
	 * 驳回
	 */
	actFlowReject : function(){
		var businessKey = $('input[name="businessKey"]').val();
		if(businessKey){
			$.modal.confirm("确定要驳回办理吗？", function() {
				$.ajax({
			        url: ctx + "flowable/engine/reject",
			        type: "post",
			        dataType: "json",
			        data: {'businessKey' : businessKey},
			        success: function(res) {
			        	if(res.code == 0){
			        		layer.msg("保存成功,正在刷新数据请稍后……", {
		                	    icon: $.modal.icon('success'),
		                	    time: 500,
		                	    shade: [0.1, '#8F8F8F'],
		                	    end: function(){
		                	    	refreshItem();
		                	    }
		                	});
			        	}else{
			        		$.modal.alertError(res.msg);
			        	}
			        }
				});
			});
		}
	},
	/**
	 * 作废
	 */
	actFlowTrash : function(){
		var businessKey = $('input[name="businessKey"]').val();
		if(businessKey){
			$.modal.confirm("确定要作废该业务流程吗？", function() {
				$.ajax({
			        url: ctx + "flowable/engine/trash",
			        type: "post",
			        dataType: "json",
			        data: {'businessKey' : businessKey},
			        success: function(res) {
			        	if(res.code == 0){
			        		layer.msg("保存成功,正在刷新数据请稍后……", {
		                	    icon: $.modal.icon('success'),
		                	    time: 500,
		                	    shade: [0.1, '#8F8F8F'],
		                	    end: function(){
		                	    	refreshItem();
		                	    }
		                	});
			        	}else{
			        		$.modal.alertError(res.msg);
			        	}
			        }
				});
			});
		}
	},
	/**
	 * 关闭
	 */
	actFormClose : function(){
		$.modal.closeTab();
	},
	/**
	 * 流程引擎回调函数
	 */
	actFlowCallback : function(data, callback){
		data.flowName = data.flowName ? data.flowName : $('input[name="flowName"').val();
		data.flowTypeId = data.flowTypeId ? data.flowTypeId : $('input[name="flowTypeId"').val();
		data.modelKey = data.modelKey ? data.modelKey : $('input[name="modelKey"').val();
		data.businessKey = data.id ? data.id : $('input[name="businessKey"').val();
		data.callbackId = data.callbackId ? data.callbackId : $('input[name="callbackId"').val();
		data.callbackType = data.callbackType ? data.callbackType : $('input[name="callbackType"').val();
		
		$.ajax({
	        url: ctx + "flowable/engine/start",
	        type: "post",
	        dataType: "json",
	        data: data,
	        success: function(res) {
	        	if(res.code == 0){
	        		if(typeof callback == 'function'){
	        			callback(res);
	        		}
	        	}else{
	        		$.modal.alertError(res.msg);
	        	}
	        }
		});
	}
}
