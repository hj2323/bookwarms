<%@page import="com.mybook.dto.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
 <title>✨Bookwarms</title>
   <%--head영역 --%>
<%@include file="../includes/header.jsp"%>



<div class="container" style="margin-top:30px">
   <h1>장바구니</h1>
    <table class="table">
        <thead>
          <tr>
             <th style="width:15%;"><div class="form-check-inline">
                <label class="form-check-label">
                  <input type="checkbox" class="form-check-input" id="cateAll">전체선택
                </label>
              </div></th>
             <th>상품정보</th>
             <th>상품금액</th>
              <th>수량</th>
               <th>합계</th>
             <th>배송비</th>
            
            
          </tr>
        </thead>
        <tbody>
        <%
			int sum = 0;
        	ArrayList<Cart> cartList = (ArrayList<Cart>)
        	request.getAttribute("cartlist");
        	if(cartList == null){
        		cartList = new ArrayList<Cart>();
        	}
        	for(int i = 0; i<cartList.size();i++){
        		Cart cart = cartList.get(i);
        		int total = cart.getBook_price() * cart.getAmount();
        		sum = sum + total;
        	}
        
        %>
        <c:forEach items="${cartlist }" var="cart">
          <tr>
            <td>
            <input type="hidden" value="${cart.cart_id}" id="cart_id"/>
            <input type="checkbox" class="chBox" name="categorys" data-cartid="${cart.cart_id }"></td>
            <td>
	            <img src="https://images.unsplash.com/photo-1549122728-f519709caa9c?
	            ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2
	            .1&auto=format&fit=crop&w=1525&q=80" width="150px;">
	            <p>${cart.book_title}</p>
	            <p>${cart.book_author} 저</p>
	        	
        	</td>
            <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${cart.book_price}" />원</td>
            <td><input type="number" id="amount" name="amount" value="${cart.amount }" min="1" max="999999">
	        	<button type="button" class="btn  btn btn-secondary btn-sm" id="update_btn">수정</button></td>
            <td><b><fmt:formatNumber type="number" maxFractionDigits="3" value="${cart.book_price* cart.amount}" />원</b></td>
            <td colspan="2">무료</td>
          </tr>
          </c:forEach>
          <tr>
            <td><input type="checkbox" class="form-check-input" value=""></td>
            <td><img src="https://images.unsplash.com/photo-1549122728-f519709caa9c?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1525&q=80" width="300px;"><p>달러구트 꿈 백화점</p>
            <p>이미예 저</p>
        <p> <div class="form-group">
            <label for="sel1">수량:</label>
            <select class="form-control" id="sel1">
              <option>1</option>
              <option>2</option>
              <option>3</option>
              <option>4</option>
              <option>5</option>
              <option>6</option>
              <option>7</option>
              <option>8</option>
              <option>9</option>
              <option>10</option>
            </select>
          </div></p></td>
            <td>	12,420원</td>
            <td colspan="2">무료</td>
          </tr>
          <tr>
            <td colspan="4"><b>상품가격 <fmt:formatNumber type="number" maxFractionDigits="3" value="<%=sum %>" />원 + 배송비 무료 = 주문금액 <fmt:formatNumber type="number" maxFractionDigits="3" value="<%=sum %>" />원</b></td>
            
          </tr>
          
        </tbody>
      </table>
      <hr>
      <button type="button" class="btn btn-danger" id="selectDelete_btn">선택삭제</button>
      <div class="total">총 상품가격 <b><fmt:formatNumber type="number" maxFractionDigits="3" value="<%=sum %>" /></b>원 + 총 배송비 0원 = 총 주문금액 <b><fmt:formatNumber type="number" maxFractionDigits="3" value="<%=sum %>" /></b>원</div>

      <div class="buttons">
        <button type="button" onclick="location.href='/booklist/booklist'"  class="btn btn-primary">계속쇼핑하기</button>
        <button type="button" class="btn btn-primary" id="orderBtn">구매하기</button>

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
			checkArr.push($(this).attr("data-cartid"));
		});

		$.ajax({
			url:"/cart/delete",
			type:"post",
			data:{chbox : checkArr},
			success: function(result){

				if(result==1){
				location.href="/cart/cart";
				}else{
					alert("삭제 실패")
				}	
			}
		})
	}
})

$("#orderBtn").click(function(){
	alert("ss")
	var checkArr = new Array();

		$("input[class='chBox']:checked ").each(function(){
			checkArr.push($(this).attr("data-cartid"));
		});

		$.ajax({
			url:"/order/order",
			type:"post",
			data:{chbox : checkArr}
			/*success: function(result){

				if(result==1){
				location.href="/order/order";
				}else{
					alert("실패")
				}	
			}*/
		})
	
})

/*
$("#update_btn").click(function(){
	var data = {
		"amount":$("#amount").val()
		"cart_id":$("#cart_id").val()
	}
	$.ajax({
		url:"/cart/update",
		type:"post"
		contentType:'application/json;charset=utf-8',
		data:JSON.stringify(data)	
		//amount가 int라서???
	})
	.done(function(resp){
		(resp+"수량변경")
			
			
	})
	.fail(function(error){
		alert("수량변경 실패");
	})
})*/
	
</script>
<%@include file="../includes/footer.jsp"%>

</body>
</html>
