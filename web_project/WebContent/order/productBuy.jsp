<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.interior.order.*"%>

<%
  String id = (String) session.getAttribute("MEMBER_ID");
			List basketlist = (List) request.getAttribute("basketlist");
			OrderBean memberlist = (OrderBean) request.getAttribute("memberlist");
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
<script src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script>
//우편번호 검색
function execDaumPost() {
 new daum.Postcode(
   {
    oncomplete : function(data) {
     var fullAddr = ''; 
     var extraAddr = ''; 

     if (data.userSelectedType === 'R') { 
      fullAddr = data.roadAddress;

     } else { 
      fullAddr = data.jibunAddress;
     }

     if (data.userSelectedType === 'R') {
      if (data.bname !== '') {
       extraAddr += data.bname;
      }
      if (data.buildingName !== '') {
       extraAddr += (extraAddr !== '' ? ', '
         + data.buildingName : data.buildingName);
      }
      fullAddr += (extraAddr !== '' ? ' (' + extraAddr
        + ')' : '');
     }

     document.getElementById('item_getzip').value = data.zonecode; 
     document.getElementById('item_getaddr1').value = fullAddr;
     document.getElementById('item_getaddr2').focus();
    }
   }).open();
}

	function buyfunction() {
		var select = document.getElementById("buytype");
		var buytype_value = select.options[select.selectedIndex].value;
		var price_sum = $('#price_sum').val();
		var membername = $('#membername').html();
		var memberphone = $('#memberphone').html();
		var memberemail = $('#memberemail').html();

		/* 
		아임포트 계정 : testbuyer@test.com / q!123456
		 */
		var IMP = window.IMP; // 생략가능
		IMP.init('imp97371231'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

		IMP.request_pay({
			pg : 'nice',
			pay_method : buytype_value,
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : '(주)MODERNA 상품 결제',
			amount : price_sum,
			buyer_email : memberemail,
			buyer_name : membername,
			buyer_tel : memberphone,
		}, function(rsp) {
			if (rsp.success) {
				$('#payment_status').val(rsp.status);
				$('#payment_num').val(rsp.merchant_uid);
				/* ready(미결제), paid(결제완료), cancelled(결제취소, 부분취소포함), failed(결제실패) */
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
				alert(msg);
				return;
			}
			document.buyform.submit();
			 return;
		});
	}
</script>
<style>
input{
border-top: 0px;;
border-left: 0px;;
border-right: 0px;;
height: 40px;
}
</style>
<title></title>
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
              <li class="active">Member > Product Buy</li>
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
            <h3>상품 주문하기</h3>
            <br> <br>

            <form method="post" name="buyform" action="./payment.html">
              <input type="hidden" value="" id="payment_status" name="payment_status"> <input type="hidden" value="" id="payment_num" name="payment_num"> <span><font size="4"><b>주문상품</b></font></span>
              <hr width="100%">
              <table class="table table-hover" width="100%">
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
                </tr>
                <% int total_price = 0; %>
                <%
                  for (int i = 0; i < basketlist.size(); i++) {
                    OrderBean ol = (OrderBean) basketlist.get(i);
                %>
                <tr>
                  <td align="center" style="vertical-align: middle;"><img id="item_img" src="<%=ol.getORDER_ITEM_IMG()%>" id="basket_img" width="200"></td>
                  <input type="hidden" name="item_img" value="<%=ol.getORDER_ITEM_IMG()%>">

                  <td align="center" style="vertical-align: middle;"><span id="basket_name"><%=ol.getORDER_ITEM_NAME()%></span>
                  <input type="hidden" name="item_name" value="<%=ol.getORDER_ITEM_NAME()%>"><br> 
                  <span id="item_type"><%=ol.getORDER_ITEM_TYPE()%></span>
                  <input type="hidden" name="item_type" value="<%=ol.getORDER_ITEM_TYPE()%>">
                  </td>

                  <td align="center" style="vertical-align: middle;">
                  <span id="item_amount" style="display: inline; text-align: center;"> <%=ol.getORDER_ITEM_AMOUNT()%></span>
                  <input type="hidden" name="item_amount" value="<%=ol.getORDER_ITEM_AMOUNT()%>">
                  </td>

                  <td align="center" style="vertical-align: middle;">
                  <span id="item_price"><%=String.format("%,d", ol.getORDER_ITEM_PRICE())%> 원<br></span>
                  <input type="hidden" name="item_price" value="<%=ol.getORDER_ITEM_PRICE()%>">
                  </td>
                </tr>
                <%
                  total_price +=ol.getORDER_ITEM_PRICE_SUM();
                  }
                %>
                <tr>
                  <td colspan="4" align="right"><sapn> 
                    <font size="4"><b>총 결제 금액</b>&nbsp;&nbsp;<span><%=String.format("%,d", total_price)%> 원</sapn></font>
                    <input type="hidden" id="price_sum" name="price_sum" value="<%=total_price%>">
                  </td>
                </tr>
              </table>
              <br> <br> <br> <span><font size="4"><b>주문자 정보</b></font></span>
              <hr width="100%">
              <div class="col-md-4">
                <span style="margin-right: 30px;"><b>이름</b></span><span id="membername"><%=memberlist.getORDER_MEMBER_NAME()%></span>
                <input type="hidden" name="membername" value="<%=memberlist.getORDER_MEMBER_NAME()%>">
                <br><br> <span style="margin-right: 15px;"><b>이메일</b></span><span id="memberemail"><%=memberlist.getORDER_MEMEBER_EMAIL()%></span><br>
                <input type="hidden" name="memberemail" value="<%=memberlist.getORDER_MEMEBER_EMAIL()%>">
              </div>
              <div class="col-md-8">
                <span style="margin-right: 30px;"><b>연락처</b></span><span id="memberphone"><%=memberlist.getORDER_MEMBER_TEL()%></span><br> <br>
                <input type="hidden" name="memberphone" value="<%=memberlist.getORDER_MEMBER_TEL()%>">
              </div>
              <br> <br> <br> <br> <br> <br> <br> <br> <span><font size="4"><b>배송지 정보</b></font></span>
              <hr width="100%">
              <div class="col-md-4">
                <span style="margin-right: 30px;"><b>수령인</b></span><input type="text" name="item_getname" id="item_getname" value="<%=memberlist.getORDER_MEMBER_NAME()%>"><br><br>
              </div>
              <div class="col-md-8">
                <span style="margin-right: 30px;"><b>연락처</b></span><input type="text" name="item_getphone" id="item_getphone" value="<%=memberlist.getORDER_MEMBER_TEL()%>"><br><br>
              </div>
              <div class="col-md-12">
                <span><b>주소</b></span><br> 
                <input type="text" name="item_getzip" id="item_getzip" size="15" value="<%=memberlist.getORDER_MEMBER_ZIP()%>"><input type="button" style="margin-left: 30px;"value="Search" onclick="execDaumPost()" class="btn-default-1 btn"></td><br> <input type="text" 
                  id="item_getaddr1" name="item_getaddr1" size="50"value="<%=memberlist.getORDER_MEMBER_ADDR_1()%>"><br> <input type="text" id="item_getaddr2"
                  size ="50" name="item_getaddr2" value="<%=memberlist.getORDER_MEMBER_ADDR_2()%>"><br>
              </div>
              <div class="col-md-12"><br>
              <span><b>주문 메세지</b></span><br>
                <textarea rows="5" style="width: 56%; resize: none;" name="order_memo" id="order_memo"></textarea>
                <br> <br> <br> <br> <br> <br>
              </div>
              <span><font size="4"><b>결제 정보</b></font></span>
              <hr width="100%">
              <span style="margin-right: 30px;"><b>결제 방식</b></span> 
              <select size="1" class="form-control-u" style="width: 120px;"name="buytype" id="buytype">&nbsp;&nbsp;
                <option value="">선택</option>
                <option value="phone">휴대폰소액결제</option>
                <option value="card">신용카드</option>
                <option value="vbank">가상계좌</option>
                <option value="trans">실시간계좌이체</option>
              </select><br> <br> <br> <br>
              <div class="col-md-12" align="center">
                <input class="btn"type="button" value="결제" onclick="buyfunction()">&nbsp;&nbsp;&nbsp; <input class="btn" type="button" value="취소">
              </div>
            </form>
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