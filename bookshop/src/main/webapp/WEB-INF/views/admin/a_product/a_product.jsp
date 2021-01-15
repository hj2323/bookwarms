<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>✨Bookwarms</title>
  <script   src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <style>

.thumbImg {
  width:200px;
}
  </style>
<%--head영역 --%>
<%@include file="../../includes/header.jsp"%>



<div class="container" style="margin-top: 30px">
	<div class="row">
		<%--nav영역 --%>
		<%@include file="../nav.jsp"%>
		<div class="col-sm-8">
			<h2>상품관리</h2>
			<h5>
				<button type="button" class="btn btn-info"
					onclick="location.href='/admin/a_product/a_product_insert'">상품추가</button>
			</h5>
			<table class="table table-bordered">
				<thead>
					<tr>
						
						<th>책이름</th>
						<th>저자</th>
						<th>출간일</th>
						<th>카테고리분류넘버</th>
						<th>카테고리</th>
						<th>책이미지</th>
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
							<td>${book.cateName}</td>
							<td>
								<img src="${book.thumbImg}" class="thumbImg"/>
							</td>
							<td>
								<div class="checkbox">
									<input type="checkbox" value="" class="chBox" name="categorys" data-bookid="${book.book_id }">
									<button type="button" class="btn btn-warning btn-xs"
									onclick="location.href='/admin/a_product/update?book_id=${book.book_id}'">수정</button>
								</div>

							</td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="6">
							<%--페이징 --%>
							<ul class="pagination">
								<c:if test="${pageDto.totalCount gt 0 }">
									<%-- [이전] 출력 --%>
									<c:if test="${ pageDto.startPage gt pageDto.pageBlock }">
										<li><a
											href="a_product?pageNum=${pageDto.startPage - pageDto.pageBlock}">Previous</a></li>
									</c:if>
									<!-- 페이지번호 -->
									<c:forEach var="i" begin="${pageDto.startPage}"
										end="${pageDto.endPage}" step="1">
										<c:choose>
											<c:when test="${pageScope.i eq requestScope.pageNum}">
												<li class="page-item"><a class="page-link"
													href="/admin/a_product/a_product?pageNum=${i}">${i}</a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item"><a class="page-link"
													href="/admin/a_product/a_product?pageNum=${i}">${i}</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<!-- 다음 -->
									<c:if test="${pageDto.endPage lt pageDto.pageCount }">
										<li><a
											href="a_product?pageNum=${pageDto.startPage + pageDto.pageBlock}">Next</a></li>
									</c:if>
								</c:if>
							</ul>
						</td>
						<td>
							<button type="button" class="btn btn-danger" id="selectDelete_btn">선택삭제</button>
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
$("#selectDelete_btn").click(function(){
	var confirm_val = confirm("정말 삭제하시겠습니까?");
	if(confirm_val){
		var checkArr = new Array();

		$("input[class='chBox']:checked ").each(function(){
			checkArr.push($(this).attr("data-bookid"));
		});

		$.ajax({
			url:"/admin/a_product/delete",
			type:"post",
			data:{chbox : checkArr},
			success: function(result){

				if(result==1){
					location.href="/admin/a_product/a_product";
				}else{
					location.href="/admin/a_product/a_product";
				}	
			}
		})
	}
})

	
</script>

<%@include file="../../includes/footer.jsp"%>
</body>
</html>