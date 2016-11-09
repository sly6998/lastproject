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

		ItemDAO itemdao = new ItemDAO();
		ItemBean itemdata = null;
		List itemreplylist = new ArrayList();
		int item_seq = Integer.parseInt(request.getParameter("item_seq"));//제품 시퀀스

		
		itemdata = itemdao.getItemDetail(item_seq);// 제품 상세보기
		int listcount2 = itemdao.getItemReplyListCount();// 총 리스트 수를 받아 옴(댓글)
		itemreplylist = itemdao.getItemReplyList(item_seq);// 리스트를 받아옴(댓글)

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
