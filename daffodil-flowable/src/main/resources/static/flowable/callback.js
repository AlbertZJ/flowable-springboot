/**
 * 流程业务回调方法，由用户自行定义业务回调函数方法业务如何处理，
 * 参数说明：
 * callbackId = 回调标识编号，推荐按照{模块}-{业务}-{功能}定义，也可以使用UUID，只要唯一就行。
 * callbackType = 回调类型，根据目前业务能想到考虑的就是打开业务表单的JQueryFunction。
 * @author yweijian
 * @date 2020-07-08
 */

var FLOWABLE_CALLBACK = {
		/**
		 * 费用报销办理
		 */
		submitExpenseCallback : function(data){
			$.modal.openTab('费用报销办理', ctx + 'demo/expense/edit/' + data.businessKey);
		},
		/**
		 * 请假申请办理
		 */
		submitLeaveCallback : function(data){
			$.modal.openTab('请假申请办理', ctx + 'demo/leave/edit/' + data.businessKey);
		},
}
