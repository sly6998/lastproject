<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  String id = null;
  if (session.getAttribute("MEMBER_ID") != null) {
    id = (String) session.getAttribute("MEMBER_ID");
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
              <li class="active"><a href="./catalogue.html">Portfolio</a></li>
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
                  <li>
            <a href="./OrderList.html">주문조회</a></li>
              <li>
              <a href="./member_modify.html">마이페이지</a>
              </li>
              <li>
              <a href="./logout.html">로그아웃</a>
              </li>
              <%
                }
              %>
              </ul>
            </li>
            </ul>
          </div>
        </div>
      </div>
    </header>
    <!-- end header -->
    
    <!-- 본문 시작 -->
    <section id="featured">
      <!-- start slider -->
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <!-- Slider -->
            <div id="main-slider" class="flexslider">
              <ul class="slides">
                <li><img src="<%=request.getContextPath()%>/img/slides/img2.jpg" alt="" />
                  <!-- <div class="flex-caption">
                    <h3>for your life</h3><p>dgdfgfdh</p>
                  </div> -->
                </li>
                <li><img src="<%=request.getContextPath()%>/img/slides/img3.jpg" alt="" />
                  </li>
                <li><img src="<%=request.getContextPath()%>/img/slides/img5.jpg" alt="" />
                  </li>
              </ul>
            </div>
            <!-- end slider 슬라이더 끝 -->
          </div>
        </div>
      </div>
     </section>
    
    
    <section class="callaction">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="big-cta">
              <div class="cta-text">
                <h2>
                  <span>Mordena</span> Interior Portfolio since 2016
                </h2>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    
    
    
    <section id="content">
      <div class="container">
        <!-- Portfolio Projects -->
        <div class="row">
          <div class="col-lg-12">
            <div class="row">
              <section id="projects">
                <ul id="thumbs" class="portfolio">
                  <!-- Item Project and Filter Name -->
                  <li class="col-lg-3 design" data-id="id-0" data-type="web">
                    <div class="item-thumbs">
                      <!-- Fancybox - Gallery Enabled - Title - Full Image -->
                      <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="BEDROOM DESIGN" href="<%=request.getContextPath()%>/img/works/work1.jpg"> <span class="overlay-img"></span> <span
                        class="overlay-img-thumb font-icon-plus"></span>
                      </a>
                      <!-- Thumb Image and Description -->
                      <img src="<%=request.getContextPath()%>/img/works/work1.jpg"
                        alt="We always try to design for you have sweet dream and night. Just contact us right now.<br/>모던아는 항상 당신에게 달콤한 꿈과 밤을 주는 침실을 위해 최선을 다합니다.">
                    </div>
                  </li>
                  <!-- End Item Project -->
                  <!-- Item Project and Filter Name -->
                  <li class="item-thumbs col-lg-3 design" data-id="id-1" data-type="icon">
                    <!-- Fancybox - Gallery Enabled - Title - Full Image --> <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="STUDYROOM DESIGN" href="./img/works/work7.jpg"> <span
                      class="overlay-img"></span> <span class="overlay-img-thumb font-icon-plus"></span>
                  </a> <!-- Thumb Image and Description --> <img src="./img/works/work7.jpg"
                    alt="Try to let your children dream fantastic future by themselves.<br/>당신의 아이들이 스스로 환상적인 미래를 꿈꾸게 하세요.">
                  </li>
                  <!-- End Item Project -->
                  <!-- Item Project and Filter Name -->
                  <li class="item-thumbs col-lg-3 photography" data-id="id-2" data-type="illustrator">
                    <!-- Fancybox - Gallery Enabled - Title - Full Image --> <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="BATHROOM DESIGN" href="./img/works/work6.jpg"> <span
                      class="overlay-img"></span> <span class="overlay-img-thumb font-icon-plus"></span>
                  </a> <!-- Thumb Image and Description --> <img src="./img/works/work6.jpg"
                    alt="You can get calmness. Have time to recharge yourself.<br/>모던아의 욕실에서 평온함과 재충전의 시간을 가지세요.">
                  </li>
                  <!-- End Item Project -->
                  <!-- Item Project and Filter Name -->
                  <li class="item-thumbs col-lg-3 photography" data-id="id-2" data-type="illustrator">
                    <!-- Fancybox - Gallery Enabled - Title - Full Image --> <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="KITCHEN DESIGN" href="./img/works/work8.jpg"> <span
                      class="overlay-img"></span> <span class="overlay-img-thumb font-icon-plus"></span>
                  </a> <!-- Thumb Image and Description --> <img src="./img/works/work8.jpg"
                    alt="Delicious, Sweety, Tasty, Amazing, Comfortable, what you need more?<br/>맛있고 달콤하고 환상적인 음식, 편안한 주방. 모던아의 주방입니다.">
                  </li>
                  <!-- End Item Project -->
                  <!-- Item Project and Filter Name -->
                  <li class="item-thumbs col-lg-3 photography" data-id="id-2" data-type="illustrator">
                    <!-- Fancybox - Gallery Enabled - Title - Full Image --> <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="LIVINGROOM DESIGN" href="./img/works/work2.jpg"> <span
                      class="overlay-img"></span> <span class="overlay-img-thumb font-icon-plus"></span>
                  </a> <!-- Thumb Image and Description --> <img src="./img/works/work2.jpg"
                    alt="All the moments at home will be happy with us.<br/>모던아와 함께라면 가족들과 함께하는 시간이 즐거워집니다.">
                  </li>
                  <!-- End Item Project -->
                  <!-- Item Project and Filter Name -->
                  <li class="item-thumbs col-lg-3 photography" data-id="id-2" data-type="illustrator">
                    <!-- Fancybox - Gallery Enabled - Title - Full Image --> <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="BEDROOM DESIGN" href="./img/works/work3.jpg"> <span
                      class="overlay-img"></span> <span class="overlay-img-thumb font-icon-plus"></span>
                  </a> <!-- Thumb Image and Description --> <img src="./img/works/work3.jpg"
                    alt="Mordena style bedroom.<br/>모던아만의 심플하면서도 깔끔한 디자인의 침실입니다.">
                  </li>
                  <!-- End Item Project -->
                  <!-- Item Project and Filter Name -->
                  <li class="item-thumbs col-lg-3 photography" data-id="id-2" data-type="illustrator">
                    <!-- Fancybox - Gallery Enabled - Title - Full Image --> <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="LIVINGROOM DESIGN" href="./img/works/work4.jpg"> <span
                      class="overlay-img"></span> <span class="overlay-img-thumb font-icon-plus"></span>
                  </a> <!-- Thumb Image and Description --> <img src="./img/works/work4.jpg" style="width:260px; height:195px;"
                    alt="Sunshine, bright livingroom of Moderna<br/>햇살이 반겨주고, 언제나 환한 모던아 스타일의 거실 입니다.">
                  </li>
                  <!-- End Item Project -->
                  <!-- Item Project and Filter Name -->
                  <li class="item-thumbs col-lg-3 photography" data-id="id-2" data-type="illustrator">
                    <!-- Fancybox - Gallery Enabled - Title - Full Image --> <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="BATHROOM DESIGN" href="./img/works/work5.jpg"> <span
                      class="overlay-img"></span> <span class="overlay-img-thumb font-icon-plus"></span>
                  </a> <!-- Thumb Image and Description --> <img src="./img/works/work5.jpg" style="width:260px; height:195px;"
                    alt="Separted shower booth, dried bathroom.<br/>따로 만들어져 더욱 간편한 샤워부스와 건식 욕실입니다.">
                  </li>
                  <!-- End Item Project -->
                  <!-- Item Project and Filter Name -->
                  <li class="item-thumbs col-lg-3 photography" data-id="id-2" data-type="illustrator">
                    <!-- Fancybox - Gallery Enabled - Title - Full Image --> <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="CAFE DESIGN" href="./img/works/port1.jpg"> <span
                      class="overlay-img"></span> <span class="overlay-img-thumb font-icon-plus"></span>
                  </a> <!-- Thumb Image and Description --> <img src="./img/works/port1.jpg" style="width:260px; height:195px;"
                    alt="Enjoy! just Enjoy well!<br/>커피, 맥주, 칵테일로 유명한 EDIYA cafe 입니다.">
                  </li>
                  <!-- End Item Project -->
                  <!-- Item Project and Filter Name -->
                  <li class="item-thumbs col-lg-3 photography" data-id="id-2" data-type="illustrator">
                    <!-- Fancybox - Gallery Enabled - Title - Full Image --> <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="KIDS DESIGN" href="./img/works/port2.jpg" > <span
                      class="overlay-img"></span> <span class="overlay-img-thumb font-icon-plus"></span>
                  </a> <!-- Thumb Image and Description --> <img src="./img/works/port2.jpg" style="width:260px; height:195px;"
                    alt="Future of the world, Past of you.<br/>세계의 미래이자, 당신의 과거인 어린이들을 위한 유치원 입니다.">
                  </li>
                  <!-- End Item Project -->
                  <!-- Item Project and Filter Name -->
                  <li class="item-thumbs col-lg-3 photography" data-id="id-2" data-type="illustrator">
                    <!-- Fancybox - Gallery Enabled - Title - Full Image --> <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="KARAOKE DESIGN" href="./img/works/port3.jpg" > <span
                      class="overlay-img"></span> <span class="overlay-img-thumb font-icon-plus"></span>
                  </a> <!-- Thumb Image and Description --> <img src="./img/works/port3.jpg" style="width:260px; height:195px;"
                    alt="Let's sing and dance all night!<br/>노래부르고 춤 추고 싶어지는 노래방 인테리어 역시 모던아 입니다.">
                  </li>
                  <!-- End Item Project -->
                  <!-- Item Project and Filter Name -->
                  <li class="item-thumbs col-lg-3 photography" data-id="id-2" data-type="illustrator">
                    <!-- Fancybox - Gallery Enabled - Title - Full Image --> <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="CAFE DESIGN" href="./img/works/port4.jpg" > <span
                      class="overlay-img"></span> <span class="overlay-img-thumb font-icon-plus"></span>
                  </a> <!-- Thumb Image and Description --> <img src="./img/works/port4.jpg" style="width:260px; height:195px;"
                    alt="Would you like some coffee? let's go that cafe!<br/>커피처럼 당신을 따뜻하게 만들어주는 카페 인테리어 역시 모던아 입니다.">
                  </li>
                  <!-- End Item Project -->
                  <!-- Item Project and Filter Name -->
                  <li class="item-thumbs col-lg-3 photography" data-id="id-2" data-type="illustrator">
                    <!-- Fancybox - Gallery Enabled - Title - Full Image --> <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="KIDS DESIGN" href="./img/works/port5.jpg" > <span
                      class="overlay-img"></span> <span class="overlay-img-thumb font-icon-plus"></span>
                  </a> <!-- Thumb Image and Description --> <img src="./img/works/port5.jpg" style="width:260px; height:195px;"
                    alt="Play, Run, Enjoy, Shout at the same time with safe<br/>당신의 소중한 자녀를 항상 안전하게 지켜줄 유치원 인터레어 역시 모던아 입니다.">
                  </li>
                  <!-- End Item Project -->
                  <!-- Item Project and Filter Name -->
                  <li class="item-thumbs col-lg-3 photography" data-id="id-2" data-type="illustrator">
                    <!-- Fancybox - Gallery Enabled - Title - Full Image --> <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="GOLF DESIGN" href="./img/works/port6.jpg" > <span
                      class="overlay-img"></span> <span class="overlay-img-thumb font-icon-plus"></span>
                  </a> <!-- Thumb Image and Description --> <img src="./img/works/port6.jpg" style="width:260px; height:195px;"
                    alt="I don't know. Where is my stress?<br/>쌓인 스트레스도 저 멀리 날려보내는 골프 연습 룸 디자인도 모던아에 문의하세요.">
                  </li>
                  <!-- End Item Project -->
                  <!-- Item Project and Filter Name -->
                  <li class="item-thumbs col-lg-3 photography" data-id="id-2" data-type="illustrator">
                    <!-- Fancybox - Gallery Enabled - Title - Full Image --> <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="RESTAURANT DESIGN" href="./img/works/port7.jpg"> <span
                      class="overlay-img"></span> <span class="overlay-img-thumb font-icon-plus"></span>
                  </a> <!-- Thumb Image and Description --> <img src="./img/works/port7.jpg" style="width:260px; height:195px;"
                    alt="I am still hungry because I am in Moderna!<br/>편안함과 깔끔함을 동시에 만족시켜 손님을 더 배고프게 만드는 레스토랑 디자인 입니다.">
                  </li>
                  <!-- End Item Project -->
                  <!-- Item Project and Filter Name -->
                  <li class="item-thumbs col-lg-3 photography" data-id="id-2" data-type="illustrator">
                    <!-- Fancybox - Gallery Enabled - Title - Full Image --> <a class="hover-wrap fancybox" data-fancybox-group="gallery" title="HOSPITAL DESIGN" href="./img/works/port8.jpg" > <span
                      class="overlay-img"></span> <span class="overlay-img-thumb font-icon-plus"></span>
                  </a> <!-- Thumb Image and Description --> <img src="./img/works/port8.jpg" style="width:260px; height:195px;"
                    alt="Han Hospital designed by Moderna designers<br/>유명한 한병원. 화이트 컬러를 사용하여 깔끔한 느낌입니다.">
                  </li>
                  <!-- End Item Project -->
                </ul>
              </section>
            </div>
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
                <strong>Moderna Interior</strong><br> 5F, 14, Jong-ro, Jongno-gu, Seoul, Republic of Korea<br>
              </address>
              <p>
                <i class="icon-phone"></i> (+82) 070-5882-8989<br> <i class="icon-envelope-alt"></i> moderna@moderna.com
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
                <li><a href="#">BEDROOM designed by Mr.Park</a></li>
                <li><a href="#">STUDYROOM designed by Mr.Han</a></li>
                <li><a href="#">BATHROOM designed by Mr.Yun</a></li>
                <li><a href="#">EDIYA cafe designed Moderna</a></li>
                <li><a href="#">ATWOSOME cafe designed by Mr.Park</a></li>
              </ul>
            </div>
          </div>
          <div class="col-lg-3">
            <div class="widget">
              <h5 class="widgetheading">Moderna photostream</h5>
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
                <p>&copy; Moderna Interior. All right reserved.</p>
                <div class="credits">
                  <!-- 
                                All the links in the footer should remain intact. 
                                You can delete the links only if you purchased the pro version.
                                Licensing information: https://bootstrapmade.com/license/
                                Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=Moderna
                            -->
                  <a href="https://bootstrapmade.com/">For your life, By your life, Of your life</a>
                </div>
              </div>
            </div>
            <div class="col-lg-6">
              <ul class="social-network">
                <li><a href="https://www.facebok.com" data-placement="top" title="Facebook"><i class="fa fa-facebook"></i></a></li>
                <li><a href="https://www.twitter.com" data-placement="top" title="Twitter"><i class="fa fa-twitter"></i></a></li>
                <!-- <li><a href="#" data-placement="top" title="Linkedin"><i class="fa fa-linkedin"></i></a></li>
                <li><a href="#" data-placement="top" title="Pinterest"><i class="fa fa-pinterest"></i></a></li>
                <li><a href="#" data-placement="top" title="Google plus"><i class="fa fa-google-plus"></i></a></li> -->
              </ul>
            </div>
          </div>
        </div>
      </div>
    </footer>
  </div>
  <a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>

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