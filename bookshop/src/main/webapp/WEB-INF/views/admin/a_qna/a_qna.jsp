<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>â¨Bookwarms</title>
 <%--head영역 --%>
<%@include file="../../includes/header.jsp"%>
      



<div class="container" style="margin-top:30px">
  <div class="row">
     <%--nav영역 --%>
<%@include file="../nav.jsp"%>
    <div class="col-sm-8">
      <h2>Q&A 게시판 관리</h2>
      <h5>Title description, Dec 7, 2017</h5>
      <table class="table table-bordered">
        <thead>
         <tr>
						<th>No.</th>
						<th>문의글제목</th>
						<th>작성자</th>
						<th>날짜</th>
						<th><div class="checkbox">
							전체선택<input type="checkbox" id="cateAll" value="">
							</div></th>
					</tr>
        </thead>
        <tbody>
           <c:forEach items="${qnalist}" var="qna">
					<tr>
						<td>${qna.q_no }</td>
						<td>${qna.q_subject}</td>
						<td>${qna.q_writer}</td>
						<td><fmt:formatDate value="${qna.q_regdate}" pattern="yyyy.MM.dd"/></td>
						<td>
							<div class="checkbox">
							<input type="checkbox" value="" name="categorys">
							<button type="button" class="btn btn-warning btn-xs">수정</button>
							</div>
							
						</td>
					</tr>
					</c:forEach>
					<tr>
						<td colspan="4"></td>
						<td>
							<button type="button" class="btn btn-danger">선택삭제</button>
						</td>
					</tr>
        </tbody>
      </table>
      <%--페이징 --%>
					<ul class="pagination">
					<c:if test="${pageDto.totalCount gt 0 }">
						<%-- [이전] 출력 --%>
						<c:if test="${ pageDto.startPage gt pageDto.pageBlock }">
							<li><a href="a_qna?pageNum=${pageDto.startPage - pageDto.pageBlock}">Previous</a></li>
						</c:if>
						<!-- 페이지번호 -->
						<c:forEach var="i" begin="${pageDto.startPage}"
						end="${pageDto.endPage}" step="1">
						<c:choose>
							<c:when test="${pageScope.i eq requestScope.pageNum}">
									<li class="page-item"><a class="page-link" href="/admin/a_qna/a_qna?pageNum=${i}">${i}</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="/admin/a_qna/a_qna?pageNum=${i}">${i}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
						<!-- 다음 -->
						<c:if test="${pageDto.endPage lt pageDto.pageCount }">
						<li><a href="a_qna?pageNum=${pageDto.startPage + pageDto.pageBlock}">Next</a></li>
						</c:if>
					</c:if>
					</ul>
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
