package kr.ca.domain;

import java.io.Serializable;

public class OrderDetailDTO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 4589194824857350908L;
	private int odno;
	private int ono;
	private int pno;
	private int volume;
	private int price;
	private int amount;
	private ProductDTO pdto;

	public OrderDetailDTO() {
		// TODO Auto-generated constructor stub
	}

	public OrderDetailDTO(int odno, int ono, int pno, int volume, int price, int amount, ProductDTO pdto) {
		super();
		this.odno = odno;
		this.ono = ono;
		this.pno = pno;
		this.volume = volume;
		this.price = price;
		this.amount = amount;
		this.pdto = pdto;
	}

	public int getOdno() {
		return odno;
	}

	public void setOdno(int odno) {
		this.odno = odno;
	}

	public int getOno() {
		return ono;
	}

	public void setOno(int ono) {
		this.ono = ono;
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

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public ProductDTO getPdto() {
		return pdto;
	}

	public void setPdto(ProductDTO pdto) {
		this.pdto = pdto;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + amount;
		result = prime * result + odno;
		result = prime * result + ono;
		result = prime * result + ((pdto == null) ? 0 : pdto.hashCode());
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
		OrderDetailDTO other = (OrderDetailDTO) obj;
		if (amount != other.amount)
			return false;
		if (odno != other.odno)
			return false;
		if (ono != other.ono)
			return false;
		if (pdto == null) {
			if (other.pdto != null)
				return false;
		} else if (!pdto.equals(other.pdto))
			return false;
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
		return "OrderDetailDTO [odno=" + odno + ", ono=" + ono + ", pno=" + pno + ", volume=" + volume + ", price="
				+ price + ", amount=" + amount + ", pdto=" + pdto + "]";
	}

}
