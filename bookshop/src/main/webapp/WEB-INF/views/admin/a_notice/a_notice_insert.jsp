<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>✨Bookwarms</title>
<script src="/resources/ckeditor/ckeditor/ckeditor.js"></script>
<%--head영역 --%>

<%@include file="../../includes/header.jsp"%>



<div class="container" style="margin-top: 30px">
	<div class="row">
		<%--nav영역 --%>
		<%@include file="../nav.jsp"%>
		<div class="col-sm-8">
			<h2>이용안내 글쓰기</h2>
			<div class="table-responsive">
				<form action="insert" method="post">
					<table class="table">

						<tr>
							<td>제목</td>
							<td colspan="3"><input type="text" class="form-control"
								id="usr" name="n_subject"></td>

						</tr>

						<tr>
							<td>책 소개</td>
							<td colspan="3"><textarea class="form-control" rows="5"
									id="comment" name="n_content">
								</textarea><script>
									var ckeditor_config = {
										resize_enaleb : false,
										enterMode : CKEDITOR.ENTER_BR,
										shiftEnterMode : CKEDITOR.ENTER_P,
										filebrowserUploadUrl : "/admin/a_notice/ckUpload"
									};

									CKEDITOR.replace("n_content", ckeditor_config);
								</script>
							</td>

						</tr>
						



					</table>
					<button type="submit" class="btn btn-info">글쓰기</button>
			</div>
			</form>
		</div>
	</div>
</div>


<%@include file="../../includes/footer.jsp"%>
</body>
</html>