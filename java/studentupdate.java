package project;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import databaseconnection.GetConnection;

/**
 * Servlet implementation class studentupdate
 */
@WebServlet("/studentupdate")
public class studentupdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public studentupdate() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
PrintWriter pw=response.getWriter();
		
		HttpSession session=request.getSession();
		String name=request.getParameter("name");
		
		String email=request.getParameter("email");
		String number=request.getParameter("number");
		 
		 
 
		//GetConnection obj = new GetConnection();
		Connection conn=GetConnection.getConnection();
		 try {
	 
		 
			  	//rss.getString(4);
			PreparedStatement ps=conn.prepareStatement("update student set name='"+name+"',number='"+number+"' where email='"+email+"'");
			 int n=ps.executeUpdate();
			if(n>0) {
			pw.println("<script>alert('UpdateSucess')</script>");
			RequestDispatcher rs=request.getRequestDispatcher("viewstudentdata.jsp");
			rs .include(request, response);
		}
		else {
			pw.println("<script>alert('UpdateUnSucess')</script>");
			RequestDispatcher rs=request.getRequestDispatcher("viewstudentdata.jsp");
			rs .include(request, response);	
		}
		 } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
