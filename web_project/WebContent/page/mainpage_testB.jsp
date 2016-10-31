<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>메인 페이지</title>
<meta charset="utf-8">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/reset.css" type="text/css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/grid.css"
	type="text/css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style.css" type="text/css">
<script src="<%=request.getContextPath()%>/js/jquery-1.6.2.min.js"
	type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/jquery.galleriffic.js"
	type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/jquery.opacityrollover.js"
	type="text/javascript"></script>

<style type="text/css">
.menu_bg {
	background-color: #F6F6F6;
	height: 140px;
	left: 0;
	right: 0;
	top: 0;
	position: fixed;
	z-index: 800;
}

body {
	margin: 0;
}

header {
	padding-top: 600px;
	color: #e6e5e5;
	display: block;
	position: relative;
	z-index: 999;
	text-align: center;
	background: url(images/slide.jpg) center 0 no-repeat;
	padding-bottom: 53px;
}

header .rel {
	z-index: 999;
}

header h1 {
	z-index: 999;
}

header h1.logo {
	top: -17px;
	position: absolute;
	left: 50%;
	margin-left: -46px;
}

.navigation {
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	padding: 10px 0 0;
	margin-bottom: 177px;
	text-align: center;
}

.navigation li {
	display: inline-block;
	font: 24px/36px 'Droid Sans', sans-serif;
}

.navigation li+li {
	margin-left: 87px;
}

.navigation li:first-child+li+li+li {
	margin-left: 20%;
}

.navigation li a {
	position: relative;
}

.navigation li a:after {
	-webkit-transition: 0.5s ease;
	transition: 0.5s ease;
	position: absolute;
	height: 1px;
	top: 100%;
	margin-top: 7px;
	content: '';
	left: 50%;
	margin-left: -42px;
	background-color: #ffffff;
	opacity: .53;
	width: 0;
}

.navigation li a:hover, .navigation li a.current {
	color: inherit;
}

.navigation li a:hover:after, .navigation li a.current:after {
	width: 84px;
}

.container_12 .grid_12 {
	width: 1170px;
}

.grid_12 {
	display: inline;
	float: left;
	position: relative;
	margin-left: 15px;
	margin-right: 15px;
}

.container_12 {
	margin-left: auto;
	margin-right: auto;
	width: 1200px;
}

h1, ul, li {
	margin: 0;
	padding: 0;
}

a{
	text-decoration: none;
	color: black;
	outline: none;
}

#member_top a {
	font-family: 'fontawesome-webfont';
}
</style>


</head>
<body id="page1">
	<%@ include file="./header.jsp"%>
	<%@ include file="./contents.jsp"%>
	<%@ include file="./footer.jsp"%>
</body>
</html>
