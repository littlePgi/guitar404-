package util;

import java.util.List;

/**
 * 分页工具类
 */
public class PageUtil<T> {
	private int total;// 总记录数  
    private int pageSize;// 每页记录数  
    private int pageNum;// 当前页码  
    private int totalPage;// 总页数
    private List<T> list;//查询到数据list
    
    public PageUtil() {
	}
    
	public PageUtil(int total, int pageNum, int pageSize) {
		this.total = total;
		this.pageSize = pageSize;
		this.pageNum = pageNum;
		
		//求总页数
		if(total % pageSize==0){
			this.totalPage = total/pageSize;
		}else{
			this.totalPage = total/pageSize + 1;
		}
	}
	
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
		this.list = list;
	}
}
