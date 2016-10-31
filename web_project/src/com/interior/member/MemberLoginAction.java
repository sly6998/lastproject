package com.interior.member;

import java.io.PrintWriter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.interior.controller.Action;
import com.interior.controller.ActionForward;

public class MemberLoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
		  
	    HttpSession session= request.getSession();
	    MemberDAO memberdao = new MemberDAO();
	    MemberBean member = new MemberBean();
	    
	    int result = -1;
	    boolean save_cookie = Boolean.parseBoolean(request.getParameter("save_id"));
	    
	    member.setMEMBER_ID(request.getParameter("MEMBER_ID"));
	    member.setMEMBER_PWD(request.getParameter("MEMBER_PWD"));
	    
	    result = memberdao.isMember(member,request);
	    if(result == 0){
	      response.setContentType("text/html;charset=utf-8");
	      PrintWriter out =response.getWriter();
	      out.println("<script>");
	      out.println("alert('비밀번호가 일치하지 않습니다.');");
	      out.println("location.href='./mainpage.html';");
	      out.println("</script>");
	      out.close();
	      return null;
	    }else if(result == -1){
	      response.setContentType("text/html;charset=utf-8");
	      PrintWriter out =response.getWriter();
	      out.println("<script>");
	      out.println("alert('아이디가 존재하지 않습니다.');");
	      out.println("location.href='./mainpage.html';");
	      out.println("</script>");
	      out.close();
	      return null;
	    }
	    //로그인 성공
	    session.setAttribute("MEMBER_ID", member.getMEMBER_ID());
	    System.out.println("로그인 성공");
	    
		if(save_cookie==true){
			Cookie cookie = new Cookie("save_id",member.getMEMBER_ID());
			cookie.setMaxAge(60*60*24*7);//일주일
			cookie.setPath("/");
			response.addCookie(cookie);
		}else{
			Cookie cookie = new Cookie("save_id",null);
			cookie.setMaxAge(0);
			cookie.setPath("/");
			response.addCookie(cookie);
		}
	    forward.setRedirect(true);
	    forward.setPath("./mainpage.html");
	    return forward;
	}

}
