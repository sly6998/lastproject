package com.interior.noti;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;


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
	
	
			// 공지사항 글 댓글 쓰기
			public int NotiReplyWrite(NotiReplyBean notireplywrite){
				String noti_reply_sql = "select max(noti_reply_num) from noti_reply";
				String sql="";
				
				int num=0;
				int result=0;
				
				int reply_ref = notireplywrite.getNOTI_REPLY_REF();
				int reply_seq = notireplywrite.getNOTI_REPLY_SEQ();
				int reply_lev = notireplywrite.getNOTI_REPLY_LEV();
				
				try{
					con=ds.getConnection();
					pstmt=con.prepareStatement(noti_reply_sql);
					rs=pstmt.executeQuery();
					
					if(rs.next()){
						num=rs.getInt(1)+1;
					}else{
						num=1;
					}
					sql = "update NOTI_reply set noti_reply_seq=noti_reply_seq+1 where noti_reply_ref=? and noti_reply_seq>?";
					
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, reply_ref);
					pstmt.setInt(2, reply_seq);
					
					sql = "insert into noti_reply (noti_reply_num, noti_reply_member_NAME, noti_reply_content, noti_reply_ref, noti_reply_seq, noti_reply_lev, noti_reply_date) values (noti_reply_seq.nextval,?,?,?,?,?sysdate)";
					
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, notireplywrite.getNOTI_REPLY_MEMBER_NAME());
					pstmt.setString(2, notireplywrite.getNOTI_REPLY_CONTENT());
					pstmt.setInt(3, reply_ref);
					pstmt.setInt(4, reply_seq);
					pstmt.setInt(5, reply_lev);
					pstmt.executeUpdate();
					return num;
				}catch(Exception e){
					System.out.println("NotiReplyWrite error : "+e);
				}finally{
					if(rs!=null)try{rs.close();}catch(SQLException e){}
					if(pstmt!=null)try{pstmt.close();}catch(SQLException e){}
					if(con!=null)try{con.close();}catch(SQLException e){}
				}
				return 0;
			}
			
			//공지사항 댓글 수정
			public boolean NotiReplyModify(NotiReplyBean replymodify)throws Exception{
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
				String sql = "delete from noti_reply where noti_reply_num=?";
				
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
					try{
						if(pstmt!=null){
							pstmt.close();
						}
						if(con!=null){
							con.close();
						}
					}catch(Exception ex){
						
					}
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
		
		//공지사항 글 댓글 보기
		public NotiReplyBean getReplyDetail(int num2) throws Exception {
			// TODO Auto-generated method stub
			NotiReplyBean notireply = null;
						
			try{
				con=ds.getConnection();
				pstmt = con.prepareStatement("select * from noti_reply where noti_reply_num=?");
				pstmt.setInt(1, num2);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					notireply = new NotiReplyBean();
					notireply.setNOTI_REPLY_NUM(rs.getInt("NOTI_REPLY_NUM"));
					notireply.setNOTI_REPLY_MEMBER_NAME(rs.getString("NOTI_REPLY_MEMBER_NAME"));					
					notireply.setNOTI_REPLY_MEMBER_ID(rs.getString("NOTI_REPLY_MEMBER_ID"));
					notireply.setNOTI_REPLY_CONTENT(rs.getString("NOTI_REPLY_CONTENT"));
					notireply.setNOTI_REPLY_DATE(rs.getDate("NOTI_REPLY_DATE"));
					notireply.setNOTI_REPLY_REF(rs.getInt("NOTI_REPLY_REF"));
					notireply.setNOTI_REPLY_SEQ(rs.getInt("NOTI_REPLY_SEQ"));
					notireply.setNOTI_REPLY_LEV(rs.getInt("NOTI_REPLY_LEV"));
				}
				return notireply;
			}catch(Exception e){
				System.out.println("getReplyDetail error : "+e);
			}finally{
				if(rs!=null) try{rs.close();}catch(SQLException ex){}
				if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
				if(con!=null) try{con.close();}catch(SQLException ex){}
			}
			return null;
		}
}