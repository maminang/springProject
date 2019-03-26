package kr.co.domain;

import java.io.Serializable;

public class TestDTO implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -4515749319744765537L;
	private int num;
	private String tname;
	private String tday;

	public TestDTO() {
		// TODO Auto-generated constructor stub
	}

	public TestDTO(int num, String tname, String tday) {
		super();
		this.num = num;
		this.tname = tname;
		this.tday = tday;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getTname() {
		return tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}

	public String getTday() {
		return tday;
	}

	public void setTday(String tday) {
		this.tday = tday;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + num;
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
		TestDTO other = (TestDTO) obj;
		if (num != other.num)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "TestDTO [num=" + num + ", tname=" + tname + ", tday=" + tday + "]";
	}

}
