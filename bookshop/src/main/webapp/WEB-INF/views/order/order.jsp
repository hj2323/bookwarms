<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>â¨Bookwarms</title>
  <%--head영역 --%>
<%@include file="../includes/header.jsp"%>



<div class="container" style="margin-top:30px">
    <h1>ì£¼ë¬¸/ê²°ì </h1>
    <h4>êµ¬ë§¤ìì ë³´</h4>
    <table class="table">
        <tbody>
          <tr>
            <td width="15%">ì´ë¦</td>
            <td><div class="form-group">
                <input type="text" class="form-control" id="">
              </div></td>
          </tr>
          <tr>
            <td>ì´ë©ì¼</td>
            <td><div class="form-group">
                <input type="email" class="form-control" id="">
              </div></td>
          </tr>
          <tr>
            <td>í´ëí°ë²í¸</td>
            <td><div class="form-group">
                <input type="text" class="form-control" id="">
              </div></td>
          </tr>
        </tbody>
      </table>
      <h4>ë°ë ì¬ë ì ë³´</h4>
    <table class="table">
        <tbody>
          <tr>
            <td width="15%">ì´ë¦</td>
            <td><div class="form-group">
                <input type="text" class="form-control" id="">
              </div></td>
          </tr>
          <tr>
            <td>ë°°ì¡ì£¼ì</td>
            <td><div class="form-group">
                <input type="text" class="form-control" id="">
              </div></td>
          </tr>
          <tr>
            <td>ì°ë½ì²</td>
            <td><div class="form-group">
                <input type="text" class="form-control" id="">
              </div></td>
          </tr>
          <tr>
            <td>ë°°ì¡ ìì²­ì¬í­
            </td>
            <td><div class="form-group">
                <input type="text" class="form-control" id="">
              </div></td>
          </tr>
        </tbody>
      </table>
      <h4>ë°°ì¡
    </h4>
      <table class="table">
          <tbody>
            <tr>
              <td width="15%">ì±ì ëª©</td>
              <td>ìë nê°</td>
            </tr>
            <tr>
                <td>ì±ì ëª©</td>
                <td>ìë nê°</td>
            </tr>
            <tr>
                <td>ì±ì ëª©</td>
                <td>ìë nê°</td>
            </tr>
          </tbody>
        </table>
        <h4>ê²°ì ì ë³´

        </h4>
          <table class="table">
              <tbody>
                <tr>
                  <td width="15%">ì´ ê²°ì ê¸ì¡</td>
                  <td>x,xxxì</td>
                </tr>
                <tr>
                    <td>ê²°ì ë°©ë² </td>
                    <td><div class="form-check-inline">
                        <label class="form-check-label">
                          <input type="radio" class="form-check-input" name="optradio">ê³ì¢ì´ì²´
                        </label>
                      </div>
                      <div class="form-check-inline">
                        <label class="form-check-label">
                          <input type="radio" class="form-check-input" name="optradio">ì ì©ì¹´ë
                        </label>
                      </div>
                      <div class="form-check-inline">
                        <label class="form-check-label">
                          <input type="radio" class="form-check-input" name="optradio">ì²´í¬ì¹´ë
                        </label>
                      </div>
                      <div class="form-check-inline">
                        <label class="form-check-label">
                          <input type="radio" class="form-check-input" name="optradio">ë²ì¸ì¹´ë
                        </label>
                      </div>
                      <div class="form-check-inline">
                        <label class="form-check-label">
                          <input type="radio" class="form-check-input" name="optradio">í´ëí°
                        </label>
                      </div>
                      <div class="form-check-inline">
                        <label class="form-check-label">
                          <input type="radio" class="form-check-input" name="optradio">ë¬´íµì¥ìê¸(ê°ìê³ì¢)
                        </label>
                      </div>
                     
                    </td>
                    
                </tr>
               
              </tbody>
            </table>
            <button type="button" class="btn btn-success">ê²°ì íê¸°</button>
</div>


  <%--fotter영역 --%>
<%@include file="../includes/footer.jsp"%>

</body>
</html>
