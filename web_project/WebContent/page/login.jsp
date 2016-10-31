<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	Cookie[] cookie = request.getCookies();
	String save_id = "";
	if (cookie != null) {
		for (int i = 0; i < cookie.length; i++) {
			if ("save_id".equals(cookie[i].getName().trim())) {
				save_id = cookie[i].getValue();
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<script src="<%=request.getContextPath()%>/js/login.js"></script>
<title></title>
<meta charset="utf-8">
<link href='http://fonts.googleapis.com/css?family=Varela+Round' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/member_form.css">
</head>
<body>
	<div class="text-center" style="padding: 50px 0">
		<div class="member_logo">Login</div>
		<div class="login-form-1">
			<form name="loginform" class="text-left" method="post" action="./MemberLoginAction.html">
				<div class="login-form-main-message"></div>
				<div class="main-login-form">
					<div class="login-group">
						<div class="form-group">
							<input type="text" class="form-control" name="MEMBER_ID" id="MEMBER_ID" placeholder="User ID" value="<%=save_id%>">
						</div>
						<div class="form-group">
							<input type="password" class="form-control" name="MEMBER_PWD" id="MEMBER_PWD" placeholder="Password">
						</div>
						<div class="form-group login-group-checkbox">
							<input type="checkbox" id="save_id" name="save_id" <%="".equals(save_id) ? "" : "checked"%>>
							<label for="save_id">remember ID</label>
						</div>
					</div>
					<button type="button" class="login-button" onclick="login()">
						<i class="fa fa-chevron-right"></i>
					</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
