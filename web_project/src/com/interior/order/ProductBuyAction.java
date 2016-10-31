package com.interior.order;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interior.controller.Action;
import com.interior.controller.ActionForward;

public class ProductBuyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		 request.setCharacterEncoding("utf-8");
		  ActionForward forward = new ActionForward();

		  forward.setRedirect(false);
		  forward.setPath("./order/productBuy.jsp");
		  
		  return forward;
	}

}
