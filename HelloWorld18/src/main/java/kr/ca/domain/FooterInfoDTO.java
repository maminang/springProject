package kr.ca.domain;

import java.io.Serializable;

public class FooterInfoDTO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -382425638745274505L;
	private String companyname;
	private String representative;
	private int bsns_reg_no;
	private String cmnct_saler_report;
	private String address;
	private String partnership_email;
	private int phone_number;
	private String work_hour;
	private String account_holder;
	private String facebook_address;
	private String kakaotalk_address;
	private String instagram_address;
	private String copyright;

	public FooterInfoDTO() {
		// TODO Auto-generated constructor stub
	}

	public FooterInfoDTO(String companyname, String representative, int bsns_reg_no, String cmnct_saler_report,
			String address, String partnership_email, int phone_number, String work_hour, String account_holder,
			String facebook_address, String kakaotalk_address, String instagram_address, String copyright) {
		super();
		this.companyname = companyname;
		this.representative = representative;
		this.bsns_reg_no = bsns_reg_no;
		this.cmnct_saler_report = cmnct_saler_report;
		this.address = address;
		this.partnership_email = partnership_email;
		this.phone_number = phone_number;
		this.work_hour = work_hour;
		this.account_holder = account_holder;
		this.facebook_address = facebook_address;
		this.kakaotalk_address = kakaotalk_address;
		this.instagram_address = instagram_address;
		this.copyright = copyright;
	}

	public String getCompanyname() {
		return companyname;
	}

	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}

	public String getRepresentative() {
		return representative;
	}

	public void setRepresentative(String representative) {
		this.representative = representative;
	}

	public int getBsns_reg_no() {
		return bsns_reg_no;
	}

	public void setBsns_reg_no(int bsns_reg_no) {
		this.bsns_reg_no = bsns_reg_no;
	}

	public String getCmnct_saler_report() {
		return cmnct_saler_report;
	}

	public void setCmnct_saler_report(String cmnct_saler_report) {
		this.cmnct_saler_report = cmnct_saler_report;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPartnership_email() {
		return partnership_email;
	}

	public void setPartnership_email(String partnership_email) {
		this.partnership_email = partnership_email;
	}

	public int getPhone_number() {
		return phone_number;
	}

	public void setPhone_number(int phone_number) {
		this.phone_number = phone_number;
	}

	public String getWork_hour() {
		return work_hour;
	}

	public void setWork_hour(String work_hour) {
		this.work_hour = work_hour;
	}

	public String getAccount_holder() {
		return account_holder;
	}

	public void setAccount_holder(String account_holder) {
		this.account_holder = account_holder;
	}

	public String getFacebook_address() {
		return facebook_address;
	}

	public void setFacebook_address(String facebook_address) {
		this.facebook_address = facebook_address;
	}

	public String getKakaotalk_address() {
		return kakaotalk_address;
	}

	public void setKakaotalk_address(String kakaotalk_address) {
		this.kakaotalk_address = kakaotalk_address;
	}

	public String getInstagram_address() {
		return instagram_address;
	}

	public void setInstagram_address(String instagram_address) {
		this.instagram_address = instagram_address;
	}

	public String getCopyright() {
		return copyright;
	}

	public void setCopyright(String copyright) {
		this.copyright = copyright;
	}

	@Override
	public String toString() {
		return "FooterInfoDTO [companyname=" + companyname + ", representative=" + representative + ", bsns_reg_no="
				+ bsns_reg_no + ", cmnct_saler_report=" + cmnct_saler_report + ", address=" + address
				+ ", partnership_email=" + partnership_email + ", phone_number=" + phone_number + ", work_hour="
				+ work_hour + ", account_holder=" + account_holder + ", facebook_address=" + facebook_address
				+ ", kakaotalk_address=" + kakaotalk_address + ", instagram_address=" + instagram_address
				+ ", copyright=" + copyright + "]";
	}

}
