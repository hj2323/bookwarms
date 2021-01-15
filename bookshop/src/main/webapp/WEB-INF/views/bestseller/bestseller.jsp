<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>✨Bookwarms</title>
 <%--head영역 --%>
<%@include file="../includes/header.jsp"%>



<div class="container" style="margin-top:30px">
  <h3>Bestseller</h3>
  <p>판매량과 주문수를 기준으로 집계됩니다.</p>
    <table class="table">
        <thead>
          <tr >
            <th></th>
            <th></th>
            <th></th>
   
          </tr>
        </thead>
        <tbody>
         <c:forEach items="${Booklist}" var="book">
			<form action="/order/order" method="get">
			<input type="hidden" value="${book.book_id}" name="book_id">
				<tr>
					<td><img src="${book.book_Img }"
						width="150px;"></td>
					<td><div style="font-size: 25px;">${book.book_title }</div>
						<div>${book.book_author } 저</div>
						<hr>


						<div style="color: #777; font-size: 16px;">
							판매지수 🏷${book.orderCnt }
						</div>
					</td>

					
				</tr>
				</form>
			</c:forEach>
        </tbody>
      </table>
      
</div>

<%@include file="../includes/footer.jsp"%>

</body>
</html>
