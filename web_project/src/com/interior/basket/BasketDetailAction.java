package com.interior.basket;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interior.controller.Action;
import com.interior.controller.ActionForward;


public class BasketDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		 
		  request.setCharacterEncoding("utf-8");
		  ActionForward forward = new ActionForward();

		  BasketDAO basketdao = new BasketDAO();
		  BasketBean basketdata = new BasketBean();

		 int num = Integer.parseInt(request.getParameter("BASKET_NUM"));
		 basketdata = basketdao.getDetail(num);//게시글 보기
	
		  if (basketdata == null) {
		    System.out.println("질문게시판 상세보기 시스템 에러");
		    return null;
		  }

		  System.out.println("질문게시판 상세보기 성공");
		  
		  request.setAttribute("basketdata", basketdata);

		  forward.setRedirect(false);
		  forward.setPath("./basket/basket_detail.jsp");
		  
		  return forward;
	}

}
