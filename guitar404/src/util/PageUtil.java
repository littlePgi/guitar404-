package util;

import java.util.List;

/**
 * ��ҳ������
 */
public class PageUtil<T> {
	private int total;// �ܼ�¼��  
    private int pageSize;// ÿҳ��¼��  
    private int pageNum;// ��ǰҳ��  
    private int totalPage;// ��ҳ��
    private List<T> list;//��ѯ������list
    
    public PageUtil() {
	}
    
	public PageUtil(int total, int pageNum, int pageSize) {
		this.total = total;
		this.pageSize = pageSize;
		this.pageNum = pageNum;
		
		//����ҳ��
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
