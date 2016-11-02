package com.interior.order;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.interior.basket.BasketDAO;
import com.interior.controller.Action;
import com.interior.controller.ActionForward;
import com.interior.review.ReviewDAO;

public class OrderListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("MEMBER_ID");
		OrderDAO orderdao = new OrderDAO();
		List orderlist = new ArrayList();


		orderlist = orderdao.getOrderList(id);// 리스트를 받아옴

		request.setAttribute("orderlist", orderlist);

		forward.setRedirect(false);
		forward.setPath("./order/order_list.jsp");

		return forward;
		
	}

}
