<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>✨Bookwarms</title>
 <%--head영역 --%>
<%@include file="../includes/header.jsp"%>



<div class="container" style="margin-top:30px">
  <h3>Bestseller</h3>
  <p>판매량과 주문수를 기준으로 집계됩니다.</p>
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
                <li class="list-group-item">수량<div class="form-group">
                    <input type="text" class="form-control" id="usr" style="width:10%;">
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
                    <input type="text" class="form-control" id="usr" style="width:10%;">
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
                    <input type="text" class="form-control" id="usr" style="width:10%;">
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

<%@include file="../includes/footer.jsp"%>

</body>
</html>
