package henu.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import henu.bean.Gym;
import henu.bean.Order;
import henu.bean.User;
import henu.util.DbcpPool;

public class userImpl {
     public User find_mynews(String username)
     {
    	String sql = "select * from user where username='"+username+"'";
 		User user = new User();
        ResultSet rs = null;
 		try{
 			rs = DbcpPool.executeQuery(sql);
 			rs.next();
 			user.setAddress(rs.getString("address"));
 			user.setBirthdate(rs.getString("birthdate"));
 			user.setEmail(rs.getString("email"));
 			user.setGender(rs.getString("gender"));
 			user.setPhone(rs.getString("phone"));
 			user.setUsername(rs.getString("username"));
 			user.setCity(rs.getString("city"));
 			user.setCounty(rs.getString("county"));
 			user.setProvince(rs.getString("province"));
 			rs.close();
 		}catch(Exception e)
 		{
 			e.printStackTrace();
 		}
 		DbcpPool.close();
 		return user;
     }
     
     public int update_mynews(User user) 
     {
    	 String sql = "select count(*) from user where password='"+user.getPassword()+"' and username='"+user.getUserNo()+"'";
    	 ResultSet rs = null;
    	 int count = 0;
    	 rs = DbcpPool.executeQuery(sql);
		 try {
			rs.next();
			count = rs.getInt("count(*)");
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(count==0)
			return 2;
		sql = "update user set username=?,password=?,gender=?,birthdate=?,"
				+"email=?,phone=?,address=?,city=?,county=?,province=? where username=?";
	    PreparedStatement ps = DbcpPool.executePreparedStatement(sql);
	    int result = 0;
	    try {
		ps.setString(1, user.getUsername());
		ps.setString(2, user.getNewPwd());
		ps.setString(3, user.getGender());
		ps.setString(4, user.getBirthdate());
		ps.setString(5, user.getEmail());
		ps.setString(6, user.getPhone());
		ps.setString(7, user.getAddress());
		ps.setString(8, user.getCity());
		ps.setString(9, user.getCounty());
		ps.setString(10, user.getProvince());
		ps.setString(11, user.getUserNo());
		result = ps.executeUpdate();
		ps.close();
	    } catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	    }
	    DbcpPool.close();
	   if(result>0)
	   return 1;
	   else 
	   return 0;
     }
     
     public List<Order> find_order(String username)
     {
    	 List<Order> order = new ArrayList<Order>();
    	 String sql = "select * from user a,myorder b,gym c where a.username=b.username "
    	 		+ "and b.gymNo=c.gymNo and a.username='"+username+"'";
    	 ResultSet rs = null;
   		try {
   			rs = DbcpPool.executeQuery(sql);
   			while (rs.next()) {
   				Order r = new Order();
   				r.setTotal(rs.getString("b.total"));
   				r.setMytime(rs.getString("b.mytime"));
   				r.setNum(rs.getString("b.num"));
   				r.setOrdertime(rs.getString("b.ordertime"));
   				r.setState(rs.getBoolean("b.state"));
   				r.setOrderNo(rs.getString("b.orderNo"));
   				r.setGymname(rs.getString("c.gymname"));
   				r.setAddress(rs.getString("c.province")+rs.getString("c.city")
   				+rs.getString("c.county")+rs.getString("c.address"));
   				r.setImg(rs.getString("c.img"));
   				r.setPrice(rs.getString("price"));
   				order.add(r);		//将封装好的Record对象放入列表容器中
   			}
   			rs.close();
   		} catch (SQLException e) {
   			System.out.println("查询出错，操作未完成!");
   			e.printStackTrace();
   		} finally {
   			DbcpPool.close();	
   		}
   		return order;
     }
     
     public boolean chargeback(String orderNo)
     {
    	String sql = "update myorder set state=? where orderNo=?";
 		PreparedStatement ps = DbcpPool.executePreparedStatement(sql);
    	int result = 0 ;
    	boolean F = false;
 		try {
 			ps.setBoolean(1, F);
 			ps.setString(2, orderNo);
 			result = ps.executeUpdate();
 			ps.close();
 		} catch (SQLException e) {
 			e.printStackTrace();
 		}
 		DbcpPool.close();
 		if(result>0)
 		return true;
 		else 
 		return false;
     }
     
     public boolean order(Order r)
     {
    	 String sql = "select * from gym where gymNo='"+r.getGymNo()+"'";
    	 ResultSet rs = null;
    	 try{
  			rs = DbcpPool.executeQuery(sql);
  			rs.next();
  			r.setPrice(rs.getString("price"));
  			rs.close();
  		}catch(Exception e)
  		{
  			e.printStackTrace();
  		}
    	Float total = Float.parseFloat(r.getNum())*Float.parseFloat(r.getPrice());
    	sql = "INSERT INTO myorder (gymNo,username,num,total,state,ordertime,mytime) "
				+ "VALUES (?,?,?,?,?,?,?)";
    	PreparedStatement ps = DbcpPool.executePreparedStatement(sql);
		int result = 0 ;
		try {
			ps.setString(1, r.getGymNo());
			ps.setString(2, r.getUsername());
			ps.setString(3, r.getNum());
			ps.setFloat(4, total);
			ps.setBoolean(5, true);	
			ps.setString(6, r.getOrdertime());
			ps.setString(7, r.getMytime());
			result = ps.executeUpdate();
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DbcpPool.close();
		if(result>0)
		return true;
		else 
		return false;
     }
     
     public Gym find_gymnews(String gymNo)
     {
    	 Gym g = new Gym();
    	 String sql = "select * from gym where gymNo='"+gymNo+"'";
    	 ResultSet rs = null;
    		try {
    			rs = DbcpPool.executeQuery(sql);
    			while (rs.next()) {
    				g.setImg(rs.getString("img"));			
      				g.setAddress(rs.getString("address"));
      				g.setCity(rs.getString("city"));
      				g.setCounty(rs.getString("county"));
      				g.setGymname(rs.getString("gymname"));
      				g.setPhone(rs.getString("phone"));
      				g.setProvince(rs.getString("Province"));
      				g.setSporttype(rs.getString("sporttype"));
      				g.setPrice(rs.getString("price"));
      				g.setGym(rs.getString("gymNo"));
    			}
    			rs.close();
    		} catch (SQLException e) {
    			System.out.println("查询出错，操作未完成!");
    			e.printStackTrace();
    		} finally {
    			DbcpPool.close();	
    		}
    		return g;
     }
}
