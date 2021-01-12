<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>✨Bookwarms</title>
    <%--head영역 --%>
<%@include file="../../includes/header.jsp"%>
      



<div class="container" style="margin-top:30px">
  <div class="row">
    <%--nav영역 --%>
<%@include file="../nav.jsp"%>
    <div class="col-sm-8">
     <h2>이용안내관리</h2>
     <h5>
				<button type="button" class="btn btn-info"
					onclick="location.href='/admin/a_notice/a_notice_insert'">글쓰기</button>
			</h5>
      <table class="table table-bordered">
        <thead>
          <tr>
            <th>No.</th>
            <th>글제목</th>
            <th>날짜</th>
            <th>조회수</th>
            <th><div class="checkbox">
								전체선택<input type="checkbox" id="cateAll" value="">
							</div>
			</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>John</td>
            <td>Doe</td>
            <td>john@example.com</td>
             <td>2</td>
           	<td>
           		<div class="checkbox">
					<input type="checkbox" value="" class="chBox" name="categorys" data-bookid="${book.book_id }">
					<button type="button" class="btn btn-warning btn-xs"
						onclick="location.href='/admin/a_product/update?book_id=${book.book_id}'">수정</button>
				</div>
			</td>
          </tr>
					<tr>
						<td colspan="4">
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

<%@include file="../../includes/footer.jsp"%>

</body>
</html>
