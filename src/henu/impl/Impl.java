package henu.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import henu.bean.User;
import henu.util.DbcpPool;

public class Impl {
	//登录
      public boolean login(User user)
      {
    	  String sql = null;
    	  if(user.getUsertype().equals("user"))
    	     sql = "select count(*) from user where username='"+user.getUsername()+"' and password ='"+user.getPassword()+"'";
    	  else 
    		  sql = "select count(*) from admin where adminname='"+user.getUsername()+"' and password ='"+user.getPassword()+"'";
    	  ResultSet rs = DbcpPool.executeQuery(sql);
    	  int count = 0;
    	  try {
  			if(rs.next())
  			{
  				count = rs.getInt("count(*)");
  			}
  			rs.close();
  		} catch (SQLException e) {
  			e.printStackTrace();
  		}
  		DbcpPool.close();
  		if(count>0)
  			return true;
  		else
    	    return false;
      }
    
     //注册
     public boolean register(User user)
     {
    	 String sql = "INSERT INTO user (username,password,"
 				+ "gender,email,phone,birthdate,"
 				+ "address,province,city,county)"
 				+ "VALUES (?,?,?,?,?,?,?,?,?,?)";
 		PreparedStatement ps = DbcpPool.executePreparedStatement(sql);
 		int result = 0 ;
 		try {
 			ps.setString(1, user.getUsername());
 			ps.setString(2, user.getPassword());
 			ps.setString(3, user.getGender());
 			ps.setString(4, user.getEmail());
 			ps.setString(5, user.getPhone());
 			ps.setString(6, user.getBirthdate());
 			ps.setString(7, user.getAddress());
 			ps.setString(8, user.getProvince());
 			ps.setString(9, user.getCity());
 			ps.setString(10, user.getCounty());
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
}
