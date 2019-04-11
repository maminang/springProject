package kr.ca.domain;

import java.io.Serializable;
import java.util.List;

public class OrderDTO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -1367988235698090543L;
	private int ono;
	private String name;
	private String address;
	private String postNum;
	private String dtl_adres;
	private String phone;
	private int total_price;
	private String order_date;
	private String shipping_memo;
	private String payment_status;
	private List<OrderDetailDTO> detailList;

	public OrderDTO() {
		// TODO Auto-generated constructor stub
	}

	public OrderDTO(int ono, String name, String address, String postNum, String dtl_adres, String phone,
			int total_price, String order_date, String shipping_memo, String payment_status,
			List<OrderDetailDTO> detailList) {
		super();
		this.ono = ono;
		this.name = name;
		this.address = address;
		this.postNum = postNum;
		this.dtl_adres = dtl_adres;
		this.phone = phone;
		this.total_price = total_price;
		this.order_date = order_date;
		this.shipping_memo = shipping_memo;
		this.payment_status = payment_status;
		this.detailList = detailList;
	}

	public int getOno() {
		return ono;
	}

	public void setOno(int ono) {
		this.ono = ono;
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

	public String getPostNum() {
		return postNum;
	}

	public void setPostNum(String postNum) {
		this.postNum = postNum;
	}

	public String getDtl_adres() {
		return dtl_adres;
	}

	public void setDtl_adres(String dtl_adres) {
		this.dtl_adres = dtl_adres;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getTotal_price() {
		return total_price;
	}

	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}

	public String getOrder_date() {
		return order_date;
	}

	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}

	public String getShipping_memo() {
		return shipping_memo;
	}

	public void setShipping_memo(String shipping_memo) {
		this.shipping_memo = shipping_memo;
	}

	public String getPayment_status() {
		return payment_status;
	}

	public void setPayment_status(String payment_status) {
		this.payment_status = payment_status;
	}

	public List<OrderDetailDTO> getDetailList() {
		return detailList;
	}

	public void setDetailList(List<OrderDetailDTO> detailList) {
		this.detailList = detailList;
		for (OrderDetailDTO oddto : detailList) {
			total_price += oddto.getPrice() * oddto.getAmount();
		}
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ono;
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
		OrderDTO other = (OrderDTO) obj;
		if (ono != other.ono)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "OrderDTO [ono=" + ono + ", name=" + name + ", address=" + address + ", postNum=" + postNum
				+ ", dtl_adres=" + dtl_adres + ", phone=" + phone + ", total_price=" + total_price + ", order_date="
				+ order_date + ", shipping_memo=" + shipping_memo + ", payment_status=" + payment_status
				+ ", detailList=" + detailList + "]";
	}

}
