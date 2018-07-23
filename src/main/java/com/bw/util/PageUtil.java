package com.bw.util;

public class PageUtil {
	private String page;//请求页
	private int pageSize;//每页展示的记录数
	private int count;//总记录数
	
	private int prevPage;//上一页
	private int nextPage;//下一页
	private int currentPage;//处理后的当前页
	private int lastPage;//总记录数
	private int startIndex;//每页起始索引值
	public PageUtil(String page, int pageSize, int count) {
		super();
		this.page = page;
		this.pageSize = pageSize;
		this.count = count;
		//将计算的统计出来
		
		//处理当前页
		if(page==null || page == ""){
			this.currentPage = 1;
		}else{
			this.currentPage = Integer.parseInt(page);
		}
		
		//处理上一页
		if(this.currentPage == 1){
			this.prevPage = 1;
		}else{
			this.prevPage = this.currentPage -1;
		}
		
		//处理尾页
		if(count%pageSize == 0){
			this.lastPage = count/pageSize;
		}else{
			this.lastPage = count/pageSize + 1;
		}
		
		//处理下一页
		if(this.currentPage == this.lastPage){
			this.nextPage = this.lastPage;
		}else{
			this.nextPage = this.currentPage + 1;
		}
		
		//得到每页起始索引值
		this.startIndex = (this.currentPage - 1)* pageSize;
	}
	public PageUtil() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "PageUtil [page=" + page + ", pageSize=" + pageSize + ", count="
				+ count + ", prevPage=" + prevPage + ", nextPage=" + nextPage
				+ ", currentPage=" + currentPage + ", lastPage=" + lastPage
				+ ", startIndex=" + startIndex + "]";
	}
	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getPrevPage() {
		return prevPage;
	}
	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}
	public int getNextPage() {
		return nextPage;
	}
	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getLastPage() {
		return lastPage;
	}
	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}
	public int getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}
}
