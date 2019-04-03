package kr.ca.domain;

import java.io.Serializable;

public class ProductDetailDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int pno;
	private int volume;
	private int price;
	
	public ProductDetailDTO() {
		// TODO Auto-generated constructor stub
	}

	public ProductDetailDTO(int pno, int volume, int price) {
		super();
		this.pno = pno;
		this.volume = volume;
		this.price = price;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
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

	@Override
	public String toString() {
		return "ProductDetailDTO [pno=" + pno + ", volume=" + volume + ", price=" + price + "]";
	}
	
	

}
