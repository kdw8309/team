package action.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import vo.MemberVo;

/**
 * Servlet implementation class MemberInsertAction
 */
@WebServlet("/member/insert.do")
public class MemberInsertAction extends HttpServlet {
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
		String	m_id		= 	request.getParameter("m_id");
		String	m_pwd		=	request.getParameter("m_pwd");
		String	m_nick		=	request.getParameter("m_nick");
		String	m_email		=	request.getParameter("m_email");
		String	m_ph		=	request.getParameter("m_ph");
		String	m_jumin		=	request.getParameter("m_jumin");
		String	m_pref_book	=	request.getParameter("m_pref_book");
		int		m_age		=	Integer.parseInt(request.getParameter("m_age"));
		String	m_name		=	request.getParameter("m_name");
		String	m_zipcode	=	request.getParameter("m_zipcode");
		String	m_addr		=	request.getParameter("m_addr");
		
		
		//System.out.printf("%s,%s,%s,%s,%s,%s,%s,%d,%s,%s,%s",m_id, m_pwd, m_nick, m_email, m_ph, m_jumin, m_pref_book, m_age, m_name, m_zipcode, m_addr);
		//3. ip구하기
		String	m_ip		=	request.getRemoteAddr();
		
		//4. MemberVo로 포장
		MemberVo vo	=	new MemberVo();
		
		vo.setM_addr(m_addr);
		vo.setM_age(m_age);
		vo.setM_email(m_email);
		vo.setM_id(m_id);
		vo.setM_ip(m_ip);
		vo.setM_jumin(m_jumin);
		vo.setM_name(m_name);
		vo.setM_nick(m_nick);
		vo.setM_ph(m_ph);
		vo.setM_pref_book(m_pref_book);
		vo.setM_pwd(m_pwd);
		vo.setM_zipcode(m_zipcode);
		vo.setM_grade("일반");
		
		//5. DB 입력
		int res	=	MemberDao.getInstance().insert(vo);
		
		//6. 목록보기
		response.sendRedirect("login_form.do");
		
		

	}

}
