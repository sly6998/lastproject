package com.interior.noti;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import com.interior.item.ItemBean;
import com.interior.qna.QnaBean;


public class NotiDAO {
	
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;
	public NotiDAO(){
		try{
			Context init = new InitialContext();
			ds=(DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
		}catch(Exception e){
			System.out.println("DB connection failed : "+e);
			return;
		}
	}

	public int getListCount(String cond) {//총 게시판 리스트 수
		// TODO Auto-generated method stub
		int count = 0;
		String sql = "select count(*) from noti";
		if (cond != null && !cond.equals("")) {
			sql = sql + " where " + cond;
		}
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				count = rs.getInt(1);
			}
		}catch(Exception e){
			System.out.println("getListCount error : "+e);
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(con!=null) try{con.close();}catch(SQLException ex){}
		}
		return count;
	}

	public List getNotiList(int page, int limit, String cond) {//게시판 리스트를 받아옴
		// TODO Auto-generated method stub
		String sql = "select * from " + 	
		"(select rownum rnum, noti_num, NOTI_MEMBER_NAME, noti_subject, noti_content," +
		"noti_readcount, noti_date from " +
		"(select * from noti order by " +
		"noti_date desc)) " +
		"where rnum>=? and rnum<=?";

		String sql_2 = "select * from " +
				"(select rownum rnum, noti_num, NOTI_MEMBER_NAME, noti_subject, noti_content," +
				"noti_readcount, noti_date from " +
				"(select * from noti where %s order by " +
				"noti_date desc)) " +
				"where rnum>=? and rnum<=?";
		
		if (cond != null && !cond.equals("")) {
			sql = String.format(sql_2, cond);
		}
		
		
		List list = new ArrayList();
		
		int startrow=(page-1)*10+1;
		int endrow=startrow+limit-1;
		try{
			con=ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, endrow);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				NotiBean noti = new NotiBean();
				noti.setNOTI_NUM(rs.getInt("NOTI_NUM"));
				noti.setNOTI_MEMBER_NAME(rs.getString("NOTI_MEMBER_NAME"));
				noti.setNOTI_SUBJECT(rs.getString("NOTI_SUBJECT"));
				noti.setNOTI_CONTENT(rs.getString("NOTI_CONTENT"));
				noti.setNOTI_READCOUNT(rs.getInt("NOTI_READCOUNT"));
				noti.setNOTI_DATE(rs.getDate("NOTI_DATE"));
				list.add(noti);
			}
			return list;
		}catch(Exception e){
			System.out.println("getNotiList error : "+e);
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(con!=null) try{con.close();}catch(SQLException ex){}
		}
		return null;
	}

	public boolean setReadCountUpdate(int num) {//공지사항 조회수 업데이트
		// TODO Auto-generated method stub
		String sql = "update noti set noti_readcount = "+
		"noti_readcount+1 where noti_num = "+num;
		int result = 0;
		try{
			con=ds.getConnection();
			pstmt = con.prepareStatement(sql);
			result = pstmt.executeUpdate();
			if(result==0){
				return false;
			}
			return true;
		}catch(Exception e){
			System.out.println("setReadCount error : "+e);
		}finally{
			try{
				if(pstmt!=null)pstmt.close();
				
				
				if(con!=null)con.close();
			}catch(Exception e) {}
		}
		return false;
	}

	public NotiBean getDetail(int num) throws Exception {//공지사항 글 보기(상세보기)
		// TODO Auto-generated method stub
		NotiBean noti = null;
				
		try{
			con=ds.getConnection();
			pstmt = con.prepareStatement("select * from noti where noti_num=?");
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				noti = new NotiBean();
				noti.setNOTI_NUM(rs.getInt("NOTI_NUM"));
				noti.setNOTI_MEMBER_ID(rs.getString("NOTI_MEMBER_ID"));
				noti.setNOTI_MEMBER_NAME(rs.getString("NOTI_MEMBER_NAME"));
				noti.setNOTI_SUBJECT(rs.getString("NOTI_SUBJECT"));
				noti.setNOTI_CONTENT(rs.getString("NOTI_CONTENT"));
				noti.setNOTI_READCOUNT(rs.getInt("NOTI_READCOUNT"));
				noti.setNOTI_DATE(rs.getDate("NOTI_DATE"));
			}
			return noti;
		}catch(Exception e){
			System.out.println("getDetail error : "+e);
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(con!=null) try{con.close();}catch(SQLException ex){}
		}
		return null;
	}

	public boolean notiInsert(NotiBean notidata) {//공지사항 글쓰기(관리자)
		// TODO Auto-generated method stub
		int num = 0;
		String sql = "";
		int result = 0;
		
		try{
			sql = "insert into noti (NOTI_NUM, NOTI_MEMBER_ID, NOTI_MEMBER_NAME, NOTI_SUBJECT, NOTI_CONTENT, NOTI_READCOUNT, NOTI_DATE) values (noti_seq.nextval,?,?,?,?,?,sysdate)";
			
			con=ds.getConnection();
			
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, notidata.getNOTI_MEMBER_ID());
			pstmt.setString(2, notidata.getNOTI_MEMBER_NAME());
			pstmt.setString(3, notidata.getNOTI_SUBJECT());
			pstmt.setString(4, notidata.getNOTI_CONTENT());
			pstmt.setInt(5, notidata.getNOTI_READCOUNT());
			
			result = pstmt.executeUpdate();
			if(result==0){
				return false; //0이 실패
			}
			return true;
		}catch(Exception e){
			System.out.println("notiInsert error : "+e);
			e.printStackTrace();
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(con!=null) try{con.close();}catch(SQLException ex){}
		}
		return false;
	}

	public NotiBean notimodifyview(int num) {//공지사항 수정할 글 불러오기(관리자)
		// TODO Auto-generated method stub
		NotiBean noti = null;
		try{
			con=ds.getConnection();
			pstmt = con.prepareStatement("select * from noti where NOTI_NUM=?");
			pstmt.setInt(1, num);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				noti = new NotiBean();
				noti.setNOTI_NUM(rs.getInt("NOTI_NUM"));
				noti.setNOTI_MEMBER_ID(rs.getString("NOTI_MEMBER_ID"));
				noti.setNOTI_MEMBER_NAME(rs.getString("NOTI_MEMBER_NAME"));
				noti.setNOTI_SUBJECT(rs.getString("NOTI_SUBJECT"));
				noti.setNOTI_CONTENT(rs.getString("NOTI_CONTENT"));
				noti.setNOTI_READCOUNT(rs.getInt("NOTI_READCOUNT"));
				noti.setNOTI_DATE(rs.getDate("NOTI_DATE"));
			}
			return noti;
		}catch(Exception e){
			System.out.println("notimodifyview error : "+e);
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(con!=null) try{con.close();}catch(SQLException ex){}
		}
		return null;
	}

	public boolean boardModify(NotiBean notidata) { //공지사항 수정 action(관리자)
		// TODO Auto-generated method stub
		String sql = "update noti set NOTI_SUBJECT=?,";
		sql+="NOTI_CONTENT=? where NOTI_NUM=?";
		int result =0;
		try{
			con=ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, notidata.getNOTI_SUBJECT());
			pstmt.setString(2, notidata.getNOTI_CONTENT());
			pstmt.setInt(3, notidata.getNOTI_NUM());
			result=pstmt.executeUpdate();
			
			if(result==0){
				return false;
			}
			
			return true;
		}catch(Exception e){
			System.out.println("boardModify error : "+e);
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(con!=null) try{con.close();}catch(SQLException ex){}
		}
		return false;
	}

	public boolean notidelete(int num) {//공지사항 글 삭제 action(관리자)
		// TODO Auto-generated method stub
		String noti_delete_sql = "delete from noti where NOTI_num=?";
		
		int result = 0;
		
		try{
			con=ds.getConnection();
			pstmt = con.prepareStatement(noti_delete_sql);
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate();
			if(result==0){
				return false;
			}
			return true;
		}catch(Exception e){
			System.out.println("notidelete error : "+e);
		}finally{
			try{
				if(pstmt!=null){
					pstmt.close();
				}
				if(con!=null){
					con.close();
				}
			}catch(Exception ex) {}
		}
		return false;
	}
	
			
			//공지사항 댓글 수정
			public boolean notireplymodify(NotiBean replymodify)throws Exception{
				String sql = "update noti_reply set noti_reply_content=? where noti_reply_num=?";
				
				try{
					con=ds.getConnection();
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, replymodify.getNOTI_REPLY_CONTENT());
					pstmt.setInt(2, replymodify.getNOTI_REPLY_NUM());
					pstmt.executeUpdate();
					return true;
				}catch(Exception e){
					System.out.println("NotiReplyModify error : "+e);
				}finally{
					if(rs!=null)try{rs.close();}catch(SQLException ex){}
					if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
					if(con!=null)try{con.close();}catch(SQLException ex){}
				}
				return false;
			}
			
			//공지사항 댓글 삭제
			public boolean NotiReplyDelete(int num){
				String sql = "delete from noti_reply where noti_reply_seq=?";
				
				int result=0;
				
				try{
					con=ds.getConnection();
					pstmt=con.prepareStatement(sql);
					pstmt.setInt(1, num);
					result=pstmt.executeUpdate();
					if(result==0){
						return false;
					}
					return true;
				}catch(Exception e){
					System.out.println("NotiReplyDelete error : "+e);
				}finally{
					if(rs!=null) try{rs.close();}catch(SQLException ex){}
					if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
					if(con!=null) try{con.close();}catch(SQLException ex){}
				}
				return false;
			}
			
		//공지사항 댓글 글쓴이 인지 확인
		public boolean isNotiReplyWriter(int num, String ID){
			System.out.println("ID = "+ID);
			String sql = "select * from noti_reply where noti_reply_num=?";
			
			try{
				con=ds.getConnection();
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, num);
				rs=pstmt.executeQuery();
				rs.next();
				
				if(ID.equals(rs.getString("NOTI_REPLY_MEMBER_ID"))){
					return true;
				}
			}catch(Exception e){
				System.out.println("isNotiReplyWriter error : "+e);
			}finally{
				try{
					if(pstmt!=null){
						pstmt.close();
					}
					if(con!=null){
						con.close();
					}
				}catch(Exception e){
					
				}
			}
			return false;
		}
		
		//공지사항 글에 달린 댓글 보여주기
		public List getNotiReplyList(int num2) {
			// TODO Auto-generated method stub
			String sql =  "select * from noti_reply where noti_reply_num=?";
			
			List list = new ArrayList();
			
			
			try{
				con=ds.getConnection();
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, num2);
				rs=pstmt.executeQuery();
				
				while(rs.next()){
					
					NotiBean noti2 = new NotiBean();
					noti2.setNOTI_REPLY_NUM(rs.getInt("NOTI_REPLY_NUM"));
					noti2.setNOTI_REPLY_MEMBER_ID(rs.getString("NOTI_REPLY_MEMBER_ID"));
					noti2.setNOTI_REPLY_MEMBER_NAME(rs.getString("NOTI_REPLY_MEMBER_NAME"));
					noti2.setNOTI_REPLY_CONTENT(rs.getString("NOTI_REPLY_CONTENT"));
					noti2.setNOTI_REPLY_DATE(rs.getDate("NOTI_REPLY_DATE"));
					noti2.setNOTI_REPLY_SEQ(rs.getInt("NOTI_REPLY_SEQ"));
					noti2.setNOTI_REPLY_REF(rs.getInt("NOTI_REPLY_REF"));
					noti2.setNOTI_REPLY_LEV(rs.getInt("NOTI_REPLY_LEV"));
					list.add(noti2);
					
				}
				
				return list;
			}catch(Exception e){
				System.out.println("getNotiReplyList error : "+e);
			}finally{
				if(rs!=null) try{rs.close();}catch(SQLException ex){}
				if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
				if(con!=null) try{con.close();}catch(SQLException ex){}
			}
			return null;
		}
		
		//공지사항 글의 댓글 수 구하기
		public int getNotiReplyListCount() {//qna 댓글 리스트의  수 구하기 
			// TODO Auto-generated method stub
			int count=0;
			
			try{
				con=ds.getConnection();
				pstmt=con.prepareStatement("select count(*) from noti_reply");
				rs=pstmt.executeQuery();
				
				if(rs.next()){
					count=rs.getInt(1);
				}
			}catch(Exception e){
				System.out.println("getNotiReplyListCount error : "+e);
			}finally{
				if(rs!=null) try{rs.close();}catch(SQLException ex){}
				if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
				if(con!=null) try{con.close();}catch(SQLException ex){}
			}
			return count;
		}
		
		//공지사항 글에 댓글 작성하기
		public boolean NotiReplyInsert(NotiBean notidata) {
			// TODO Auto-generated method stub
			int num = 0;
			String sql = "";
			int result = 0;
			
			try{
				sql = "insert into noti_reply "
						+ "(noti_REPLY_MEMBER_ID, noti_REPLY_CONTENT, noti_REPLY_DATE, noti_REPLY_NUM, noti_REPLY_SEQ) "
						+ "values (?,?,sysdate,?,noti_reply_seq.NEXTVAL)";
				
				con=ds.getConnection();
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, notidata.getNOTI_REPLY_MEMBER_ID());
				pstmt.setString(2, notidata.getNOTI_REPLY_CONTENT());
				pstmt.setInt(3, notidata.getNOTI_REPLY_NUM());
				
				
				result = pstmt.executeUpdate();
				if(result==0){
					return false; //0이 실패
				}
				return true;
			}catch(Exception e){
				System.out.println("NotiReplyInsert error : "+e);
				e.printStackTrace();
			}finally{
				if(rs!=null) try{rs.close();}catch(SQLException ex){}
				if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
				if(con!=null) try{con.close();}catch(SQLException ex){}
			}
			return false;
		}
		
		//공지사항 댓글 수정 화면으로 이동
		/*public List notireplymodifyview(int num2) {
			// TODO Auto-generated method stub
			NotiBean jotka = null;
			try{
				con=ds.getConnection();
				pstmt = con.prepareStatement("select * from noti_reply where noti_reply_num=?");
				pstmt.setInt(1, num2);
				
				rs=pstmt.executeQuery();
				List list = new ArrayList();

				
				if(rs.next()){
					jotka = new NotiBean();
					jotka.setNOTI_REPLY_SEQ(rs.getInt("NOTI_REPLY_SEQ"));
					jotka.setNOTI_REPLY_MEMBER_ID(rs.getString("NOTI_REPLY_MEMBER_ID"));
					jotka.setNOTI_REPLY_CONTENT(rs.getString("NOTI_REPLY_CONTENT"));
					jotka.setNOTI_REPLY_DATE(rs.getDate("NOTI_REPLY_DATE"));
					list.add(jotka);
				}
				return list;
			}catch(Exception e){
				System.out.println("notireplymodifyview error : "+e);
			}finally{
				if(rs!=null) try{rs.close();}catch(SQLException ex){}
				if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
				if(con!=null) try{con.close();}catch(SQLException ex){}
			}
			return null;
		}*/
		
		//공지사항 글과 댓글을 동시에 보여주기
		public NotiBean notireplymodifyview(int num1, int num2, HttpServletRequest request) {
			String sql = "select * from noti where noti_num=?";
			String sql_reply = "select * from noti_reply where noti_reply_num=? order by noti_reply_seq";
			String modify_reply = "select * from noti_reply where noti_reply_seq=?";
			int result = 0;
			int result_reply = 0;
			int noti_reply_seq = 0;
			NotiBean noti = null;
			NotiBean modify_re = null;
			List reply = new ArrayList<>();
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num1);
				rs = pstmt.executeQuery();
				while(rs.next()){
					result =1;
					noti = new NotiBean();
					noti.setNOTI_NUM(rs.getInt("NOTI_NUM"));
					noti.setNOTI_MEMBER_ID(rs.getString("NOTI_MEMBER_ID"));
					noti.setNOTI_MEMBER_NAME(rs.getString("NOTI_MEMBER_NAME"));
					noti.setNOTI_SUBJECT(rs.getString("NOTI_SUBJECT"));
					noti.setNOTI_CONTENT(rs.getString("NOTI_CONTENT"));
					noti.setNOTI_READCOUNT(rs.getInt("NOTI_READCOUNT"));
					noti.setNOTI_DATE(rs.getDate("NOTI_DATE"));
					
				}
				
				//댓글 불러오기
				pstmt = con.prepareStatement(sql_reply);
				pstmt.setInt(1, num1);
				rs = pstmt.executeQuery();
				while(rs.next()){
					result_reply =1;
					NotiBean noti2 = new NotiBean();
					noti2.setNOTI_REPLY_NUM(rs.getInt("NOTI_REPLY_NUM"));
					noti2.setNOTI_REPLY_MEMBER_ID(rs.getString("NOTI_REPLY_MEMBER_ID"));
					noti2.setNOTI_REPLY_MEMBER_NAME(rs.getString("NOTI_REPLY_MEMBER_NAME"));
					noti2.setNOTI_REPLY_CONTENT(rs.getString("NOTI_REPLY_CONTENT"));
					noti2.setNOTI_REPLY_DATE(rs.getDate("NOTI_REPLY_DATE"));
					noti2.setNOTI_REPLY_SEQ(rs.getInt("NOTI_REPLY_SEQ"));
					noti2.setNOTI_REPLY_REF(rs.getInt("NOTI_REPLY_REF"));
					noti2.setNOTI_REPLY_LEV(rs.getInt("NOTI_REPLY_LEV"));
					reply.add(noti2);
				}
				
				
				
				//수정할 댓글 불러오기
				pstmt = con.prepareStatement(modify_reply);
				pstmt.setInt(1, num2);
				rs = pstmt.executeQuery();
				while(rs.next()){
					modify_re = new NotiBean();
					modify_re.setNOTI_REPLY_NUM(rs.getInt("NOTI_REPLY_NUM"));
					modify_re.setNOTI_REPLY_MEMBER_ID(rs.getString("NOTI_REPLY_MEMBER_ID"));
					modify_re.setNOTI_REPLY_MEMBER_NAME(rs.getString("NOTI_REPLY_MEMBER_NAME"));
					modify_re.setNOTI_REPLY_CONTENT(rs.getString("NOTI_REPLY_CONTENT"));
					modify_re.setNOTI_REPLY_DATE(rs.getDate("NOTI_REPLY_DATE"));
					modify_re.setNOTI_REPLY_SEQ(rs.getInt("NOTI_REPLY_SEQ"));
					modify_re.setNOTI_REPLY_REF(rs.getInt("NOTI_REPLY_REF"));
					modify_re.setNOTI_REPLY_LEV(rs.getInt("NOTI_REPLY_LEV"));
				}
				if(result != 1 || result_reply !=1){
					System.out.println("보여주기 실패");
					return null;
				}
				System.out.println("보여주기 성공");
				
				request.setAttribute("replylist", reply);
				request.setAttribute("modify_re", modify_re);
				
				return noti;
				
			} catch (Exception e) {
				System.out.println("Show replies error : " + e);
				e.printStackTrace();
			} finally {
				if (rs != null)
					try {
						rs.close();
					} catch (SQLException ex) {
					}
				if (pstmt != null)
					try {
						pstmt.close();
					} catch (SQLException ex) {
					}
				if (con != null)
					try {
						con.close();
					} catch (SQLException ex) {
					}
			}
			return null;
		}

    public boolean notiModifyReply(NotiBean modifyreply) {//공지사항 댓글 수정
      String sql ="update NOTI_REPLY set noti_reply_member_id=?, noti_reply_content=?, noti_reply_date=sysdate where noti_reply_seq=? and noti_reply_num=? ";
      NotiBean noti = null;
      int result = 0;
          
      try{
        con=ds.getConnection();
        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, modifyreply.getNOTI_REPLY_MEMBER_ID());
        pstmt.setString(2, modifyreply.getNOTI_REPLY_CONTENT());
        pstmt.setInt(3, modifyreply.getNOTI_REPLY_SEQ());
        pstmt.setInt(4, modifyreply.getNOTI_NUM());
        
        result = pstmt.executeUpdate();
        
        if(result != 1){
          System.out.println("댓글수정 실패");
          return false;
        }
        
        return true;
      }catch(Exception e){
        System.out.println("reply modify error : "+e);
      }finally{
        if(rs!=null) try{rs.close();}catch(SQLException ex){}
        if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
        if(con!=null) try{con.close();}catch(SQLException ex){}
      }
      return false;
    }

}