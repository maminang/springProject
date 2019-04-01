package kr.ca.domain;


import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;



public class PageMaker {
	private int amount;
	private int totalPage;
	private int beginPageNum;
	private int stopPageNum;
	private Criteria cri;

	public PageMaker() {
		// TODO Auto-generated constructor stub
	}

	public PageMaker(int amount, int totalPage, int beginPageNum, int stopPageNum, Criteria cri) {
		super();
		this.amount = amount;
		this.totalPage = totalPage;
		this.beginPageNum = beginPageNum;
		this.stopPageNum = stopPageNum;
		this.cri = cri;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
		
		totalPage=(amount-1)/cri.getPerPage()+1;
		beginPageNum=((cri.getPage()-1)/10)*10+1;
		stopPageNum=(((cri.getPage()-1)/10)+1)*10;
		if(totalPage<stopPageNum) {
			stopPageNum=totalPage;
		}
	
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getBeginPageNum() {
		return beginPageNum;
	}

	public void setBeginPageNum(int beginPageNum) {
		this.beginPageNum = beginPageNum;
	}

	public int getStopPageNum() {
		return stopPageNum;
	}

	public void setStopPageNum(int stopPageNum) {
		this.stopPageNum = stopPageNum;
	}

	public Criteria getCri() {
		return cri;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
	}

	public PageMaker(int amount, Criteria cri) {
		super();
		this.amount = amount;
		this.cri=cri;
		
		totalPage=(amount-1)/cri.getPerPage()+1;
		beginPageNum=((cri.getPage()-1)/10)*10+1;
		stopPageNum=(((cri.getPage()-1)/10)+1)*10;
		if(totalPage<stopPageNum) {
			stopPageNum=totalPage;
		}
	}
	public String makeQuery(int page) {
		UriComponents uc = UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("perPage", cri.getPerPage())
				.build();
		return uc.toUriString();
	}
	
	
	/*
	 * public String makeSearch(int page) { UriComponents uc =
	 * UriComponentsBuilder.newInstance() .queryParam("page", page)
	 * .queryParam("perPage", cri.getPerPage()) .queryParam("searchType",
	 * ((SearchCriteria)cri).getSearchType()) .queryParam("keyword",
	 * ((SearchCriteria)cri).getKeyword()) .build(); return uc.toUriString(); }
	 */
	
}
