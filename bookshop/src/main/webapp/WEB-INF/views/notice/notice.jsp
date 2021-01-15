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
	<h3>이용안내</h3>
	<table class="table">
		<thead>
			<tr>
				<th>No.</th>
				<th style="width: 60%;">글 제목</th>
				<th>날짜</th>
				<th>조회수</th>

			</tr>
		</thead>
		<tbody>
			<c:forEach items="${Noticelist }" var="notice">
				<tr>
					<td>${notice.nno }</td>
					<td><a href="viewPath/${notice.nno}">${notice.n_subject }</a></td>
					<td><fmt:formatDate value="${notice.n_regdate }"
									pattern="yyyy.MM.dd" /></td>
					<td>${notice.n_hit }</td>
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
					href="notice?pageNum=${pageDto.startPage - pageDto.pageBlock}">Previous</a></li>
			</c:if>
			<!-- 페이지번호 -->
			<c:forEach var="i" begin="${pageDto.startPage}"
				end="${pageDto.endPage}" step="1">
				<c:choose>
					<c:when test="${pageScope.i eq requestScope.pageNum}">
						<li class="page-item"><a class="page-link"
							href="/notice/notice?pageNum=${i}">${i}</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link"
							href="/notice/notice?pageNum=${i}">${i}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<!-- 다음 -->
			<c:if test="${pageDto.endPage lt pageDto.pageCount }">
				<li><a
					href="notice?pageNum=${pageDto.startPage + pageDto.pageBlock}">Next</a></li>
			</c:if>
		</c:if>
	</ul>
</div>


<%@include file="../includes/footer.jsp"%>
</body>
</html>
