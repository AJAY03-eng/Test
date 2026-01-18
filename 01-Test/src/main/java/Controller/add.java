package Controller;

import java.io.IOException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Conn.ConnectionPool;

@WebServlet("/add")
public class add extends HttpServlet
  
{
   protected void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
   {
	   String studentid=req.getParameter("studentid");
	   String name=req.getParameter("name");
	   String email=req.getParameter("email");
	   String  phone=req.getParameter("phone");
	   String standard=req.getParameter("standard");
	   String address =req.getParameter("address");
	   
	   
	   Connection connection =ConnectionPool.giveConnection();
	   System.out.println(connection);
	
	   try {   
		   
		   String insert="INSERT INTO users VALUES(?,?,?,?,?,?)";
		   
		   PreparedStatement ptst=connection.prepareStatement(insert);
		   ptst.setString(1,studentid );
		   ptst.setString(2, name);
		   ptst.setString(3, email);
		   ptst.setString(4, phone);
		   ptst.setString(5, standard);
		   ptst.setString(6, address);
		   
		  int res1= ptst.executeUpdate();
		  System.out.println("record inserted " + res1);
		  
		  
		  RequestDispatcher rd=req.getRequestDispatcher("add.jsp");
		  req.setAttribute("succ"," added Successfully");
		  rd.forward(req, res);
		   
		   
		   
		   
		   
		   
	   }
	   catch(SQLException e)
	   {
		   e.printStackTrace();
		   RequestDispatcher rd=req.getRequestDispatcher("add.jsp");
			  req.setAttribute("failed"," Already exists");
			  rd.forward(req, res);
		   
		   
	   }
	   
   }
}
