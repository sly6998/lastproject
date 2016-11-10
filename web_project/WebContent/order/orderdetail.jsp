<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.interior.order.*"%>
<%
  String id = (String) session.getAttribute("MEMBER_ID");
  List orderdetail = (List) request.getAttribute("orderdetail");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title></title>
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
  <div id="wrapper">
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
              <li><a href="./noti_list.html">Noti</a></li>
              <li><a href="./catalogue.html">Portfolio</a></li>
              <li><a href="./product_list.html">Product</a></li>
              <li><a href="./review_list.html">Review</a></li>
              <li><a href="./qna_list.html">QnA</a></li>
              <li><a href="./advice_request.html">Contact</a></li>
              <li class="dropdown active"><a href="#" class="dropdown-toggle " data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false">Member<b
                  class=" icon-angle-down"></b></a>
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
              <li class="active">Member > Order Detail</li>
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
            <h3>주문 상세보기</h3>
            <br> <br> <span><font size="4"><b>주문자 정보</b></font></span>
            <hr width="100%">
            <%
              for (int i = 0; i < orderdetail.size(); i++) {
                OrderBean ol = (OrderBean) orderdetail.get(i);
            %>
            <div class="col-md-4">
              <span style="margin-right: 30px;"><b>주문자</b></span><span><%=ol.getORDER_MEMBER_NAME()%></span><br>
              <br> <span style="margin-right: 15px;"><b>입금현황</b></span> <span> <!--ready(미결제), paid(결제완료), cancelled(결제취소, 부분취소포함), failed(결제실패)--> <%
              if (ol.getORDER_TRADE_STATUS().equals("paid")) {
            %> 결제완료 <%
              } else if (ol.getORDER_TRADE_STATUS().equals("ready")) {
            %> 미결제 <%
              } else if (ol.getORDER_TRADE_STATUS().equals("cancelled")) {
            %> 결제취소 <%
              } else if (ol.getORDER_TRADE_STATUS().equals("failed")) {
            %> 결제실패 <%
              }
            %>
              </span><br>
              <br> <span style="margin-right: 15px;"><b>주문메모</b></span><span><%=ol.getORDER_MEMO()%></span><br>
              <br>
            </div>
            <div class="col-md-8">
              <span style="margin-right: 15px;"><b>주문일자</b></span><span><%=ol.getORDER_DATE()%></span><br>
              <br> <span style="margin-right: 30px;"><b>연락처</b></span><span><%=ol.getORDER_MEMBER_TEL()%></span><br>
              <br>
              <br>
              <br>
              <br>
              <br>
            </div>

            <span><font size="4"><b>배송지 정보</b></font></span>
            <hr width="100%">
            <div class="col-md-4">
              <span><b>주소</b></span><br>
              <br> <span style="margin-bottom: 50px;"><%=ol.getORDER_ZIP()%></span><br> <span><%=ol.getORDER_ADDR_1()%></span><br> <span><%=ol.getORDER_ADDR_2()%></span> <br>
              <br>
            </div>
            <div class="col-md-8">
              <span style="margin-right: 30px;"><b>연락처</b></span><span><%=ol.getORDER_TEL()%></span><br>
              <br>
              <br>
              <br>
              <br>
              <br>
              <br>
              <br>
            </div>
            <%} %>

            <span><font size="4"><b>제품 정보</b></font></span>
            <hr width="100%">
            <table class="table table-hover" style="width: 70%">
              <tr align="center" style="background-color: #EFEFEF">
                <td style="font-size: 12pt; font-weight: bold; width: 250px;" align="center">사진</td>
                <td style="font-size: 12pt; font-weight: bold;" align="center">주문제품</td>
                <td style="font-size: 12pt; font-weight: bold;" align="center" width="100">수량</td>
                <td style="font-size: 12pt; font-weight: bold;" align="center" width="150">가격</td>
              <tr>
                <%
                for (int i = 0; i < orderdetail.size(); i++) {
                OrderBean ol = (OrderBean) orderdetail.get(i);
              %>
              
              <tr>
                <td align="center" style="vertical-align: middle;"><img src="<%=ol.getORDER_ITEM_IMG()%>" width="200"></td>
                <td align="center" style="vertical-align: middle;"><%=ol.getORDER_ITEM_NAME()%><br>
                <br>
                <font size="2" color="blue">옵션></font> <font size="2"><%=ol.getORDER_ITEM_TYPE() %></font></td>
                <td align="center" style="vertical-align: middle;"><%=ol.getORDER_ITEM_AMOUNT()%></td>
                <td align="center" style="vertical-align: middle;"><%=String.format("%,d", ol.getORDER_ITEM_PRICE_SUM())%> 원</td>
              </tr>
              <%
              }
            %>
            </table>
            <br>
            <br>
            <br>
            <br> <span><font size="4"><b>결제 정보</b></font></span>
            <hr width="100%">

            <table class="table" style="width: 70%;">
              <tr align="center" style="background-color: #EFEFEF">
                <td style="font-size: 12pt; font-weight: bold; width: 250px;" align="center">주문번호</td>
                <td style="font-size: 12pt; font-weight: bold;" align="center">결제방법</td>
                <td style="font-size: 12pt; font-weight: bold;" align="center" width="100">결제금액</td>
              </tr>
              <%
                for (int i = 0; i < orderdetail.size(); i++) {
                OrderBean ol = (OrderBean) orderdetail.get(i);
              %>
              <tr>
                <td align="center"><%=ol.getORDER_TRADE_NUM()%></td>
                <td align="center">
                  <!--card(신용카드) trans(실시간계좌이체) vbank(가상계좌) phone(휴대폰소액결제)--> <%
                     if (ol.getORDER_TRADE_TYPE().equals("card")) {
                  %> 신용카드 <%
                    } else if (ol.getORDER_TRADE_TYPE().equals("trans")) {
                  %> 실시간계좌이체 <%
                    } else if (ol.getORDER_TRADE_TYPE().equals("vbank")) {
                  %> 가상계좌 <%
                    } else if (ol.getORDER_TRADE_TYPE().equals("phone")) {
                  %> 휴대폰소액결제 <%
                    }
                  %>
                </td>
                <td align="center"><%=String.format("%,d", ol.getORDER_ITEM_PRICE_SUM())%> 원</td>
              </tr>
              <%
              }
              %>
            </table>
            <!-- 본문 end -->
          </div>
        </div>
      </div>
    </section>

    <footer>
      <div class="container">
        <div class="row">
          <div class="col-lg-3">
            <div class="widget">
              <h5 class="widgetheading">Get in touch with us</h5>
              <address>
                <strong>Moderna company Inc</strong><br> Modernbuilding suite V124, AB 01<br> Someplace 16425 Earth
              </address>
              <p>
                <i class="icon-phone"></i> (123) 456-7890 - (123) 555-7891 <br> <i class="icon-envelope-alt"></i> email@domainname.com
              </p>
            </div>
          </div>
          <div class="col-lg-3">
            <div class="widget">
              <h5 class="widgetheading">Pages</h5>
              <ul class="link-list">
                <li><a href="#">Press release</a></li>
                <li><a href="#">Terms and conditions</a></li>
                <li><a href="#">Privacy policy</a></li>
                <li><a href="#">Career center</a></li>
                <li><a href="#">Contact us</a></li>
              </ul>
            </div>
          </div>
          <div class="col-lg-3">
            <div class="widget">
              <h5 class="widgetheading">Latest posts</h5>
              <ul class="link-list">
                <li><a href="#">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</a></li>
                <li><a href="#">Pellentesque et pulvinar enim. Quisque at tempor ligula</a></li>
                <li><a href="#">Natus error sit voluptatem accusantium doloremque</a></li>
              </ul>
            </div>
          </div>
          <div class="col-lg-3">
            <div class="widget">
              <h5 class="widgetheading">Flickr photostream</h5>
              <div class="flickr_badge">
                <script type="text/javascript" src="https://www.flickr.com/badge_code_v2.gne?count=8&amp;display=random&amp;size=s&amp;layout=x&amp;source=user&amp;user=34178660@N03"></script>
              </div>
              <div class="clear"></div>
            </div>
          </div>
        </div>
      </div>
      <div id="sub-footer">
        <div class="container">
          <div class="row">
            <div class="col-lg-6">
              <div class="copyright">
                <p>&copy; Moderna Theme. All right reserved.</p>
                <div class="credits">
                  <!-- 
                                All the links in the footer should remain intact. 
                                You can delete the links only if you purchased the pro version.
                                Licensing information: https://bootstrapmade.com/license/
                                Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=Moderna
                            -->
                  <a href="https://bootstrapmade.com/">Free Bootstrap Themes</a> by <a href="https://bootstrapmade.com/">BootstrapMade</a>
                </div>
              </div>
            </div>
            <div class="col-lg-6">
              <ul class="social-network">
                <li><a href="#" data-placement="top" title="Facebook"><i class="fa fa-facebook"></i></a></li>
                <li><a href="#" data-placement="top" title="Twitter"><i class="fa fa-twitter"></i></a></li>
                <li><a href="#" data-placement="top" title="Linkedin"><i class="fa fa-linkedin"></i></a></li>
                <li><a href="#" data-placement="top" title="Pinterest"><i class="fa fa-pinterest"></i></a></li>
                <li><a href="#" data-placement="top" title="Google plus"><i class="fa fa-google-plus"></i></a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </footer>
    <!-- 회원가입 모달 -->
    <div class="modal fade" id="joinModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content"></div>
      </div>
    </div>
    <!-- 로그인 모달 -->
    <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content"></div>
      </div>
    </div>
    <!-- id찾기 모달 -->
    <div class="modal fade" id="idModal" tabindex="-1" role="dialog" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content"></div>
      </div>
    </div>
    <!-- pw찾기 모달 -->
    <div class="modal fade" id="pwdModal" tabindex="-1" role="dialog" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content"></div>
      </div>
    </div>
</body>
</html>