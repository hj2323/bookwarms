<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>✨Bookwarms</title>
  <%--head영역 --%>
<%@include file="../includes/header.jsp"%>



<div class="container" style="margin-top:30px">
    <h2>회원가입</h2>
    
    <form action="join" method="post" id="frm">
    <div class="form-group">
        <label for="usr">아이디:</label>
        <input type="text" class="form-control" id="usr" name="userid" placeholder="아이디를 입력해주세요">
        <button type="button" class="btn btn-outline-dark btn-sm" >아이디중복확인</button>
      </div>
      <div class="form-group">
        <label for="pwd">비밀번호</label>
        <input type="password" class="form-control" id="pwd" name="userpw" placeholder="비밀번호를 입력해주세요">
      </div>
      <div class="form-group">
        <label for="pwd">비밀번호확인:</label>
        <input type="password" class="form-control" id="pwd" placeholder="비밀번호를 다시 한번 입력해주세요">
      </div>
      <div class="form-group">
        <label for="usr">이름:</label>
        <input type="text" class="form-control" id="usr" name="username" placeholder="성함을 입력해주세요">
      </div>
      <div class="form-group">
        <label for="usr">email:</label>
        <input type="email" class="form-control" id="usr" name="useremail" placeholder="이메일주소를 입력해주세요">
        
      </div>
      <div class="form-group">
        <label for="usr">주소:</label> <button type="button" class="btn btn-outline-dark btn-sm">우편번호검색</button>
        <input type="number" class="form-control" id="usr" name="address1" placeholder="우편번호">
        <input type="text" class="form-control" id="usr" name="address2" placeholder="상세주소">
      </div>
      <div class="form-group">
        <label for="usr">전화번호:</label>
        <input type="text" class="form-control" id="usr" name="tel" placeholder="'-'를 뺸 형식으로 입력해주세요 예)01012345678">
        <p></p>
      </div>
     <!--  <select name="auth">
  <option value="ADMIN">관리자</option>
   <option value="MANAGER">매니저</option>
   <option value="USER">사용자</option>
  </select> -->
      <button type="submit" class="btn btn-outline-dark btn-lg">가입하기</button>
	</form>
</div>
<%@include file="../includes/footer.jsp"%>

</body>
</html>
