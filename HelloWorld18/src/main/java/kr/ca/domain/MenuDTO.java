package kr.ca.domain;

import java.io.Serializable;

public class MenuDTO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -3181853671499594205L;
	private String category;
	private String href;

	public MenuDTO() {
		// TODO Auto-generated constructor stub
	}

	public MenuDTO(String category, String href) {
		super();
		this.category = category;
		this.href = href;
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
		result = prime * result + ((category == null) ? 0 : category.hashCode());
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
		if (category == null) {
			if (other.category != null)
				return false;
		} else if (!category.equals(other.category))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "MenuDTO [category=" + category + ", href=" + href + "]";
	}

}
