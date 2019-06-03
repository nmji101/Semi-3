package ncs.kh.dto;

import java.sql.Date;

public class ReviewDTO {
	private int re_seq;
	private int re_classId;
	private String re_userId;
	private String re_review;
	private String star;
	private Date re_date;
	private Date re_writeDate;
	private int re_like;
	
	public ReviewDTO() {
		super();
	}
	
	public ReviewDTO(int re_seq, int re_classId, String re_userId, String re_review, String star, Date re_date,
			Date re_writeDate, int re_like) {
		super();
		this.re_seq = re_seq;
		this.re_classId = re_classId;
		this.re_userId = re_userId;
		this.re_review = re_review;
		this.star = star;
		this.re_date = re_date;
		this.re_writeDate = re_writeDate;
		this.re_like = re_like;
	}

	public int getRe_seq() {
		return re_seq;
	}

	public void setRe_seq(int re_seq) {
		this.re_seq = re_seq;
	}

	public int getRe_classId() {
		return re_classId;
	}

	public void setRe_classId(int re_classId) {
		this.re_classId = re_classId;
	}

	public String getRe_userId() {
		return re_userId;
	}

	public void setRe_userId(String re_userId) {
		this.re_userId = re_userId;
	}

	public String getRe_review() {
		return re_review;
	}

	public void setRe_review(String re_review) {
		this.re_review = re_review;
	}

	public String getStar() {
		return star;
	}

	public void setStar(String star) {
		this.star = star;
	}

	public Date getRe_date() {
		return re_date;
	}

	public void setRe_date(Date re_date) {
		this.re_date = re_date;
	}

	public Date getRe_writeDate() {
		return re_writeDate;
	}

	public void setRe_writeDate(Date re_writeDate) {
		this.re_writeDate = re_writeDate;
	}

	public int getRe_like() {
		return re_like;
	}

	public void setRe_like(int re_like) {
		this.re_like = re_like;
	}

}
