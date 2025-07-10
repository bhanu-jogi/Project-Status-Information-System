package project;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
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
 * Servlet implementation class updatedata
 */
@WebServlet("/updatedata")
public class updatedata extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updatedata() {
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
		
		Connection conn=GetConnection.getConnection();
		int id=Integer.parseInt(request.getParameter("id"));
		String str="new";
		String title=request.getParameter("title");
		String abstractt=request.getParameter("abstractt");
		String domain=request.getParameter("domain");
		String softrequire=request.getParameter("softrequire");
		String hardrequire=request.getParameter("hardrequire");

		 String email=request.getParameter("email");
		Date datee = new Date();  
	    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");  
	    String date= formatter.format(datee); 
	     
	 
		 
		try {
			
			 
			PreparedStatement st=conn.prepareStatement("update title set title=?,abstractt=?,domain=?,softrequire=?,hardrequire=?,date=? where email='"+email+"' and id='"+id+"' and status='"+str+"'" );
			st.setString(1, title);
			st.setString(2, abstractt);
			st.setString(3, domain);
			st.setString(4, softrequire);
			st.setString(5, hardrequire);
			 st.setString(6, date);
			 int n=st.executeUpdate();
		 
			
			if(n>0) {
			pw.println("<script>alert('Sucess')</script>");
			RequestDispatcher rs=request.getRequestDispatcher("viewtitle.jsp");
			rs.include(request, response);
		}
		else{
			pw.println("<script>alert('UnSucess')</script>");
			RequestDispatcher rs=request.getRequestDispatcher("update.jsp");
			rs.include(request, response);
		}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		
	}

}
