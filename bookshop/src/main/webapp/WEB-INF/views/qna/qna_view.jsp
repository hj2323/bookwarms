<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>✨Bookwarms</title>
  <script   src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<%--head영역 --%>
<%@include file="../includes/header.jsp"%>



<div class="container" style="margin-top: 30px">
	<h3>QnA</h3>

	<table class="table">
		<thead>
			<tr>
				<td>제목</td>
				<input type="hidden" value="${qna.q_no}" id="qno"/>
				<td colspan="3">${qna.q_subject}</td>


			</tr>
		</thead>
		<tbody>
			<tr>
				<td>작성자</td>
				<td>${qna.q_writer}</td>
				<td>등록일</td>
				<td><fmt:formatDate value="${qna.q_regdate}"
						pattern="yyyy.MM.dd" /></td>
			</tr>
			<tr>
				<td colspan="4">${qna.q_content}</td>

			</tr>

		</tbody>
	</table>
	<hr>
	<button type="button" class="btn btn-primary" onclick="location.href='/qna/qna'">목록으로</button>
	
	<c:if test="${(sessionScope.sessid == qna.q_writer) or (sessionScope.sessid == 'admin')}">
	<button type="button"
		onclick="location.href='/qna/qna_update?q_no=${qna.q_no}'"
		class="btn btn-primary">수정하기</button>
	
	
	<button type="button" class="btn btn-primary" id="btnDelete">삭제하기</button>
	</c:if>
	<hr>
	<c:choose>
			<c:when test="${sessionScope.sessid == 'admin'}">
	<h4>댓글쓰기</h4>
	<div class="form-group">
		<label for="comment">Comment:</label>
		<textarea class="form-control" rows="5" id="msg" name="qreply_content"></textarea>
		
				<!-- 관리자 로그인 했을때 -->
				<input type="button" class="btn btn-primary" value="댓글쓰기"
					id="commentBtn">
			</c:when>
			<c:otherwise>
			<!-- 관리자가 아닐때 -->
				
				
			</c:otherwise>
		</c:choose>
	</div>
	<hr>
	<div id="area"></div>
</div>
<script>
	var init=function(){
		$.ajax({
			type:"get",
			url:"/reply/commentList",
			data:{"q_no":$("#qno").val()}

		})
		.done(function(resp){
			alert(resp);
			var htmlStr="";
			//댓글개수 구현하고 싶을때 해주기
			//$("#replycount").html("("+resp.count+")");
			$.each(resp, function(key,val){
				//htmlStr += "No. " +(val.cnum)+"<br>"
				//htmlStr += "작성자:" +val.userid+"<br>"
				//htmlStr += "내용:" + val.content+"<br>"
				//htmlStr += "작성일:" +val.regdate+"<br>"
				htmlStr += "<div class='container2'>"
				htmlStr += "<div class='panel-group'>"
				htmlStr += "<div class='panel panel-default'>"
				htmlStr += "<div class='panel-body'>"
				htmlStr += "<b>작성자</b> 관리자	&nbsp;&nbsp;<b>내용</b> " + val.qreply_content+"	&nbsp;&nbsp;<b>작성일</b>" +val.qreply_regdate
				//data를 사용하면 내가 마치 태그를 하나 만들는 것처럼 사용 가능
				htmlStr += "<a data-qreply_no="+val.qreply_no+">del&nbsp;x</a><hr>";
				htmlStr += "</div>"
				htmlStr += "</div>"
					
				//아래코드 버튼 눌러도 동작안함
				//htmlStr += "<input type='button' class='btn btn-default' onclick='location.href='javascript:fdelete("+val.cnum+")'' value='x'>"	
				htmlStr += "</div>"
				htmlStr += "</div>"	

				
			})
			
			
			//alert(htmlStr);
			$("#area").html(htmlStr);
			$("#area").on("click", "a", function(){
				var qreply_no = $(this).data("qreply_no");
				//alert(cnum);
				fdel(qreply_no)
			})
			
		})
		.fail(function(e){
			alert("error:"+e);
		})			
	}


	//댓글삭제
	function fdel(qreply_no){
		//alert("asdfas")
		$.ajax({
			type:"DELETE",
			url:"/reply/commentDelete/"+qreply_no//레스트풀방식으로 넘김
	
		})
		.done(function(resp){
			//alert(resp+"글 삭제")
			init();
			
		})
		.fail(function(error){
			alert("글 삭제 실패");
		})
		
	}//fdelete

	
	//댓글쓰기
	$("#commentBtn").on("click",function(){
		var data={
		"q_no":$("#qno").val(),
		"qreply_content":$("#msg").val()
				
		}
		$.ajax({
			type:"post",
			url:"/reply/commentInsert",
			contentType:'application/json;charset=utf-8',
			data:JSON.stringify(data)
		})//ajax
		.done(function(){
			alert("comment Insert 성공")
			$("#msg").val("");
			init();//쓰고 바로 화면에 띄워줌
			})
		.fail(function(){
			alert("comment Insert 실패")
			})

	});//commentBtn

	
	
	//jq삭제버튼
$("#btnDelete").click(function(){
	//alert($("#qno").val())
	$.ajax({
		type:"delete",
		url:"/qna/delete/"+$("#qno").val(),
		success:function(resp){
			if(resp=="success"){
				alert("삭제성공");
					location.href="/qna/qna";
			}//if
		}//success
	})//ajax
})//btnDelete

init();

</script>

<%@include file="../includes/footer.jsp"%>
</body>
</html>
