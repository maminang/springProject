package kr.co.domain;

import java.io.Serializable;

public class ReplyVO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -3867533589907310835L;
	private int rno;
	private int bno;
	private String replyText;
	private String replyer;
	private String repDate;
	private String updateDate;

	public ReplyVO() {
		
	}

	public ReplyVO(int rno, int bno, String replyText, String replyer, String repDate, String updateDate) {
		super();
		this.rno = rno;
		this.bno = bno;
		this.replyText = replyText;
		this.replyer = replyer;
		this.repDate = repDate;
		this.updateDate = updateDate;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getReplyText() {
		return replyText;
	}

	public void setReplyText(String replyText) {
		this.replyText = replyText;
	}

	public String getReplyer() {
		return replyer;
	}

	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}

	public String getRepDate() {
		return repDate;
	}

	public void setRepDate(String repDate) {
		this.repDate = repDate;
	}

	public String getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + rno;
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
		ReplyVO other = (ReplyVO) obj;
		if (rno != other.rno)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "ReplyVO [bno=" + bno + ", repDate=" + repDate + ", replyer=" + replyer + ", replyText=" + replyText
				+ ", rno=" + rno + ", updateDate=" + updateDate + "]";
	}

}
