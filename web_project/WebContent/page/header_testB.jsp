<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
  String id = "admisn";
%>
<body>

	<div class="menu_bg"></div>
	<header>
	<div class="navigation">
		<div align="right" id="member_top"
			style="width: 80%; margin-bottom: 20px; margin-top: 0px">

			<%
					  if (id == null || id == "") {
					%>
			<a href="#"><font size="4">Join</font></a>&nbsp;&nbsp;&nbsp;
			<a href="#"><font size="4">Login</font></a>&nbsp;&nbsp;&nbsp;
			<a href="#"><font size="4">Email /</a>&nbsp;<a href="#">Password Find</font>
			</a>
			<%
					  } else if (id.equals("admin")) {
					%>
			<a href="#"><font size="4">MemberManagement</font></a>&nbsp;&nbsp;&nbsp;
			<a href="#"><font size="4">OrderManagement</font></a>&nbsp;&nbsp;&nbsp;
			<a href="#"><font size="4">AdviceManagement</font></a>&nbsp;&nbsp;&nbsp;
			<a href="#"><font size="4">MyPage</font></a>&nbsp;&nbsp;&nbsp;
			<a href="#"><font size="4">Logout</font></a>
			<%
					  } else {
					%>
			<a href="#"><font size="4">MyPage</font></a>&nbsp;&nbsp;&nbsp;
			<a href="#"><font size="4">OrderLookUp</font></a>&nbsp;&nbsp;&nbsp;
			<a href="#"><font size="4">AdviceLookUp</font></a>&nbsp;&nbsp;&nbsp;
			<a href="#"><font size="4">Logout</font></a>
			<%
					  }
					%>
		</div>
		<div class="container_12">
			<div class="grid_12">
				<h1 class="logo">
					<a href="index.html" style="margin-left: 15%"><img
						src="<%=request.getContextPath()%>/images/logo.png" alt=""> </a>
				</h1>

			</div>
			<nav>
			<ul>
				<li><a href="#services">Notice</a></li>
				<li><a href="#portfolio">Catalog</a></li>
				<li><a href="#about">product</a></li>
				<li><a href="#contacts">Review</a></li>
				<li><a href="#contacts">QnA</a></li>
				<li><a href="#contacts">Advice</a></li>
			</ul>
			</nav>
		</div>
	</div>
	</div>
	</header>


