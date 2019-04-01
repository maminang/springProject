package kr.ca.domain;

import java.io.Serializable;

public class CSDTO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	// 식별번호 
    private int idnbr;

    // 질문자 
    private String quser;

    // 비밀번호 
    private String qpassword;

    // 질문제목 
    private String qtitle;

    // 질문유형 
    private String qtype;

    // 질문내용 
    private String qcontent;

    // 첨부파일 
    private String qfile;

    // 전화번호 
    private String qphone;

    // 이메일 
    private String email;
    
    public CSDTO() {
		// TODO Auto-generated constructor stub
	}

	public CSDTO(int idnbr, String quser, String qpassword, String qtitle, String qtype, String qcontent, String qfile,
			String qphone, String email) {
		super();
		this.idnbr = idnbr;
		this.quser = quser;
		this.qpassword = qpassword;
		this.qtitle = qtitle;
		this.qtype = qtype;
		this.qcontent = qcontent;
		this.qfile = qfile;
		this.qphone = qphone;
		this.email = email;
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

	public String getQtype() {
		return qtype;
	}

	public void setQtype(String qtype) {
		this.qtype = qtype;
	}

	public String getQcontent() {
		return qcontent;
	}

	public void setQcontent(String qcontent) {
		this.qcontent = qcontent;
	}

	public String getQfile() {
		return qfile;
	}

	public void setQfile(String qfile) {
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
		return "CSDTO [idnbr=" + idnbr + ", quser=" + quser + ", qtitle=" + qtitle + "]";
	}
    
    
}
