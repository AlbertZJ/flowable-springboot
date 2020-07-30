package com.daffodil.flowable.service.impl;

import java.io.BufferedInputStream;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.flowable.bpmn.model.BpmnModel;
import org.flowable.engine.ProcessEngine;
import org.flowable.engine.ProcessEngineConfiguration;
import org.flowable.engine.repository.Deployment;
import org.flowable.engine.repository.DeploymentQuery;
import org.flowable.engine.repository.ProcessDefinition;
import org.flowable.image.impl.DefaultProcessDiagramGenerator;
import org.flowable.ui.common.service.exception.NotFoundException;
import org.flowable.ui.modeler.domain.Model;
import org.flowable.ui.modeler.repository.ModelRepository;
import org.flowable.ui.modeler.serviceapi.ModelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.daffodil.core.constant.Constants;
import com.daffodil.core.dao.JpaDao;
import com.daffodil.core.entity.Page;
import com.daffodil.core.entity.Query;
import com.daffodil.core.exception.BaseException;
import com.daffodil.flowable.entity.ActCnDeployment;
import com.daffodil.flowable.entity.ActCnModel;
import com.daffodil.flowable.entity.ActCnFlowType;
import com.daffodil.flowable.entity.ActCnFlowUser;
import com.daffodil.flowable.service.IFlowableModelService;
import com.daffodil.util.StringUtils;

/**
 * 
 * @author yweijian
 * @date 2020年1月13日
 * @version 1.0
 */
@Service
public class FlowableModelServiceImpl implements IFlowableModelService{

	@Autowired
	private JpaDao jpaDao;
	
	@Autowired
	private ModelService modelService;
	
	@Autowired
    protected ModelRepository modelRepository;
	
	@Autowired
	private ProcessEngine processEngine;

	@Override
	@Transactional
	public void deployModeler(String modelId, String typeId) {
		org.flowable.ui.modeler.domain.Model model = null;
		try{
			model = modelService.getModel(modelId);
		} catch (NotFoundException e) {
			throw new BaseException("流程发布失败，没有查找到ID为【" + modelId + "】的流程模板");
		}
		if (StringUtils.isNotEmpty(model.getModelEditorJson())) {
			
			String category = this.categoryBuilder(typeId);
			
			BpmnModel bpmnModel = modelService.getBpmnModel(model);
			byte[] xmlBytes = modelService.getBpmnXML(bpmnModel);
			BufferedInputStream bin = new BufferedInputStream(new ByteArrayInputStream(xmlBytes));
			String resourceName = model.getName().replaceAll(" ", "_") + ".bpmn20.xml";
			Deployment deployment = processEngine.getRepositoryService().createDeployment()
					.name(model.getName())
					.key(model.getKey())
					.category(category)
					.tenantId(typeId)//将租户ID作为模型类型的ID
					.addInputStream(resourceName, bin)
					.deploy();
			
			List<ProcessDefinition> list = processEngine.getRepositoryService().createProcessDefinitionQuery()
					.deploymentId(deployment.getId())
					.list();
			if(StringUtils.isNotEmpty(list)){
				for (ProcessDefinition processDefinition : list) {
					processEngine.getRepositoryService().setProcessDefinitionCategory(processDefinition.getId(), category);
				}
			}
		}else{
			throw new BaseException("流程发布失败，【" + model.getName() + "】流程模板不完整，请完善设计");
		}
	}
	
	private String categoryBuilder(String typeId){
		ActCnFlowType flowType = jpaDao.find(ActCnFlowType.class, typeId);
		String[] ancestors = flowType.getAncestors().split(",");
		String category = "";
		if(StringUtils.isNotEmpty(ancestors)){
			for(int i = 0; i < ancestors.length; i++){
				String id = ancestors[i];
				if(StringUtils.isNotEmpty(id) && !Constants.ROOT.equals(id)){
					ActCnFlowType children = jpaDao.find(ActCnFlowType.class, id);
					category += children.getTypeName() + " / ";
				}
			}
		}
		return category + flowType.getTypeName();
	}
	
	@Override
	@Transactional
	public void removeDeployment(String[] ids) {
		if(StringUtils.isNotEmpty(ids)){
			for(String deployId : ids){
				List<Object> paras = new ArrayList<Object>();
				paras.add(Constants.NORMAL);
				paras.add(deployId);
				ActCnFlowUser flowUser = jpaDao.find("from ActCnFlowUser where status = ? and deployId = ? ", paras, ActCnFlowUser.class);
				if(null != flowUser){
					throw new BaseException("删除失败，流程已绑定用户不能删除");
				}
				try {
					processEngine.getRepositoryService().deleteDeployment(deployId);
				}catch (Exception e) {
					throw new BaseException("删除失败，存在未完成的业务流程");
				}
				
			}
		}
	}

