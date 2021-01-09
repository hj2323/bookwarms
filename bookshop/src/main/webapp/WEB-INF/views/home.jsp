<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>✨Bookwarms</title>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD7ejAWAAdXj3KcsLxZ4Y7XOjCYlgiO0T4&callback=initMap"async defer></script>
<style>
#map{
	width:100%;
	height:300px;
}
</style>
<script>
function showMap(){
	var e = document.getElementById('map');
	new google.maps.Map(e, {center:{lat:35.156700, lng:129.059391}, zoom:14});
}
</script>
<%--head영역 --%>
<%@include file="includes/header.jsp"%>


<div class="container" style="margin-top: 30px">
	<div class="row">
		<div class="col-sm-4">
			<h2>이용안내</h2>
			<table class="table table-bordered table-sm">
				<thead>
					<tr>
						<th>Firstname</th>
						<th>Lastname</th>
						<th>Email</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>John</td>
						<td>Doe</td>
						<td>john@example.com</td>
					</tr>
					<tr>
						<td>Mary</td>
						<td>Moe</td>
						<td>mary@example.com</td>
					</tr>
					<tr>
						<td>July</td>
						<td>Dooley</td>
						<td>july@example.com</td>
					</tr>
				</tbody>
			</table>
			<h2>오시는길<button class="btn btn-secondary" onclick="showMap()">지도보기</button></h2>
			
			<div id="map"></div>
			<hr class="d-sm-none">
		</div>
		<div class="col-sm-8">
			<h2>오늘의 책</h2>
			<h5>Title description, Dec 7, 2017</h5>
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
						<img width="600px" src="https://images.unsplash.com/photo-1551029506-0807df4e2031?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1191&q=80" alt="book1">
					</div>
					<div class="carousel-item">
						<img width="600px" src="https://images.unsplash.com/photo-1512820790803-83ca734da794?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1374&q=80" alt="book2">
					</div>
					<div class="carousel-item">
						<img width="600px" src="https://images.unsplash.com/photo-1524995997946-a1c2e315a42f?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80" alt="book3">
					</div>
				</div>

				<!-- Left and right controls -->
				<a class="carousel-control-prev" href="#demo" data-slide="prev">
					<span class="carousel-control-prev-icon"></span>
				</a> <a class="carousel-control-next" href="#demo" data-slide="next">
					<span class="carousel-control-next-icon"></span>
				</a>

			</div>
			<p>Some text..</p>
			<p>Sunt in culpa qui officia deserunt mollit anim id est laborum
				consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
				labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
				exercitation ullamco.</p>

		</div>
	</div>
</div>
<%@include file="includes/footer.jsp"%>
</body>
</html>
