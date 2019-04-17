package kr.ca.domain;

import java.io.Serializable;

public class ReviewDTO implements Serializable {

	/**
	* 
	*/
	private static final long serialVersionUID = 1L;
	private int pno;
	private int rno;
	private int score;
	private int recommendation;
	private String id;
	private String title;
	private String content;
	private String age_group;
	private String favorite_scent;

	public ReviewDTO() {
		// TODO Auto-generated constructor stub
	}

	public ReviewDTO(int pno, int rno, int score, int recommendation, String id, String title, String content,
			String age_group, String favorite_scent) {
		super();
		this.pno = pno;
		this.rno = rno;
		this.score = score;
		this.recommendation = recommendation;
		this.id = id;
		this.title = title;
		this.content = content;
		this.age_group = age_group;
		this.favorite_scent = favorite_scent;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public int getRecommendation() {
		return recommendation;
	}

	public void setRecommendation(int recommendation) {
		this.recommendation = recommendation;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getAge_group() {
		return age_group;
	}

	public void setAge_group(String age_group) {
		this.age_group = age_group;
	}

	public String getFavorite_scent() {
		return favorite_scent;
	}

	public void setFavorite_scent(String favorite_scent) {
		this.favorite_scent = favorite_scent;
	}

	@Override
	public String toString() {
		return "ReviewDTO [pno=" + pno + ", rno=" + rno + ", score=" + score + ", recommendation=" + recommendation
				+ ", id=" + id + ", title=" + title + ", content=" + content + ", age_group=" + age_group
				+ ", favorite_scent=" + favorite_scent + "]";
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
		ReviewDTO other = (ReviewDTO) obj;
		if (rno != other.rno)
			return false;
		return true;
	}

}
