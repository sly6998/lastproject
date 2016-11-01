package com.interior.order;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.interior.basket.BasketBean;
import com.interior.basket.BasketDAO;
import com.interior.controller.Action;
import com.interior.controller.ActionForward;

public class ProductBuyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ActionForward forward = new ActionForward();
		OrderDAO orderdao = new OrderDAO();
		List basketlist = new ArrayList();
		OrderBean memberlist = new OrderBean();
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("MEMBER_ID");
			
		basketlist = orderdao.getBasket_info_List(id);// 장바구니 내역 가져오기
		memberlist = orderdao.getmember_info_List(id);// 회원정보 가져오기

		request.setAttribute("basketlist", basketlist);
		request.setAttribute("memberlist", memberlist);
		  
		forward.setRedirect(false);
		forward.setPath("./order/productBuy.jsp");
		  
		  return forward;
	}

}
