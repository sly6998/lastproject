<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.interior.basket.*"%>
<%
  String id = (String) session.getAttribute("MEMBER_ID");
			List basketList = (List) request.getAttribute("basketList");
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
<script>
	function modify() {

		var num = $('#num').val();
		var amount = $('#basket_amount').html();

		location = "./BasketModify.html?num=" + num + "&amount=" + amount;
	}

	function submit_f(str) {

		if (str == 'modify') {
			basketform.action = './BasketModify.html';
		} else if (str == 'buy') {
			basketform.action = './ProductBuy.html';
		}

	}
	
	//수량변경
	$(function() {
		$('.bt_up').click(
				function() {
					var n = $('.bt_up').index(this);
					var num = $(".num:eq(" + n + ")").html();
					num = $(".num:eq(" + n + ")").html(num * 1 + 1);

				});
		$('.bt_down').click(
				function() {
					var n = $('.bt_down').index(this);
					var num = $(".num:eq(" + n + ")").html();
					num = $(".num:eq(" + n + ")").html(num * 1 - 1);
				});
	});
</script>
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
              <li class="active">Member > Basket</li>
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
            <h3>장바구니</h3>

            <form name="basketform" method="post">
              
              <table class="table table-hover" width="100%">
              <!-- 항목 (번호/제목 / 글쓴이 / 날짜 / 조회수 ) -->
              <tr align="center" style="background-color: #EFEFEF">
                <td style="font-size: 12pt; font-weight: bold; width: 250px;">
                  <div align="center">이미지</div>
                </td>

                <td align="center" style="font-size: 12pt; font-weight: bold;" height="26">
                  <div align="center">제품명</div>
                </td>

                <td align="center" style="font-size: 12pt; font-weight: bold;" width="150" height="26">
                  <div align="center">수량</div>
                </td>

                <td align="center" style="font-size: 12pt; font-weight: bold;" width="100" height="26">
                  <div align="center">가격</div>
                </td>
                <td align="center" style="font-size: 12pt; font-weight: bold;" width="100" height="26">
                  <div align="center">삭제</div>
                </td>
              </tr>

              <%
                for (int i = 0; i < basketList.size(); i++) {
                  BasketBean bl = (BasketBean) basketList.get(i);
              %>
              <tr>
                <td align="center" style="vertical-align:middle;">
                  <img src="<%=bl.getBASKET_ITEM_IMAGE()%>" id="basket_img" width="200">
                </td>

                <td align="center" style="vertical-align:middle;">
                  <a href="#" style='text-decoration: none;'><span id="basket_name"><%=bl.getBASKET_ITEM_NAME()%></span></a><br>
                  <span id="basket_type"><%=bl.getBASKET_ITEM_TYPE() %></span>
                </td>

                <td align="center" style="vertical-align:middle;">
                  <span name="basket_amount" id="basket_amount" class="num" size="1" style="display: inline; text-align: center; margin-right: 5px;"><%=bl.getBASKET_AMOUNT()%></span>
                  <img src="<%=request.getContextPath()%>/images/up_btn.png" alt="" width="10" valign="bottom" class="bt_up" />&nbsp;
                  <img src="<%=request.getContextPath()%>/images/down_btn.png" alt="" width="10" valign="top" class="bt_down" /><br><br>
                  <input type="hidden" name="num" id="num" value="<%=bl.getBASKET_NUM()%>">
                  <button type="button" class="btn" onclick="modify()">변경</td>
                </td>

                <td align="center" style="vertical-align:middle;">
                    <span id="basket_price"><%=bl.getBASKET_RESULT()%><br></span>
                </td>

                <td align="center" style="vertical-align:middle;">
                   <button type="button" class="btn" onclick="location.href='./BasketDelete.html?num=<%=bl.getBASKET_NUM()%>'">삭제</button>
                </td>

              </tr>

              <%
                }
              %>
              <tr>
                <td height="26"></td>
              </tr>
            </table>
              
              
              
              
              <table border="1">
                <tr>
                  <td>사진</td>
                  <td>제품명</td>
                  <td>수량</td>
                  <td>가격</td>
                  <td>삭제</td>

                </tr>

                <%
                  for (int i = 0; i < basketList.size(); i++) {
                    BasketBean bl = (BasketBean) basketList.get(i);
                %>
                <tr>
                  <td><img src="<%=bl.getBASKET_ITEM_IMAGE()%>" width="100"> <input type="hidden" name="product_img" value="<%=bl.getBASKET_ITEM_IMAGE()%>"></td>
                  <td>
                    <table>
                      <tr>
                        <td><a href="#"><%=bl.getBASKET_ITEM_NAME()%></a>
                        <td><input type="hidden" name="product_name" value="<%=bl.getBASKET_ITEM_NAME()%>">
                      </tr>
                      <tr>
                        <td>[옵션]<%=bl.getBASKET_ITEM_TYPE()%></td>
                        <input type="hidden" name="product_type" value="<%=bl.getBASKET_ITEM_TYPE()%>">
                      </tr>
                    </table>
                  </td>
                  <td><input type="text" name="amount" id="amount" size="1" value="<%=bl.getBASKET_AMOUNT()%>"><br> 
                  <input type="hidden" name="num" id="num"
                    value="<%=bl.getBASKET_NUM()%>"> <input type="submit" value="변경" onclick="submit_f('modify')"></td>
                  <td><span id="price"> <%=bl.getBASKET_RESULT()%>
                  </span> <input type="hidden" name="product_result" value="<%=bl.getBASKET_RESULT()%>"></td>
                  <td>
                    <button type="button" onclick="location.href='./BasketDelete.html?num=<%=bl.getBASKET_NUM()%>'">삭제</button>
                  </td>
                </tr>
                <%
                  }
                %>

              </table>



              <table>
                <tr>
                  <td>
                    <button type="button" onclick="location.href='./BasketDelete.html'">장바구니 비우기</button>
                  </td>
                  <td><input type="submit" value="주문하기" onclick="submit_f('buy')"></td>
                  <td>
                    <button type="button" onclick="location.href='./product_list.html'">쇼핑계속하기</button>
                  </td>
                </tr>
              </table>
            </form>




            <!-- 제품 상세설명 end -->
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