<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int result = (int) request.getAttribute("overlap");
%>
<!DOCTYPE html">
<html>
<head>
<link href='http://fonts.googleapis.com/css?family=Varela+Round'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/member_form.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.css" type="text/css">
<script src="<%=request.getContextPath()%>/js/join.js"></script>
<meta charset="UTF-8">
<title></title>
</head>
<body>


	<div class="login-form-1" align="center" valign="middle">
		<div class="login-group">
			<div align="center" valign="middle">
				<div align="center" valign="middle">
					<p />
					<br />
					<%
						if (result == 1) {
					%>
					<span><font size="3">이미 가입되어 있는 아이디 입니다.</font></span>
					<%
						} else {
					%>
					<span><font size="3">가입 가능한 아이디 입니다.</font></span>
					<%
						}
					%><p />
					<button class="btn-default-1 btn"
						onclick="overlapClose(<%=result%>)">
						Close</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>