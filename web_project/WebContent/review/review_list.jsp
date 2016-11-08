<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.interior.review.*"%>

<%
  String id = "";
  String MEMBER_NAME = "";

  if (session.getAttribute("MEMBER_ID") != null) {
    id = (String) session.getAttribute("MEMBER_ID");
  }

  if (session.getAttribute("MEMBER_NAME") != null) {
    MEMBER_NAME = (String) session.getAttribute("MEMBER_NAME");
  }

  List boardList = (List) request.getAttribute("boardlist");
  int listcount = ((Integer) request.getAttribute("listcount")).intValue();
  int nowpage = ((Integer) request.getAttribute("page")).intValue();
  int maxpage = ((Integer) request.getAttribute("maxpage")).intValue();
  int startpage = ((Integer) request.getAttribute("startpage")).intValue();
  int endpage = ((Integer) request.getAttribute("endpage")).intValue();

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
              <li class="active"><a href="./noti_list.html">Noti</a></li>
              <li><a href="./catalogue.html">Portfolio</a></li>
              <li><a href="./product_list.html">Product</a></li>
              <li><a href="./review_list.html">Review</a></li>
              <li><a href="./qna_list.html">QnA</a></li>
              <li><a href="./advice_request.html">Contact</a></li>
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
              <li class="active">Review</li>
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
            <h3 class="heading">공지사항</h3>
            <!-- 검색 기능 추가 -->
            <div width="100%" align="right">
              <form name="srchForm" action="./review_list.html" method="post">
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

            <table class="table table-hover" width="100%">
              <!-- 항목 (번호/제목 / 글쓴이 / 날짜 / 조회수 ) -->
              <tr align="center" style="background-color: #EFEFEF">
                <td style="font-size: 12pt; font-weight: bold; width: 80px;" height="26">
                  <div align="center">번호</div>
                </td>

                <td style="font-size: 12pt; font-weight: bold;" height="26">
                  <div align="center">제목</div>
                </td>

                <td style="font-size: 12pt; font-weight: bold;" width="150" height="26">
                  <div align="center">글쓴이</div>
                </td>

                <td style="font-size: 12pt; font-weight: bold;" width="100" height="26">
                  <div align="center">날짜</div>
                </td>
                <td style="font-size: 12pt; font-weight: bold;" width="100" height="26">
                  <div align="center">조회수</div>
                </td>
              </tr>

              <%
                for (int i = 0; i < boardList.size(); i++) {
                  ReviewBean bl = (ReviewBean) boardList.get(i);
              %>
              <tr align="center" valign="middle" style="border: 1px solid #ddd;" onmouseover="this.style.backgroundColor='#F8F8F8'">
                <td height="23" style="font-family: Tahoma; font-size: 10pt; border: 0px solid #000;"><%=bl.getREVIEW_NUM()%></td>

                <td style="font-family: Tahoma; font-size: 10pt; border: 0px solid #000;"><a class="navbar-link" href="./review_detail.html?REVIEW_NUM=<%=bl.getREVIEW_NUM()%>" style='text-decoration: none;'><%=bl.getREVIEW_SUBJECT()%>
                </a></td>


                <td style="font-family: Tahoma; font-size: 10pt; border: 0px solid #000;">
                  <div align="center"><%=bl.getREVIEW_MEMBER_NAME()%>
                  </div>
                </td>

                <td style="font-family: Tahoma; font-size: 10pt; border: 0px solid #000;">
                  <div align="center">
                    <%=bl.getREVIEW_DATE()%></div>
                </td>

                <td style="font-family: Tahoma; font-size: 10pt; border: 0px solid #000;">
                  <div align="center"><%=bl.getREVIEW_READCOUNT()%>
                  </div>
                </td>

              </tr>

              <%
                }
              %>
              <tr>
                <td height="26"></td>
              </tr>
            </table>
            <%-- <%
              if (id.equals("admin")) {
            %>
            <p align="right">
              <button class="btn" onclick="location.href='./review_write.html'">글쓰기</button>
            <p />
            <%
              }
            %> --%>
            <table align="center">
              <!-- [이전] / [1] [2] [3] / [다음] -->
              <tr align="center" height="20">
                <td colspan="3" style="font-family: Tahoma; font-size: 10pt; border: 0px solid #000;">
                
                  <%
                    if (nowpage <= 1) {
                  %> [이전]&nbsp; <%
   } else {
 %> <a href="./review_list.html?page=<%=nowpage - 1%>">[이전]</a>&nbsp; <%
   }
 %> <%
   for (int a = startpage; a <= endpage; a++) {
     if (a == nowpage) {
 %> [<%=a%>] <%
   } else {
 %> <a href="./review_list.html?page=<%=a%>">[<%=a%>]
                </a> &nbsp; <%
   }
 %> <%
   }
 %> <%
   if (nowpage >= maxpage) {
 %> [다음] <%
   } else {
 %> <a href="./review_list.html?page=<%=nowpage + 1%>">[다음]</a> <%
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