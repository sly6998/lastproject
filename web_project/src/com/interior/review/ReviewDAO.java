package com.interior.review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

import com.interior.noti.NotiBean;

public class ReviewDAO {

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;
	public ReviewDAO(){
		try{
			Context init = new InitialContext();
			ds=(DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
		}catch(Exception e){
			System.out.println("DB connection failed : "+e);
			return;
		}
	}
	
	public boolean reviewdelete(int num) {// Review 게시글 삭제
		// TODO Auto-generated method stub
		String sql = "delete from review where review_num=?";
		
		int result = 0;
		
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
			System.out.println("reviewdelete error : "+e);
		}finally{
			try{
				if(pstmt!=null){
					pstmt.close();
				}
				if(con!=null){
					con.close();
				}
			}catch(Exception e){}
		}
		return false;		
	}

	public void setReadCountUpdate(int num) {// Review 게시글 조회 수 업데이트
		// TODO Auto-generated method stub
		String sql = "update review set review_readcount = review_readcount+1 where review_num = "+num;
		
		try{
			con=ds.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.executeUpdate();
		}catch(Exception e){
			System.out.println("setReadCountUpdate error : "+e);
		}finally{
			try{
				if(pstmt!=null){
					pstmt.close();
				}
				if(con!=null){
					con.close();
				}
			}catch(Exception e){}
		}
	}

