package kr.ca.domain;

import java.io.Serializable;
import java.util.List;

public class DealingsDTO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 4333053165728869532L;
	private int dno;
	private String name;
	private String address;
	private String email;
	private int total_price;
	private String shipping_memo;
	private boolean is_payed;
	private List<ProductDTO> dealings_products;

	public DealingsDTO() {
		// TODO Auto-generated constructor stub
	}

	public DealingsDTO(int dno, String name, String address, String email, int total_price, String shipping_memo,
			boolean is_payed, List<ProductDTO> dealings_products) {
		super();
		this.dno = dno;
		this.name = name;
		this.address = address;
		this.email = email;
		this.total_price = total_price;
		this.shipping_memo = shipping_memo;
		this.is_payed = is_payed;
		this.dealings_products = dealings_products;
	}

	public int getDno() {
		return dno;
	}

	public void setDno(int dno) {
		this.dno = dno;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getTotal_price() {
		return total_price;
	}

	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}

	public String getShipping_memo() {
		return shipping_memo;
	}

	public void setShipping_memo(String shipping_memo) {
		this.shipping_memo = shipping_memo;
	}

	public boolean isIs_payed() {
		return is_payed;
	}

	public void setIs_payed(boolean is_payed) {
		this.is_payed = is_payed;
	}

	public List<ProductDTO> getDealings_products() {
		return dealings_products;
	}

	public void setDealings_products(List<ProductDTO> dealings_products) {
		this.dealings_products = dealings_products;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + dno;
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
		DealingsDTO other = (DealingsDTO) obj;
		if (dno != other.dno)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "DealingsDTO [dno=" + dno + ", name=" + name + ", address=" + address + ", email=" + email
				+ ", total_price=" + total_price + ", shipping_memo=" + shipping_memo + ", is_payed=" + is_payed
				+ ", dealings_products=" + dealings_products + "]";
	}

}
