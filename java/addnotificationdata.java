package project;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import databaseconnection.GetConnection;

/**
 * Servlet implementation class addnotificationdata
 */
@WebServlet("/addnotificationdata")
public class addnotificationdata extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addnotificationdata() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
PrintWriter pw=response.getWriter();
		
		HttpSession session=request.getSession();
		
		 
		String title=request.getParameter("title");
		String description=request.getParameter("description");
		Date datee = new Date();  
	    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");  
	    String date= formatter.format(datee); 
	 
	    String student=request.getParameter("student");
	    String guide=request.getParameter("guide");
	    String st="student";
	    String stt="guide";
		//GetConnection obj = new GetConnection();
		Connection conn=GetConnection.getConnection();
		 try {
			 PreparedStatement ps=conn.prepareStatement("insert into notification(title,description,date,studentemail,student,guideemail,guide)values(?,?,?,?,?,?,?)");
			 ps.setString(1,title);
			 ps.setString(2,description);
			 ps.setString(3,date);
			 ps.setString(4, student);
			 ps.setString(5, st);
			 ps.setString(6, guide);
			 ps.setString(7, stt);
			 int n=ps.executeUpdate();
			 
		if(n>0) {
			pw.println("<script>alert('AddSucess')</script>");
			RequestDispatcher rs=request.getRequestDispatcher("viewnoti.jsp");
			rs.forward(request, response);
		}
		else {
			pw.println("<script>alert('Add UnSucess')</script>");
			RequestDispatcher rs1=request.getRequestDispatcher("addnotification.jsp");
			rs1 .include(request, response);	
		}
		 } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
