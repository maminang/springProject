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
	
	public ShoppingCartDTO() {
		// TODO Auto-generated constructor stub
	}

	public ShoppingCartDTO(String id, int pno, int amount) {
		super();
		this.id = id;
		this.pno = pno;
		this.amount = amount;
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

	@Override
	public String toString() {
		return "ShoppingCartDTO [id=" + id + ", pno=" + pno + ", amount=" + amount + "]";
	}
	
	
	
}
