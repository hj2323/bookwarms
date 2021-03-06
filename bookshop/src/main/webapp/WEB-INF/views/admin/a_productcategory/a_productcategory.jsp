<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			<h2>상품카테고리관리</h2>
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
							<input type="checkbox" value="" class="chBox" name="categorys" data-cateCode="${category.cateCode }">
							
							</div>
							
						</td>
					</tr>
					</c:forEach>
					<tr>
						<td colspan="2"></td>
						<td>
							<button type="button" class="btn btn-danger" id="selectDelete_btn">선택삭제</button>
						</td>
					</tr>
					<tr>
						<td><input type="text" class="form-control" id="cateName"></td>
						<td><input type="text" class="form-control" id="cateCode"></td>
						<td>
							<button type="button" class="btn btn-info" id="insertBtn">추가</button>
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

//카테고리추가
	$("#insertBtn").on("click",function(){
		var data={
		"cateName":$("#cateName").val(),
		"cateCode":$("#cateCode").val()
				
		}
		$.ajax({
			type:"post",
			url:"/admin/a_productcategory/insert",
			contentType:'application/json;charset=utf-8',
			data:JSON.stringify(data)
		})//ajax
		.done(function(){
			alert("Insert 성공")
			
			location.reload();
			})
		.fail(function(){
			alert("Insert 실패")
			})

	});
	$("#selectDelete_btn").click(function(){
		var confirm_val = confirm("정말 삭제하시겠습니까?");
		if(confirm_val){
			var checkArr = new Array();

			$("input[class='chBox']:checked ").each(function(){
				checkArr.push($(this).attr("data-cateCode"));
			});

			$.ajax({
				url:"/admin/a_productcategory/delete",
				type:"post",
				data:{chbox : checkArr},
				success: function(result){

					if(result==1){
					location.href="/admin/a_productcategory/a_productcategory";
					}else{
						
						location.href="/admin/a_productcategory/a_productcategory";
					}	
				}
			})
		}
	})
</script>

<%@include file="../../includes/footer.jsp"%>
</body>
</html>
