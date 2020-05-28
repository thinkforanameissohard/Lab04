package org.controller;
/**
 * 执行一些数据的操作
 * */

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.dao.DBBean;
import org.entity.infor;

public class controller {
	
	
	/**
	 * 查很多条数据
	 * 从student表中获取所有的图书信息
	 * @return student的数组
	 */
	public static ArrayList<infor> getList(){
		ArrayList<infor> list=new ArrayList<infor>();
		String sql="select * from student";
		DBBean jdbc=new DBBean();
		ResultSet rs=null;
		rs=jdbc.executeQuery(sql);
		
        try {
        	
			while(rs.next())
			{
				infor bi=new infor();
				bi.setId(rs.getInt("sno"));
				bi.setAddress(rs.getString("address"));
				bi.setBirthday(rs.getString("birthday"));
				bi.setGender(rs.getString("gender"));
				bi.setName(rs.getString("name"));
				
				list.add(bi);
			}
//			 rs.close();
		} catch(SQLException e)
		{
			e.printStackTrace();
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		jdbc.close();
        return list;
	}

	/**
	 * 查一条数据
	 * 获取指定id的学生
	 * @param id 学号
	 * @return 一个infor对象
	 */
	public static infor getById(String id){
		String sql="select * from student where sno=%s";
		DBBean jdbc=new DBBean();
		
		ResultSet rs=jdbc.executeQuery(String.format(sql, id)); //防止SQL注入
		infor bi=new infor();
        try {
			if(rs.next())
			{
				bi.setId(rs.getInt("sno"));
				bi.setAddress(rs.getString("address"));
				bi.setBirthday(rs.getString("birthday"));
				bi.setGender(rs.getString("gender"));
				bi.setName(rs.getString("name"));
			}
			
		}
        catch(SQLException e)
		{
			e.printStackTrace();
		}catch(Exception e)
		{
			e.printStackTrace();
		}
        finally 
		{
			try {
				if(rs!=null) rs.close();
				
			}catch(SQLException e)
			{
				e.printStackTrace();
			}catch(Exception e)
			{
				e.printStackTrace();
			}
		}

        jdbc.close();
        return bi;
	}

	/**
	 * 更新一条数据
	 * @param infor 一条学生的信息
	 * @return 修改的结果：1代表成功，0代表没有更新
	 */
	public static int update(infor one){
		int result=0;
		String sql = "update student set name='%s',gender='%s',birthday='%s',address='%s' where sno=%s";
		DBBean jdbc=new DBBean();
		result=jdbc.executeUpdate(String.format(sql, one.getName(),one.getGender(),one.getBirthday(),one.getAddress(),one.getId()));
		jdbc.close();
		return result;
	}
	
	/**
	 * 删除指定id的学生
	 * @param id 学号
	 * @return 删除的结果：1代表成功，0代表没有删除
	 */
	public static int delete(String id){
		int result=0;
		String sql="delete from student where sno=%s";
		DBBean jdbc=new DBBean();
		result=jdbc.executeUpdate(String.format(sql, id));
		jdbc.close();
		return result;
	}
	
	/**
	 * 增加一个学生
	 * @param infor 一条学生的信息
	 * @return 新增的结果：1代表成功，0代表没有增加
	 */
	public static int add(infor one){
		int result=0;
		String sql = "insert into student(name,gender,birthday,address) values('%s','%s','%s','%s')";
		DBBean jdbc=new DBBean();
		
		result=jdbc.executeUpdate(String.format(sql, one.getName(),one.getGender(),one.getBirthday(),one.getAddress()));
		jdbc.close();
		return result;
	}
}
