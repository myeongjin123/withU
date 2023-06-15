<%@page import="java.io.PrintWriter"%>
<%@page import="board.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/include/header.jsp"></jsp:include>
<link rel="stylesheet" href="css/boardlist.css">
<div class="body">
	<h1 class="m-100">게시판</h1>
    	<!-- board start -->
	    <div class="border-top0">
	        <span class="w100">번호</span>
	        <span class="w400">제목</span>
	        <span class="w150">작성자</span>
	        <span class="w150">작성일</span>
	        <span class="w100">조회수</span>
	    </div>
        <%
        BoardDAO bdao = new BoardDAO();
        ArrayList<BoardBean> search = bdao.getSearch(request.getParameter("searchField"),
                                request.getParameter("searchText"));

        if (search.size() == 0) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('검색결과가 없습니다.')");
            script.println("history.back()");
            script.println("</script>");
        }

        int pageSize = 10; // 페이지당 게시글 수
        int currentPage = 1; // 현재 페이지 번호
        if (request.getParameter("pageNum") != null) {
            currentPage = Integer.parseInt(request.getParameter("pageNum"));
        }

        int startRow = (currentPage - 1) * pageSize;
        int endRow = currentPage * pageSize;
        if (endRow > search.size()) {
            endRow = search.size();
        }

        for (int i = startRow; i < endRow; i++) {
            BoardBean board = search.get(i);
        %>

        <div class="form-center border-bottom1">
            <span class="w100 bold"><%= board.getNum() %></span>
            <span class="w400"><a href="BoardInfoControl.do?num=<%= board.getNum() %>"><%= board.getSubject() %></a></span>
            <span class="w150"><%= board.getWriter() %></span>
            <span class="w150"><%= board.getWdate().split(" ")[0]%></span>
            <span class="w100"><%= board.getReadcount() %></span>
        </div>
		
        <%
        }

        int pageCount = search.size() / pageSize + (search.size() % pageSize == 0 ? 0 : 1);
        int startPage = ((currentPage - 1) / 10) * 10 + 1;
        int endPage = startPage + 9;
        if (endPage > pageCount) {
            endPage = pageCount;
        }
        %>
        
        <div class="list-button">
        	<button onclick="location.href='BoardList.jsp'">목록</button>
        	<button onclick="location.href='BoardWriteForm.jsp'">글쓰기</button>
        </div>
        
        	<p class="form-center">
              <%
                if (startPage > 1) {
              %>
                <a href="searchbbs.jsp?pageNum=<%= startPage - 1 %>&searchField=<%= request.getParameter("searchField") %>&searchText=<%= request.getParameter("searchText") %>" id="a-prev">이전</a>
              <%
                }
                for (int i = startPage; i <= endPage; i++) {
              %>
                <a href="searchbbs.jsp?pageNum=<%= i %>&searchField=<%= request.getParameter("searchField") %>&searchText=<%= request.getParameter("searchText") %>" id="a-now"><%= i %></a>
              <%
                }
                if (endPage < pageCount) {
              %>
                <a href="searchbbs.jsp?pageNum=<%= endPage + 1 %>&searchField=<%= request.getParameter("searchField") %>&searchText=<%= request.getParameter("searchText") %>" id="a-next">다음</a>
              <%
                }
              %>
            </p>
 
</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>