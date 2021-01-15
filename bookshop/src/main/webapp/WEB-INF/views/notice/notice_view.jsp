<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>✨Bookwarms</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<%--head영역 --%>
<%@include file="../includes/header.jsp"%>



<div class="container" style="margin-top: 30px">
	<h3>QnA</h3>

	<table class="table">
		<thead>
			<tr>
				<td>제목</td>

				<td colspan="3">${notice.n_subject}</td>


			</tr>
		</thead>
		<tbody>
			<tr>
				<td>작성자</td>
				<td><b>관리자</b></td>
				<td>등록일</td>
				<td><fmt:formatDate value="${notice.n_regdate}"
						pattern="yyyy.MM.dd" /></td>
			</tr>
			<tr>
				<td colspan="4">${notice.n_content}</td>

			</tr>

		</tbody>
	</table>
	<hr>
	<button type="button" class="btn btn-primary">목록으로</button>

</div>

<%@include file="../includes/footer.jsp"%>
</body>
</html>
