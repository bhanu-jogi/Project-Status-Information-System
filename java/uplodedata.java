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
 * Servlet implementation class uplodedata
 */
@WebServlet("/uplodedata")
public class uplodedata extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public uplodedata() {
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
		
		 
		String title=request.getParameter("title");
		String documenet=request.getParameter("documenet");
		int id=Integer.parseInt(request.getParameter("id"));
		String name=request.getParameter("name");
		String email=request.getParameter("elmai");
		
		//GetConnection obj = new GetConnection();
		Connection conn=GetConnection.getConnection();
		 try {
			PreparedStatement ps = conn.prepareStatement("insert into upload(title,document,id,name,email)values(?,?,?,?,?)");
		  ps.setString(1, title);
		  ps.setString(2, documenet);
		  ps.setInt(3, id);
		  ps.setString(4, name);
		  ps.setString(5, email);
		  int n=ps.executeUpdate();
		if(n>0) {
			pw.println("<script>alert('UploadSucess')</script>");
			RequestDispatcher rs=request.getRequestDispatcher("studenthome.jsp");
			rs.include(request, response);
		}
		else {
			pw.println("<script>alert('Upload UnSucess')</script>");
			RequestDispatcher rs=request.getRequestDispatcher("upload.jsp");
			rs .include(request, response);	
		}
		 } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
