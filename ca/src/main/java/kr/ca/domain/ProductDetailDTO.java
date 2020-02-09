package kr.ca.domain;

import java.io.Serializable;

public class ProductDetailDTO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -7668022281098830850L;
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
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + pno;
		result = prime * result + price;
		result = prime * result + volume;
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
		ProductDetailDTO other = (ProductDetailDTO) obj;
		if (pno != other.pno)
			return false;
		if (price != other.price)
			return false;
		if (volume != other.volume)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "ProductDetailDTO [pno=" + pno + ", volume=" + volume + ", price=" + price + "]";
	}

}
