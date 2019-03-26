package kr.co.domain;

import java.io.Serializable;
import java.util.List;

public class ReplyPageMaker extends PageMaker implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2940538932201469532L;
	private List<ReplyVO> list;

	public ReplyPageMaker(int amount, Criteria cri, List<ReplyVO> list) {
		super(amount, cri);
		this.list = list;
	}

	public List<ReplyVO> getList() {
		return list;
	}

	public void setList(List<ReplyVO> list) {
		this.list = list;
	}

}