	@Override
	public InputStream getModelerDiagramByModelKey(String modelKey) {
		InputStream in = null;
		BpmnModel bpmnModel = null;
		//流程已部署（已发布）-查看流程图方法
		Deployment deployment = processEngine.getRepositoryService().createDeploymentQuery().deploymentKey(modelKey).singleResult();
		if(null != deployment){
			ProcessDefinition process = processEngine.getRepositoryService().createProcessDefinitionQuery()
					.deploymentId(deployment.getId())
					.singleResult();
			if(null != process){
				bpmnModel = processEngine.getRepositoryService().getBpmnModel(process.getId());
			}
		}else{
			//流程待部署（待发布）-查看流程图方法
			try {
				Model model = modelService.getModel(modelKey);
				if(StringUtils.isNotEmpty(model.getModelEditorJson())){
					bpmnModel = modelService.getBpmnModel(model);
				}
			} catch (NotFoundException e) {
				//流程模板已删除
			}
		}
		
		if(null != bpmnModel){
			DefaultProcessDiagramGenerator generator = new DefaultProcessDiagramGenerator();
			ProcessEngineConfiguration engconf = processEngine.getProcessEngineConfiguration();
			in = generator.generateDiagram(bpmnModel, "png", 
					engconf.getActivityFontName(), 
					engconf.getLabelFontName(), 
					engconf.getAnnotationFontName(), 
					null, true);
			
		}
		return in;
	}

	@Override
	public List<ActCnModel> selectModelUndeployList(Query<ActCnModel> query) {
		
		List<Model> models = null;
		ActCnModel actCnModel = query.getEntity();
        if(StringUtils.isNotEmpty(actCnModel.getName())){
            models = modelRepository.findByModelTypeAndFilter(0, "%" + actCnModel.getName() + "%", "modifiedDesc");
        } else {
            models = modelRepository.findByModelType(0, "modifiedDesc");
        }

        //已部署的流程
        List<Deployment> list = processEngine.getRepositoryService().createDeploymentQuery().orderByDeploymenTime().desc().list();
        
        List<ActCnModel> datas = new ArrayList<ActCnModel>();
        if (StringUtils.isNotEmpty(models)) {
            for (Model model : models) {
            	boolean deploy = false;
            	if(StringUtils.isNotEmpty(list)){
            		for(Deployment deployment : list){
            			if(deployment.getKey().equals(model.getKey())){
            				deploy = true;
            				break;
            			}
            		}
            	}
            	if(!deploy){
            		ActCnModel m = new ActCnModel(model);
    				datas.add(m);
            	}
            }
        }
		return datas;
	}

	@Override
	public List<ActCnDeployment> selectModelDeployList(Query<ActCnDeployment> query) {
		
		List<Deployment> list = null;
		DeploymentQuery deploymentQuery = processEngine.getRepositoryService().createDeploymentQuery();
		ActCnDeployment actCnDeployment = query.getEntity();
		
		if(StringUtils.isNotEmpty(actCnDeployment.getName())){
			deploymentQuery.deploymentNameLike("%" + actCnDeployment.getName() + "%");
		}
		if(StringUtils.isNotEmpty(actCnDeployment.getModelKey())){
			deploymentQuery.deploymentKeyLike("%" + actCnDeployment.getModelKey() + "%");
		}
		if(StringUtils.isNotEmpty(actCnDeployment.getCategory())){
			deploymentQuery.deploymentCategoryLike("%" + actCnDeployment.getCategory() + "%");
		}
		if(StringUtils.isNotEmpty(actCnDeployment.getTenantId())){
			deploymentQuery.deploymentTenantId(actCnDeployment.getTenantId());
		}
		if (StringUtils.isNotNull(query.getPage())) {
			Page page = query.getPage();
			page.setTotalRow((int) deploymentQuery.count());
			list = deploymentQuery.orderByDeploymenTime().desc().listPage(page.getFromIndex(), page.getPageSize());
		}else{
			list = deploymentQuery.orderByDeploymenTime().desc().list();
		}
		List<ActCnDeployment> datas = new ArrayList<ActCnDeployment>();
		if (StringUtils.isNotEmpty(list)) {
			for (int i = 0; i < list.size(); i++) {
				Deployment deployment = list.get(i);
				ActCnDeployment d = new ActCnDeployment(deployment);
				datas.add(d);
			}
		}
		return datas;
	}

}
