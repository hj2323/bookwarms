<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
   <title>✨Bookwarms</title>
  <%--head영역 --%>
<%@include file="../includes/header.jsp"%>



<div class="container" style="margin-top:30px">
 <%--mypageNav영역 --%>
<%@include file="mypageNav.jsp"%>
      <h2>내 정보 수정</h2>
     
       <form action="myaccount/update" method="post" id="frm">
	 <div class="form-group">
        <label for="usr">아이디:</label>
        <input type="text" class="form-control" id="usr" name="userid" value="${member.userid }" readonly>
        
      </div>
      <div class="form-group">
        <label for="pwd">비밀번호:</label>
        <input type="password" class="form-control" id="pwd" name="userpw" value="${member.userid }">
      </div>
      <div class="form-group">
        <label for="pwd">비밀번호확인:</label>
        <input type="password" class="form-control" id="pwd">
      </div>
      <div class="form-group">
        <label for="usr">이름:</label>
        <input type="text" class="form-control" id="usr" name="username"  value="${member.username }">
      </div>
      <div class="form-group">
        <label for="usr">email:</label>
        <input type="text" class="form-control" id="usr" name="useremail"  value="${member.useremail }">
        
      </div>
      <div class="form-group">
        <label for="usr">주소:</label> <button type="button" class="btn btn-outline-dark btn-sm">우편번호검색</button>
        <input type="text" class="form-control" id="usr" disabled name="address1"  value="${member.address1 }">
        <input type="text" class="form-control" id="usr" name="address2"  value="${member.address2 }">
      </div>
      <div class="form-group">
        <label for="usr">전화번호:</label>
        <input type="text" class="form-control" id="usr" name="tel"  value="${member.tel }">
        <p>"-"를 뺸 형식으로 입력해주세요 예)01012345678</p>
      </div>
<button type="submit" class="btn btn-warning">수정</button>
    </div>
  </div>
</div>

<%@include file="../includes/footer.jsp"%>

</body>
</html>
