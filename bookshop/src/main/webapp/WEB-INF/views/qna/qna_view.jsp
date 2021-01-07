<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>â¨Bookwarms</title>
   <%--head영역 --%>
<%@include file="../includes/header.jsp"%>



<div class="container" style="margin-top:30px">
   <h3>QnA</h3>
   
   <table class="table">
       <thead>
         <tr>
            <td>ì ëª©</td>
            <td colspan="3">ë¬¸ìëë¦½ëë¤</td>
           
           
         </tr>
       </thead>
       <tbody>
         <tr>
           <td>ìì±ì</td>
           <td>ì´ãã</td>
           <td>ë±ë¡ì¼</td>
           <td>2021.01.01</td>
         </tr>
         <tr>
           <td colspan="4">ë´ì©</td>
           
         </tr>
         
       </tbody>
     </table>
<hr>
<button type="button" class="btn btn-primary">ëª©ë¡ì¼ë¡</button>
<hr>
<h4>ëê¸ì°ê¸°</h4>
<div class="form-group">
    <label for="comment">Comment:</label>
    <textarea class="form-control" rows="5" id="comment"></textarea>
  </div>
     
</div>

<div class="jumbotron text-center" style="margin-bottom:0">
    <p><a href="#">ð¼ð¼ð¼</a></p>
  </div>

</body>
</html>
