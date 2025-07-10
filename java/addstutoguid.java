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
 * Servlet implementation class addstutoguid
 */
@WebServlet("/addstutoguid")
public class addstutoguid extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addstutoguid() {
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
		
		 
		String stemail=request.getParameter("student");
		 
		String stname=null;
		String guemail=request.getParameter("guide");
		String guname=null;
 
		//GetConnection obj = new GetConnection();
		Connection conn=GetConnection.getConnection();
		 try {
			Statement ps2 = conn.createStatement();
		 ResultSet rss=ps2.executeQuery("select * from student where email='"+stemail+"'");
		
		if(rss.next()) {
			
			  stname=rss.getString(2);
			 }
		 
		 } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
				Statement ps = conn.createStatement();
			 ResultSet rs=ps.executeQuery("select * from guide where email='"+guemail+"'");
			
			if(rs.next()) {
				
				  guname=rs.getString(2);
				 }
			 
			 } catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		 try {
			PreparedStatement pp=conn.prepareStatement("insert into assign(stemail,stname,guemail,guname)values(?,?,?,?)");
			pp.setString(1, stemail);
			 
			pp.setString(2, stname);
			pp.setString(3, guemail);
			pp.setString(4, guname);
			int n=pp.executeUpdate();
			if(n>0) {
				pw.println("<script>alert('Assigned Sucess')</script>");
				RequestDispatcher rs=request.getRequestDispatcher("hodhome.jsp");
				rs .include(request, response);	
			}
			else {
				pw.println("<script>alert('Assigned UnSucess')</script>");
				RequestDispatcher rs=request.getRequestDispatcher("assigngutost.jsp");
				rs .include(request, response);	
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		  
	}

}
