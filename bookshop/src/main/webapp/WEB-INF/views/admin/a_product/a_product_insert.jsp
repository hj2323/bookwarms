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
			<h2>상품추가</h2>
			<div class="table-responsive">
			<form action="insert" method="post" enctype="multipart/form-data">
				<table class="table">

					<tr>
						<td >책제목</td>
						<td colspan="3"><input type="text" class="form-control"
							id="usr" name="book_title"></td>

					</tr>
					<tr>
						<td>저자</td>
						<td colspan="3"><input type="text" class="form-control"
							id="usr" name="book_author"></td>

					</tr>
					<tr>
						<td>출간일</td>
						<td><input type="date" name="book_releaseDate"></td>
						<td>카테고리선택</td>
						<td><div class="form-group">
									<select class="form-control" id="sel1" name="cateCode">
										<c:forEach items="${categorylist}" var="cate">
										<option value="${cate.cateCode}">${cate.cateName }</option>
										</c:forEach>
									</select>
								</div></td>

					</tr>
					<tr>
						<td>가격(원)</td>
						<td colspan="3"><input type="number" class="form-control" id="usr" name="book_price"></td>
						

					</tr>
					<tr>
						<td>책 소개</td>
						<td colspan="3"><textarea class="form-control" rows="5"
								id="comment" name="book_description"></textarea></td>

					</tr>
					<tr>
					<td>책이미지 파일업로드</td>
						<td colspan="3">
						<div class="inputArea">
							<div class="custom-file">
								<input type="file" class="custom-file-input" id="customFile" name='file'>
								<label class="custom-file-label" for="customFile">Choose
									file</label>
									
									
							</div>
							<div class="select_img"><img src=""/></div>
							
							<script>
							$("#customFile").change(function(){
								if(this.files && this.files[0]){
									var reader = new FileReader;
									reader.onload = function(data){
										$(".select_img img").attr("src", data.target.result).width(500);
									}
									reader.readAsDataURL(this.files[0]);
								}
							})
						</script>
						<%--=request.getRealPath("/") --%>
						</div>
						</td>
					
					</tr>
					
				

				</table>
				<button type="submit" class="btn btn-info">상품추가</button>
			</div>
		</form>
		</div>
	</div>
</div>


<%@include file="../../includes/footer.jsp"%>
</body>
</html>