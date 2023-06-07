package control;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import board.BoardDAO;

@WebServlet("/BoardDeleteProcCon.do")
public class BoardDeleteProcCon extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//reqPro(request,response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request,response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		String password = request.getParameter("userpass");
		String pass = request.getParameter("pass");
		
		if(password.equals(pass)) {
			BoardDAO bdao = new BoardDAO();
			bdao.deleteBoard(num);
			
			//request.setAttribute("msg", "삭제 되었습니다.");
			//RequestDispatcher dis = request.getRequestDispatcher("BoardListCon.do");
			//dis.forward(request, response);
			//response.sendRedirect("BoardListCon.do");
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().print("<script>alert('삭제되었습니다.'); location.href='BoardList.jsp';</script>");
		}else {
			//request.setAttribute("msg", "비밀번호가 틀렸습니다.");
			//RequestDispatcher dis = request.getRequestDispatcher("BoardListCon.do");
			//dis.forward(request, response);
			//response.sendRedirect("BoardListCon.do");
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().print("<script>alert('비밀번호가 틀렸습니다.'); history.back();</script>");
		}
	}
}


