<!doctype html>
<%@ page   import="java.sql.*" import="java.util.*"  import="project.*"%>
<html class="no-js" lang="zxx">
    <head>
        <%@include file="headlinks.jsp" %>
   </head>

   <body>
   <main> 
    <%@ include file="hodheader.jsp" %>
    <%@include file="connect.jsp" %>
    <!-- Preloader Start -->
    <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
                <div class="preloader-circle"></div>
                <div class="preloader-img pere-text">
                     
                    <h3>Project</h3>
                </div>
            </div>
        </div>
    </div>
    <!-- Preloader End -->
    <div class="slider-area slider-height" style="height:550px"data-background="assets/img/hero/im.jpeg">
            <div class="slider-active">
                <!-- Single Slider -->
                <div class="single-slider">
                    <div class="slider-cap-wrapper">
                        <div class="col-md-12">
                             
                           <h1  style="margin-right:100px;color:white;text-align:center;font-weight:bold;margin-top:125px;text-transform:uppercase;" data-animation="fadeInRight" data-delay=".5s">Student Projects</h1>
                           
                            <!-- Hero Btn -->
                            
                        </div>
                        
                    </div>
                </div>
                
                
            </div>
            </div>
    <!--================Blog Area =================-->
       <!--================Blog Area =================-->
<section class="blog_area section-padding">
    <div class="container">
        <div class="row">
            <%
                try {
                    PreparedStatement ps = con.prepareStatement("SELECT studentprojects.stpid, studentprojects.title, studentprojects.description, studentprojects.domain, studentprojects.techno, studentprojects.sreq, studentprojects.hreq, studentprojects.date, studentprojects.status, studentprojects.stemail, students.sname FROM studentprojects INNER JOIN students ON studentprojects.stemail = students.email");
                    rs = ps.executeQuery();
                    while (rs.next()) {
            %>
            <!-- Card 1 -->
            <div class="col-lg-6 col-md-6 mb-4">
                <article class="blog_item">
                    <div class="blog_item_img">
                        <img class="card-img rounded-0" style="width:570px;height:330px;"src="stdprjimg.jsp?id=<%= rs.getInt(1) %>" alt="">
                        <a href="#" class="blog_item_date">
                            <h3><%= rs.getDate(8) %></h3>
                        </a>
                    </div>
                    <div class="blog_details">
                        <h2 style="text-transform:uppercase"><%= rs.getString(11) %></h2>
                        <p><%= rs.getString(10) %></p>
                        <a class="d-inline-block">
                            <h2><i class="fa fa-cogs fa-2x mr-1"></i><%= rs.getString(2) %></h2>
                        </a>
                        <p><%= rs.getString(3) %>.</p>
                        <i style="color:skyblue;" class="fas fa-file-alt fa-2x mb-4 mr-2"></i><a href="guidestudentprojectabtsdow.jsp?id=<%=rs.getInt(1)%>">&nbsp;Abstract</a>
                        <ul class="blog-info-link">
                            <li><a><i class="fas fa-briefcase fa-lg"></i><%= rs.getString(4) %></a></li>
                            <li><a><i class="fas fa-cube fa-lg"></i> <%= rs.getString(5) %></a></li>
                            <li><a><i class="fas fa-file-code fa-lg"></i> <%= rs.getString(6) %></a></li>
                            <li><a><i class="fas fa-laptop fa-lg"></i><%= rs.getString(7) %></a></li>
                        </ul>
                         <div class="container ml-5 mt-4 m-3 mx-3">
                                   
                                     <a class="genric-btn warning large" href="hodstudentprojecttasks.jsp?id=<%=rs.getInt(1)%>">Tasks</a>
                                    </div>
                    </div>
                </article>
            </div>
            <% 
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>  
        </div>
    </div>
</section>

        <!--================Blog Area =================-->
  
   <%-- <!-- slider Area Start-->
        <div class="slider-area slider-height" data-background="assets/img/hero/h1_hero.jpg">
            <div class="slider-active">
                <!-- Single Slider -->
                
                
                    <div class="slider-cap-wrapper">
                      
                     <div class="col-lg-8 ">
                     
                                <center>
                        <div class="col-xl-2 col-lg-2 col-md-1">
                                <div class="logo">
                                    <h3>ViewTitle</h3>
                                </div>
                            </div> 
                            </div>
         <div class="offset-lg-1">
                 <div table style=text-align:center;color:#000000;>
    <div style=margin-left:3%>                  
                         <%
                         
                         
 try{        
	 String status="new";
	 Connection conn=GetConnection.getConnection();
	 
	  
	 
	 
	 Statement st=conn.createStatement();
	 ResultSet rs=st.executeQuery("select * from title");
	 out.println("<table border=1 width=80% >");
	 out.println("<tr>");
	 out.println("<th>"+"ID"+"</th>"+"<th>"+"TITLE"+"</th>"+"<th>"+"ABSTRACT"+"</th>"+"<th>"+"DOMAIN"+"</th>"+"<th>"+"SOFTWARE REQUIREMENT"+"</th>"+"<th>"+"HARDWARE REQUIREMENT"+"</th>"+"<th>"+"DATE & TIME"+"</th>"+"<th>"+"EMAIL"+"</th>"+"<th>"+"STATUS"+"</th>");
	 out.println("<tr>");
	 
	 while(rs.next()){
		 
		 
		 
		 out.println("<tr>");
		 out.println("<td>"+rs.getInt(1)+"</td>"+"<td>"+rs.getString(2)+"</td>"+"<td>"+rs.getString(3)+"</td>"+"<td>"+rs.getString(4)+"</td>"+"<td>"+rs.getString(5)+"</td>"+"<td>"+rs.getString(6)+"</td>"+"<td>"+rs.getString(8)+"</td>"+"<td>"+rs.getString(9)+"</td>"+"<td>"+rs.getString(7)+"</td>");
		   out.println("</tr>");
	 }
	 
	 
	 out.println("</table>");
	 
	 
	 
	 
	 
	 
 }
     catch(Exception e){                    
    	 e.printStackTrace();
     }
                         
                         
                         %>
                         </div>  
            <!-- slider-footer Start -->
            </div>
            </div>
            </div>
            </div>
             </div> --%>
    </main>
 
     
 
     

<%@ include file="footer.jsp" %>
   
</body>
</html>