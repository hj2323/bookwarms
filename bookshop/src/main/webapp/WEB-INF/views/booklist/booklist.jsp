<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>✨Bookwarms</title>
<%--head영역 --%>
<%@include file="../includes/header.jsp"%>




<div class="container" style="margin-top: 30px">

	<%--카테고리메뉴 --%>
	<ul class="nav nav-tabs">
	<c:if test="${pageDto.totalCount gt 0 }">
		<c:forEach items="${categorylist}" var="cate">
		
					<li class="nav-item"><a class="nav-link active"
						href="/booklist/boolist?cateCode=${cate.cateCode}&pageNum="${pageNum}">${cate.cateName}(${cate.cateCode})</a></li>
				

		</c:forEach>
		</c:if>



		</li>
	</ul>
	<table class="table">
		<thead>
			<tr>
				<th></th>
				<th></th>
				<th></th>

			</tr>
		</thead>
		<tbody>
		<c:forEach items="${Booklist}" var="book">
			<tr>
				<td><img
					src="https://images.unsplash.com/photo-1549122728-f519709caa9c?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1525&q=80"
					width="300px;"></td>
				<td><div style="font-size:25px;">${book.book_title }</div><div>${book.book_author } 저</div>
					<hr>
					

					<div style="color:#888; font-size:16px;">판매가 <span style="color:#ff6666;font-size:26px;">${book.book_price} </span>원</div>
				</td>

				<td><ul class="list-group">
						<form action="insertCart" method="post">
						<li class="list-group-item">수량
							<div class="form-group">
							<input type="hidden" id="bookid" value="${book.book_id }">
								<input type="text" class="form-control" id="amount"
									style="width: 15%;">
							</div>
						</li>
						<li class="list-group-item"><button type="button" data-bookid="${book.book_id }" class="btn btn-light" id="cartBtn">카트에 담기</button></li>
						<li class="list-group-item"><button type="button" data-bookid="${book.book_id }" class="btn btn-light" id="orderBtn">바로구매</button></li>
					</ul></td>
			</tr>
			</c:forEach>
			
		</tbody>
	</table>
	<%--페이징 --%>
	<ul class="pagination">
		<c:if test="${pageDto.totalCount gt 0 }">
			<%-- [이전] 출력 --%>
			<c:if test="${ pageDto.startPage gt pageDto.pageBlock }">
				<li><a
					href="booklist?pageNum=${pageDto.startPage - pageDto.pageBlock}&cateCode=${cateCode}">Previous</a></li>
			</c:if>
			<!-- 페이지번호 -->
			<c:forEach var="i" begin="${pageDto.startPage}"
				end="${pageDto.endPage}" step="1">
				<c:choose>
					<c:when test="${pageScope.i eq requestScope.pageNum}">
						<li class="page-item"><a class="page-link active"
							href="/booklist/boolist?pageNum=${i}&cateCode=${cateCode}">${i}</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link"
							href="/booklist/boolist?pageNum=${i}&cateCode=${cateCode}">${i}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<!-- 다음 -->
			<c:if test="${pageDto.endPage lt pageDto.pageCount }">
				<li><a
					href="booklist?pageNum=${pageDto.startPage + pageDto.pageBlock}&cateCode=${cateCode}">Next</a></li>
			</c:if>
		</c:if>
	</ul>
</div>
<script>
$("#cartBtn").click(function(){
	alert("asdfas")
	var data={
		"book_id":$("#bookid").val(),
		"amount":$("#amount").val()
	}
	
	$.ajax({
		url:"/cart/insert",
		type:"post",
		contentType:'application/json;charset=utf-8',
		data:JSON.stringify(data)
	})
	.done(function(){
		alert("상품을 장바구니에 추가했습니다.")
		})
	.fail(function(){
		alert("상품 추가를 실패했습니다")
		})
	
})
</script>
<%@include file="../includes/footer.jsp"%>
</body>
</html>
