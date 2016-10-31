package com.interior.basket;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.interior.controller.Action;
import com.interior.controller.ActionForward;
import com.interior.member.MemberBean;
import com.interior.member.MemberDAO;

public class AddBasketAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");

	    ActionForward forward = new ActionForward();
	    
	    BasketDAO basketdao = new BasketDAO();
	    BasketBean basketdata = new BasketBean();
	    HttpSession session = request.getSession();
	    String id = (String)session.getAttribute("MEMBER_ID");
	    
	    boolean result = false;
	    
	    basketdata.setBASKET_MEMBER_ID(id);
	    basketdata.setBASKET_ITEM_NAME(request.getParameter("item_name"));
	    basketdata.setBASKET_ITEM_TYPE(request.getParameter("item_type"));
	    basketdata.setBASKET_ITEM_PRICE(Integer.parseInt(request.getParameter("item_price")));
	    basketdata.setBASKET_AMOUNT(Integer.parseInt(request.getParameter("num")));
	    basketdata.setBASKET_ITEM_IMAGE(request.getParameter("hidden_img"));
	    
	    result = basketdao.addBasket(basketdata);
	    
	    
	    if(result == false){
	      System.out.println("장바구니 추가 실패");
	      return null;
	    }
	    
	    response.setContentType("text/html;charset=utf-8");
    	PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("var con_value = confirm('장바구니로 이동하시겠습니까?');");
		out.println("if(con_value==true){");
		out.println("location.href='./basketlist.html';");
		out.println("}else{");
		out.println("location.href='./product_list.html';");
		out.println("}");
		out.println("</script>");
		out.close();
	    
	    return null;
	}
}