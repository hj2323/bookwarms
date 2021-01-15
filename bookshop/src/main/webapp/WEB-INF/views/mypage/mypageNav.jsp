<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
    <div class="row">
    <div class="col-sm-4">
      <h3><b>${sessionScope.sessid }</b>의 마이페이지</h3>
   <ul class="nav nav-pills flex-column">
        <li class="nav-item">
          <a class="nav-link" href="/mypage/myaccount">내 정보 관리</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/mypage/myorder">내 주문 조회</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/mypage/myqna">내 문의글 조회</a>
          </li>
        
       
      </ul>
      <hr class="d-sm-none">
    </div>
    <div class="col-sm-8">