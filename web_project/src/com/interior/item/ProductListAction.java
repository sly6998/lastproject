package com.interior.item;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interior.controller.Action;
import com.interior.controller.ActionForward;

public class ProductListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward = new ActionForward();

		ItemDAO itemdao = new ItemDAO();
		List itemlist = new ArrayList();
		response.setContentType("text/html;charset=utf-8");

		int page = 1;
		int limit = 9;

		/* 검색 기능*/
		String srchKey = request.getParameter("srchKey");
		String srchFlds = request.getParameter("srchFlds");
		String cond = null;
		if(srchKey == null || srchKey.equals("")){
			cond = null;
			
		}else if(srchFlds.equals("all")){
			String whereFmt = "upper(NOTI_SUBJECT) like '%%'|| upper('%s') || '%%'"
					+"or upper(NOTI_MEMBER_NAME) like '%%'|| upper('%s') || '%%'"
					+"or upper(NOTI_CONTENT) like '%%'|| upper('%s') || '%%'";
			cond = String.format(whereFmt, srchKey, srchKey, srchKey);
			
		}else if(srchFlds.equals("sub")){
			String whereFmt="upper(NOTI_SUBJECT) like'%%'|| upper('%s') || '%%'";
			cond = String.format(whereFmt, srchKey);
			
		}else if(srchFlds.equals("au")){
			String whereFmt="upper(NOTI_MEMBER_NAME) like'%%'|| upper('%s') || '%%'";
			cond = String.format(whereFmt, srchKey);
			
		}else if(srchFlds.equals("con")){
			String whereFmt="upper(NOTI_CONTENT) like'%%'|| upper('%s') || '%%'";
			cond = String.format(whereFmt, srchKey);
		}
		
		/*
		*/
		
		
		
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		int listcount = itemdao.getListCount(cond);// 총 리스트 수를 받아 옴
		itemlist = itemdao.getItemList(page, limit, cond); // 제품 리스트를 받아옴

		// 총 페이지 수
		int maxpage = (int) ((double) listcount / limit + 0.95);// 0.95를 더해서 올림
																// 처리
		// 현재 페이지에 보여줄 시작 페이지 수(1,11,21....)
		int startpage = (((int) ((double) page / 9 + 0.9)) - 1) * 9 + 1;
		// 현재 페이지에 보여줄 마지막 페이지 수(10,20,30 ...)
		int endpage = maxpage;

		if (endpage > startpage + 9 - 1)
			endpage = startpage + 9 - 1;

		request.setAttribute("page", page);// 현재 페이지 수
		request.setAttribute("maxpage", maxpage);// 최대 페이지 수
		request.setAttribute("startpage", startpage);// 현재 페이지에 표시할 첫 페이지 수
		request.setAttribute("endpage", endpage);// 현재 페이지에 표시할 끝 페이지 수
		request.setAttribute("listcount", listcount);// 글 수
		request.setAttribute("itemlist", itemlist);
		
		request.setAttribute("srchKey", srchKey);
		request.setAttribute("srchFlds", srchFlds);

		forward.setRedirect(false);
		forward.setPath("./product/product_list.jsp");

		return forward;
	}

}
