<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>â¨Bookwarms</title>
  <%--head영역 --%>
<%@include file="../includes/header.jsp"%>



<div class="container" style="margin-top:30px">
    <h3>ì´ì©ìë´</h3>
    <table class="table">
        <thead>
          <tr>
            <th>No.</th>
            <th style="width:60%;">ê¸ ì ëª©</th>
            <th>ë ì§</th>
            <th>ì¡°íì</th>
            
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>1</td>
            <td>êµí/íë¶ ìë´</td>
            <td>2021.01.01</td>
            <td>1</td>
          </tr>
          <tr>
            <td>2</td>
            <td>ì ìì¬í­</td>
            <td>2021.01.01</td>
            <td>1</td>
          </tr>
          <tr>
            <td>3</td>
            <td>ë§¤ì¥ìë´</td>
            <td>2021.01.01</td>
            <td>1</td>
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

<div class="jumbotron text-center" style="margin-bottom:0">
    <p><a href="#">ð¼ð¼ð¼</a></p>
  </div>

</body>
</html>
