<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="user.BoardDAO" %>
<%@ page import="user.BoardDTO" %>
<%@ page import="java.util.Vector" %>

<!doctype html>

<html>
  <head>
    <title>강의평가 웹 사이트</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- 부트스트랩 CSS 추가하기 -->
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <!-- 커스텀 CSS 추가하기 -->
    <link rel="stylesheet" href="./css/custom.css">
  </head>
  <body>
  <%
   // BoardDAO 클래스의 인스턴스 생성
   BoardDAO boardDAO = new BoardDAO();

   // getBoardList() 메서드를 사용하여 게시물 목록 검색
   Vector<BoardDTO> boardList = boardDAO.getBoardList();
%>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <a class="navbar-brand" href="index.jsp">강의평가 웹 사이트</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbar">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
            <a class="nav-link" href="index.jsp">메인</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" id="dropdown" data-toggle="dropdown">
             회원 관리
            </a>
            <div class="dropdown-menu" aria-labelledby="dropdown">
              <a class="dropdown-item active" href="userLogin.jsp">로그인</a>
              <a class="dropdown-item" href="userRegister.jsp">회원가입</a>
              <a class="dropdown-item" href="userLogout.jsp">로그아웃</a>
            </div>
          </li>
        </ul>
        <form action="./index.jsp" method="get" class="form-inline my-2 my-lg-0">
          <input type="text" name="search" class="form-control mr-sm-2" placeholder="내용을 입력하세요.">
          <button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
        </form>
     </div>
    </nav>
    <p/>
	<div class="container">
	  <table class="table table-bordered table-striped">
	    <thead class="thead-dark">
	      <tr>
	        <th style="width: 10%;">글번호</th>
	        <th style="width: 10%;">글쓴이</th>
	        <th style="width: 35%;">글 제목</th>
	        <th style="width: 20%;">등록일</th>
	        <th style="width: 10%;">조회수</th>
	      </tr>
	    </thead>
	    <tbody>
	       <% for (int i = 0; i < boardList.size(); i++) {
   				 BoardDTO board = boardList.get(i);
			%>
			    <tr>
			        <td><%= board.getNum() %></td>
			        <td><%= board.getTitle() %></td>
			        <td><%= board.getUserId() %></td>
			        <td><%= board.getPostdate() %></td>
			        <td><%= board.getVisitcount() %></td>
			    </tr>
			<% } %>
	    </tbody>
	  </table>
	</div>
    <footer class="bg-dark mt-4 p-5 text-center" style="color: #FFFFFF;">
      &copy; 2023 김지성 All Rights Reserved.
    </footer>
    <!-- 제이쿼리 자바스크립트 추가하기 -->
    <script src="./js/jquery.min.js"></script>
    <!-- Popper 자바스크립트 추가하기 -->
    <script src="./js/popper.min.js"></script>
    <!-- 부트스트랩 자바스크립트 추가하기 -->
    <script src="./js/bootstrap.min.js"></script>
  </body>
</html>
