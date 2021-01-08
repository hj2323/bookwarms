<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>✨Bookwarms</title>
  <script   src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
 <%--head영역 --%>
<%@include file="../../includes/header.jsp"%>


<div class="container" style="margin-top:30px">
  <div class="row">
   <%--nav영역 --%>
<%@include file="../nav.jsp"%>
    <div class="col-sm-8">
      <h2>${member.username }의 회원 정보</h2>
      <h5>회원정보수정</h5>
       <form action="/admin/a_member/update" method="post" id="frm">
      <table class="table table-bordered">
       <tr>
       	<td>아이디</td>
       	<td><input type="text" value="${member.userid }" name="userid" id="userid"></td>
       </tr>
       <tr>
       	<td>이름</td>
       	<td><input type="text" value="${member.username }" name="username"></td>
       </tr>
       <tr>
       	<td>비밀번호</td>
       	<td><input type="text" value="${member.userpw }" name="userpw"></td>
       </tr>
       <tr>
       	<td>주소</td>
       	<td><input type="text" value="${member.address1 }" name="address1">
       	<input type="text" value="${member.address2 }" name="address2"></td>
       </tr>
       <tr>
       	<td>전화번호</td>
       	<td><input type="text" value="${member.tel }" name="tel"></td>
       </tr>
       <tr>
       	<td>이메일</td>
       	<td><input type="text" value="${member.useremail }" name="useremail"></td>
       </tr>
      </table>
     <div class="btn-group">
						<button type="submit" class="btn btn-default">수정하기</button>
						 <input type="button"
			class="btn btn-default" id="btnDelete" value=" 삭제하기">
					</div>
				</form>
    </div>
  </div>
</div>
<script>
$("#btnDelete").click(function(){
	//alert($("#userid").val())
	$.ajax({
		type:"delete",
		url:"/admin/a_member/delete/"+$("#userid").val(),
		success:function(resp){
			if(resp=="success"){
				alert("삭제성공");
					location.href="/admin/a_member/a_member";
			}//if
		}//success
	})//ajax
})
</script>
 <%--footer영역 --%>
<%@include file="../../includes/footer.jsp"%>

</body>
</html>
