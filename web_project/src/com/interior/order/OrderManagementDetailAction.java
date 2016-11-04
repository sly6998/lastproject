package com.interior.order;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.interior.controller.Action;
import com.interior.controller.ActionForward;

public class OrderManagementDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("MEMBER_ID");
		String trade_num = (String)request.getParameter("trade_num");
		OrderDAO orderdao = new OrderDAO();
		List orderdetail = new ArrayList();


		orderdetail = orderdao.getOrderManagementDetail(trade_num);// 상세페이지를 받아옴

		request.setAttribute("orderdetail", orderdetail);

		forward.setRedirect(false);
		forward.setPath("./order/order_management_detail.jsp");

		return forward;
	}

}
