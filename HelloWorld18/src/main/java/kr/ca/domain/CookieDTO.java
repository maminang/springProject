package kr.ca.domain;

import java.io.Serializable;

public class CookieDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String name;
	private String value;

	public CookieDTO() {
		// TODO Auto-generated constructor stub
	}

	public CookieDTO(String name, String value) {
		super();
		this.name = name;
		this.value = value;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	@Override
	public String toString() {
		return "CookieDTO [name=" + name + ", value=" + value + "]";
	}
	
	
	
}
