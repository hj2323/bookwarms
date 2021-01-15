<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>✨Bookwarms</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	  <script   src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<style>
.fakeimg {
	height: 200px;
	background: #aaa;
}

.faq {
	text-align: center;
	border-radius: 5px;
	border: 2px solid rgb(204, 204, 204);
	margin: 20px 300px;
	min-width: 100px;
	padding: 10px 0;
}

.total {
	text-align: center;
	border-radius: 5px;
	border: 2px solid rgb(204, 204, 204);
	margin: 20px 200px;
	min-width: 500px;
	padding: 10px 0;
}

.buttons {
	text-align: center;
	margin: 40px 0 100px 0;
}
</style>
</head>
<body>

	<ul class="nav justify-content-end bg-light">
		
		<c:choose>
				
			<c:when test="${sessionScope.sessid=='admin'}">
				<li>🛠<span style="color:red;">관리자</span>로 로그인 했습니다.</li>
				<li class="nav-item"><a class="nav-link"
					href="/admin/a_notice/a_notice">관리자 페이지👨‍🔧</a></li>
				<li class="nav-item"><a class="nav-link" href="/member/logout">로그아웃</a>
				</li>
			</c:when>
			<c:when test="${sessionScope.sessid!=null}">
				<li>📣<b>${sessionScope.sessid }</b>(으)로 로그인 했습니다.</li>
				<li class="nav-item"><a class="nav-link" href="/cart/cart">장바구니🛒</a></li>
				<li class="nav-item"><a class="nav-link"
					href="/mypage/myaccount">마이 페이지🙍‍♂️‍</a></li>
				<li class="nav-item"><a class="nav-link" href="/member/logout">로그아웃</a>
				</li>
			</c:when>
			<c:otherwise>
			
				<li class="nav-item"><a class="nav-link" href="/member/signup">회원가입</a></li>
				<li class="nav-item"><a class="nav-link" href="/member/login">로그인</a></li>
			</c:otherwise>
		</c:choose>
	</ul>

	<div class="jumbotron text-center" style="margin-bottom: 0">


		<h1>Welcome to BookWarms!🦉</h1>
		<p>🎊책을 좋아하는 사람들을 위한 인터넷 서점 북웜즈에 오신것을 환영합니다!🎊</p>
		<p>찾고 싶은 책을 검색해보세요!</p>
		<form action="/booklist/booklist" method="get">
		<div class="container" style="display: flex;">
		
			<div class="form-group"
				style="width: 600px; display: relative; margin: 0 5px 0 100px;">
				<input type="text" class="form-control" id="usr" name="search">
			</div>
			<div>
				<button type="submit" class="btn btn-secondary">검색</button>
			</div>
		
		</div>
		</form>
	</div>
	
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<a class="navbar-brand" href="/">✨Bookwarms</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="collapsibleNavbar">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="/notice/notice">❗이용안내</a></li>
				<li class="nav-item"><a class="nav-link"
					href="/booklist/booklist">Books💖</a></li>
				<li class="nav-item"><a class="nav-link"
					href="/bestseller/bestseller">Bestseller💯</a></li>
				<li class="nav-item"><a class="nav-link" href="/qna/qna">Q&A💌</a>
				</li>


			</ul>
		</div>

	</nav>