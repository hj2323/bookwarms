<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>â¨Bookwarms</title>
  <%--head영역 --%>
<%@include file="../includes/header.jsp"%>
      



<div class="container" style="margin-top:30px">
  <div class="container" style="margin-top:30px">
  <ul class="nav nav-tabs">
    <li class="nav-item">
      <a class="nav-link active" href="#">인문</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#">경제경영</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#">문학</a>
    </li>
    <li class="nav-item">
      <a class="nav-link disabled" href="#">Disabled</a>
    </li>
  </ul>
    <table class="table">
        <thead>
          <tr >
            <th></th>
            <th></th>
            <th></th>
   
          </tr>
        </thead>
        <tbody>
          <tr>
            <td><img src="https://images.unsplash.com/photo-1549122728-f519709caa9c?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1525&q=80" width="300px;"></td>
            <td>책이름<br>저자<br>가격</td>
            
            <td><ul class="list-group">
            <form action="insertCart" method="post"></form>
                <li class="list-group-item">수량<div class="form-group">
                    <input type="text" class="form-control" id="usr" style="width:15%;">
                  </div></li>
                <li class="list-group-item"><button type="submit">카트에 담기</button></li>
                <li class="list-group-item">바로구매</li>
              </ul></td>
          </tr>
          <tr>
            <td><img src="https://images.unsplash.com/photo-1549122728-f519709caa9c?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1525&q=80" width="300px;"></td>
            <td>책이름<br>저자<br>가격</td>
            
            <td><ul class="list-group">
                <li class="list-group-item">수량<div class="form-group">
                    <input type="text" class="form-control" id="usr" style="width:15%;">
                  </div></li>
                <li class="list-group-item">카트에 담기</li>
                <li class="list-group-item">바로구매</li>
              </ul></td>
          </tr>
          <tr>
            <td><img src="https://images.unsplash.com/photo-1549122728-f519709caa9c?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1525&q=80" width="300px;"></td>
            <td>책이름<br>저자<br>가격</td>
            
            <td><ul class="list-group">
                <li class="list-group-item">수량<div class="form-group">
                    <input type="text" class="form-control" id="usr" style="width:15%;">
                  </div></li>
                <li class="list-group-item">카트에 담기</li>
                <li class="list-group-item">바로구매</li>
              </ul></td>
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