	public ReviewBean getDetail(int num) throws Exception{//Review 게시글 보기
		// TODO Auto-generated method stub
		ReviewBean review = null;
		String sql = "select * from review where review_num=?";
		
		try{
			con=ds.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				review = new ReviewBean();
				review.setREVIEW_NUM(rs.getInt("REVIEW_NUM"));
				review.setREVIEW_READCOUNT(rs.getInt("REVIEW_READCOUNT"));
				review.setREVIEW_MEMBER_ID(rs.getString("REVIEW_MEMBER_ID"));
				review.setREVIEW_MEMBER_NAME(rs.getString("REVIEW_MEMBER_NAME"));
				review.setREVIEW_SUBJECT(rs.getString("REVIEW_SUBJECT"));
				review.setREVIEW_CONTENT(rs.getString("REVIEW_CONTENT"));
				review.setREVIEW_DATE(rs.getDate("REVIEW_DATE"));
			}
			return review;
		}catch(Exception e){
			System.out.println("getReviewDetail error : "+e);
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(con!=null) try{con.close();}catch(SQLException ex){}
		}
		return null;
	}

	public int getListCount(String cond) {//Review 게시글 총 수
		// TODO Auto-generated method stub
		int count = 0;
		String sql = "select count(*) from review";
		if (cond != null && !cond.equals("")) {
			sql = sql + " where " + cond;
		}
		
		try{
			con=ds.getConnection();
			pstmt=con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				count=rs.getInt(1);
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

	public List getReviewList(int page, int limit, String cond) {//Review 게시글 리스트 보기
		// TODO Auto-generated method stub
		String sql = "select * from " +
		"(select rownum rnum, review_num, review_member_id, review_member_name," +
		"review_subject, review_content, review_readcount," +
		"review_date, " +
		" (select count(*) from review_reply bb where  bb.review_reply_num = review_num) as zzzzz from "+
		"(select * from review order by review_date desc)) " +
		"where rnum>=? and rnum<=?";
		
		String sql_2 = "select * from " +
				"(select rownum rnum, review_num, review_member_id, review_member_name," +
				"review_subject, review_content, review_readcount," +
				"review_date, " +
				" (select count(*) from review_reply bb where  bb.review_reply_num = review_num) as zzzzz from "+
				"(select * from review where %s order by review_date desc)) " +
				"where rnum>=? and rnum<=?";
		
		if (cond != null && !cond.equals("")) {
			sql = String.format(sql_2, cond);
		}
		
		
		List list = new ArrayList();
		
		int startrow = (page-1)*10+1;
		int endrow = startrow+limit-1;
		
		try{
			con=ds.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, endrow);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				ReviewBean review = new ReviewBean();
				review.setREVIEW_NUM(rs.getInt("REVIEW_NUM"));
				review.setREVIEW_READCOUNT(rs.getInt("REVIEW_READCOUNT"));
				review.setREVIEW_MEMBER_ID(rs.getString("REVIEW_MEMBER_ID"));
				review.setREVIEW_MEMBER_NAME(rs.getString("REVIEW_MEMBER_NAME"));
				review.setREVIEW_SUBJECT(rs.getString("REVIEW_SUBJECT"));
				review.setREVIEW_CONTENT(rs.getString("REVIEW_CONTENT"));
				review.setREVIEW_DATE(rs.getDate("REVIEW_DATE"));
				review.setREVIEW_REPLY_AMOUNT(rs.getInt("zzzzz"));
				
				list.add(review);
			}
			return list;
		}catch(Exception e){
			System.out.println("getReviewList error : "+e);
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(con!=null) try{con.close();}catch(SQLException ex){}
		}
		return null;
	}

	public boolean reviewModify(ReviewBean reviewdata) {//Review 게시글 수정
		// TODO Auto-generated method stub
		String sql = "update review set review_subject=?,";
		sql+="review_content=? where review_num=?";
		
		try{
			con=ds.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, reviewdata.getREVIEW_SUBJECT());
			pstmt.setString(2, reviewdata.getREVIEW_CONTENT());
			pstmt.setInt(3, reviewdata.getREVIEW_NUM());
			pstmt.executeUpdate();
			return true;
		}catch(Exception e){
			System.out.println("reviewModify error : "+e);
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(con!=null) try{con.close();}catch(SQLException ex){}
		}
		return false;
	}

	public ReviewBean reviewmodifyView(int num) {//Review 게시글 수정 페이지 보기
		// TODO Auto-generated method stub
		ReviewBean review = null;
		try{
			con=ds.getConnection();
			pstmt = con.prepareStatement("select * from review where REVIEW_NUM=?");
			pstmt.setInt(1, num);
			
			
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				review = new ReviewBean();
				review.setREVIEW_NUM(rs.getInt("REVIEW_NUM"));
				review.setREVIEW_MEMBER_ID(rs.getString("REVIEW_MEMBER_ID"));
				review.setREVIEW_MEMBER_NAME(rs.getString("REVIEW_MEMBER_NAME"));
				review.setREVIEW_SUBJECT(rs.getString("REVIEW_SUBJECT"));
				review.setREVIEW_CONTENT(rs.getString("REVIEW_CONTENT"));
				review.setREVIEW_READCOUNT(rs.getInt("REVIEW_READCOUNT"));
				review.setREVIEW_DATE(rs.getDate("REVIEW_DATE"));
			}
			return review;
		}catch(Exception e){
			System.out.println("reviewmodifyview error : "+e);
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(con!=null) try{con.close();}catch(SQLException ex){}
		}
		return null;
	}

	public boolean reviewInsert(ReviewBean reviewdata) {//Review 게시글 등록
		// TODO Auto-generated method stub
		int num=0;
		String sql="";
		int result=0;
		
		try{
			con=ds.getConnection();
			pstmt=con.prepareStatement("select max(review_num) from review");
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				num=rs.getInt(1)+1;
			}else{
				num=1;
			}
			
			sql="insert into review (review_num, review_member_id, review_member_name,";
			sql+="review_subject, review_content," +
				"review_readcount, review_date) values(review_seq.nextval,?,?,?,?,?,sysdate)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, reviewdata.getREVIEW_MEMBER_ID());
			pstmt.setString(2, reviewdata.getREVIEW_MEMBER_NAME());
			pstmt.setString(3, reviewdata.getREVIEW_SUBJECT());
			pstmt.setString(4, reviewdata.getREVIEW_CONTENT());
			pstmt.setInt(5, reviewdata.getREVIEW_READCOUNT());
			
			result=pstmt.executeUpdate();
			if(result==0){
				return false;
			}
			return true;
		}catch(Exception e){
			System.out.println("reviewInsert error : "+e);
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(con!=null) try{con.close();}catch(SQLException ex){}
		}
		return false;
	}
	
	
	//REVIEW 게시판 글에 댓글 등록
	public boolean ReviewReplyInsert(ReviewBean reviewdata) {
		// TODO Auto-generated method stub
		int num = 0;
		String sql = "";
		int result = 0;
		
		try{
			sql = "insert into review_reply "
					+ "(review_REPLY_MEMBER_ID, review_REPLY_CONTENT, review_REPLY_DATE, review_REPLY_NUM, review_REPLY_SEQ) "
					+ "values (?,?,sysdate,?,review_reply_seq.NEXTVAL)";
			
			/*/////////////////////////////////
			sql = "insert into qna_reply "
					+ "(QNA_REPLY_MEMBER_ID, QNA_REPLY_CONTENT, QNA_REPLY_DATE, QNA_REPLY_NUM, QNA_REPLY_SEQ) "
					+ "values (?,?,sysdate,?,qna_reply_seq.NEXTVAL)";
			*/
			con=ds.getConnection();
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, reviewdata.getREVIEW_REPLY_MEMBER_ID());
			pstmt.setString(2, reviewdata.getREVIEW_REPLY_CONTENT());
			pstmt.setInt(3, reviewdata.getREVIEW_REPLY_NUM());
			
			
			result = pstmt.executeUpdate();
			if(result==0){
				return false; //0이 실패
			}
			return true;
		}catch(Exception e){
			System.out.println("ReviewReplyInsert error : "+e);
			e.printStackTrace();
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(con!=null) try{con.close();}catch(SQLException ex){}
		}
		return false;
	}
	
	//REVIEW 게시판 글에 댓글 수정
	public boolean ReviewReplyModify(ReviewBean reviewremodify)throws Exception{
		String sql = "update review_REPLY set review_reply_member_id=?, review_reply_content=?, review_reply_date=sysdate where review_reply_seq=? and review_reply_num=? ";
		
	      ReviewBean review = null;
	      int result = 0;
	          
	      try{
	        con=ds.getConnection();
	        pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, reviewremodify.getREVIEW_REPLY_MEMBER_ID());
	        pstmt.setString(2, reviewremodify.getREVIEW_REPLY_CONTENT());
	        pstmt.setInt(3, reviewremodify.getREVIEW_REPLY_SEQ());
	        pstmt.setInt(4, reviewremodify.getREVIEW_NUM());
	        
	        result = pstmt.executeUpdate();
	        
	        if(result != 1){
	          System.out.println("댓글수정 실패");
	          return false;
	        }
	        
	        return true;
	      }catch(Exception e){
	        System.out.println("review reply modify error : "+e);
	      }finally{
	        if(rs!=null) try{rs.close();}catch(SQLException ex){}
	        if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
	        if(con!=null) try{con.close();}catch(SQLException ex){}
	      }
	      return false;
	    }
	
	
	//REVIEW 게시판 글에 댓글 삭제
	public boolean ReviewReplyDelete(int num){
		String sql = "delete from review_reply where review_reply_seq=?";
		
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
			System.out.println("ReviewReplyDelete error : "+e);
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(con!=null) try{con.close();}catch(SQLException ex){}
		}
		return false;
	}
	
	//REVIEW 글에 달린 댓글 보여주기(list형식)
	public List getReviewReplyList(int num2) {
		// TODO Auto-generated method stub
		String sql =  "select * from review_reply where review_reply_num=?";
		
		List list = new ArrayList();
		
		
		try{
			con=ds.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num2);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				
				ReviewBean review2 = new ReviewBean();
				review2.setREVIEW_REPLY_NUM(rs.getInt("REVIEW_REPLY_NUM"));
				review2.setREVIEW_REPLY_MEMBER_ID(rs.getString("REVIEW_REPLY_MEMBER_ID"));
				review2.setREVIEW_REPLY_MEMBER_NAME(rs.getString("REVIEW_REPLY_MEMBER_NAME"));
				review2.setREVIEW_REPLY_CONTENT(rs.getString("REVIEW_REPLY_CONTENT"));
				review2.setREVIEW_REPLY_DATE(rs.getDate("REVIEW_REPLY_DATE"));
				review2.setREVIEW_REPLY_SEQ(rs.getInt("REVIEW_REPLY_SEQ"));
				review2.setREVIEW_REPLY_REF(rs.getInt("REVIEW_REPLY_REF"));
				review2.setREVIEW_REPLY_LEV(rs.getInt("REVIEW_REPLY_LEV"));
				list.add(review2);
				
			}
			
			return list;
			
		}catch(Exception e){
			System.out.println("getReviewReplyList error : "+e);
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(con!=null) try{con.close();}catch(SQLException ex){}
		}
		return null;
	}
	
	
	//REVIEW 게시판 글 삭제나 수정 권한 확인(글쓴이 인지 확인)
	public boolean isReviewReplyWriter(int num, String ID){
		System.out.println("ID = "+ID);
		String sql = "select * from review_reply where review_reply_num=?";
		
		try{
			con=ds.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			rs.next();
			
			if(ID.equals(rs.getString("REVIEW_REPLY_MEMBER_ID"))){
				return true;
			}
		}catch(Exception e){
			System.out.println("isReviewReplyWriter error : "+e);
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
	
	//REVIEW 게시판 글에 달린 댓글 수 구하기
	public int getReivewReplyListCount() {
		// TODO Auto-generated method stub
		int count=0;
		
		try{
			con=ds.getConnection();
			pstmt=con.prepareStatement("select count(*) from review_reply");
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				count=rs.getInt(1);
			}
		}catch(Exception e){
			System.out.println("getReviewReplyListCount error : "+e);
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(con!=null) try{con.close();}catch(SQLException ex){}
		}
		return count;
	}
	
	
	//REVIEW 게시판에서 글과 댓글을 동시에 보여주기(수정시에)
	public ReviewBean reviewreplymodifyview(int num1, int num2, HttpServletRequest request) {
		String sql = "select * from review where review_num=?";
		String sql_reply = "select * from review_reply where review_reply_num=? order by review_reply_seq";
		String modify_reply = "select * from review_reply where review_reply_seq=?";
		int result = 0;
		int result_reply = 0;
		int review_reply_seq = 0;
		ReviewBean review = null;
		ReviewBean modify_re = null;
		List reply = new ArrayList<>();
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num1);
			rs = pstmt.executeQuery();
			while(rs.next()){
				result =1;
				review = new ReviewBean();
				review.setREVIEW_NUM(rs.getInt("REVIEW_NUM"));
				review.setREVIEW_MEMBER_ID(rs.getString("REVIEW_MEMBER_ID"));
				review.setREVIEW_MEMBER_NAME(rs.getString("REVIEW_MEMBER_NAME"));
				review.setREVIEW_SUBJECT(rs.getString("REVIEW_SUBJECT"));
				review.setREVIEW_CONTENT(rs.getString("REVIEW_CONTENT"));
				review.setREVIEW_READCOUNT(rs.getInt("REVIEW_READCOUNT"));
				review.setREVIEW_DATE(rs.getDate("REVIEW_DATE"));
				
			}
			
			//댓글 불러오기
			pstmt = con.prepareStatement(sql_reply);
			pstmt.setInt(1, num1);
			rs = pstmt.executeQuery();
			while(rs.next()){
				result_reply =1;
				ReviewBean review2 = new ReviewBean();
				review2.setREVIEW_REPLY_NUM(rs.getInt("REVIEW_REPLY_NUM"));
				review2.setREVIEW_REPLY_MEMBER_ID(rs.getString("REVIEW_REPLY_MEMBER_ID"));
				review2.setREVIEW_REPLY_MEMBER_NAME(rs.getString("REVIEW_REPLY_MEMBER_NAME"));
				review2.setREVIEW_REPLY_CONTENT(rs.getString("REVIEW_REPLY_CONTENT"));
				review2.setREVIEW_REPLY_DATE(rs.getDate("REVIEW_REPLY_DATE"));
				review2.setREVIEW_REPLY_SEQ(rs.getInt("REVIEW_REPLY_SEQ"));
				review2.setREVIEW_REPLY_REF(rs.getInt("REVIEW_REPLY_REF"));
				review2.setREVIEW_REPLY_LEV(rs.getInt("REVIEW_REPLY_LEV"));
				reply.add(review2);
			}
			
			
			
			//수정할 댓글 불러오기
			pstmt = con.prepareStatement(modify_reply);
			pstmt.setInt(1, num2);
			rs = pstmt.executeQuery();
			while(rs.next()){
				modify_re = new ReviewBean();
				modify_re.setREVIEW_REPLY_NUM(rs.getInt("REVIEW_REPLY_NUM"));
				modify_re.setREVIEW_REPLY_MEMBER_ID(rs.getString("REVIEW_REPLY_MEMBER_ID"));
				modify_re.setREVIEW_REPLY_MEMBER_NAME(rs.getString("REVIEW_REPLY_MEMBER_NAME"));
				modify_re.setREVIEW_REPLY_CONTENT(rs.getString("REVIEW_REPLY_CONTENT"));
				modify_re.setREVIEW_REPLY_DATE(rs.getDate("REVIEW_REPLY_DATE"));
				modify_re.setREVIEW_REPLY_SEQ(rs.getInt("REVIEW_REPLY_SEQ"));
				modify_re.setREVIEW_REPLY_REF(rs.getInt("REVIEW_REPLY_REF"));
				modify_re.setREVIEW_REPLY_LEV(rs.getInt("REVIEW_REPLY_LEV"));
			}
			if(result != 1 || result_reply !=1){
				System.out.println("보여주기 실패");
				return null;
			}
			System.out.println("보여주기 성공");
			
			request.setAttribute("replylist", reply);
			request.setAttribute("modify_re", modify_re);
			
			return review;
			
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
	
	 //REVIEW 게시판 글에 달린 댓글 수정
	 public boolean modifyreviewreply(ReviewBean reviewreplymodify) {
	      String sql ="update review_REPLY set review_reply_member_id=?, review_reply_content=?, review_reply_date=sysdate where review_reply_seq=? and review_reply_num=? ";
	      ReviewBean noti = null;
	      int result = 0;
	          
	      try{
	        con=ds.getConnection();
	        pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, reviewreplymodify.getREVIEW_REPLY_MEMBER_ID());
	        pstmt.setString(2, reviewreplymodify.getREVIEW_REPLY_CONTENT());
	        pstmt.setInt(3, reviewreplymodify.getREVIEW_REPLY_SEQ());
	        pstmt.setInt(4, reviewreplymodify.getREVIEW_NUM());
	        
	        result = pstmt.executeUpdate();
	        
	        if(result != 1){
	          System.out.println("댓글 수정 실패");
	          return false;
	        }
	        
	        return true;
	      }catch(Exception e){
	        System.out.println("review reply modify error : "+e);
	      }finally{
	        if(rs!=null) try{rs.close();}catch(SQLException ex){}
	        if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
	        if(con!=null) try{con.close();}catch(SQLException ex){}
	      }
	      return false;
	    }
}
