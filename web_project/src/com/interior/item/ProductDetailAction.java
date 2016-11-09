package com.interior.item;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interior.controller.Action;
import com.interior.controller.ActionForward;
import com.interior.noti.NotiBean;
import com.interior.noti.NotiDAO;

public class ProductDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("utf-8");
		ActionForward forward = new ActionForward();

		ItemDAO notidao = new ItemDAO();
		ItemBean itemdata = null;
		List itemreplylist = new ArrayList();

		int item_seq = Integer.parseInt(request.getParameter("item_seq"));//제품 시퀀스

		itemdata = notidao.getItemDetail(item_seq);// 제품 상세보기

		if (itemdata == null) {
			System.out.println("제품 상세보기 에러");
			return null;
		}
		System.out.println("제품 상세보기 성공");

		request.setAttribute("itemdata", itemdata);
		request.setAttribute("itemreplylist", itemreplylist);

		forward.setRedirect(false);
		forward.setPath("./product/product_detail.jsp");

		return forward;
	}

}
