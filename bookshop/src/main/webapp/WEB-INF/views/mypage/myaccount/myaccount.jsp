<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>â¨Bookwarms</title>
  <%--head영역 --%>
<%@include file="../../includes/header.jsp"%>



<div class="container" style="margin-top:30px">
  <div class="row">
    <div class="col-sm-4">
      <h3>ê´ë¦¬ìíì´ì§</h3>
      <ul class="nav nav-pills flex-column">
        <li class="nav-item">
          <a class="nav-link" href="/mypage/myaccount/myaccount.jsp">ë´ ì ë³´ ê´ë¦¬</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/mypage/myorder/myorder.jsp">ë´ ì£¼ë¬¸ ì¡°í</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/mypage/myqna/myqna.jsp">ë´ ë¬¸ìê¸ ì¡°í</a>
          </li>
        
       
      </ul>
      <hr class="d-sm-none">
    </div>
    <div class="col-sm-8">
      <h2>ë´ ì ë³´ ê´ë¦¬</h2>
      <h5>Title description, Dec 7, 2017</h5>
      <table class="table table-bordered">
        <thead>
          <tr>
            <th>Firstname</th>
            <th>Lastname</th>
            <th>Email</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>John</td>
            <td>Doe</td>
            <td>john@example.com</td>
          </tr>
          <tr>
            <td>Mary</td>
            <td>Moe</td>
            <td>mary@example.com</td>
          </tr>
          <tr>
            <td>July</td>
            <td>Dooley</td>
            <td>july@example.com</td>
          </tr>
        </tbody>
      </table>
     
    </div>
  </div>
</div>

<div class="jumbotron text-center" style="margin-bottom:0">
  <p><a href="#">ð¼ð¼ð¼</a></p>
</div>

</body>
</html>
