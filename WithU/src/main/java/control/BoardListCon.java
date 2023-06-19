package control;

import java.io.IOException;
import java.util.Vector;

import board.BoardBean;
import board.BoardDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/BoardListCon.do")
public class BoardListCon extends HttpServlet {
	
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	
	protected void reqPro (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//화면에 보여질 게시글의 갯수를 지정
				int pageSize = 10;
				//현재 보여지고 있는 페이지의 넘버값을 읽어들임
				String pageNum = request.getParameter("pageNum");
				//null 처리
				if(pageNum == null) {
					pageNum = "1";
				}
				//전체 게시글의 갯수 파악
				int count = 0;
				//jsp 페이지 내에서 보여질 넘버링 숫자값을 저장하는 변수
				int number = 0;
				
				//현재 보여지고 있는 페이지 문자를 숫자로 형변환
				int currentPage = Integer.parseInt(pageNum);
				//전체 게시글의 갯수를 가져와야 하기에 데이터베이스 객체 생성
				BoardDAO bdao = new BoardDAO();
				count = bdao.getAllCount();
				
				//현재 보여질 페이지 시작번호를 설정
				int startRow = (currentPage-1)*pageSize+1;
				int endRow = currentPage * pageSize;
				
				//최신글 10개를 기준으로 게시글을 리턴 받아주는 메소드 호출
				Vector<BoardBean> v = bdao.getAllBoard( startRow, endRow);
				
				number = count - (currentPage -1) * pageSize;
				
				/////수정 삭제시 비밀번호가 같지 않다면 msg 호출
				String msg = (String)request.getAttribute("msg");
				
				//////////BoardList.jsp쪽으로 request객체에 담아서 넘겨줌
				request.setAttribute("v", v);
				request.setAttribute("number", number);
				request.setAttribute("pageSize", pageSize);
				request.setAttribute("count", count);
				request.setAttribute("currentPage", currentPage);
				request.setAttribute("msg", msg);
				
			    
				
				RequestDispatcher dis = request.getRequestDispatcher("BoardList.jsp");
				dis.forward(request, response);
			}

		}