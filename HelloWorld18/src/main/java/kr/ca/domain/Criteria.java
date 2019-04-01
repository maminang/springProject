package kr.ca.domain;

public class Criteria {

	private int page;
	private int perPage;
	
	public Criteria() {
		// TODO Auto-generated constructor stub
		page=1;
		perPage=10;
	}

	public Criteria(int page, int perPage) {
		super();
		this.page = page;
		this.perPage = perPage;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getPerPage() {
		return perPage;
	}

	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}
	
	public int getStartNum() {
		int startNum=(page-1)*perPage+1;
		return startNum;
	}
	
	
}
