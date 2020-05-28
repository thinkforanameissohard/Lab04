package org.dao;
import java.sql.*;

public class DBBean {
	private String driverStr = "com.mysql.jdbc.Driver";
	private String URL="jdbc:mysql://localhost:3306/studentmanagement?zeroDateTimeBehavior=convertToNull&useUnicode=true&characterEncoding=utf-8";
	private String USERNAME = "root";
	private String PWD="";
	private Connection conn = null;
	private Statement stmt = null;
	
	/**
	 * 连接数据库
	 * @param sql
	 * 要执行的语句 
	 * */
	public DBBean() {
		try {
			Class.forName(driverStr);
			conn = DriverManager.getConnection(URL, USERNAME,PWD);
			stmt = conn.createStatement();
		} catch (Exception ex) {
			System.out.println("数据库连接失败！");
		}
	}

	/**
	 * 执行更新（增删改）操作
	 * @param 
	 * SQL语句
	 * @return int
	 * 更新操作的结果 
	 */
	public int executeUpdate(String s) {
		int result = 0;
		try {
			result = stmt.executeUpdate(s);
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 执行查询（查）操作
	 * @param 
	 * SQL语句
	 * @return ResultSet
	 * 查询结果  
	 */
	public ResultSet executeQuery(String s) {
		ResultSet rs = null;
		try {
			rs =  stmt.executeQuery(s);
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		
		return rs;
	}

	/**
	 * 关闭数据库
	 */
	public void close() {
		try
		{
			if(stmt!=null)	stmt.close();
			if(conn!=null)	conn.close();
		}catch(SQLException e)
		{
			e.printStackTrace();
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}
