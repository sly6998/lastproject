<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.interior.advice.*"%>

<%
 AdviceBean advice=(AdviceBean)request.getAttribute("advicedata");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title></title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/reset.css" type="text/css" media="screen">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" type="text/css" media="screen">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/grid.css" type="text/css" media="screen">   
    <script src="<%=request.getContextPath()%>/js/jquery-1.6.2.min.js" type="text/javascript"></script>     
	<!--[if lt IE 7]>
        <div style=' clear: both; text-align:center; position: relative;'>
            <a href="http://www.microsoft.com/windows/internet-explorer/default.aspx?ocid=ie6_countdown_bannercode"><img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0"  alt="" /></a>
        </div>
	<![endif]-->
    <!--[if lt IE 9]>
   		<script type="text/javascript" src="js/html5.js"></script>
        <link rel="stylesheet" href="css/ie.css" type="text/css" media="screen">
	<![endif]-->
</head>
<body id="page5">
	<%@ include file="../page/header.jsp"%>
    <section id="content">
        <div class="bg-top">
        	<div class="bg-top-2">
                <div class="bg">
                    <div class="bg-top-shadow">
                        <div class="main">
                            <div class="box">
                                <div class="padding">
                                    <div class="container_12">
                                        <div class="wrapper">
                                            <div class="grid_12">
                                            	<div class="indent-left">
                                                	<h3 class="p2">contact us detail (관리자)</h3>
                                                    
                  

<FORM id="contact-form">
<fieldset>
<label>
	<span class="text-form">Name:</span>
	<table><tr><td style="border:1px solid #ddd; width:150px;"> <%= advice.getADVICE_NAME()%></td></tr></table>
</label>

<label>
	<span class="text-form">Tel:</span>
	<table><tr><td style="border:1px solid #ddd; width:150px;"><%= advice.getADVICE_TEL()%></td></tr></table>
</label>
<div class="wrapper">
	<div class="text-form">Message:</div>
	<table>
		<tr>
			<td style="border:1px solid #ddd; width:500px; height:150px "><%= advice.getADVICE_CONTENT()%></td>
		</tr>
		
		<tr>
			<td><a href="advice_list.html">목록보기 </a></td>
		</tr> 
	</table>
</div>
</fieldset>
</FORM>
					
                                            
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>	
        </div>
     
</body>
</html>