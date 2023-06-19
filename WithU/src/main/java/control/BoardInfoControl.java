package control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import board.BoardBean;
import board.BoardDAO;
import comment.CommentBean;
import comment.CommentDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/BoardInfoControl.do")
public class BoardInfoControl extends HttpServlet {

   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			reqPro(request, response);
		} catch (NumberFormatException e) {
			// 파라미터 값을 정수로 변환할 수 없는 경우 예외 처리
			e.printStackTrace();
			// 에러 페이지로 리다이렉트 또는 에러 메시지를 보여줄 수 있습니다.
			 response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid number format");
        
		}
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			reqPro(request, response);
		} catch (NumberFormatException e) {
			// 파라미터 값을 정수로 변환할 수 없는 경우 예외 처리
			e.printStackTrace();
			// 에러 페이지로 리다이렉트 또는 에러 메시지를 보여줄 수 있습니다.
			 response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid number format");
        
		}
	
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		//num
		int num = Integer.parseInt(request.getParameter("num"));
		
		//데이터베이스 접근
		BoardDAO bdao = new BoardDAO();
		
		//하나의 게시글에 대한 정보를 리턴
		BoardBean bean = bdao.getOneBoard(num);
		request.setAttribute("bean", bean);
		
		
		int ref = Integer.parseInt(request.getParameter("num"));
		 // 댓글 목록 가져오기
	    CommentDAO cdao = new CommentDAO();
	    List<CommentBean> commentList = cdao.getList(ref); // 해당 게시글의 댓글 목록 가져오기
	    request.setAttribute("commentList", commentList);
		
		//view jsp쪽으로 데이터를 넘겨줌
		RequestDispatcher dis = request.getRequestDispatcher("BoardInfo.jsp");
		dis.forward(request, response);
		} catch (NumberFormatException | SQLException e) {
            // 숫자 형식 예외 처리
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid number format");
        }
	}

}
