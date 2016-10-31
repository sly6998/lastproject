<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
  String MEMBER_ID = null;


  if (session.getAttribute("MEMBER_ID") != null) {
  MEMBER_ID =(String)session.getAttribute("MEMBER_ID");
 
  }
   

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
<body >
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
                                                	<h3 class="p2">Contact Form</h3>
                                                    
<form id="contact-form" method="post" action="./AdviceWriteAction.html">                    

<fieldset> 
<table>
<tr>
<td width="400px">

<label><div class="text-form">Name:</div><input name="ADVICE_NAME" type="text" /></label>
<label><div class="text-form">Tel:</div><input name="ADVICE_TEL" type="text" /></label>
                                 
<div class="wrapper">
	<div class="text-form">Message:</div>
	<input style="height:300px; width:300px;  " name="ADVICE_CONTENT" type="text" />
	
</div> 
</div>    
</td>


<td style="border:0px solid #ddd" align="leftd">
<div id="map" style="width:400px;height:240px;"></div>
<h5>
<font color="#969696" >
[ JASON DESIGN COMPANY ]								<br/><br/>
<div class="text-form">Address  </div>서울 종로구 관철동 13-13 종로코아빌딩 5층	<br/><br/>
<div class="text-form">Email    </div>JASON@DESIGN.COM<br/><br/>
<div class="text-form">Tel      </div>02-6901-7001<br/><br/>
<div class="text-form">Fax      </div>02-9601-2282<br/><br/>
</font>
</h5>
</td>



</table>
<div class="buttons">
	<!-- <input type="button" value="글등록" onclick="document.getElementById('contact-form').submit()">  -->
	<a class="button" href="#" onClick="document.getElementById('contact-form').reset()">Clear</a>
	<a class="button" href="#" onClick="document.getElementById('contact-form').submit()">Send</a>
	
	
	
	
	
	<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=69441167f5fd1088fb45c5ceddf8255c"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new daum.maps.LatLng(37.569469, 126.985984),
			level: 3
		};

		var map = new daum.maps.Map(container, options); 
		
		// 마커가 표시될 위치입니다 
		var markerPosition  = new daum.maps.LatLng(37.569469, 126.985984); 

		// 마커를 생성합니다
		var marker = new daum.maps.Marker({
		    position: markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);

		// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
		// marker.setMap(null);    
		
		// 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new daum.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">솔데스크</div>'
        });
        infowindow.open(map, marker);
		
	</script>

                      
</fieldset>						
</form>                          
                                                       
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