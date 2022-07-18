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

		//1. �������ڵ�
		request.setCharacterEncoding("utf-8");
		
		//2. parameter�ޱ�
		String m_id		= request.getParameter("m_id");
		String m_pwd	= request.getParameter("m_pwd");
		
		String url		= request.getParameter("url");
		
		//3. m_id�� �ش�Ǵ� ȸ������ ��������
		MemberVo user = MemberDao.getInstance().selectOne(m_id);
		
		//4. m_idüũ
		if(user==null) {
			//Session Tracking
			response.sendRedirect("login_form.do?reason=fail_id");
			
			return;
			
		}
		
		//5. m_pwdüũ
		if(user.getM_pwd().equals(m_pwd)==false) {
			//Session Tracing
			response.sendRedirect("login_form.do?reason=fail_pwd&m_id=" + m_id);
			
			return;
			
		}
		
		//6. �α��� ������ �ֱ�
		HttpSession session = request.getSession();
		session.setAttribute("user", user);
		
		if(url!=null && !url.isEmpty()) {
			
			response.sendRedirect(url);
			
		}else {
			//���������� �̵�(url)
			//������ :     
			response.sendRedirect("../main/main.do");
			
			
			
		}

	}

}
