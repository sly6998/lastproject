package com.interior.item;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interior.controller.Action;
import com.interior.controller.ActionForward;

public class ItemReplyModifyViewAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf-8");
		ActionForward forward = new ActionForward();

		ItemDAO itemdao = new ItemDAO();
		ItemBean ssibal = new ItemBean(); //본문 내용
		List replylist = new ArrayList<>(); // 불러온 댓글
		ItemBean item_reply = new ItemBean(); //수정할 댓글
		

		int num1 = Integer.parseInt(request.getParameter("ITEM_NUM"));//본문 시퀀스
		int num2 = Integer.parseInt(request.getParameter("ITEM_REPLY_SEQ"));//댓글 시퀀스
		
		
		ssibal = itemdao.ItemReplyModifyView(num1,num2, request);

		
		
		if (ssibal == null) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('시스템 오류. 관리자에게 연락바람');");
			out.println("</script>");
			out.close();
			return null;
		}

		System.out.println("공지사항 댓글 수정페이지 보기 성공");
		replylist = (List) request.getAttribute("replylist");
		item_reply = (ItemBean) request.getAttribute("modify_re");

		request.setAttribute("ssibal", ssibal);
		request.setAttribute("replylist", replylist);
		request.setAttribute("item_reply", item_reply);
		

		forward.setRedirect(false);
		forward.setPath("./product/product_reply_modify_view.jsp");
		return forward;
	}
}
