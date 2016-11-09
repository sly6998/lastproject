package com.interior.item;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interior.controller.Action;
import com.interior.controller.ActionForward;

public class ItemReplyWriteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf-8");
		ActionForward forward = new ActionForward();
		
		ItemDAO itemdao = new ItemDAO();
		ItemBean itemreplydata = new ItemBean();
		
		int num2 = Integer.parseInt(request.getParameter("ITEM_SEQ"));
		
		
		boolean result = false;
		
		try{
			
			itemreplydata.setITEM_REPLY_MEMBER_ID((String)request.getParameter("ITEM_REPLY_MEMBER_ID"));
			itemreplydata.setITEM_REPLY_CONTENT((String)request.getParameter("ITEM_REPLY_CONTENT"));
			itemreplydata.setITEM_REPLY_NUM(num2);
			
			result = itemdao.ItemReplyInsert(itemreplydata);
			
			
			if (result == false) {
				System.out.println("ITEM 댓글 등록 시스템 에러");
				return null;
			}
			
			System.out.println("ITEM 댓글 등록 성공");
			
			forward.setRedirect(true);
			forward.setPath("./item_detail.html?ITEM_SEQ="+num2);
			return forward;
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
}