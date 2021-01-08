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
				<table class="table">

					<tr>
						<td>책제목</td>
						<td colspan="3"><input type="text" class="form-control"
							id="usr"></td>

					</tr>
					<tr>
						<td>저자</td>
						<td colspan="3"><input type="text" class="form-control"
							id="usr"></td>

					</tr>
					<tr>
						<td>출간일</td>
						<td><input type="date"></td>
						<td>카테고리선택</td>
						<td><select name="cars" class="custom-select-sm">
								<option selected>Small Custom Select Menu</option>
								<option value="volvo">Volvo</option>
								<option value="fiat">Fiat</option>
								<option value="audi">Audi</option>
						</select></td>

					</tr>
					<tr>
						<td>가격(원)</td>
						<td><input type="text" class="form-control" id="usr"></td>
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
								id="comment"></textarea></td>

					</tr>



				</table>
				<button type="button" class="btn btn-info">상품추가</button>
			</div>

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