package com.interior.noti;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interior.controller.Action;
import com.interior.controller.ActionForward;

public class NotiReplyWriteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf-8");
		ActionForward forward = new ActionForward();
		
		NotiDAO notidao = new NotiDAO();
		NotiBean notireplydata = new NotiBean();
		
		int num2 = Integer.parseInt(request.getParameter("NOTI_NUM"));
		
		
		boolean result = false;
		
		try{
			
			notireplydata.setNOTI_MEMBER_ID((String)request.getParameter("NOTI_REPLY_MEMBER_ID"));
			notireplydata.setNOTI_REPLY_CONTENT((String)request.getParameter("NOTI_REPLY_CONTENT"));
			notireplydata.setNOTI_REPLY_NUM(num2);
			
			result = notidao.notiInsert(notireplydata);
			
			
			if (result == false) {
				System.out.println("NOTI 댓글 등록 시스템 에러");
				return null;
			}
			
			System.out.println("NOTI 댓글 등록 성공");
			
			forward.setRedirect(true);
			forward.setPath("./noti_detail.html?NOTI_NUM="+num2);
			return forward;
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
}