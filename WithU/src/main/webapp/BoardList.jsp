<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.BoardBean"%>
<%@page import="java.util.Vector"%>
<%@page import="board.BoardDAO"%>

<jsp:include page="/include/header.jsp"></jsp:include>
<link rel="stylesheet" href="css/boardlist.css">

<div class="body">
	<%
	// 전체 게시물의 내용을 jsp 쪽으로 가져와야함
	BoardDAO bdao = new BoardDAO();
	// 전체 게시글을 리턴 받아주는 소스
	Vector<BoardBean> vec = bdao.allBoard();
	%>

	
	<h1 class="m-100">게시판</h1>
	<!-- search box -->
	<div class="w1000 search-box">
    	<form action="searchbbs.jsp" name="search" method="post" class="form-right">
    		<div class="flex-select">
    			<select class="form-control" name="searchField">
    				<option value="0">선택</option>
    				<option value="subject">제목</option>
    				<option value="writer">작성자</option>
    				<option value="content">내용</option>
    			</select>
    			<input type="text" id="search-input" class="form-control" placeholder="검색어를 입력하세요." name="searchText" maxlength="20">
    			<button type="submit"> 검색 </button>	
    		</div>
    	</form>
 	</div>
    <!-- search box -->
    
    <!-- board start -->
	    <div class="border-top0">
	        <span class="w100">번호</span>
	        <span class="w400">제목</span>
	        <span class="w150">작성자</span>
	        <span class="w150">작성일</span>
	        <span class="w100">조회수</span>
	    </div>

	    <%
	    int pageSize = 10; // 페이지당 게시글 수
	    int currentPage = 1; // 현재 페이지 번호
	    if (request.getParameter("pageNum") != null) {
	        currentPage = Integer.parseInt(request.getParameter("pageNum"));
	    }
	
	    int startRow = (currentPage - 1) * pageSize;
	    int endRow = currentPage * pageSize;
	    if (endRow > vec.size()) {
	        endRow = vec.size();
	    }
	
	    int number = vec.size();
	
	    for (int i = startRow; i < endRow; i++) {
	        BoardBean bean = vec.get(i);
	    %>
	    
	    <!-- 게시판 리스트 출력 -->
	    <div class="form-center border-bottom1">
	       <span class="w100 bold"><%= bean.getNum() %></span>
	       <span class="w400" id="subleft"><a href="BoardInfoControl.do?num=<%= bean.getNum() %>"><%= bean.getSubject() %></a></span>
	       <span class="w150"><%= bean.getWriter() %></span>
	       <span class="w150"><%= bean.getWdate() %></span>
	       <span class="w100"><%= bean.getReadcount() %></span>
	    </div>

	    <% } %>
	    
	    <div class="write-button">
	        <button onclick="location.href='BoardWriteForm.jsp'">글쓰기</button>
		</div>

	<p class="form-center">
    <!-- 페이지네이션-->
    <% if (vec.size() > 0) {
        int pageCount = vec.size() / pageSize + (vec.size() % pageSize == 0 ? 0 : 1);
        int startPage = ((currentPage - 1) / 10) * 10 + 1;
        int endPage = startPage + 9;
        if (endPage > pageCount) {
            endPage = pageCount;
        }
        if (startPage > 1) { %>
            <a href='BoardListCon.do?pageNum=<%= startPage - 1 %>' id="a-prev">이전</a>
        <% }
        for (int i = startPage; i <= endPage; i++) { %>
            <a href='BoardListCon.do?pageNum=<%= i %>' id="a-now"><%= i %> </a>
        <% }
        if (endPage < pageCount) { %>
            <a href='BoardListCon.do?pageNum=<%= endPage + 1 %>' id="a-next">다음</a>
        <% 
        } } 
    	%>
 		</p>   
    
<%-- 	<script>
		var message = '<%= request.getAttribute("msg") %>';
	    if (message === "수정이 완료 되었습니다.") {
	        alert("게시글이 수정되었습니다.");
	    } else if (message === "비밀번호가 맞지 않습니다.") {
	        alert("비밀번호가 틀렸습니다.");
	    } else if (message === "삭제 되었습니다.") {
	        alert("삭제 되었습니다.");
	    } else if (message === "비밀번호가 틀렸습니다.") {
	        alert("비밀번호가 틀렸습니다.");
	    }
	</script> --%>
</div>
    <jsp:include page="/include/footer.jsp"></jsp:include>

</body>
</html>