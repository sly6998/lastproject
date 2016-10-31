package com.interior.noti;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.interior.controller.Action;
import com.interior.controller.ActionForward;

public class NotiReplyDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf-8");
		ActionForward forward = new ActionForward();
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		boolean result = false;
		boolean usercheck = false;
		int num = Integer.parseInt(request.getParameter("num"));
		
		NotiDAO notidao = new NotiDAO();
		usercheck = notidao.isNotiReplyWriter(num, id);
		
		if(usercheck==false){
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('you cannot delete it.')");
			out.println("location.href='./NotiList.bo';");
			out.println("</script>");
			out.close();
			return null;
		}
		
		return null;
	}

	
	
}
