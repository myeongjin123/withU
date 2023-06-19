package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import comment.CommentBean;
import comment.CommentService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/comment.do")
public class CommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public CommentServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); //사용자 입력 문자 인코딩
		response.setContentType("text/html; charset=UTF-8"); //사용자 응답 웹페이지 문자 인코딩
		PrintWriter out = response.getWriter();
		
		try {
		//댓글 추가, 수정, 삭제 실행 선택 파라미터
		int exe = Integer.parseInt(request.getParameter("exe"));
		int num = Integer.parseInt(request.getParameter("num"));
		int ref = Integer.parseInt(request.getParameter("ref"));
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String content = request.getParameter("content");
		
		
		//int currentPage = Integer.parseInt(request.getParameter("page"));
		CommentBean bean = new CommentBean();
		bean.setNum(num);
		bean.setRef(ref);
		bean.setContent(content);
		bean.setName(name);
		bean.setPassword(password);
		
		
		//insert
		CommentService comment = CommentService.getInstance();
		
		out.print("<script>");
		if(exe == 1) { //댓글 새로 추가
			comment.insert(bean);
			out.print("alert('댓글 작성 완료');");
		}else if(exe == 2) { //댓글 수정
			boolean res = comment.update(bean);
			if(res) {
				//성공
				out.print("alert('댓글 수정 완료');");
			}else {
				//실패
				out.print("alert('비밀번호 오류');");
			}
		}else { //댓글 삭제 (exe == 3)
			boolean res = comment.delete(num, password);
			if(res) {
				out.print("alert('댓글 삭제 완료');");
			}else {
				out.print("alert('비밀번호 오류');");
			}
		}
		
		//댓글 추가, 수정, 삭제 후에 다시 메인글 검색
		out.print("location.href='BoardInfo?num=" + ref + "&page=';");
		out.print("</script>");
		
		 // 댓글 추가, 수정, 삭제 후에 댓글 목록 가져와서 commentList 속성으로 설정
        List<CommentBean> commentList = comment.getList(ref);
        request.setAttribute("commentList", commentList);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("BoardInfoControl.do?num=" + ref);
        dispatcher.forward(request, response);
		
		} catch (NumberFormatException e) {
            // 숫자 형식이 잘못된 경우 예외 처리
            out.print("<script>");
            out.print("alert('잘못된 요청입니다.');");
            out.print("history.back();");
            out.print("</script>");
        }
	}
}
