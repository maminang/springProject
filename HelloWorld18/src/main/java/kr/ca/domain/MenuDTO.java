package kr.ca.domain;

import java.io.Serializable;

public class MenuDTO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -3181853671499594205L;
	private int order_no;
	private String category;
	private String href;

	public MenuDTO() {
		// TODO Auto-generated constructor stub
	}

	public MenuDTO(int order_no, String category, String href) {
		super();
		this.order_no = order_no;
		this.category = category;
		this.href = href;
	}

	public int getOrder_no() {
		return order_no;
	}

	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getHref() {
		return href;
	}

	public void setHref(String href) {
		this.href = href;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + order_no;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MenuDTO other = (MenuDTO) obj;
		if (order_no != other.order_no)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "MenuDTO [order_no=" + order_no + ", category=" + category + ", href=" + href + "]";
	}

}