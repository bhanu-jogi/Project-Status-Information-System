package project;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import databaseconnection.GetConnection;
import java.sql.*;

/**
 * Servlet implementation class studentdata
 */
@WebServlet("/studentdata")
public class studentdata extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public studentdata() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unlikely-arg-type")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		PrintWriter pw=response.getWriter();
		HttpSession session=request.getSession();
		
		Connection conn=GetConnection.getConnection();
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String status="Authorized";
		session.setAttribute("email", email);
		try {
			Statement st=conn.createStatement();
			ResultSet rss=st.executeQuery("select * from students where email='"+email+"' and pwd='"+password+"' and status='"+status+"'");
		 if(rss.next()) {
//		if(email.equals(rss.getString(3))) {
//			if(password.equals(rss.getString(4))) {
			pw.println("<script>alert('LoginSucess')</script>");
			RequestDispatcher rs=request.getRequestDispatcher("studenthome.jsp");
			rs.include(request, response);
//		}else {
//			 
//				pw.println("<script>alert('LoginUnSucess')</script>");
//				RequestDispatcher rs=request.getRequestDispatcher("student.jsp");
//				rs.include(request, response);
//		}
			}
		else  {
		pw.println("<script>alert('Login Unsucess')</script>");
		RequestDispatcher rs=request.getRequestDispatcher("student.jsp");
		rs.include(request, response);
	}
		 		 

		
 	
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		
	}

}
