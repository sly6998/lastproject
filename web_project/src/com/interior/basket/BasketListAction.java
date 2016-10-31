package com.interior.basket;

import java.util.ArrayList;
import java.util.List;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.interior.controller.Action;
import com.interior.controller.ActionForward;

public class BasketListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
		BasketDAO basketdao = new BasketDAO();
		List basketList = new ArrayList();
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("MEMBER_ID");
		
		basketList = basketdao.getBasketList(id);// 리스트를 받아옴

		request.setAttribute("basketList", basketList);

		forward.setRedirect(false);
		forward.setPath("./basket/basket_list.jsp");

		return forward;
	}

}
