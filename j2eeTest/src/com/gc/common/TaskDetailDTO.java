package com.gc.common;

public class TaskDetailDTO {

	 /**
     * 表单的值
     */
    private String inputValue;
     
     /**
     * 顺序
     */
    private Long serial;

     /**
     * 模板id
     */
    private Long TEMPLATE_ID;

     /**
     * 字段名
     */
    private String key;
     
     /**
     * 标签
     */
    private String label;
     
     /**
     * 表单类型(input,select,file等) 或为空
     */
    private String htmlType;
     
     /**
     * 合并行数
     */
    private Long rowSpan;
     
     /**
     * 合并列数
     */
    private Long colSpan;
     
     /**
     * 是否换行，0为否，1为是
     */
    private Long isBr;
     
     /**
     * 列的宽度，占百分比，存数字或*
     */
    private String colWidth;
	
}
