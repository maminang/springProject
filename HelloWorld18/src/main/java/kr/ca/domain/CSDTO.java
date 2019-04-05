package kr.ca.domain;

import java.io.Serializable;
import java.util.Arrays;

public class CSDTO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int idnbr;
	private String quser;
	private String qpassword;
	private String qtitle;
	private String qcontent;
	private String qtype;
	private String[] qfile;
	private String qphone;
	private String email;
	private int openStatus;
	private String qanswer;
    
	public CSDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getIdnbr() {
		return idnbr;
	}

	public void setIdnbr(int idnbr) {
		this.idnbr = idnbr;
	}

	public String getQuser() {
		return quser;
	}

	public void setQuser(String quser) {
		this.quser = quser;
	}

	public String getQpassword() {
		return qpassword;
	}

	public void setQpassword(String qpassword) {
		this.qpassword = qpassword;
	}

	public String getQtitle() {
		return qtitle;
	}

	public void setQtitle(String qtitle) {
		this.qtitle = qtitle;
	}

	public String getQcontent() {
		return qcontent;
	}

	public void setQcontent(String qcontent) {
		this.qcontent = qcontent;
	}

	public String getQtype() {
		return qtype;
	}

	public void setQtype(String qtype) {
		this.qtype = qtype;
	}

	public String[] getQfile() {
		return qfile;
	}

	public void setQfile(String[] qfile) {
		this.qfile = qfile;
	}

	public String getQphone() {
		return qphone;
	}

	public void setQphone(String qphone) {
		this.qphone = qphone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getOpenStatus() {
		return openStatus;
	}

	public void setOpenStatus(int openStatus) {
		this.openStatus = openStatus;
	}

	public String getQanswer() {
		return qanswer;
	}

	public void setQanswer(String qanswer) {
		this.qanswer = qanswer;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + idnbr;
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
		CSDTO other = (CSDTO) obj;
		if (idnbr != other.idnbr)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "CSDTO [idnbr=" + idnbr + ", quser=" + quser + ", qpassword=" + qpassword + ", qtitle=" + qtitle
				+ ", qcontent=" + qcontent + ", qtype=" + qtype + ", qfile=" + Arrays.toString(qfile) + ", qphone="
				+ qphone + ", email=" + email + ", openStatus=" + openStatus + ", qanswer=" + qanswer + "]";
	}

	
	
	
}
