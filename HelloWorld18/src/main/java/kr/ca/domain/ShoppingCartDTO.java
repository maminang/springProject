package kr.ca.domain;

import java.io.Serializable;

public class ShoppingCartDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String id;
	private int pno;
	private int amount;
	private int volume;
	private int price;
	
	public ShoppingCartDTO() {
		// TODO Auto-generated constructor stub
	}

	public ShoppingCartDTO(String id, int pno, int amount, int volume, int price) {
		super();
		this.id = id;
		this.pno = pno;
		this.amount = amount;
		this.volume = volume;
		this.price = price;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
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
		return "ShoppingCartDTO [id=" + id + ", pno=" + pno + ", amount=" + amount + ", volume=" + volume + ", price="
				+ price + "]";
	}

	

	
	
	
	
}
