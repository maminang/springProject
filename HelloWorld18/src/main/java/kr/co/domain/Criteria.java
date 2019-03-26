package kr.co.domain;

public class Criteria {
	private int page;
	private int perPage;

	public Criteria() {
		page = 1;
		perPage = 10;
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
		return (page - 1) * perPage;
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPage=" + perPage + "]";
	}

}
