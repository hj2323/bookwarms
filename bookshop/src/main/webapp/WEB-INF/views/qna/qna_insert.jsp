<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>â¨Bookwarms</title>
<%--head영역 --%>
<%@include file="../includes/header.jsp"%>



<div class="container" style="margin-top: 30px">
	<h3>QnA</h3>
	<form action="insert" method="post" id="frm">
		<table class="table">
			<thead>
				<tr>
					<td>제목</td>
					<td colspan="3"><input type="text" class="form-control"
						id="subject" name="q_subject"></td>


				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="4">
						<div class="form-group">
							<textarea class="form-control" rows="5" id="comment"
								name="q_content" placeholder="문의사항을 입력해주세요"></textarea>
						</div>
					</td>

				</tr>

			</tbody>
		</table>
		<hr>
		<c:choose>
			<c:when test="${empty sessionScope.sessid}">
				<!-- 세션이 없을때 -->
				
			</c:when>
			<c:otherwise>
				<!-- 세션이 있을때 -->
				<button type="submit" class="btn btn-primary">글쓰기</button>
			</c:otherwise>
		</c:choose>
		<button type="button" class="btn btn-primary">목록으로</button>
		</form>
		<hr>
</div>


<%@include file="../includes/footer.jsp"%>
</body>
</html>
