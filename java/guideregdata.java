package project;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
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
 * Servlet implementation class guideregdata
 */
@WebServlet("/guideregdata")
public class guideregdata extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public guideregdata() {
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
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String number=request.getParameter("number");
		session.setAttribute("email", email);
		String status="waiting";
		try {
			
			Statement ss=conn.createStatement();
			ResultSet rss=ss.executeQuery("select * from guide where email='"+email+"'");
			if(rss.next()) {
				pw.println("<script>alert('Already Used This Email')</script>");
				RequestDispatcher rs=request.getRequestDispatcher("registerguide.jsp");
				rs.include(request, response);
			
			}
			else {
			PreparedStatement st=conn.prepareStatement("insert into guide(name,email,password,number,status)values(?,?,?,?,?)");
			st.setString(1, name);
			st.setString(2, email);
			st.setString(3, password);
			st.setString(4, number);
			st.setString(5, status);
			 int n=st.executeUpdate();
		 
			
			if(n>0) {
			pw.println("<script>alert('RegisterSucess')</script>");
			RequestDispatcher rs=request.getRequestDispatcher("guide.jsp");
			rs.forward(request, response);
		}
		else{
			pw.println("<script>alert('Register UnSucess')</script>");
			RequestDispatcher rs=request.getRequestDispatcher("registerguide.jsp");
			rs.include(request, response);
		}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}}


