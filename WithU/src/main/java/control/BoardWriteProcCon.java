package control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardBean;
import board.BoardDAO;

@WebServlet("/BoardWriteProcCon.do")
public class BoardWriteProcCon extends HttpServlet {

  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//reqPro(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		//빈클레스로 데이터를 읽어들임
		BoardBean bean = new BoardBean();
		bean.setSubject(request.getParameter("subject"));
		bean.setWriter(request.getParameter("writer"));
		bean.setUserid(request.getParameter("userid"));
		bean.setUserpass(request.getParameter("userpass"));
		bean.setContent(request.getParameter("content"));
		
		BoardDAO bdao = new BoardDAO();
		bdao.insertBoard(bean);
		
		
		//RequestDispatcher dis = request.getRequestDispatcher("BoardListCon.do");
		//dis.forward(request, response);
		response.sendRedirect("BoardListCon.do");
		
	}

}
