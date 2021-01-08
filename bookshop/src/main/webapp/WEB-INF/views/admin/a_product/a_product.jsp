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
			<h2>상품관리</h2>
			<h5><button type="button" class="btn btn-info" onclick="location.href='/admin/a_product/a_product_insert'">상품추가</button></h5>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>책이름</th>
						<th>저자</th>
						<th>출간일</th>
						<th>카테고리분류넘버</th>
						<th>카테고리</th>
						<th>
							<div class="checkbox">
								전체선택<input type="checkbox" id="cateAll" value="">
							</div>
						</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${Booklist}" var="book">
						<tr>
							<td>${book.book_title}</td>
							<td>${book.book_author}</td>
							<td><fmt:formatDate value="${book.book_releaseDate}"
									pattern="yyyy.MM.dd" /></td>
							<td>${book.cateCode}</td>
							<td><div class="form-group">
									<select class="form-control" id="sel1">
										<option value="" selected>{book.cateName}</option>
										<c:forEach items="${categorylist}" var="cate">
										<option value="${cate.cateCode}">${cate.cateName }</option>
										</c:forEach>
									</select>
								</div></td>
							<td>
								<div class="checkbox">
									<input type="checkbox" value="" name="categorys">
									<button type="button" class="btn btn-warning btn-xs">수정</button>
								</div>

							</td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="5"></td>
						<td>
							<button type="button" class="btn btn-danger">선택삭제</button>
						</td>
					</tr>


				</tbody>
			</table>


		</div>
	</div>
</div>
<script>
	var $cateAll = $('#cateAll');
	$cateAll.change(function() {
		var $this = $(this);
		var checked = $this.prop('checked'); // checked 문자열 참조(true, false)
		// console.log(checked);
		$('input[name="categorys"]').prop('checked', checked);

	});

	var boxes = $('input[name="categorys"]');
	boxes.change(function() {
		// 첫 번째 방법
		/*
		var selectAll = true;
		var count = boxes.length;
		var i = 0;
		for (; i < count; i++) {
		  if (!boxes[i].checked) {
		    selectAll = false;
		    break;
		  }
		}
		 */

		// 두 번째 방법
		var boxLength = boxes.length;
		// 체크된 체크박스 갯수를 확인하기 위해 :checked 필터를 사용하여 체크박스만 선택한 후 length 프로퍼티를 확인
		var checkedLength = $('input[name="categorys"]:checked').length;
		var selectAll = (boxLength == checkedLength);

		$cateAll.prop('checked', selectAll);

	});
</script>

<%@include file="../../includes/footer.jsp"%>
</body>
</html>