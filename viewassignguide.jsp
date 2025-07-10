<!doctype html>
<%@ page   import="java.sql.*" import="java.util.*"  import="project.*"%>
<html class="no-js" lang="zxx">
    <head>
       <%@include file="headlinks.jsp" %>
   </head>

   <body>
   <main> 
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
    <!-- Preloader Start -->
   <%@ include file="studentheader.jsp" %>
   <%@include file="connect.jsp" %>
   <div class="slider-area slider-height" style="height:550px"data-background="assets/img/hero/im.jpeg">
            <div class="slider-active">
                <!-- Single Slider -->
                <div class="single-slider">
                    <div class="slider-cap-wrapper">
                        <div class="col-md-12">
                             
                           <h1  style="margin-right:100px;color:white;text-align:center;font-weight:bold;margin-top:125px;text-transform:uppercase;" data-animation="fadeInRight" data-delay=".5s">Assigned Guide</h1>
                           
                            <!-- Hero Btn -->
                            
                        </div>
                        
                    </div>
                </div>
                
                
            </div>
            </div>
   
   
          
              
              
               <div class="team-area section-padding30">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="cl-xl-7 col-lg-8 col-md-10">
                        <!-- Section Tittle -->
                        <div class="section-tittle text-center mb-70">
                            <span>Assigned Guide</span>
                            <h2>Connect with your designated guide and embark on a path to excellence.</h2>
                        </div> 
                    </div>
                </div>
                <%String email=(String)session.getAttribute("email");
                try{
                	PreparedStatement ps=con.prepareStatement("select guides.gid,guides.mobile,guides.egmail,guides.gname,guides.department,guides.empid,students.sname from guides inner join students on guides.egmail=students.guideEmail where students.email=?");
                	ps.setString(1,email);
                	rs=ps.executeQuery();
                	int count=0;
                	while(rs.next()){
                		count++;
                		%>
                		<div class="row">
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="single-team mb-30">
                            <div class="team-img">
                                <img src="studentguiimg.jsp?id=<%=rs.getInt(1) %>" style="width:270px;height:350px"alt="">
                                <!-- Blog Social -->
                                <div class="team-social">
                                    
                                    <li><a   data-toggle="tooltip" style="background-color:skyblue;color:white" data-placement="right"title="<%=rs.getString(2)%>"><i class="fa fa-phone"></i></a></li>
                                    <li><a  data-toggle="tooltip" style="background-color:skyblue;color:white" data-placement="right"title="<%=rs.getString(3)%>"><i class="fas fa-envelope" ></i></a></li>
                                 </div>
                            </div>
                            <div class="team-caption">
                                <h3><a   style="text-transform:uppercase"><%=rs.getString(4) %></a></h3>
                               
                                <p><%=rs.getString(6) %></p>
                                 <p><%=rs.getString(5) %></p>
                                
                            </div>
                            
                            <p style="text-transform:uppercase;"><span style="text-weight:bold;color:skyblue;"><i class="fas fa-hands-helping"></i>&nbsp;</span><%=rs.getString(7) %></p>
                     <%-- 
                             <p style="text-transform:uppercase;"><span style="text-transform:uppercase;text-weight:bold;color:skyblue;"><i class="fa fa-suitcase fa-lg"></i>&nbsp;</span><%=rs.getString(7) %></p>
                      <p style="text-transform:uppercase;"><span style="text-transform:uppercase;text-weight:bold;color:skyblue;"><i class="fa fa-calendar-alt fa-lg"></i>&nbsp;</span><%=rs.getString(9) %></p>
                       <p style="text-transform:uppercase;"><span style="text-transform:uppercase;text-weight:bold;color:skyblue;"><i class="fa fa-venus-mars fa-lg"></i>&nbsp;</span><%=rs.getString(10) %></p>
                      --%>  
                       <%-- <%
                       String status=rs.getString(16);
                       if(status.equalsIgnoreCase("Accepted")){
                    	   %>
                    	   <a class="genric-btn danger ml-5" onclick="return confirm('Do You Want To Deactivate?')"href="hodstudentdeactivate.jsp?id=<%=rs.getInt(1) %>" >Deactivate</a>
                    	   <% 
                       }else if(status.equalsIgnoreCase("Rejected")){
                    	   %>
                    	   <a class="genric-btn danger ml-5" onclick="return confirm('Do You Want To Delete?')"href="hodstudentdelete.jsp?id=<%=rs.getInt(1) %>" >Delete</a>
                    	   <% 
                       }else if(status.equalsIgnoreCase("Deactivate")){
                    	   %>
                    	   <a class="genric-btn info ml-5" onclick="return confirm('Do You Want To Activate?')" href="hodstudentactivate.jsp?id=<%=rs.getInt(1) %>" >Activate</a>
                    	   <% 
                       }else{
                    	   %>
                    	   <a class="genric-btn primary ml-3" href="hodstudentaccept.jsp?id=<%=rs.getInt(1)%>">Accept</a><a href="hodstudentreject.jsp?id=<%=rs.getInt(1) %>" onclick="return confirm('Do You Want To Reject')"class="genric-btn danger ml-2">Reject</a>
                    	   <%
                       }
                       %> --%>
                        </div>
                    </div>
                    
                   
                    
                </div>
                		
                		<%
                		
                	}if(count==0){
                		%>
                		<h3 style="color:red;text-align:center">Guide Not Assigned yet..!!</h3>
                		<%
                	}
                }catch(Exception e){
                	e.printStackTrace();
                } %>
                
            </div>
        </div>
    </main>
 
     
 
     

<%@ include file="footer.jsp" %>
    
        
    </body>
</html>