<!doctype html>
<%@ page import="java.sql.*" import="databaseconnection.*" %>
<html class="no-js" lang="zxx">
    <head>
        
            <%@include file="headlinks.jsp" %>
   </head>

   <body>
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
    <!-- Preloader Start -->
   <%@ include file="studentheader.jsp" %>
    <main>
     <div class="slider-area slider-height" style="height:550px"data-background="assets/img/hero/im.jpeg">
            <div class="slider-active">
                <!-- Single Slider -->
                <div class="single-slider">
                    <div class="slider-cap-wrapper">
                        <div class="col-md-12">
                             
                           <h1  style="margin-right:100px;color:white;text-align:center;font-weight:bold;margin-top:125px;text-transform:uppercase;" data-animation="fadeInRight" data-delay=".5s">Update Project</h1>
                           
                            <!-- Hero Btn -->
                            
                        </div>
                        
                    </div>
                </div>
                
                
            </div>
            </div>
 
        <!-- slider Area Start-->
        <section class="m-5 p-5">
        		<div class="row">
                    <%
                    try{
                    int pid=Integer.parseInt(request.getParameter("id"));
                    PreparedStatement ps=con.prepareStatement("select * from studentprojects where stpid=?");
                    ps.setInt(1,pid);
                    rs=ps.executeQuery();
                    while(rs.next()){
                    	%>
                    	 <div class="col-lg-8">
                        <form class="form-contact contact_form" action="studentprojectupdatedata.jsp" enctype="multipart/form-data" method="post" >
                            <div class="row">
                                 <div class="col-sm-7">
                                    <div class="form-group">
                                        <input class="form-control" name="pid" value="<%=pid %>" required type="number" readonly placeholder="Enter Title" >
                                    </div>
                                </div>   
                               <div class="col-sm-7">
                                    <div class="form-group">
                                        <input class="form-control" name="title" value="<%=rs.getString(3) %>" required type="text" placeholder="Enter Title" >
                                    </div>
                                </div>   
                                <div class="col-sm-7">
                                    <div class="form-group">
                                        <textarea class="form-control" name="desc"  required  placeholder="Enter Description" ><%=rs.getString(4) %></textarea>
                                    </div>
                                </div> 
                                <div class="col-sm-7">
                                    <div class="form-group">
                                        <input class="form-control" name="domain" value="<%=rs.getString(5) %>" required id="subject" type="text" placeholder="Enter Domain" >
                                    </div>
                                </div>  
                                <div class="col-sm-7">
                                    <div class="form-group">
                                        <textarea class="form-control" name="techno" required id="subject" placeholder="Enter Technologies" ><%=rs.getString(6) %></textarea>
                                    </div>
                                </div> 
                                <div class="col-sm-7">
                                    <div class="form-group">
                                        <textarea class="form-control" name="srequire" required id="subject" placeholder="Enter Software Requirements" ><%=rs.getString(7) %></textarea>
                                    </div>
                                </div> 
                                <div class="col-sm-7">
                                    <div class="form-group">
                                        <textarea class="form-control" name="hrequire" required id="subject" placeholder="Enter Hardware Requirements" ><%=rs.getString(8) %></textarea>
                                    </div>
                                </div> 
                                <div class="col-sm-7">
                                    <div class="form-group">
                                    <label>ProjectImage</label>
                                        <input type="file" accept=".jpeg,.jpg,.png" class="form-control" name="image" required id="subject" />
                                    </div>
                                </div> 
                                <div class="col-sm-7">
                                    <div class="form-group">
                                    <label>ProjectAbstract</label>
                                        <input type="file" accept=".pdf,.doc,.docx,.txt" class="form-control" name="pabstract" required id="subject" />
                                    </div>
                                </div> 
                                     
                                
                              
                            </div>
                            <div class="form-group mt-3">
                                <button type="submit" style="text-transform:uppercase" class="button button-contactForm boxed-btn">SUBMIT</button>
                            </div>
                        </form>
                    </div>
                    	<%
                    }
                    
                    }catch(Exception e){
                    	e.printStackTrace();
                    }
                    %>
                   
                    
                </div>
                
            
             </section>
             
                <!-- Single Slider -->
                 
            <!-- slider-footer Start -->
      
             
    </main>
 
     
<%@ include file="footer.jsp" %>
   
        
    </body>
</html>