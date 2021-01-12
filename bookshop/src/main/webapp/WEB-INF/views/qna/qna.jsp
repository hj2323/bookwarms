<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>✨Bookwarms</title>
 <%--head영역 --%>
<%@include file="../includes/header.jsp"%>


<div class="container" style="margin-top:30px">
   <h3>QnA</h3>
    <div class="faq">FAQ</div>
   <table class="table">
       <thead>
         <tr>
           <th>No.</th>
           <th style="width:60%;">글 제목</th>
           <th>작성자</th>
           <th>날짜</th>
           
         </tr>
       </thead>
       <tbody>
      
        <c:forEach items="${qnalist}" var="qna">
         <tr>
           <td>${qna.q_no }</td>
           <td><a href="viewPath?q_no=${qna.q_no}">${qna.q_subject }<span class="badge">${qna.replyCnt }</span></a></td>
           <td>${qna.q_writer }</td>
           <td><fmt:formatDate value="${qna.q_regdate}" pattern="yyyy.MM.dd"/>
          </td>
         </tr>
         </c:forEach>
       </tbody>
     </table>

    <%--페이징 --%>
					<ul class="pagination">
					<c:if test="${pageDto.totalCount gt 0 }">
						<%-- [이전] 출력 --%>
						<c:if test="${ pageDto.startPage gt pageDto.pageBlock }">
							<li><a href="qna?pageNum=${pageDto.startPage - pageDto.pageBlock}">Previous</a></li>
						</c:if>
						<!-- 페이지번호 -->
						<c:forEach var="i" begin="${pageDto.startPage}"
						end="${pageDto.endPage}" step="1">
						<c:choose>
							<c:when test="${pageScope.i eq requestScope.pageNum}">
									<li class="page-item"><a class="page-link" href="/qna/qna?pageNum=${i}">${i}</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link" href="/qna/qna?pageNum=${i}">${i}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
						<!-- 다음 -->
						<c:if test="${pageDto.endPage lt pageDto.pageCount }">
						<li><a href="qna?pageNum=${pageDto.startPage + pageDto.pageBlock}">Next</a></li>
						</c:if>
					</c:if>
					</ul>
     <c:choose>
			<c:when test="${empty sessionScope.sessid}">
				<!-- 세션이 없을때 -->
				
			</c:when>
			<c:otherwise>
				<!-- 세션이 있을때 -->
				 <button type="button" onclick="location.href='/qna/qna_insert'" class="btn btn-primary">글쓰기</button>
			</c:otherwise>
		</c:choose>
    
</div>


<%@include file="../includes/footer.jsp"%>

</body>
</html>
