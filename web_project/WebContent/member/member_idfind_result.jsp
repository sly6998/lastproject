<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = (String) request.getAttribute("id");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href='http://fonts.googleapis.com/css?family=Varela+Round'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/member_form.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.css" type="text/css">
<script src="<%=request.getContextPath()%>/js/idFind.js"></script>
<title></title>
</head>
<body>
	<div class="login-form-1" align="center" style="width:100%">
		<div class="login-group">
			<div align="center">
				<span class="form-control">
					<font size="4">
						<%if(id !=""){%>
						회원님의 ID는 <br><font color="red"><%=id%></font> 입니다.
						<%}else if(id == ""){%>
						일치하는 회원정보가 없습니다.
						<%}%>
					</font> 
				</span><br>
				<button type="button" class="btn-default-1 btn"
					onclick="result_close()">Close</button>
			</div>
		</div>
	</div>
</body>
</html>