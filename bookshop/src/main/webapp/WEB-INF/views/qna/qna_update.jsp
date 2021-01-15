<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>â¨Bookwarms</title>
   <%--head영역 --%>
<%@include file="../includes/header.jsp"%>



<div class="container" style="margin-top:30px">
   <h3>QnA</h3>
    <form action="update" method="post" id="frm">
    <input type="hidden" name="q_no" value="${qna.q_no }">
   <table class="table">
       <thead>
         <tr>
            <td>제목</td>
            <td colspan="3"><input type="text" value="${qna.q_subject}" name="q_subject"></td>
           
           
         </tr>
       </thead>
       <tbody>
         
         <tr>
           <td colspan="4"><div class="form-group">
							<textarea class="form-control" rows="5" id="comment"
								name="q_content">${qna.q_content}</textarea>
						</div></td>
           
         </tr>
         
       </tbody>
     </table>
<button type="submit" class="btn btn-primary">수정하기</button>

	</form>
</div>
<%@include file="../includes/footer.jsp"%>

</body>
</html>
