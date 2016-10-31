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
		NotiReplyBean notireplydata = new NotiReplyBean();
		int result=0;
		
		notireplydata.setNOTI_REPLY_NUM(Integer.parseInt(request.getParameter("NOTI_REPLY_NUM")));
		notireplydata.setNOTI_REPLY_MEMBER_NAME(request.getParameter("NOTI_REPLY_MEMBER_NAME"));
		notireplydata.setNOTI_REPLY_CONTENT(request.getParameter("NOTI_REPLY_CONTENT"));
		notireplydata.setNOTI_REPLY_REF(Integer.parseInt(request.getParameter("NOTI_REPLY_REF")));
		notireplydata.setNOTI_REPLY_SEQ(Integer.parseInt(request.getParameter("NOTI_REPLY_SEQ")));
		notireplydata.setNOTI_REPLY_LEV(Integer.parseInt(request.getParameter("NOTI_REPLY_LEV")));
		
		result = notidao.NotiReplyWrite(notireplydata);
		
		if(result==0){
			System.out.println("NotiReplyWriteAction failed");
			return null;
		}
		System.out.println("NotiReplyWriteAction completed!");
		
		forward.setRedirect(true);
		forward.setPath("./NotiDetailAction.bo?num="+result);
		return forward;
	}
}