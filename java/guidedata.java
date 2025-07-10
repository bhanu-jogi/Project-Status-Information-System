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

/**
 * Servlet implementation class guidedata
 */
@WebServlet("/guidedata")
public class guidedata extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public guidedata() {
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
	@SuppressWarnings("unused")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		PrintWriter pw=response.getWriter();
		HttpSession session=request.getSession();
		
		Connection conn=GetConnection.getConnection();
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String status="Authorized";
		session.setAttribute("email", email);
		try {
			Statement st=conn.createStatement();
			ResultSet rss=st.executeQuery("select * from guide where email='"+email+"' and password='"+password+"' and status='"+status+"'");
		if(rss.next()) {
			 
			pw.println("<script>alert('LoginSucess')</script>");
			RequestDispatcher rs=request.getRequestDispatcher("guidehome.jsp");
			rs.forward(request, response);
		}
		else  {
		pw.println("<script>alert('LoginUnsucess')</script>");
		RequestDispatcher rs=request.getRequestDispatcher("guide.jsp");
		rs.include(request, response);
	}

		 
 	
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		
		
		
		
	}

}
