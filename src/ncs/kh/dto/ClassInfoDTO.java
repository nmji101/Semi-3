package ncs.kh.dto;

import java.util.Date;

public class ClassInfoDTO {
	private int info_classid; 
    private String info_tutorid;
    private String info_category;
    private String info_title; 
    private String info_explain;
    private String info_intro;
    private String info_addr;
    private int info_maxperson;
    private String info_gender;
    private int info_price;
    private String info_img1;
    private String info_img2;
    private String info_img3;
    private String info_start; 	//수업시작날짜    날짜형식은 2019-05-30
    private String info_end; 		//수업 종료날짜
    private Date info_date; 	//수업 등록날짜
    private String info_avgstar;
    private int info_click;
    
	public ClassInfoDTO() {
		super();
	}
	public ClassInfoDTO(int info_classid, String info_tutorid, String info_category, String info_title,
			String info_explain, String info_intro, String info_addr, int info_maxperson, String info_gender,
			int info_price, String info_img1, String info_img2, String info_img3, String info_start, String info_end,
			Date info_date, String info_avgstar, int info_click) {
		super();
		this.info_classid = info_classid;
		this.info_tutorid = info_tutorid;
		this.info_category = info_category;
		this.info_title = info_title;
		this.info_explain = info_explain;
		this.info_intro = info_intro;
		this.info_addr = info_addr;
		this.info_maxperson = info_maxperson;
		this.info_gender = info_gender;
		this.info_price = info_price;
		this.info_img1 = info_img1;
		this.info_img2 = info_img2;
		this.info_img3 = info_img3;
		this.info_start = info_start;
		this.info_end = info_end;
		this.info_date = info_date;
		this.info_avgstar = info_avgstar;
		this.info_click = info_click;
	}
	public int getInfo_classid() {
		return info_classid;
	}
	public void setInfo_classid(int info_classid) {
		this.info_classid = info_classid;
	}
	public String getInfo_tutorid() {
		return info_tutorid;
	}
	public void setInfo_tutorid(String info_tutorid) {
		this.info_tutorid = info_tutorid;
	}
	public String getInfo_category() {
		return info_category;
	}
	public void setInfo_category(String info_category) {
		this.info_category = info_category;
	}
	public String getInfo_title() {
		return info_title;
	}
	public void setInfo_title(String info_title) {
		this.info_title = info_title;
	}
	public String getInfo_explain() {
		return info_explain;
	}
	public void setInfo_explain(String info_explain) {
		this.info_explain = info_explain;
	}
	public String getInfo_intro() {
		return info_intro;
	}
	public void setInfo_intro(String info_intro) {
		this.info_intro = info_intro;
	}
	public String getInfo_addr() {
		return info_addr;
	}
	public void setInfo_addr(String info_addr) {
		this.info_addr = info_addr;
	}
	public int getInfo_maxperson() {
		return info_maxperson;
	}
	public void setInfo_maxperson(int info_maxperson) {
		this.info_maxperson = info_maxperson;
	}
	public String getInfo_gender() {
		return info_gender;
	}
	public void setInfo_gender(String info_gender) {
		this.info_gender = info_gender;
	}
	public int getInfo_price() {
		return info_price;
	}
	public void setInfo_price(int info_price) {
		this.info_price = info_price;
	}
	public String getInfo_img1() {
		return info_img1;
	}
	public void setInfo_img1(String info_img1) {
		this.info_img1 = info_img1;
	}
	public String getInfo_img2() {
		return info_img2;
	}
	public void setInfo_img2(String info_img2) {
		this.info_img2 = info_img2;
	}
	public String getInfo_img3() {
		return info_img3;
	}
	public void setInfo_img3(String info_img3) {
		this.info_img3 = info_img3;
	}
	public String getInfo_start() {
		return info_start;
	}
	public void setInfo_start(String info_start) {
		this.info_start = info_start;
	}
	public String getInfo_end() {
		return info_end;
	}
	public void setInfo_end(String info_end) {
		this.info_end = info_end;
	}
	public Date getInfo_date() {
		return info_date;
	}
	public void setInfo_date(Date info_date) {
		this.info_date = info_date;
	}
	public String getInfo_avgstar() {
		return info_avgstar;
	}
	public void setInfo_avgstar(String info_avgstar) {
		this.info_avgstar = info_avgstar;
	}
	public int getInfo_click() {
		return info_click;
	}
	public void setInfo_click(int info_click) {
		this.info_click = info_click;
	}
    
}
