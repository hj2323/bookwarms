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
      <h2>내 정보 관리</h2>
      <h5>내정보 수정, 회원탈퇴</h5>
     
      <table class="table table-bordered">
        <tbody>
          <tr>
            <td width="100px;">아이디</td>
            <td><span id="userid">${member.userid }</span></td>
            
          </tr>
          <tr>
            <td>이름</td>
            <td>${member.username }</td>
            
          </tr>
          <tr>
            <td>email</td>
            <td>${member.useremail }</td>
           
          </tr>
          <tr>
            <td>주소</td>
            <td>${member.address1 }<br>${member.address2 }</td>
            
          </tr>
          <tr>
            <td>전화번호</td>
            <td>${member.tel }</td>
            
          </tr>
          
        </tbody>
      </table>

<button type="button" class="btn btn-warning" onclick="location.href='/mypage/modify_myaccount'">수정</button>
<button type="button" class="btn btn-danger" id="deleteBtn">탈퇴</button>
    </div>
  </div>
</div>
<script>
$("#deleteBtn").click(function(){
	var confirm_val = confirm("정말 탈퇴하시겠습니까?");
	if(confirm_val){
		
		$.ajax({
			url:"/mypage/myaccount/delete/"+$("#userid").text(),
			type:"post",
			success:function(resp){
				alert(resp)
				if(resp=="success"){
					alert("삭제성공");
						location.href="/qna/qna";
				}//if
			}
		})
	}
})

</script>
<%@include file="../includes/footer.jsp"%>

</body>
</html>
