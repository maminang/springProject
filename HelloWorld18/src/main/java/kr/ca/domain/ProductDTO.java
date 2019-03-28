package kr.ca.domain;

import java.io.Serializable;

public class ProductDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int pno;
	private String eng_name;
	private String kr_name;
	private String prdct_dscrp;
	private int volume;
	private int price;
	private String category;
	
	public ProductDTO() {
		// TODO Auto-generated constructor stub
	}

	public ProductDTO(int pno, String eng_name, String kr_name, String prdct_dscrp, int volume, int price,
			String category) {
		super();
		this.pno = pno;
		this.eng_name = eng_name;
		this.kr_name = kr_name;
		this.prdct_dscrp = prdct_dscrp;
		this.volume = volume;
		this.price = price;
		this.category = category;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public String getEng_name() {
		return eng_name;
	}

	public void setEng_name(String eng_name) {
		this.eng_name = eng_name;
	}

	public String getKr_name() {
		return kr_name;
	}

	public void setKr_name(String kr_name) {
		this.kr_name = kr_name;
	}

	public String getPrdct_dscrp() {
		return prdct_dscrp;
	}

	public void setPrdct_dscrp(String prdct_dscrp) {
		this.prdct_dscrp = prdct_dscrp;
	}

	public int getVolume() {
		return volume;
	}

	public void setVolume(int volume) {
		this.volume = volume;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "productDTO [pno=" + pno + ", eng_name=" + eng_name + ", kr_name=" + kr_name + ", prdct_dscrp="
				+ prdct_dscrp + ", volume=" + volume + ", price=" + price + ", category=" + category + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + pno;
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
		ProductDTO other = (ProductDTO) obj;
		if (pno != other.pno)
			return false;
		return true;
	}
	
	 
	
}
