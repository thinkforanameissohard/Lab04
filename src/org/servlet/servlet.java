package org.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.controller.controller;
import org.entity.infor;


/**
 * 删除修改直接跳转到查询界面，用查询出来的结果，表示是否操作成功
 */
@WebServlet("*.do")
public class servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public servlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			request.setCharacterEncoding("utf-8");
			String actionUrl=request.getServletPath();		//获取客户请求的Servlet地址

			if(actionUrl.equals("/student.do"))
			{		
				String id=request.getParameter("id");//显示学生信息
				
				if(id!=null)//查一条
				{
					infor bi=controller.getById(id);		
					request.setAttribute("bi", bi);			
				}
				else//查所有
				{
					ArrayList<infor> list=controller.getList();  
					request.setAttribute("list", list);					
				}
				request.getRequestDispatcher("student.jsp").forward(request, response); 
			}
			else if(actionUrl.equals("/insert.do"))//增加学生信息
			{	
				infor one=new infor();
				one.setName(request.getParameter("name"));
				one.setAddress(request.getParameter("address"));
				one.setBirthday(request.getParameter("birthday"));
				one.setGender(request.getParameter("gender"));
			
				controller.add(one);
				request.getRequestDispatcher("insert.jsp").forward(request, response);
			}
			else if(actionUrl.equals("/editsave.do")) //修改学生信息
			{	   
				infor one=new infor();
				one.setId(Integer.parseInt(request.getParameter("id")));

				one.setName(request.getParameter("name"));
				one.setAddress(request.getParameter("address"));
				one.setBirthday(request.getParameter("birthday"));
				one.setGender(request.getParameter("gender"));
				
				controller.update(one);
//				response.sendRedirect("/student.do");
				response.sendRedirect("/Lab04/student.do");

			}
			else if(actionUrl.equals("/del.do"))//删除学生
			{			
				String id=request.getParameter("id");
				controller.delete(id);	
				
				response.sendRedirect("/Lab04/student.do");

			}
			else//什么操作都没有就回到主页面
			{
				request.getRequestDispatcher("/index.jsp").forward(request, response);
			}

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
