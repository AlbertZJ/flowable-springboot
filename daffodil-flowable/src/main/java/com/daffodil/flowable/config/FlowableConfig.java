package com.daffodil.flowable.config;

import javax.sql.DataSource;

import org.flowable.spring.SpringProcessEngineConfiguration;
import org.flowable.spring.boot.EngineConfigurationConfigurer;
import org.flowable.ui.modeler.properties.FlowableModelerAppProperties;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.AutoConfigureOrder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import liquibase.Liquibase;
import liquibase.database.Database;
import liquibase.database.DatabaseConnection;
import liquibase.database.DatabaseFactory;
import liquibase.database.jvm.JdbcConnection;
import liquibase.resource.ClassLoaderResourceAccessor;

/**
 * 
 * @author yweijian
 * @date 2020年1月9日
 * @version 1.0
 */
@Configuration
@AutoConfigureOrder(value=1)
public class FlowableConfig implements EngineConfigurationConfigurer<SpringProcessEngineConfiguration> {
	
	protected static final String LIQUIBASE_CHANGELOG_PREFIX = "ACT_DE_";
    
	@Value("${flowable.diagram.activityFontName: 宋体}")
    private String activityFontName;

    @Value("${flowable.diagram.labelFontName: 宋体}")
    private String labelFontName;

    @Value("${flowable.diagram.annotationFontName: 宋体}")
    private String annotationFontName;
    
    @Bean
	public FlowableModelerAppProperties flowableModelerAppProperties() {
		FlowableModelerAppProperties flowableModelerAppProperties=new FlowableModelerAppProperties();
		return flowableModelerAppProperties;
	}
    
    @Bean
	public Liquibase liquibase(DataSource dataSource) {

		try {
			DatabaseConnection connection = new JdbcConnection(dataSource.getConnection());
			Database database = DatabaseFactory.getInstance().findCorrectDatabaseImplementation(connection);
			database.setDatabaseChangeLogTableName(LIQUIBASE_CHANGELOG_PREFIX + database.getDatabaseChangeLogTableName());
			database.setDatabaseChangeLogLockTableName(LIQUIBASE_CHANGELOG_PREFIX + database.getDatabaseChangeLogLockTableName());

			Liquibase liquibase = new Liquibase("META-INF/liquibase/flowable-modeler-app-db-changelog.xml", new ClassLoaderResourceAccessor(), database);
			liquibase.update("flowable");
			return liquibase;

		} catch (Exception e) {
			throw new RuntimeException("Error creating liquibase database", e);
		}
	}
    
	@Override
    public void configure(SpringProcessEngineConfiguration springProcessEngineConfiguration) {
        springProcessEngineConfiguration.setActivityFontName(activityFontName);
        springProcessEngineConfiguration.setLabelFontName(labelFontName);
        springProcessEngineConfiguration.setAnnotationFontName(annotationFontName);
    }
}
