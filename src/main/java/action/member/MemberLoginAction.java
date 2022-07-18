package action.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import vo.MemberVo;

/**
 * Servlet implementation class MemberLoginAction
 */
@WebServlet("/member/login.do")
public class MemberLoginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		//1. 수신인코딩
		request.setCharacterEncoding("utf-8");
		
		//2. parameter받기
		String m_id		= request.getParameter("m_id");
		String m_pwd	= request.getParameter("m_pwd");
		
		String url		= request.getParameter("url");
		
		//3. m_id에 해당되는 회원정보 가져오기
		MemberVo user = MemberDao.getInstance().selectOne(m_id);
		
		//4. m_id체크
		if(user==null) {
			//Session Tracking
			response.sendRedirect("login_form.do?reason=fail_id");
			
			return;
			
		}
		
		//5. m_pwd체크
		if(user.getM_pwd().equals(m_pwd)==false) {
			//Session Tracing
			response.sendRedirect("login_form.do?reason=fail_pwd&m_id=" + m_id);
			
			return;
			
		}
		
		//6. 로그인 세선에 넣기
		HttpSession session = request.getSession();
		session.setAttribute("user", user);
		
		if(url!=null && !url.isEmpty()) {
			
			response.sendRedirect(url);
			
		}else {
			//메인페이지 이동(url)
			//현재경로 :     
			response.sendRedirect("../main/main.do");
			
			
			
		}

	}

}
