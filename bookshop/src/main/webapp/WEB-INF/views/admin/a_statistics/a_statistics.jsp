<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>✨Bookwarms</title>
  <!-- 구글 차트 호출을 위한 js 파일 -->
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script>
//구글 차트 라이브러리 로딩
//google객체는 위쪽 google src안에 들어있음
google.load('visualization','1',{
  'packages' : ['corechart']
});
//로딩이 완료되면 drawChart 함수를 호출
  google.setOnLoadCallback(drawChart); //라이브러리를 불러오는 작업이 완료되었으면 drawChart작업을 실행하라는 뜻.
  function drawChart() {
      var jsonData = $.ajax({
    	  url :"/admin/a_statistics/chart",
    	  dataType : "json",
          async : false
      }).responseText; //제이슨파일을 text파일로 읽어들인다는 뜻
      console.log(jsonData);
      //데이터테이블 생성
      var data
      = new google.visualization.DataTable(jsonData);
      //제이슨 형식을 구글의 테이블 형식으로 바꿔주기 위해서 집어넣음
      //차트를 출력할 div
      //LineChart, ColumnChart, PieChart에 따라서 차트의 형식이 바뀐다.
      
      var chart = new google.visualization.PieChart(
              document.getElementById('chart_div')); //원형 그래프
      
      //var chart = new google.visualization.LineChart(
              //document.getElementById('chart_div')); //선 그래프 
              
      //var chart
      //  = new google.visualization.ColumnChart(document.getElementById('chart_div'));
              //차트 객체.draw(데이터 테이블, 옵션) //막대그래프
              
              //cuveType : "function" => 곡선처리
              
              //데이터를 가지고 (타이틀, 높이, 너비) 차트를 그린다.
              chart.draw(data, {
                  title : "카테고리 별 책 수 통계",
                  curveType : "function", //curveType는 차트의 모양이 곡선으로 바뀐다는 뜻
                  width : 600,
                  height : 400
              });
  }

</script>
</script>
  <%--head영역 --%>
<%@include file="../../includes/header.jsp"%>



<div class="container" style="margin-top:30px">
  <div class="row">
    <%--nav영역 --%>
<%@include file="../nav.jsp"%>
    <div class="col-sm-8">
      <h2>카테고리 별 도서수</h2>
       <!-- 차트 출력 영역 -->
    <div id="chart_div"></div>
    <!-- 차트가 그려지는 영역 -->
    <!-- 차트 새로고침 버튼 -->
    <button id="btn" class="btn btn-secondary" type="button" onclick="drawChart()">refresh</button>
     
    </div>
  </div>
</div>

  <%--footer영역 --%>
<%@include file="../../includes/footer.jsp"%>

</body>
</html>
