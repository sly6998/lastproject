<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.interior.advice.*"%>

<%
	String id = "";
	String MEMBER_NAME = "";

	if (session.getAttribute("MEMBER_ID") != null) {
  		id = (String) session.getAttribute("MEMBER_ID");
	}

	if (session.getAttribute("MEMBER_NAME") != null) {
  		MEMBER_NAME = (String) session.getAttribute("MEMBER_NAME");
	}
  
  List boardList = (List)request.getAttribute("boardlist");
  int listcount = ((Integer)request.getAttribute("listcount")).intValue();
  int nowpage = ((Integer)request.getAttribute("page")).intValue();
  int maxpage = ((Integer)request.getAttribute("maxpage")).intValue();
  int startpage = ((Integer)request.getAttribute("startpage")).intValue();
  int endpage = ((Integer)request.getAttribute("endpage")).intValue();
  
  //검색 기능용
  String srchKey = (String) request.getAttribute("srchKey");
  if (srchKey == null) {
    srchKey = "";
  }

  String srchFlds = (String) request.getAttribute("srchFlds");
  if (srchFlds == null) {
    srchFlds = "";
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
	

  
 	
 	
</head>
<body>

 <!-- start header -->
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
    <!-- end header -->
    <!-- 위치 -->
    <section id="inner-headline">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <ul class="breadcrumb">
              <li><a href="#"><i class="fa fa-home"></i></a><i class="icon-angle-right"></i></li>
              <li class="active">QNA</li>
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
            <h3 class="heading">CONTACT US - LIST(관리자)</h3>
            <!-- 검색 기능 추가 -->
            <div width="100%" align="right">
              <form name="srchForm" action="./advice_list.html" method="post">
                <select name="srchFlds" class="form-control-u" style="width: 80px;">
                  <option value="all" <%=srchFlds.equals("all") ? "selected='selected'" : ""%>>모두</option>
                  <option value="sub" <%=srchFlds.equals("sub") ? "selected='selected'" : ""%>>제목</option>
                  <option value="au" <%=srchFlds.equals("au") ? "selected='selected'" : ""%>>글쓴이</option>
                  <option value="con" <%=srchFlds.equals("con") ? "selected='selected'" : ""%>>내용</option>
                </select> <input type="text" name="srchKey" class="form-control-u" style="width: 250px" maxlength="50" value="<%=srchKey%>" /> <input type="button" value="검색" class="btn"
                  onClick="submitSrchForm()" />
              </form>
            </div>
            <p />
            <!-- 검색 기능 end -->



                                                    
                    
<table class="table table-hover" >
      <!-- 빈공간(여백) -->
      <tr>
         <td style="border: 0px solid #000;" colspan="5" height="20px"></td>
      </tr>
      
      <!-- 항목 -->
      <tr align="center" style="border: 1px solid #ddd; background-color: #EFEFEF">
         <td
            style="font-size: 12pt; border: 1px solid #ddd; font-weight: bold; width: 30px;"
            height="26">
            <div align="center">Num</div>
         </td> 
         
         
         <td
            style="font-size: 12pt; border: 1px solid #ddd; font-weight: bold; width: 180px;"
            height="26">
            <div align="center"> - </div>
         </td>

        

         <td
            style="font-size: 12pt; font-weight: bold; border: 1px solid #ddd;"
            width="70" height="26">
            <div align="center">Name</div>
         </td>

         <td
            style="font-size: 12pt; font-weight: bold; border: 1px solid #ddd;"
            width="70" height="26">
            <div align="center">Tel</div>
         </td>

         <td
            style="font-size: 12pt; font-weight: bold; border: 1px solid #ddd;"
            width="70" height="26">
            <div align="center">Date</div>
         </td>
      </tr>
    
    	
    	<%
         for (int i = 0; i < boardList.size(); i++) {
            AdviceBean bl = (AdviceBean) boardList.get(i);
      %>
    
      <!-- 내용 -->
      <tr align="center" valign="middle" style="border:1px solid #ddd;" onmouseover="this.style.backgroundColor='#F8F8F8'">
     
         <td height="23"
            style="font-family: Tahoma; font-size: 10pt; border: 0px solid #000;">
         <%= bl.getADVICE_NUM() %>
         </td>

         <td style="font-family: Tahoma; font-size: 10pt; border: 0px solid #000;">-
         </td>
         
         
         <td>
            <a href="./advice_detail.html?ADVICE_NUM=<%=bl.getADVICE_NUM()%>"><%=bl.getADVICE_NAME()%></a>
         </td>

         <td style="font-family: Tahoma; font-size: 10pt; border: 0px solid #000;">
           <%=bl.getADVICE_TEL() %>
         </td>
           
           

         <td
            style="font-family: Tahoma; font-size: 10pt; border:0px solid #000;">
           <%=bl.getADVICE_DATE() %>
         </td>
      </tr>
      
      <%
         }
      %>
</table>                                                        
				
                        

</body>
</html>