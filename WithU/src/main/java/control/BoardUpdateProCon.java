package control;

import java.io.IOException;

import board.BoardDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/BoardUpdateProcCon.do")
public class BoardUpdateProCon extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글처리
		request.setCharacterEncoding("utf-8");
		
		//폼으로부터 넘어온 데이터를 받아줌
		int num = Integer.parseInt(request.getParameter("num"));
		String password = request.getParameter("userpass"); //사용자로부터 입력받은 패스워드 값
		String pass = request.getParameter("pass"); //실제 데이터 베이스에 저장되어있는 패스워드 값
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		
		if(password.equals(pass) ) {
			BoardDAO bdao = new BoardDAO();
			bdao.updateBoard(num, subject, content);
			// 수정이 완료되었다면 전체 게시글 보기로 이동
//			request.setAttribute("msg", "수정이 완료 되었습니다.");
//			RequestDispatcher dis = request.getRequestDispatcher("BoardListCon.do");
//			dis.forward(request, response);
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().print("<script>alert('수정이 완료되었습니다.'); location.href='BoardList.jsp';</script>");
		}else if(password != pass || password == null) {
//			request.setAttribute("msg", "비밀번호가 맞지 않습니다.");
//			RequestDispatcher dis = request.getRequestDispatcher("BoardListCon.do");
//			dis.forward(request, response);
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().print("<script>alert('비밀번호가 틀렸습니다.'); history.back();</script>");
		}
		
	}
	
	

}
