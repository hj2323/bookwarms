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
    <div class="faq">FAQ</div>
   <table class="table">
       <thead>
         <tr>
           <th>No.</th>
           <th style="width:60%;">ê¸ ì ëª©</th>
           <th>ìì±ì</th>
           <th>ë ì§</th>
           
         </tr>
       </thead>
       <tbody>
         <tr>
           <td>1</td>
           <td>ë¬¸ìëë¦½ëë¤</td>
           <td>ì´ãã</td>
           <td>2021.01.01</td>
         </tr>
         <tr>
           <td>2</td>
           <td><span class="badge badge-info">ëµë³</span>ë¬¸ìëë¦½ëë¤</td>
           <td>ë´ë¹ì</td>
           <td>2021.01.01</td>
         </tr>
         <tr>
          <td>1</td>
          <td>ë¬¸ìëë¦½ëë¤</td>
          <td>ì´ãã</td>
          <td>2021.01.01</td>
         </tr>
       </tbody>
     </table>

     <ul class="pagination">
       <li class="page-item"><a class="page-link" href="#">Previous</a></li>
       <li class="page-item"><a class="page-link" href="#">1</a></li>
       <li class="page-item"><a class="page-link" href="#">2</a></li>
       <li class="page-item"><a class="page-link" href="#">3</a></li>
       <li class="page-item"><a class="page-link" href="#">Next</a></li>
     </ul>
</div>

<%@include file="../includes/footer.jsp"%>

</body>
</html>
