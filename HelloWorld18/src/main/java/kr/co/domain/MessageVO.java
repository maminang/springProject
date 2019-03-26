package kr.co.domain;

import java.io.Serializable;

public class MessageVO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2825992320972698685L;
	private int mid;
	private String targetId;
	private String sender;
	private String message;
	private String openDate;
	private String sendDate;

	public MessageVO() {
		// TODO Auto-generated constructor stub
	}

	public MessageVO(int mid, String targetId, String sender, String message, String openDate, String sendDate) {
		super();
		this.mid = mid;
		this.targetId = targetId;
		this.sender = sender;
		this.message = message;
		this.openDate = openDate;
		this.sendDate = sendDate;
	}

	public int getMid() {
		return mid;
	}

	public void setMid(int mid) {
		this.mid = mid;
	}

	public String gettargetId() {
		return targetId;
	}

	public void settargetId(String targetId) {
		this.targetId = targetId;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getOpenDate() {
		return openDate;
	}

	public void setOpenDate(String openDate) {
		this.openDate = openDate;
	}

	public String getSendDate() {
		return sendDate;
	}

	public void setSendDate(String sendDate) {
		this.sendDate = sendDate;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + mid;
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
		MessageVO other = (MessageVO) obj;
		if (mid != other.mid)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "MessageVO [mid=" + mid + ", targetId=" + targetId + ", sender=" + sender + ", message=" + message
				+ ", openDate=" + openDate + ", sendDate=" + sendDate + "]";
	}

}
