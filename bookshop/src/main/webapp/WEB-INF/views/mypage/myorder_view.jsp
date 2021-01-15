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
      <h2> 주문 상세보기</h2>
      <h5>주문 번호 | ${order.order_id}</h5>
     
      <table class="table table-bordered">
        <tbody>
        	
          <tr>
            <td width="130px;"><b>책제목</b></td>
            <td>${order.book_title}</td>
            
          </tr>
           <tr>
            <td><b>책이미지</b></td>
            <td><img src="${order.thumbImg}" width="100px"></td>
            
          </tr>
           <tr>
            <td><b>수령인</b></td>
            <td>${order.order_rec}</td>
            
          </tr>
           <tr>
            <td><b>수령인 연락처</b></td>
            <td>${order.order_phone}</td>
            
          </tr>
           <tr>
            <td><b>수량</b></td>
            <td>${order.amount}</td>
            
          </tr>
          <tr>
            <td><b>수령인</b></td>
            <td>${order.order_rec}</td>
            
          </tr>
          
          <tr>
            <td><b>주소</b></td>
            <td>(${order.address1}) ${order.address2}</td>
            
          </tr>
            <tr>
            <td><b>결제방식</b></td>
            <td>${order.order_payment}</td>
            
          </tr>
           <tr>
            <td><b>배송시 유의사항</b></td>
            <td>${order.order_ask}</td>
            
          </tr>
       
        </tbody>
      </table>
        
    
    </div>
  </div>
</div>

<%@include file="../includes/footer.jsp"%>

</body>
</html>
