package com.interior.noti;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.interior.controller.Action;
import com.interior.controller.ActionForward;

public class NotiReplyModifyAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf-8");
		
		ActionForward forward = new ActionForward();
		boolean result=false;
		
		int num2 = Integer.parseInt(request.getParameter("NOTI_REPLY_NUM"));
		
		NotiDAO notidao = new NotiDAO();
		NotiReplyBean notireplydata = new NotiReplyBean();
		
		boolean usercheck = notidao.isNotiReplyWriter(num2, request.getParameter("NOTI_REPLY_MEMBER_ID"));
		
		if(usercheck == false){
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('who the fuck you are?')");
			out.println("location.href='./NotiList.bo';");
			out.println("</script>");
			return null;
		}
		try{
			notireplydata.setNOTI_REPLY_NUM(num2);
			notireplydata.setNOTI_REPLY_CONTENT(request.getParameter("NOTI_REPLY_CONTENT"));
			
			result = notidao.NotiReplyModify(notireplydata);
			
			if(result == false){
				System.out.println("NotiReplyModifyAction failed");
				return null;
			}
			System.out.println("NotiReplyModifyAction completed!");
			
			forward.setRedirect(true);
			forward.setPath("./NotiReplyDetailAction.bo?num="+notireplydata.getNOTI_REPLY_NUM());
			//return forward
		}catch(Exception e){
			e.printStackTrace();
		}
		return forward;
	}
}