package ncs.kh.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {
	
	private Connection getConnection() throws Exception{
		Class.forName("oracle.jdbc.driver.OracleDriver");

		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "semi";
		String password = "semi";

		return DriverManager.getConnection(url, user, password);
	}
	
	public String[] getTutorImg(String tutorId) throws Exception{
		String sql = "select m_nickname, m_phone from member where m_id = ?";
		ResultSet rs = null;
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
				pstat.setString(1, tutorId);
				rs = pstat.executeQuery();
				String[] nick_photo = new String[2];
				if(rs.next()) {
					nick_photo[0] = rs.getString(1);
					nick_photo[1] = rs.getString(2);
				}
				return nick_photo;
		}finally {
			if(rs !=null) {
				rs.close();
			}
		}
		
		
		
		
	}
}
