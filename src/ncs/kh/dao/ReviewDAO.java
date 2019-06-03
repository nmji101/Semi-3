package ncs.kh.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import ncs.kh.dto.ReviewDTO;

public class ReviewDAO {
	public Connection getConnection()throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "kh";
		String pw = "kh";
		return DriverManager.getConnection(url,user,pw);
	}
	
	public List<ReviewDTO> selectAll(int start, int end) throws Exception{
		String sql = "select * from (select row_number() over(order by re_seq desc) as rown, review.* from review) where rown between ? and ?";
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql); 
				pstat.setInt(1, start);
				pstat.setInt(2, end);
				ResultSet rs = pstat.executeQuery();
				
				List<ReviewDTO> list = new ArrayList<>();

				while(rs.next()) {
					int re_seq = rs.getInt("RE_SEQ");
					int re_classId = rs.getInt("RE_CLASSID");
					String re_userId = rs.getString("RE_USERID");
					String re_review = rs.getString("RE_REVIEW");
					String star = rs.getString("RE_STAR");
					String re_star = this.viewStar(star);
					Date re_date = rs.getDate("RE_DATE");
					Date re_writeDate = rs.getDate("RE_WRITEDATE");
					int re_like = rs.getInt("RE_LIKE");
				
					ReviewDTO dto = new ReviewDTO(re_seq, re_classId, re_userId, re_review, re_star, re_date, re_writeDate, re_like);
					list.add(dto);
			}
			return list;
		}

	// 별점 보여주기
	public String viewStar(String star) {
		String result="";
		if(star.contentEquals("1")) {
			result = "★☆☆☆☆";
		}else if(star.contentEquals("2")) {
			result = "★★☆☆☆";
		}else if(star.contentEquals("3")) {
			result = "★★★☆☆";
		}else if(star.contentEquals("4")) {
			result = "★★★★☆";
		}else if(star.contentEquals("5")) {
			result = "★★★★★";

		}else {
			result =  "";
		}
		return result;
	}
	
	
	public int boardCount()throws Exception {
		String sql="select count(*) from review";
		int result = 0;
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
			if(rs.next()) {
				result = rs.getInt("count(*)");
			}
			return result;
		}
	}
	public String getNavi(int currentPage, int recordTotalCount, int recordCountPerPage) {

		int naviCountPerPage = 5;

		int pageTotalCount=0;

		if(recordTotalCount % recordCountPerPage > 0) {
			pageTotalCount = recordTotalCount / recordCountPerPage + 1;
		}else {
			pageTotalCount = recordTotalCount / recordCountPerPage;
		}


		if(currentPage < 1) {
			currentPage = 1;
		}else if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}


		int startNavi = (currentPage -1) / naviCountPerPage * naviCountPerPage + 1;
		int endNavi = startNavi + (naviCountPerPage-1);
		// 현재 위치에 따른 네비 시작과 끝을 구하기

		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}
		//네비 끝값이 최대 페이지 번호를 넘어가면 최대 페이지번호로 네비 끝값을 설정한다.

		boolean needPrev = true;
		boolean needNext = true;

		if(startNavi == 1) {
			needPrev=false;
		}

		if(endNavi == pageTotalCount) {
			needNext = false;
		}

		StringBuilder sb = new StringBuilder();
		String bootTag = "<li class=\"page-item\"><a class=\"page-link\" href='index.review?currentPage="; 
		if(needPrev) {
			int prev = startNavi -1;
			sb.append(bootTag+ prev +"'>Previous</a></li>");
		}

		for(int i = startNavi; i <= endNavi; i++) {
			sb.append(bootTag+i+"'>"+ i + " " +"</a></li>");
		}
		if(needNext) {
			int next = endNavi + 1;
			sb.append(bootTag+ next +"'>Next</a></li>");
		}
		System.out.println(sb);
		return sb.toString();
	}
	
}
