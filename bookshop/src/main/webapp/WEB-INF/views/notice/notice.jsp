<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>✨Bookwarms</title>
  <%--head영역 --%>
<%@include file="../includes/header.jsp"%>



<div class="container" style="margin-top:30px">
    <h3>이용안내</h3>
    <table class="table">
        <thead>
          <tr>
            <th>No.</th>
            <th style="width:60%;">글 제목</th>
            <th>날짜</th>
            <th>조회수</th>
            
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>1</td>
            <td>교환/환불 안내</td>
            <td>2021.01.01</td>
            <td>1</td>
          </tr>
          <tr>
            <td>2</td>
            <td>유의사항</td>
            <td>2021.01.01</td>
            <td>1</td>
          </tr>
          <tr>
            <td>3</td>
            <td>매장안내</td>
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


<%@include file="../includes/footer.jsp"%>

</body>
</html>
