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
 <%--mypageNav영역 --%>
<%@include file="mypageNav.jsp"%>
      <h2>내 주문 관리</h2>
     <c:forEach items="${orderList}" var="orderList">
      <table class="table table-bordered">
        <tbody>
        	
          <tr>
            <td width="130px;">📍<b>주문번호</b></td>
            <td><a href="/mypage/myorder_view?order_id=${orderList.order_id}">${orderList.order_id}</a></td>
            
          </tr>
           <tr>
            <td><b>주문날짜</b></td>
            <td><fmt:formatDate value="${orderList.order_regdate}" type="both" dateStyle="medium" timeStyle="medium"/></td>
            
          </tr>
          <tr>
            <td><b>수령인</b></td>
            <td>${orderList.order_rec}</td>
            
          </tr>
          
          <tr>
            <td><b>주소</b></td>
            <td>(${orderList.address1}) ${orderList.address2}</td>
            
          </tr>
          <tr>
            <td><b>가격</b></td>
            <td><fmt:formatNumber pattern="###,###,###"
								value="${orderList.order_price}" />
							원</td>
            
          </tr>
       
        </tbody>
      </table>
         	</c:forEach>
    
    </div>
  </div>
</div>

<%@include file="../includes/footer.jsp"%>

</body>
</html>
