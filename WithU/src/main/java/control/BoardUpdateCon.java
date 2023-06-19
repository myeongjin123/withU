package control;

import java.io.IOException;

import board.BoardBean;
import board.BoardDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/BoardUpdateCon.do")
public class BoardUpdateCon extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request,response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	// 해당번호
	int num = Integer.parseInt(request.getParameter("num"));
	
	// 데이터베이스에서 하나의 게시글에 대한 정보를 리턴하는 메소드 호출
	BoardDAO bdao = new BoardDAO();
	BoardBean bean = bdao.getOneUpdateBoard(num);
	
	// request에 데이터 부착
	request.setAttribute("bean", bean);
	
	RequestDispatcher dis = request.getRequestDispatcher("BoardUpdateForm.jsp");
	dis.forward(request, response);
	}

}
