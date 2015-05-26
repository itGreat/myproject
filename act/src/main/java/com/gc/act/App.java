package com.gc.act;

import org.activiti.engine.ProcessEngineConfiguration;
import org.junit.Test;

/**
 * Hello world!
 *
 */
public class App 
{

	@Test
	public void init(){
		//初始化表
		ProcessEngineConfiguration cfg = ProcessEngineConfiguration.createProcessEngineConfigurationFromResourceDefault();
		cfg.buildProcessEngine();
		
	}

}
