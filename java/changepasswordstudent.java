package project;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import databaseconnection.GetConnection;

/**
 * Servlet implementation class changepasswordstudent
 */
@WebServlet("/changepasswordstudent")
public class changepasswordstudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public changepasswordstudent() {
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
	@SuppressWarnings("unused")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
       PrintWriter pw=response.getWriter();
		
		HttpSession session=request.getSession();
		
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String newpassword=request.getParameter("newpassword");
		
		session.setAttribute("email", email);
 
		//GetConnection obj = new GetConnection();
		Connection conn=GetConnection.getConnection();
		 try {
			Statement ps2 = conn.createStatement();
		 ResultSet rss=ps2.executeQuery("select * from student where email='"+email+"'");
		 while(rss.next()){
		if(password.equals(rss.getString(4))){
		 
			password=newpassword;
			//rss.getString(4);
			PreparedStatement ps=conn.prepareStatement("update student set password='"+password+"' where email='"+email+"'");
			 int n=ps.executeUpdate();
			if(n>0) {
			pw.println("<script>alert('UpdateSucess')</script>");
			RequestDispatcher rs=request.getRequestDispatcher("studenthome.jsp");
			rs .include(request, response);
		}}
		else {
			pw.println("<script>alert('Please Enter Valied Old Password')</script>");
			RequestDispatcher rs=request.getRequestDispatcher("changepasswordstu.jsp");
			rs .include(request, response);	
		}}
		 } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}

}
