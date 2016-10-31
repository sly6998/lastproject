package com.interior.basket;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.omg.CORBA.Request;


public class BasketDAO {
	
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;
	public BasketDAO(){
		try{
			Context init = new InitialContext();
			ds=(DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		}catch(Exception e){
			System.out.println("DB connection failed : "+e);
			return;
		}
	}


	public List getBasketList(String id) {//Basket 리스트 불러오기
		// TODO Auto-generated method stub
		String sql = "select rownum, BASKET_MEMBER_ID, BASKET_ITEM_IMAGE, BASKET_ITEM_NAME, "
				+ "BASKET_ITEM_MODEL, BASKET_ITEM_BRAND, BASKET_ITEM_TYPE, BASKET_AMOUNT, BASKET_ITEM_PRICE "
				+ "from basket where BASKET_MEMBER_ID=?";
		List basketlist = new ArrayList();
		
		try{
			con=ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				BasketBean basket = new BasketBean();
				basket.setBASKET_NUM(rs.getInt("ROWNUM"));
				basket.setBASKET_MEMBER_ID(rs.getString("BASKET_MEMBER_ID"));
				basket.setBASKET_ITEM_IMAGE(rs.getString("BASKET_ITEM_IMAGE"));
				basket.setBASKET_ITEM_NAME(rs.getString("BASKET_ITEM_NAME"));
				basket.setBASKET_ITEM_MODEL(rs.getString("BASKET_ITEM_MODEL"));
				basket.setBASKET_ITEM_BRAND(rs.getString("BASKET_ITEM_BRAND"));
				basket.setBASKET_ITEM_TYPE(rs.getString("BASKET_ITEM_TYPE"));
				basket.setBASKET_AMOUNT(rs.getInt("BASKET_AMOUNT"));
				basket.setBASKET_ITEM_PRICE(rs.getInt("BASKET_ITEM_PRICE"));
				
				basketlist.add(basket);
			}
			
			return basketlist;
		}catch(Exception e){
			System.out.println("getBasketList error : "+e);
			e.printStackTrace();
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(con!=null) try{con.close();}catch(SQLException ex){}
		}
		return null;
	}
	
	public BasketBean getDetail(int num) throws Exception {  //Basket 상세보기
		// TODO Auto-generated method stub
		BasketBean basket = null;
		String sql = "select * from basket where advice_num=?";
		pstmt.setInt(1, num);
		try{
			con=ds.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				basket = new BasketBean();
			
				basket.setBASKET_MEMBER_ID(rs.getString("ADVICE_MEMBER_EMAIL"));
				basket.setBASKET_MEMBER_NAME(rs.getString("ADVICE_MEMBER_NAME"));
				
				
				basket.setBASKET_DATE(rs.getDate("ADVICE_DATE"));
			}
			return basket;
		}catch(Exception e){
			System.out.println("getBasketDetail error : "+e);
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(con!=null) try{con.close();}catch(SQLException ex){}
		}
		return null;
	}


	public boolean addBasket(BasketBean basketdata) {
		// TODO Auto-generated method stub
		String sql = "Insert into basket "
				+ "(BASKET_MEMBER_ID, BASKET_ITEM_IMAGE, BASKET_ITEM_NAME, BASKET_ITEM_TYPE, BASKET_ITEM_PRICE, BASKET_AMOUNT,BASKET_DATE) "
				+ "values (?,?,?,?,?,?,sysdate)";
		int result = 0;
		
		try{
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, basketdata.getBASKET_MEMBER_ID());
			pstmt.setString(2, basketdata.getBASKET_ITEM_IMAGE());
			pstmt.setString(3, basketdata.getBASKET_ITEM_NAME());
			pstmt.setString(4, basketdata.getBASKET_ITEM_TYPE());
			pstmt.setInt(5, basketdata.getBASKET_ITEM_PRICE());
			pstmt.setInt(6, basketdata.getBASKET_AMOUNT());
			result = pstmt.executeUpdate();
			
			
				
			if(result!=0){
				return true;
			}
		}catch(Exception e){
			System.out.println("addBasket Error : "+e);
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(con!=null) try{con.close();}catch(SQLException ex){}
		}
		return false;
	}
}
