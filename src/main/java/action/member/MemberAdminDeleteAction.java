package action.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;

/**
 * Servlet implementation class MemberDeleteAction
 */
@WebServlet("/member/admin_delete.do")
public class MemberAdminDeleteAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		//1. parameter�ޱ�
		int m_idx = Integer.parseInt(request.getParameter("m_idx"));
		
		//2. DB delete
		int res = MemberDao.getInstance().delete(m_idx);
		
		//3. ��Ϻ���� �̵�
		response.sendRedirect("list.do");

	}

}
