<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>â¨Bookwarms</title>
<%--head영역 --%>
<%@include file="../../includes/header.jsp"%>



<div class="container" style="margin-top: 30px">
	<div class="row">
		<%--nav영역 --%>
		<%@include file="../nav.jsp"%>
		<div class="col-sm-8">
			<h2>상품카테고리관리</h2>
      <h5>Title description, Dec 7, 2017</h5>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>카테고리</th>
						<th>카테고리분류넘버</th>
						<th><div class="checkbox">
							전체선택<input type="checkbox" id="cateAll" value="">
							</div></th>
					</tr>
				</thead>
				<tbody>
         			 <c:forEach items="${categorylist}" var="category">
					<tr>
						<td>${category.cateName}</td>
						<td>${category.cateCode}</td>
						<td>
							<div class="checkbox">
							<input type="checkbox" value="" name="categorys">
							<button type="button" class="btn btn-warning btn-xs">수정</button>
							</div>
							
						</td>
					</tr>
					</c:forEach>
					<tr>
						<td colspan="2"></td>
						<td>
							<button type="button" class="btn btn-danger">선택삭제</button>
						</td>
					</tr>
					<tr>
						<td><input type="text" class="form-control" id="usr"></td>
						<td><input type="text" class="form-control" id="usr"></td>
						<td>
							<button type="button" class="btn btn-info">추가</button>
						</td>
					</tr>
					
					
				</tbody>
			</table>
			

		</div>
	</div>
</div>
<script>
var $cateAll = $('#cateAll');
$cateAll.change(function () {
  var $this = $(this);
  var checked = $this.prop('checked'); // checked 문자열 참조(true, false)
  // console.log(checked);
  $('input[name="categorys"]').prop('checked', checked);

});

var boxes = $('input[name="categorys"]');
boxes.change(function () {
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
