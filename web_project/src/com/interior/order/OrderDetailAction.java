package com.interior.order;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.interior.controller.Action;
import com.interior.controller.ActionForward;

public class OrderDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("MEMBER_ID");
		OrderDAO orderdao = new OrderDAO();
		List orderdetail = new ArrayList();


		orderdetail = orderdao.getOrderDetail(id);// 상세페이지를 받아옴

		request.setAttribute("orderdetail", orderdetail);

		forward.setRedirect(false);
		forward.setPath("./order/orderdetail.jsp");

		return forward;
	}

}
