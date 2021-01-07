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
      <h2>회원관리</h2>
      <h5>회원 추가, 회원정보수정, 회원 강제 탈퇴가 가능한 페이지 입니다.</h5>
      <table class="table table-bordered">
        <thead>
          <tr>
            <th>아이디</th>
            <th>이름</th>
            <th>Email</th>
            <th>가입한 날짜</th>
          </tr>
        </thead>
        <tbody>
        <c:forEach items="${memberlist}" var="member">
          <tr>
            <td>${member.userid }</td>
            <td><a href="viewPath/${member.userid}">${member.username }</a></td>
            <td>${member.useremail }</td>
            <td>${member.regDate }</td>
          </tr>
         </c:forEach>
        </tbody>
      </table>
     <form action="a_member">
					<%--페이징 --%>
					<ul class="pagination">
					<c:if test="${pageDto.totalCount gt 0 }">
						<%-- [이전] 출력 --%>
						<c:if test="${ pageDto.startPage gt pageDto.pageBlock }">
							<li><a href="a_member?pageNum=${pageDto.startPage - pageDto.pageBlock}&field=${field}&word=${word}">Previous</a></li>
						</c:if>
						<!-- 페이지번호 -->
						<c:forEach var="i" begin="${pageDto.startPage}"
						end="${pageDto.endPage}" step="1">
						<c:choose>
							<c:when test="${pageScope.i eq requestScope.pageNum}">
									<li class="page-item"><a class="page-link" href="/admin/a_member/a_member?pageNum=${i}&field=${field}&word=${word}">${i}</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="/admin/a_member/a_member?pageNum=${i}&field=${field}&word=${word}">${i}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
						<!-- 다음 -->
						<c:if test="${pageDto.endPage lt pageDto.pageCount }">
						<li><a href="a_member?pageNum=${pageDto.startPage + pageDto.pageBlock}&field=${field}&word=${word}">Next</a></li>
						</c:if>
					</c:if>
					</ul>

					

					<select name="field" class="form-control" id="sel1">
						<option value="userid">아이디</option>
						<option value="username">이름</option>
					</select>

					<div class="form-group">
						<input type="text" class="form-control" id="word"
							placeholder="검색어를 입력해 주세요" name="word">
					</div>
					<button type="submit" class="btn btn-default" value="검색">검색</button>
				</form>
    </div>
  </div>
</div>

 <%--footer영역 --%>
<%@include file="../../includes/footer.jsp"%>

</body>
</html>
