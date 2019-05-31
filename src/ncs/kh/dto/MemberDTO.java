package ncs.kh.dto;

public class MemberDTO {
	private String m_id;
	private String m_password;
	private String m_nickname;
	private String m_gender;
	private String m_birth;
	private String m_phone;
	private String m_photo;
	private String m_type;
	private String m_attention;
	private String m_unique;
	
	
	public MemberDTO() {
		super();
	}
	public MemberDTO(String m_id, String m_password, String m_nickname, String m_gender, String m_birth, String m_phone,
			String m_photo, String m_type, String m_attention, String m_unique) {
		super();
		this.m_id = m_id;
		this.m_password = m_password;
		this.m_nickname = m_nickname;
		this.m_gender = m_gender;
		this.m_birth = m_birth;
		this.m_phone = m_phone;
		this.m_photo = m_photo;
		this.m_type = m_type;
		this.m_attention = m_attention;
		this.m_unique = m_unique;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_password() {
		return m_password;
	}
	public void setM_password(String m_password) {
		this.m_password = m_password;
	}
	public String getM_nickname() {
		return m_nickname;
	}
	public void setM_nickname(String m_nickname) {
		this.m_nickname = m_nickname;
	}
	public String getM_gender() {
		return m_gender;
	}
	public void setM_gender(String m_gender) {
		this.m_gender = m_gender;
	}
	public String getM_birth() {
		return m_birth;
	}
	public void setM_birth(String m_birth) {
		this.m_birth = m_birth;
	}
	public String getM_phone() {
		return m_phone;
	}
	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}
	public String getM_photo() {
		return m_photo;
	}
	public void setM_photo(String m_photo) {
		this.m_photo = m_photo;
	}
	public String getM_type() {
		return m_type;
	}
	public void setM_type(String m_type) {
		this.m_type = m_type;
	}
	public String getM_attention() {
		return m_attention;
	}
	public void setM_attention(String m_attention) {
		this.m_attention = m_attention;
	}
	public String getM_unique() {
		return m_unique;
	}
	public void setM_unique(String m_unique) {
		this.m_unique = m_unique;
	}
	
	

}
