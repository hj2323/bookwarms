<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
					href="/booklist/booklist?cateCode=${cate.cateCode}&pageNum="${pageNum}">${cate.cateName}</a></li>


			</c:forEach>
		</c:if>



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
			<form action="/order/order" method="get">
			<input type="hidden" value="${book.book_id}" name="book_id">
				<tr>
					<td><img
						src="${book.book_Img }"
						width="300px;"></td>
					<td><div style="font-size: 25px;">${book.book_title }</div>
						<div>${book.book_author } 저</div>
						<hr>


						<div style="color: #888; font-size: 16px;">
							판매가 <span style="color: #ff6666; font-size: 26px;">
							<fmt:formatNumber type="number" maxFractionDigits="3" value="${book.book_price}" />
							
							</span>원
						</div></td>

					<td><ul class="list-group">
							<li class="list-group-item">수량
								<div class="form-group">

									<input type="text" name="amount" class="form-control amount" 
										style="width: 15%;">
								</div>
							</li>
							<li class="list-group-item">
								<button type="button"
									data-bookid="${book.book_id }" class="btn btn-light cartBtn"
									>카트에 담기</button>
								</li>
							<li class="list-group-item"><button type="submit"
									data-bookid="${book.book_id }" class="btn btn-light"
									>바로구매</button></li>
						</ul>
					</td>
				</tr>
				</form>
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
							href="/booklist/booklist?pageNum=${i}&cateCode=${cateCode}">${i}</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link"
							href="/booklist/booklist?pageNum=${i}&cateCode=${cateCode}">${i}</a></li>
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
	$(".cartBtn").click(function() {
		//alert("asdfas")

		var bookinfo = $(this).parent().parent();
		
		var selectamount = $(this).parent().prev().children();

		var bookid = $(this).attr('data-bookid');//bookd_id값
		
		var amount = bookinfo.find('.amount').val();//amount값

		//alert(amount+"ddd");
		var data = {
			"book_id" : bookid,
			"amount" : amount
		}

		$.ajax({
			url : "/cart/insert",
			type : "post",
			contentType : 'application/json;charset=utf-8',
			data : JSON.stringify(data)
		}).done(function() {
			alert("상품을 장바구니에 추가했습니다.")
		}).fail(function() {
			alert("상품 추가를 실패했습니다")
		})

	})
	
	
</script>
<%@include file="../includes/footer.jsp"%>
</body>
</html>
