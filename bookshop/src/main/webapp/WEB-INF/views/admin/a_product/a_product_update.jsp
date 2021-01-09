<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>✨Bookwarms</title>
<%--head영역 --%>
<%@include file="../../includes/header.jsp"%>



<div class="container" style="margin-top: 30px">
	<div class="row">
		<%--nav영역 --%>
		<%@include file="../nav.jsp"%>
		<div class="col-sm-8">
			<h2>상품수정</h2>
			<div class="table-responsive">
			<form action="update" method="post">
			<input type="hidden" name="book_id" value="${book.book_id }">
				<table class="table">

					<tr>
						<td>책제목</td>
						<td colspan="3"><input type="text" class="form-control"
							id="usr" name="book_title" value="${book.book_title}"></td>

					</tr>
					<tr>
						<td>저자</td>
						<td colspan="3"><input type="text" class="form-control"
							id="usr" name="book_author" value="${book.book_author}"></td>

					</tr>
					<tr>
						<td>출간일</td>
						<td>
							<fmt:formatDate value="${book.book_releaseDate}" pattern="yyyy.MM.dd"/>
							<input type="date" name="book_releaseDate" >
						</td>
						<td>카테고리선택</td>
						<td><div class="form-group">
									<select class="form-control" id="sel1" name="cateCode">
										<option value="${book.cateCode}" selected>${book.cateName}</option>
										<c:forEach items="${categorylist}" var="cate">
										<option value="${cate.cateCode}">${cate.cateName }</option>
										</c:forEach>
									</select>
								</div></td>

					</tr>
					<tr>
						<td>가격(원)</td>
						<td><input type="text" class="form-control" id="usr" name="book_price" value="${book.book_price}"></td>
						<td>책이미지 파일업로드</td>
						<td><div class="custom-file">
								<input type="file" class="custom-file-input" id="customFile">
								<label class="custom-file-label" for="customFile">Choose
									file</label>
							</div></td>

					</tr>
					<tr>
						<td>책 소개</td>
						<td colspan="3"><textarea class="form-control" rows="5"
								id="comment" name="book_description">${book.book_description}</textarea></td>

					</tr>



				</table>
				<button type="submit" class="btn btn-warning">상품수정</button>
			</div>
		</form>
		</div>
	</div>
</div>


<%@include file="../../includes/footer.jsp"%>
</body>
</html>