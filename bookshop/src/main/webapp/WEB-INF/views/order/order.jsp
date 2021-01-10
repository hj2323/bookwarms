<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
 <title>✨Bookwarms</title>
  <%--head영역 --%>
<%@include file="../includes/header.jsp"%>



<div class="container" style="margin-top:30px">
      <h1>주문/결제</h1>
    <h4>구매자정보</h4>
    <table class="table">
        <tbody>
          <tr>
            <td width="15%">이름</td>
            <td><div class="form-group">
                <input type="text" class="form-control" id="">
              </div></td>
          </tr>
          <tr>
            <td>이메일</td>
            <td><div class="form-group">
                <input type="email" class="form-control" id="">
              </div></td>
          </tr>
          <tr>
            <td>휴대폰번호</td>
            <td><div class="form-group">
                <input type="text" class="form-control" id="">
              </div></td>
          </tr>
        </tbody>
      </table>
      <h4>받는 사람 정보</h4>
    <table class="table">
        <tbody>
          <tr>
            <td width="15%">이름</td>
            <td><div class="form-group">
                <input type="text" class="form-control" id="">
              </div></td>
          </tr>
          <tr>
            <td>배송주소</td>
            <td><div class="form-group">
                <input type="text" class="form-control" id="">
              </div></td>
          </tr>
          <tr>
            <td>연락처</td>
            <td><div class="form-group">
                <input type="text" class="form-control" id="">
              </div></td>
          </tr>
          <tr>
            <td>배송 요청사항
            </td>
            <td><div class="form-group">
                <input type="text" class="form-control" id="">
              </div></td>
          </tr>
        </tbody>
      </table>
      <h4>배송
    </h4>
      <table class="table">
          <tbody>
            <tr>
              <td width="15%">책제목</td>
              <td>수량 n개</td>
            </tr>
            <tr>
                <td>책제목</td>
                <td>수량 n개</td>
            </tr>
            <tr>
                <td>책제목</td>
                <td>수량 n개</td>
            </tr>
          </tbody>
        </table>
        <h4>결제정보

        </h4>
          <table class="table">
              <tbody>
                <tr>
                  <td width="15%">총 결제금액</td>
                  <td>x,xxx원</td>
                </tr>
                <tr>
                    <td>결제방법 </td>
                    <td><div class="form-check-inline">
                        <label class="form-check-label">
                          <input type="radio" class="form-check-input" name="optradio">계좌이체
                        </label>
                      </div>
                      <div class="form-check-inline">
                        <label class="form-check-label">
                          <input type="radio" class="form-check-input" name="optradio">신용카드
                        </label>
                      </div>
                      <div class="form-check-inline">
                        <label class="form-check-label">
                          <input type="radio" class="form-check-input" name="optradio">체크카드
                        </label>
                      </div>
                      <div class="form-check-inline">
                        <label class="form-check-label">
                          <input type="radio" class="form-check-input" name="optradio">법인카드
                        </label>
                      </div>
                      <div class="form-check-inline">
                        <label class="form-check-label">
                          <input type="radio" class="form-check-input" name="optradio">휴대폰
                        </label>
                      </div>
                      <div class="form-check-inline">
                        <label class="form-check-label">
                          <input type="radio" class="form-check-input" name="optradio">무통장입금(가상계좌)
                        </label>
                      </div>
                     
                    </td>
                    
                </tr>
               
              </tbody>
            </table>
            <button type="button" class="btn btn-success">결제하기</button>
</div>

  <%--footer영역 --%>
<%@include file="../includes/footer.jsp"%>

</body>
</html>
