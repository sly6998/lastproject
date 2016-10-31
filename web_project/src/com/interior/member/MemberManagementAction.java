package com.interior.member;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.interior.controller.Action;
import com.interior.controller.ActionForward;

public class MemberManagementAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		String ID = (String) session.getAttribute("MEMBER_ID");

		if (ID == null || !(ID.equals("admin"))) {
			forward.setRedirect(true);
			forward.setPath("./member/mainpage.html");
			return forward;
		}

		MemberDAO memberdao = new MemberDAO();
		List boardlist = new ArrayList();
		
		/* 검색 기능*/
		String srchKey = request.getParameter("srchKey");
		String srchFlds = request.getParameter("srchFlds");
		String cond = null;
		if(srchKey == null || srchKey.equals("")){
			cond = null;
			
		}else if(srchFlds.equals("all")){
			String whereFmt = "upper(MEMBER_NUM) like '%%'|| upper('%s') || '%%'"
					+"or upper(MEMBER_ID) like '%%'|| upper('%s') || '%%'"
					+"or upper(MEMBER_NAME) like '%%'|| upper('%s') || '%%'";
			cond = String.format(whereFmt, srchKey, srchKey, srchKey);
			
		}else if(srchFlds.equals("num")){
			String whereFmt="upper(MEMBER_NUM) like'%%'|| upper('%s') || '%%'";
			cond = String.format(whereFmt, srchKey);
			
		}else if(srchFlds.equals("id")){
			String whereFmt="upper(MEMBER_ID) like'%%'|| upper('%s') || '%%'";
			cond = String.format(whereFmt, srchKey);
			
		}else if(srchFlds.equals("name")){
			String whereFmt="upper(MEMBER_NAME) like'%%'|| upper('%s') || '%%'";
			cond = String.format(whereFmt, srchKey);
		}
		/* 			*/

		int page = 1;
		int limit = 10;

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		int listcount = memberdao.getListCount(cond);// 총 리스트 수를 받아 옴
		boardlist = memberdao.getMemberList(page, limit, cond);// 리스트를 받아옴

		// 총 페이지 수
		int maxpage = (int) ((double) listcount / limit + 0.95);// 0.95를 더해서 올림
																// 처리
		// 현재 페이지에 보여줄 시작 페이지 수(1,11,21....)
		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		// 현재 페이지에 보여줄 마지막 페이지 수(10,20,30 ...)
		int endpage = maxpage;

		if (endpage > startpage + 10 - 1)
			endpage = startpage + 10 - 1;

		request.setAttribute("page", page);// 현재 페이지 수
		request.setAttribute("maxpage", maxpage);// 최대 페이지 수
		request.setAttribute("startpage", startpage);// 현재 페이지에 표시할 첫 페이지 수
		request.setAttribute("endpage", endpage);// 현재 페이지에 표시할 끝 페이지 수
		request.setAttribute("listcount", listcount);// 글 수
		request.setAttribute("boardlist", boardlist);
		
		request.setAttribute("srchKey", srchKey);
		request.setAttribute("srchFlds", srchFlds);

		forward.setRedirect(false);
		forward.setPath("./member/member_management.jsp");

		return forward;
	}
}
