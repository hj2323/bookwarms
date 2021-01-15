<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>✨Bookwarms</title>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD7ejAWAAdXj3KcsLxZ4Y7XOjCYlgiO0T4&callback=initMap"
	async defer></script>
<style>
#map {
	width: 100%;
	height: 300px;
}
</style>
<script>
	function showMap() {
		var e = document.getElementById('map');
		new google.maps.Map(e, {
			center : {
				lat : 35.156700,
				lng : 129.059391
			},
			zoom : 14
		});
	}
</script>
<%--head영역 --%>
<%@include file="includes/header.jsp"%>


<div class="container" style="margin-top: 30px">
	<div class="row">
		<div class="col-sm-4">
			<h2>이용안내📌</h2>
			<table class="table table-bordered table-sm">
				<thead>
					<tr>
						<th>No.</th>
						<th style="width: 60%;">글 제목</th>
						<th>날짜</th>

					</tr>
				</thead>
				<tbody>
					<c:forEach items="${Noticelist }" var="notice">
						<tr>
							<td>${notice.nno }</td>
							<td><a href="/notice/viewPath/${notice.nno}">${notice.n_subject }</a></td>
							<td><fmt:formatDate value="${notice.n_regdate }"
									pattern="yyyy.MM.dd" /></td>
							
						</tr>
					</c:forEach>
					
				</tbody>
			</table>
			<h2>
				오시는길🗺			<button class="btn btn-secondary" onclick="showMap()">지도보기</button>
			</h2>

			<div id="map"></div>
			<hr class="d-sm-none">
		</div>
		<div class="col-sm-8">
			<h2>오늘의 책📕</h2>
			<h5>${serverTime }</h5>
			<div id="demo" class="carousel slide" data-ride="carousel">

				<!-- Indicators -->
				<ul class="carousel-indicators">
					<li data-target="#demo" data-slide-to="0" class="active"></li>
					<li data-target="#demo" data-slide-to="1"></li>
					<li data-target="#demo" data-slide-to="2"></li>
				</ul>

				<!-- The slideshow -->
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img width="600px"
							src="https://images.unsplash.com/photo-1551029506-0807df4e2031?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1191&q=80"
							alt="book1">
					</div>
					<div class="carousel-item">
						<img width="600px"
							src="https://images.unsplash.com/photo-1512820790803-83ca734da794?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1374&q=80"
							alt="book2">
					</div>
					<div class="carousel-item">
						<img width="600px"
							src="https://images.unsplash.com/photo-1524995997946-a1c2e315a42f?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80"
							alt="book3">
					</div>
				</div>

				<!-- Left and right controls -->
				<a class="carousel-control-prev" href="#demo" data-slide="prev">
					<span class="carousel-control-prev-icon"></span>
				</a> <a class="carousel-control-next" href="#demo" data-slide="next">
					<span class="carousel-control-next-icon"></span>
				</a>

			</div>
			<p style="font-size:20px;  "><b><a style="text-decoration:none; color:#48426d;" href="http://www.yes24.com/Product/Goods/96383431">📚어니스트의 멋진 하루📚<a></b></p>
			<p>앤서니 브라운 글,그림/공경희 역| 웅진주니어</p>
			<p style="color:#8b5e83;"><b>앤서니 브라운이 전하는 희망의 메시지</b></p>
			<p>

"너는 반드시 길을 찾을 거야." 아기 코끼리 어니스트는 혼자서 정글을 구경하러 갔다가 길을 잃고 맙니다. 정글의 동물들은 아무도 도와주려고 하지 않는데… 어니스트는 엄마에게 돌아갈 수 있을까요? 앤서니 브라운의 과거와 현재를 연결하며 그의 그림책 세계를 한 눈에 볼 수</p>

		</div>
	</div>
</div>
<%@include file="includes/footer.jsp"%>
</body>
</html>
