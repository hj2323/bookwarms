<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
 <title>✨Bookwarms</title>
 
  <%--head영역 --%>
<%@include file="../includes/header.jsp"%>



<div class="container" style="margin-top:30px">
<form id="MyForm" action="insertFromCart" method="post">
<input type="hidden" name="userid" value="${member.userid}">

      <h1>주문/결제</h1>
    <h4>주문자 정보</h4>
    <table class="table">
        <tbody>
          <tr>
            <td width="15%">이름</td>
            <td><div class="form-group">
                <input type="text" class="form-control" id="txtName" value="${member.username}">
              </div></td>
          </tr>
          <tr>
            <td>이메일</td>
            <td><div class="form-group">
                <input type="email" class="form-control" id="" value="${member.useremail}">
              </div></td>
          </tr>
          <tr>
            <td>휴대폰번호</td>
            <td><div class="form-group">
                <input type="text" class="form-control" id="txtTel" value="${member.tel}">
              </div></td>
          </tr>
           <tr>
            <td>주소</td>
            <td><div class="form-group">
                <input type="text" class="form-control" id="txtAddress1" value="${member.address1}">
                 <input type="text" class="form-control" id="txtAddress2" value="${member.address2}">
              </div></td>
          </tr>
        </tbody>
      </table>
      <hr />

<input type="checkbox" id="copy" onclick="ShipToBill(this.form);"/>주문자 정보와 배송지 정보가 같음

<hr />
      
      <h4>배송지 정보</h4>
    <table class="table">
        <tbody>
          <tr>
            <td width="15%">이름</td>
            <td><div class="form-group">
                <input type="text" class="form-control" name="order_rec" id="txtDeliveryName">
                
              </div></td>
          </tr>
          <tr>
            <td>배송주소</td>
            <td><div class="form-group">
                우편번호<input type="text" class="form-control" name="address1" id="txtDeliveryAddress1">
                 <input type="text" class="form-control" name="address2" id="txtDeliveryAddress2">
              </div></td>
          </tr>
          <tr>
            <td>연락처</td>
            <td><div class="form-group">
                <input type="text" class="form-control" name="order_phone" id="txtDeliveryTel">
              </div></td>
          </tr>
          <tr>
            <td>배송 요청사항
            </td>
            <td><div class="form-group">
                <input type="text" class="form-control" name="order_ask" id="">
              </div></td>
          </tr>
        </tbody>
      </table>
      <h4>배송 </h4>
      <table class="table">
          <tbody>
          <c:set var="sum" value="0" />
          <c:forEach items="${cartlist}" var="cart">
            <tr>
            <input type="hidden" name="book_id" value="${cart.book_id}">
              <td width="15%"><img src="${cart.thumbImg }" width="100px"></td>
              <td><b>${cart.book_title }</b></td>
              <td>수량<b> ${cart.amount }</b>개</td>
              <input type="hidden" value="${cart.amount }" name="amount">
              <td>총<b> <fmt:formatNumber type="number" maxFractionDigits="3" value="${cart.book_price *cart.amount }" />
							</b>원</td>
							<input type="hidden" value="${cart.book_price *cart.amount }" name="order_price">
            </tr> 
            <c:set var="sum" value="${sum + (cart.book_price *cart.amount)}" />
            </c:forEach>           
          </tbody>
        </table>
        
        
        <h4>결제정보

        </h4>
          <table class="table">
              <tbody>
                <tr>
                  <td width="15%">총 결제금액</td>
                  <td><fmt:formatNumber pattern="###,###,###" value="${sum}" />원</td>
                </tr>
                <tr>
                    <td>결제방법 </td>
                    <td><div class="form-check-inline">
                        <label class="form-check-label">
                          <input type="radio" class="form-check-input" name="order_payment">계좌이체
                        </label>
                      </div>
                      <div class="form-check-inline">
                        <label class="form-check-label">
                          <input type="radio" class="form-check-input" name="order_payment">신용카드
                        </label>
                      </div>
                      <div class="form-check-inline">
                        <label class="form-check-label">
                          <input type="radio" class="form-check-input" name="order_payment">체크카드
                        </label>
                      </div>
                      <div class="form-check-inline">
                        <label class="form-check-label">
                          <input type="radio" class="form-check-input" name="order_payment">법인카드
                        </label>
                      </div>
                      <div class="form-check-inline">
                        <label class="form-check-label">
                          <input type="radio" class="form-check-input" name="order_payment">휴대폰
                        </label>
                      </div>
                      <div class="form-check-inline">
                        <label class="form-check-label">
                          <input type="radio" class="form-check-input" name="order_payment">무통장입금(가상계좌)
                        </label>
                      </div>
                     
                    </td>
                    
                </tr>
               
              </tbody>
            </table>
            <button type="submit" class="btn btn-success">결제하기</button>
            </form>
</div>
<script>
var name = "";
var tel = "";
var address1 = "";
var address2 = "";



function InitValue(frm){

	name = frm.txtName.value;
	//email = frm.txtName.value;
	tel = frm.txtTel.value;
	address1 = frm.txtAddress1.value;
	address2 = frm.txtAddress2.value;

}

function ShipToBill(frm){		

	if(frm.copy.checked){

		InitValue(frm);			//현재 텍스트박스와 체크박스의 상태유지

		document.getElementById("txtDeliveryName").value = document.getElementById("txtName").value;
		document.getElementById("txtDeliveryTel").value = document.getElementById("txtTel").value;
		document.getElementById("txtDeliveryAddress1").value = document.getElementById("txtAddress1").value;
		document.getElementById("txtDeliveryAddress2").value = document.getElementById("txtAddress2").value;
		//frm.chkDeliveryEmail.checked = email;

	}else{						//체크박스를 해제한다면

		frm.txtDeliveryName.value=name;
		frm.txtDeliveryTel.value=tel;
		frm.txtDeliveryAddress1.value=address1;
		frm.txtDeliveryAddress2.value=address2;

		//frm.chkDeliveryEmail.checked = email;		//폼객체 활용

	}

} 
</script>
  <%--footer영역 --%>
<%@include file="../includes/footer.jsp"%>

</body>
</html>
