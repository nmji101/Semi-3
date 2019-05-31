package ncs.kh.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import ncs.kh.dto.ClassInfoDTO;

public class ClassInfoDAO {

	private Connection getConnection() throws Exception{
		Class.forName("oracle.jdbc.driver.OracleDriver");

		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "semi";
		String password = "semi";

		return DriverManager.getConnection(url, user, password);
	}

	/**
	 * 클래스 아이디 넘겨받으면 해당 클래스의 정보들 얻어오는 메소드
	 * @param classId : 클래스의 고유번호인 id값
	 * @return : ClassInfo 테이블에서 classId 에 해당하는 모든정보
	 * @throws Exception 
	 */
	public ClassInfoDTO selectInfoByClassId(int classId) throws Exception{
		String sql = "select * from classinfo where info_classid = ?";
		ResultSet rs = null;
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, classId);
			rs = pstat.executeQuery();
			ClassInfoDTO dto = new ClassInfoDTO();
			if(rs.next()) {
				dto.setInfo_classid(rs.getInt("info_classid"));
				dto.setInfo_tutorid(rs.getString("info_tutorid"));
				dto.setInfo_category(rs.getString("info_category"));
				dto.setInfo_title(rs.getString("info_title"));
				dto.setInfo_explain(rs.getString("info_explain"));
				dto.setInfo_intro(rs.getString("info_intro"));
				dto.setInfo_addr(rs.getString("info_addr"));
				dto.setInfo_maxperson(rs.getInt("info_maxperson"));
				dto.setInfo_gender(rs.getString("info_gender"));
				dto.setInfo_price(rs.getInt("info_price"));
				dto.setInfo_img1(rs.getString("info_img1"));
				dto.setInfo_img2(rs.getString("info_img2"));
				dto.setInfo_img3(rs.getString("info_img3"));
				dto.setInfo_start(rs.getDate("info_start"));
				dto.setInfo_end(rs.getDate("info_end"));
				dto.setInfo_date(rs.getDate("info_date"));
				dto.setInfo_avgstar(rs.getString("info_avgstar"));
				dto.setInfo_click(rs.getInt("info_click"));
			}
			return dto;
		}finally {
			if(rs!=null) {
				rs.close();
			}
		}
	}

	/**
	 * 해당 클래스id의 인원이 꽉차서 수강불가능한 날짜들
	 * @param classId
	 * @return List<String> : 수강불가능한 날짜들을 "yyyy-mm-dd" 형식으로 담아서 리턴
	 * @throws Exception
	 */
	public List<String> selectMaxPersonDate(int classId) throws Exception{
		String sql = "select DO_DATE" + 
				"  from classdoing " + 
				"  where DO_CLASSID = ?" + 
				"  group by DO_DATE, DO_CLASSID" + 
				"  having count(DO_DATE) >= (select info_maxperson from classinfo where info_classid = ? )";
		ResultSet rs = null;
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, classId);
			pstat.setInt(2, classId);

			rs = pstat.executeQuery();
			List<String> closedDateList = new ArrayList<>();
			while(rs.next()) {
				String closedDate = rs.getString(1);
				closedDateList.add(closedDate.substring(0, 10));
			}
			if(closedDateList.size()==0) {
				return null;
			}
			return closedDateList;
		}finally {
			if(rs!=null) {
				rs.close();
			}
		}

	}
	
	public String selectCountCheckDate(int classId , String date) throws Exception{
		String sql = "select count(*) from classdoing where DO_CLASSID = ? and DO_DATE = ? ";
		ResultSet rs = null;
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, classId);
			pstat.setString(2, date);
			rs = pstat.executeQuery();
			String result = "";
			if(rs.next()) {
				result = rs.getString(1);
			}
			return result;
		}finally {
			if(rs!=null) {
				rs.close();
			}
		}
	}












}
