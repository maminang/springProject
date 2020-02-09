package kr.ca.domain;

import java.io.Serializable;

public class ChargeHistoryDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2020695449278401231L;
	private String id;
	private int point;
	private String chargedate;

	public ChargeHistoryDTO() {
		// TODO Auto-generated constructor stub
	}

	public ChargeHistoryDTO(String id, int point, String chargedate) {
		super();
		this.id = id;
		this.point = point;
		this.chargedate = chargedate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getChargedate() {
		return chargedate;
	}

	public void setChargedate(String chargedate) {
		this.chargedate = chargedate;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((chargedate == null) ? 0 : chargedate.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + point;
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
		ChargeHistoryDTO other = (ChargeHistoryDTO) obj;
		if (chargedate == null) {
			if (other.chargedate != null)
				return false;
		} else if (!chargedate.equals(other.chargedate))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (point != other.point)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "ChargeHistoryDTO [id=" + id + ", point=" + point + ", chargedate=" + chargedate + "]";
	}

}
