package com.gc.web;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.StringReader;
import java.io.Writer;
import java.util.HashMap;
import java.util.Map;

import com.sun.org.apache.commons.logging.Log;
import com.sun.org.apache.commons.logging.LogFactory;

import freemarker.cache.StringTemplateLoader;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

public class DocumentHandler {

	private final Log log=LogFactory.getLog(this.getClass());
	
	private Configuration configuration = null;

	public DocumentHandler() {
		configuration = new Configuration();
		configuration.setDefaultEncoding("gbk");
	}

	public void createDoc() {
		//要填入模本的数据文件
		Map<String,Object> dataMap=new HashMap<String,Object>();
		getData(dataMap);
		//设置模本装置方法和路径,FreeMarker支持多种模板装载方法。可以从servlet，classpath，数据库装载，
		//这里我们的模板是放在com.havenliu.document.template包下面
		configuration.setClassForTemplateLoading(this.getClass(), "/com/havenliu/document/template");
		Template t=null;
		
		try {
			//test.ftl为要装载的模板
			t = configuration.getTemplate("test2.ftl");
		} catch (IOException e) {
			e.printStackTrace();
		}
		//输出文档路径及名称
		File outFile = new File("D:/temp/outFile2.doc");
		Writer out = null;
		try {
			out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(outFile)));
		} catch (FileNotFoundException e1) {
			e1.printStackTrace();
		}
		 
        try {
			t.process(dataMap, out);
		} catch (TemplateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 注意dataMap里存放的数据Key值要与模板中的参数相对应
	 * @param dataMap
	 */
	 private void getData(Map<String,Object> dataMap)
	  {
		  dataMap.put("nameResult", "这是测试出来的结果");

		  
	  }
	 
	 public void export(String xmlString,Map<String,Object> root,String pathName,String fileName) throws IOException{
		 
		 StringTemplateLoader stringTemplateLoader = new StringTemplateLoader();
		 configuration.setTemplateLoader(stringTemplateLoader);
		 
		    Template temp  =  new Template("test",new StringReader(xmlString), configuration, "GBK");
			//输出文档路径及名称"D:/temp/inspect_report.doc"
			File outFile = new File(pathName,fileName);
			Writer out = null;
			try {
				out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(outFile)));
				out.flush();
				temp.process(root, out);
			} catch (Exception e1) {
				log.error("生成报告异常====",e1);
			}finally{
				if(out!=null){
					out.close();
				}
			}

			
	 }
	 
	 
	 public void export(String xmlString,Map<String,Object> root,Writer out ) throws IOException{
		 
		 StringTemplateLoader stringTemplateLoader = new StringTemplateLoader();
		 configuration.setTemplateLoader(stringTemplateLoader);
		 
		    Template temp  =  new Template("test",new StringReader(xmlString), configuration, "GBK");
			//输出文档路径及名称
//			File outFile = new File("D:/temp/inspect_report.doc");
//			Writer out = null;
			try {
//				out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(outFile)));
//				out.flush();
				temp.process(root, out);
			} catch (Exception e1) {
				log.error("生成报告异常====",e1);
			}finally{
				if(out!=null){
					out.close();
				}
			}

			
	 }
	
}
