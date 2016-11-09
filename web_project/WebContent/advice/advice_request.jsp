<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String id = "";
    String MEMBER_NAME = "";

    if (session.getAttribute("MEMBER_ID") != null) {
      id = (String) session.getAttribute("MEMBER_ID");
    }

    if (session.getAttribute("MEMBER_NAME") != null) {
      MEMBER_NAME = (String) session.getAttribute("MEMBER_NAME");
    }
 
  
   

    %>
<!DOCTYPE html>
<html lang="en">
<head>

<title></title>
<meta charset="utf-8">
     
<script src="<%=request.getContextPath()%>/js/jquery-1.6.2.min.js" type="text/javascript"></script>     
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="" />
<meta name="author" content="http://bootstraptaste.com" />
<!-- css -->
<link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/css/fancybox/jquery.fancybox.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/jcarousel.css" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/css/flexslider.css" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet" />
<!-- Theme skin -->
<link href="<%=request.getContextPath()%>/skins/default.css" rel="stylesheet" />
<!-- Script -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/noti.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.easing.1.3.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.fancybox.pack.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.fancybox-media.js"></script>
<script src="<%=request.getContextPath()%>/js/google-code-prettify/prettify.js"></script>
<script src="<%=request.getContextPath()%>/js/portfolio/jquery.quicksand.js"></script>
<script src="<%=request.getContextPath()%>/js/portfolio/setting.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.flexslider.js"></script>
<script src="<%=request.getContextPath()%>/js/animate.js"></script>
<script src="<%=request.getContextPath()%>/js/custom.js"></script>
	

<script>
	function contact_submit(){
		document.getElementById('contact-form').submit()
		alert("상담이 접수되었습니다. 빠른 시일내에 연락 드리겠습니다.");
		System.out.println("ㅎㅎ");
	}
</script>
  
</head>



<body >
 <header>
      <div class="navbar navbar-default navbar-static-top">
        <div class="container">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
              <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="./mainpage.html"><span>M</span>oderna</a>
          </div>
          <div class="navbar-collapse collapse ">
            <ul class="nav navbar-nav">
              <li><a href="./mainpage.html">Home</a></li>
              <li ><a href="./noti_list.html">Noti</a></li>
              <li><a href="./catalogue.html">Portfolio</a></li>
              <li><a href="./product_list.html">Product</a></li>
              <li><a href="./review_list.html">Review</a></li>
              <li><a href="./qna_list.html">QnA</a></li>
              <li class="active"><a href="./advice_request.html">Contact</a></li>
              <li class="dropdown"><a href="#" class="dropdown-toggle " data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false">Member<b class=" icon-angle-down"></b></a>
                <ul class="dropdown-menu">
                  <%
                    if (id == null || id == "") {
                  %>
                  <li><a href="./login.html" data-toggle="modal" data-target="#loginModal">로그인</a></li>
                  <li><a href="./join.html" data-toggle="modal" data-target="#joinModal">회원가입</a></li>
                  <li><a href="./idfind.html" data-toggle="modal" data-target="#idModal">ID 찾기</a></li>
                  <li><a href="./pwdfind.html" data-toggle="modal" data-target="#pwdModal">PWD 찾기</a></li>
                  <%
                    } else if (id.equals("admin")) {
                  %>
                  <li><a href="./member_management.html">회원관리</a></li>
                  <li><a href="./OrderManagementList.html">주문조회</a></li>
                  <li><a href="./advice_list.html">상담조회</a></li>
                  <li><a href="./member_modify.html">마이페이지</a></li>
                  <li><a href="./logout.html">로그아웃</a></li>
                  <%
                    } else {
                  %>
                  <li><a href="./basketlist.html">장바구니</a></li>
                  <li><a href="./OrderList.html">주문조회</a></li>
                  <li><a href="./member_modify.html">마이페이지</a></li>
                  <li><a href="./logout.html">로그아웃</a></li>
                  <%
                    }
                  %>
                </ul></li>
            </ul>
          </div>
        </div>
      </div>
    </header>	
<!-- 위치 -->
    <section id="inner-headline">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <ul class="breadcrumb">
              <li><a href="#"><i class="fa fa-home"></i></a><i class="icon-angle-right"></i></li>
              <li class="active">CONTACT US</li>
            </ul>
          </div>
        </div>
      </div>
    </section>
<!-- 위치 end -->
    
    
    
<section id="content">
<div class="container">
<div class="row">
<div class="col-lg-12">
 <!-- 본문 시작 -->
<h3 >CONTACT US</h3>
                                                    


<form id="contact-form" method="post" action="./AdviceWriteAction.html">                    
<table>
<tr>
<td width="500px" style="border: 0px solid #ddd;">

	<label>Name:<br/><input style="width:300px;" name="ADVICE_NAME" type="text" placeholder="성함"/></label><br/>
	<label>Tel:<br/><input style="width:300px;" name="ADVICE_TEL" type="text"  placeholder="연락처"/></label><br/>
	<label>Message:<br/>
	<textarea style="height:300px; width:400px; " name="ADVICE_CONTENT"  placeholder="상담내용을 입력해주세요" ></textarea></label>              
</td>
               


<td width="500px" style="border:0px solid #ddd" align="left">
<!-- 다음 지도 표시  -->
<div id="map" style="width:500px;height:240px;"></div>
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
<!--  다음 지도 끝 --> 	
<h5>
<font color="#969696" >
[ JASON DESIGN COMPANY ]								<br/><br/>
Address  <br/>서울 종로구 관철동 13-13 종로코아빌딩 5층	<br/><br/>
Email    <br/>JASON@DESIGN.COM<br/><br/>
Tel      <br/>02-6901-7001<br/><br/>
Fax      <br/>02-9601-2282<br/><br/>
</font>
</h5>
</td>
</table>



</form>
<button class="btn"  onClick=contact_submit()>Send</button>	
<% if(id.equals("admin")){ %>	
<button class="btn" onclick="location.href='./advice_list.html'">List</button>
<%} %>
	
	

	
	
	
	
</div>
</div>
</div>
</section>                 
			 

                                           

     
</body>
</html>