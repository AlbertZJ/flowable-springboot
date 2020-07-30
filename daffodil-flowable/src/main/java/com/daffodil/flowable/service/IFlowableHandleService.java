package com.daffodil.flowable.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.daffodil.core.entity.Query;
import com.daffodil.flowable.entity.ActCnHistoricActivity;
import com.daffodil.flowable.entity.ActCnHistoricProcess;

/**
 * 通用流程办理实现接口
 * @author yweijian
 * @date 2020年1月16日
 * @version 1.0
 */
public interface IFlowableHandleService {

	/**
	 * 直接办理 <br>
	 * 一般性的流程办理，在流程过程的输出线中无特殊的、复杂的、逻辑运算的网关 <br>
	 * 基本上能够满足绝大部分的一般性流程办理
	 * @param businessKey 业务ID
	 * @param userId 用户ID（loginName）
	 * @param handleId 操作ID
	 * @param message 办理意见
	 * @param attachmentName 附件名称
	 * @param attachmentDescription 附件备注描述
	 * @param attachmentFile 附件流
	 */
	public void generalDirectHandle(String businessKey, String userId, String handleId, String message, String attachmentName, String attachmentDescription, MultipartFile attachmentFile);
	
	/**
	 * 设置下一步骤任务的执行人
	 * @param businessKey 业务ID
	 * @param nodeId 下一步任务节点
	 * @param userId 执行人
	 */
	public void changeTaskAssignee(String businessKey, String nodeId, String userId);
	
	/**
	 * 流程作废
	 * @param businessKey 业务ID
	 */
	public void deleteProcessInstance(String businessKey);
	
	/**
	 * 流程撤办<br>
	 * 撤办是指流程任务节点执行人撤回办理操作，可跨任务节点撤办
	 * @param businessKey
	 * @param userId
	 */
	public void backProcessInstance(String businessKey, String userId);
	
	/**
	 * 流程驳回<br>
	 * 驳回是指任意任务节点驳回到流程发起节点<br>
	 * 若在并行网关或包容网关情况下驳回操作，只要其中一支分支选择操作【驳回】即将所有分支任务驳回到发起人任务节点
	 * @param businessKey
	 * @param message
	 * @param userId
	 */
	public void rejectProcessInstance(String businessKey, String message, String userId);
	
	/**
	 * 我的任务 <br>
	 * 根据查询条件查询本人发起的流程任务 <br>
	 * @param query
	 * @param taskIsFinished 任务是否已办
	 * @param processIsfinished 流程是否结束
	 * @return
	 */
	public List<ActCnHistoricProcess> selectMyselfProcessList(Query<ActCnHistoricProcess> query, boolean taskIsFinished, boolean processIsfinished);
	
	/**
	 * 待办任务<br>
	 * 根据查询条件查询他人提交给本人的待办任务
	 * @param query
	 * @return
	 */
	public List<ActCnHistoricProcess> selectUnfinishedProcessList(Query<ActCnHistoricProcess> query);
	
	/**
	 * 已办任务<br>
	 * 根据查询条件查询他人提交给本人的已办任务
	 * @param query
	 * @return
	 */
	public List<ActCnHistoricProcess> selectFinishedProcessList(Query<ActCnHistoricProcess> query);
	
	/**
	 * 办结任务<br>
	 * 根据查询条件查询他人提交给本人的办结任务（主要提供给管理员使用）
	 * @param query
	 * @return
	 */
	public List<ActCnHistoricProcess> selectCompleteProcessList(Query<ActCnHistoricProcess> query);
	
	/**
	 * 根据业务ID查询流程步骤详情
	 * @param businessKey
	 * @return
	 */
	public List<ActCnHistoricActivity> selectHistoricActivityByBusinessKey(String businessKey);

}
