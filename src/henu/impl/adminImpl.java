package henu.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import henu.bean.Gym;
import henu.util.DbcpPool;

public class adminImpl {
    public boolean add_gym(Gym gym)
    {
    	String sql = "INSERT INTO gym (gymname,sporttype,"
				+ "address,price,img,phone,"
				+ "province,city,county) "
				+ "VALUES (?,?,?,?,?,?,?,?,?)";
		PreparedStatement ps = DbcpPool.executePreparedStatement(sql);
		int result = 0 ;
		try {
			ps.setString(1, gym.getGymname());
			ps.setString(2, gym.getSporttype());
			ps.setString(3, gym.getAddress());
			ps.setString(4, gym.getPrice());
			ps.setString(5, gym.getImg());		
			ps.setString(6, gym.getPhone());
			ps.setString(7, gym.getProvince());
			ps.setString(8, gym.getCity());		
			ps.setString(9, gym.getCounty());
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
    
    public int countPage(int pageSize)
    {
  	  ResultSet totalRs = null;
  	  int totalPages = 1;
  		try {
  			//生成sql语句
  			String sqlGetTotalPages = "select count(*) from gym";

  			//获取总记录条数
  			totalRs = DbcpPool.executeQuery(sqlGetTotalPages);
  			
  			
  			totalRs.next();
  			int countResult = totalRs.getInt(1);		
  			//取得总页数
  			totalPages = countResult % pageSize == 0 ? countResult / pageSize : (int)(countResult / pageSize) + 1;		
  				
  		} catch (SQLException e) {
  			System.out.println("历史记录查询出错，操作未完成!");
  			e.printStackTrace();
  		} finally {
  			DbcpPool.close();
  		}
  		return totalPages;
    }
    
    public List<Gym> Record(int pageNo,int pageSize)
    {
  	  List<Gym> records = new ArrayList<Gym>();	

  		ResultSet rs = null;
  		
  		int startIndex = (pageNo - 1) * pageSize;
  		int endIndex = pageSize;
  		try {
  			String sql = "select * from gym limit "+startIndex+","+endIndex+"";
  			rs = DbcpPool.executeQuery(sql);

  			while (rs.next()) {
  				//取出每条记录的数据，并将其封装成Record对象
  				Gym r = new Gym();
  				r.setImg(rs.getString("img"));			
  				r.setAddress(rs.getString("address"));
  				r.setCity(rs.getString("city"));
  				r.setCounty(rs.getString("county"));
  				r.setGymname(rs.getString("gymname"));
  				r.setPhone(rs.getString("phone"));
  				r.setProvince(rs.getString("Province"));
  				r.setSporttype(rs.getString("sporttype"));
  				r.setPrice(rs.getString("price"));
  				r.setGym(rs.getString("gymNo"));
  				records.add(r);		//将封装好的Record对象放入列表容器中
  			}
  			
  		} catch (SQLException e) {
  			System.out.println("查询出错，操作未完成!");
  			e.printStackTrace();
  		} finally {
  			DbcpPool.close();	
  		}
  		return records;
    }
    
    
    public boolean delete_gym(String gymNo)
    {
    	int result=0;
    	String sql = "delete from gym where gymNo='"+gymNo+"'";
    	result = DbcpPool.executeUpdate(sql);
		if(result>0)
			return true;
		else 
		    return false;
    }
    
    public Gym find_gymnews(String gymNo)
    {
    	String sql = "select * from gym where gymNo='"+gymNo+"'";
    	ResultSet rs = null;
    	Gym r = new Gym();
    	try {
  			rs = DbcpPool.executeQuery(sql);
  			rs.next();
  		    r.setImg(rs.getString("img"));			
  			r.setAddress(rs.getString("address"));
  			r.setCity(rs.getString("city"));
  			r.setCounty(rs.getString("county"));
  			r.setGymname(rs.getString("gymname"));
  			r.setPhone(rs.getString("phone"));
  			r.setProvince(rs.getString("Province"));
  			r.setSporttype(rs.getString("sporttype"));
  			r.setPrice(rs.getString("price"));
  			r.setGym(gymNo);
  			rs.close();
  			DbcpPool.close();	
  			} catch (SQLException e) {
  			System.out.println("查询出错，操作未完成!");
  			e.printStackTrace();
  		} 
  		return r;
    }
    
    public boolean update_gym(Gym gym)
    {
    	String sql = "update gym set gymname=?,sporttype=?,"
    		+ "address=?,price=?,img=?,phone=?,Province=?,city=?,county=? where gymNo='"+gym.getGym()+"'";
		PreparedStatement ps = DbcpPool.executePreparedStatement(sql);
		int result = 0 ;
		try {
			ps.setString(1, gym.getGymname());
			ps.setString(2, gym.getSporttype());
			ps.setString(3, gym.getAddress());
			ps.setString(4, gym.getPrice());
			ps.setString(5, gym.getImg());		
			ps.setString(6, gym.getPhone());
			ps.setString(7, gym.getProvince());
			ps.setString(8, gym.getCity());		
			ps.setString(9, gym.getCounty());
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
