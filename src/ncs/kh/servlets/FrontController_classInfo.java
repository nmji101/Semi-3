package ncs.kh.servlets;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ncs.kh.dao.ClassInfoDAO;
import ncs.kh.dao.MemberDAO;
import ncs.kh.dto.ClassInfoDTO;

@WebServlet("*.classInfo")
public class FrontController_classInfo extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter pw = response.getWriter();
		
		String reqURI = request.getRequestURI();
		String ctxPath = request.getContextPath();
		String cmd = reqURI.substring(ctxPath.length());
		System.out.println(cmd);
		
		ClassInfoDAO i_dao = new ClassInfoDAO();
		MemberDAO m_dao = new MemberDAO();
		try {
			if(cmd.equals("/index.classInfo")) {
				//시작페이지에서 넘어올때, 해당 class의 info넘겨주기
				//System.out.println(this.getServletContext().getRealPath("/")); //서버 파일경로확인용
				int classId = Integer.parseInt(request.getParameter("classId")); //클래스들 목록에서 해당클래스 클릭했을때 넘어온 id값으로 정보조회
				//1. classId에 해당하는 정보들 가져와서 request에 저장해주기.
				ClassInfoDTO dto = i_dao.selectInfoByClassId(classId);
				request.setAttribute("classInfo", dto);
				//2. 해당 클래스의 tutor의 사진과 닉네임 얻어오기.
				String[] nick_photo = m_dao.getTutorImg(dto.getInfo_tutorid());
				request.setAttribute("tutorNickname", nick_photo[0]);
				request.setAttribute("tutorImg", nick_photo[1]);
				//달력표시작업
				//3. 해당클래스의 수업가능 시작날짜 ~ 종료날짜 는 dto에서 사용하기.
				//4. 해당클래스의 정원꽉찬 날짜만 따로 보내주기.(for문때문에 size도 보내주기
				List<String> closedDateList = i_dao.selectMaxPersonDate(classId);
				request.setAttribute("closedDateList", closedDateList);
				
				System.out.println("담기완료");
				request.getRequestDispatcher("detail.jsp").forward(request, response);
			}else if(cmd.equals("/applicable.classInfo")) { 
				//보내준 날짜에 신청한 인원이 총 몇명인지
				int classId = Integer.parseInt(request.getParameter("classId"));
				String checkDate = request.getParameter("check");
				String signupNum = i_dao.selectCountCheckDate(classId, checkDate);
				pw.append(signupNum);
			}
		}catch(Exception e) {

		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
