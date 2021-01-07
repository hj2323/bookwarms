<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>â¨Bookwarms</title>
  <script   src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
   <%--head영역 --%>
<%@include file="../includes/header.jsp"%>
      


<form  method="post" action="loginCheck">
<div class="container" style="margin-top:30px">
    <div class="form-group">
        <label for="usr">ID:</label>
        <input type="text" class="form-control" id="id" name="userid">
      </div>
      <div class="form-group">
        <label for="pwd">Password:</label>
        <input type="password" class="form-control" id="pwd" name="userpw">
      </div>
      <button type="submit" id="loginBtn" class="btn btn-outline-dark">로그인</button>
</div>

</form>
<script>
	$("#loginBtn").click(function(){
		if($("#id").val()==""){
			alert("아이디를 입력하세요");
			return false;
		}
		if($("#pwd").val()==""){
			alert("비밀번호를 입력하세요");
			return false;
		}
		$.ajax({
			type:"post",
			url:"loginCheck",
			data:{"userid":$("#id").val(),"userpw":$("#pwd").val()}
		})
		.done(function(resp){
			//alert(resp);
			//로그인 성공
			if(resp=="success"){
				alert("Welcome");
				location.href="/";
				//아이디 오류--->회원가입으로
			}else if(resp=="fail"){
				alert("You're not a member. Please sign up.");
				location.href="/member/join";
				//아이디는 맞지만 비번 오류
			}else{
				alert("Please check your password.");
				$("#pwd").val("");
			}
			
			
		})
		.fail(function(e){
			alert("실패:"+e)
		})		
	})
		
	</script>
<%@include file="../includes/footer.jsp"%>
</body>
</html>
