package com.gc.util;

public class PagerUtil {
	
	static class Pager{
		protected int pageNo = 1;
		protected int pageSize = 15;
		protected long totalCount = 0;
		
		public Pager() {
			super();
		}

		public Pager(int pageNo, int pageSize, long totalCount) {
			super();
			this.pageNo = pageNo;
			this.pageSize = pageSize;
			this.totalCount = totalCount;
		}

		/**
		 * 根据pageSize与totalCount计算总页数, 默认值为-1.
		 */
		public  long getTotalPages() {
			if (totalCount < 0) {
				return -1;
			}

			long count = totalCount / pageSize;
			if (totalCount % pageSize > 0) {
				count++;
			}
			return count;
		}

		/**
		 * 是否还有下一页.
		 */
		public boolean isHasNext() {
			return (pageNo + 1 <= getTotalPages());
		}

		/**
		 * 取得下页的页号, 序号从1开始. 当前页为尾页时仍返回尾页序号.
		 */
		public int getNextPage() {
			if (isHasNext()) {
				return pageNo + 1;
			} else {
				return pageNo;
			}
		}

		/**
		 * 是否还有上一页.
		 */
		public boolean isHasPre() {
			return (pageNo - 1 >= 1);
		}

		/**
		 * 取得上页的页号, 序号从1开始. 当前页为首页时返回首页序号.
		 */
		public int getPrePage() {
			if (isHasPre()) {
				return pageNo - 1;
			} else {
				return pageNo;
			}
		}
	}
	
	
	
	public static String getPageHtml(Integer total,Integer pageNo,Integer pageSize){
		Pager paper = new Pager(pageNo,pageSize,total);
		StringBuffer html = new StringBuffer();
		html.append("<style>");
		html.append(".pager{ font-family:Verdana; font-size:13px;margin-top: 10px;}");
		html.append(".pager a,.pager span{ padding:5px 8px; border:1px solid #ddd; background:#ebebeb; margin-right:10px; text-decoration:none; color:#383838;}");
		html.append(".pager .current{ padding:5px 8px; border:1px solid #009dd7; margin-right:10px; background:#3790CE; color:#fff;}");
		html.append("</style>");
		
		//<div class="pager" id="pager"><span class="current">1</span><a href="http://baidu.com/?page=2">2</a><a href="http://baidu.com/?page=3">3</a><a href="http://baidu.com/?page=4">4</a><a href="http://baidu.com/?page=5">5</a><a href="http://baidu.com/?page=6">6</a><a href="http://baidu.com/?page=7">7</a><span>…</span><a href="http://baidu.com/?page=10">Last</a><a href="http://baidu.com/?page=2">下一页</a></div>
		html.append("<div class='pager' id='pager'>");
		html.append("<a href='javascript:;' onclick='jumpPage(1)'>首页</a>");
		html.append("<a href='javascript:;' onclick='jumpPage("+paper.getPrePage()+")'>上一页</a>");
		int count = 0;
		if(paper.isHasPre()){
			for (int i = pageNo-5; i < pageNo; i++) {
				if(i > 0){
					html.append("<a href='javascript:;' onclick='jumpPage("+i+")'>"+i+"</a>");
					count++;
				}
			}
		}
		
		html.append("<span class='current'>"+pageNo+"</span>");
//		int size = paper.getTotalPages() > (9 - count) ? ;
		for (int i = pageNo+1; i <= pageNo + 5; i++) {
			html.append("<a href='javascript:;' onclick='jumpPage("+i+")'>"+i+"</a>");
		}
		html.append("<a href='javascript:;' onclick='jumpPage("+paper.getNextPage()+")'>下一页</a>");
		html.append("<a href='javascript:;' onclick='jumpPage("+paper.getTotalPages()+")'>尾页</a>");
		html.append("<span>共"+paper.getTotalPages()+"页</span>");
		html.append("<div>");

		return html.toString();
	}
	
}
