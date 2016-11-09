package com.interior.order;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.Out;

import com.interior.basket.BasketDAO;
import com.interior.controller.Action;
import com.interior.controller.ActionForward;

public class paymentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("utf-8");

	    //ActionForward forward = new ActionForward();
	    HttpSession session = request.getSession();
	    String id = (String) session.getAttribute("MEMBER_ID");
	    
	    OrderDAO orderdao = new OrderDAO();
	    OrderBean order = new OrderBean();
	    
	    
	    boolean result = false;
	    
	    order.setORDER_TRADE_STATUS(request.getParameter("payment_status"));//결제상태	
	    order.setORDER_TRADE_NUM(request.getParameter("payment_num"));//주문번호
	    order.setORDER_ITEM_IMG(request.getParameter("item_img"));//제품이미지
	    order.setORDER_ITEM_NAME(request.getParameter("item_name"));//제품명
	    order.setORDER_ITEM_TYPE(request.getParameter("item_type"));//제품옵션
	    order.setORDER_ITEM_AMOUNT(Integer.parseInt(request.getParameter("item_amount")));//제품 주문 수량
	    order.setORDER_ITEM_PRICE(Integer.parseInt(request.getParameter("item_price")));//제품 가격
	    order.setORDER_ITEM_PRICE_SUM(Integer.parseInt(request.getParameter("price_sum")));//결제 총 금액
	    order.setORDER_MEMO(request.getParameter("order_memo"));
	    order.setORDER_TRADE_TYPE(request.getParameter("buytype"));
	    
	    order.setORDER_MEMBER_ID(id);
	    order.setORDER_MEMBER_NAME(request.getParameter("membername"));//회원 이름
	    order.setORDER_MEMBER_TEL(request.getParameter("memberphone"));//회원 연락처
	    order.setORDER_MEMEBER_EMAIL(request.getParameter("buyemail"));//주문 이메일
	
	    order.setORDER_NAME(request.getParameter("item_getname"));//수취인 이름
	    order.setORDER_TEL(request.getParameter("item_getphone"));//수취인 연락처
	    order.setORDER_ZIP(request.getParameter("item_getzip"));//수취인 주소
	    order.setORDER_ADDR_1(request.getParameter("item_getaddr1"));//수취인 주소
	    order.setORDER_ADDR_2(request.getParameter("item_getaddr2"));//수취인 주소
	    
	    
	    result = orderdao.paymentInsert(order);
	    
	    if(result == false){
	    	response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('결제가 실패 되었습니다.');");
			out.println("location.href='./mainpage.html';");
			out.println("</script>");
			out.close();
	        return null;
	    }else if(result == true){
	    	response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			BasketDAO basket = new BasketDAO();
			basket.basket_all_delete(id);//장바구니 비우기
			out.println("<script>");
			out.println("alert('결제가 성공적으로 완료 되었습니다.');");
			out.println("location.href='./OrderList.html'");
			out.println("</script>");
			out.close();
	    }
	    //forward.setRedirect(true);
	    //forward.setPath("./OrderList.html");
	    return null;
	}

}
