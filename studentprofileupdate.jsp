<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="headlinks.jsp" %>
</head>
<body>
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
   <%@ include file="head.jsp" %>
   <%@include file="connect.jsp" %>
    <main>
     <!-- Hero Start-->
      <!-- slider Area Start-->
        <div class="slider-area slider-height" style="height:550px"data-background="assets/img/hero/im.jpeg">
            <div class="slider-active">
                <!-- Single Slider -->
                <div class="single-slider">
                    <div class="slider-cap-wrapper">
                        <div class="col-md-12">
                             
                           <h1  style="margin-right:100px;color:white;text-align:center;font-weight:bold;margin-top:125px;text-transform:uppercase;" data-animation="fadeInRight" data-delay=".5s">Update Profile</h1>
                           
                            <!-- Hero Btn -->
                            
                        </div>
                        
                    </div>
                </div>
                
                
            </div>
            </div>
        <!--Hero End -->
   
<%
try{
String email=(String)session.getAttribute("email");
int id=Integer.parseInt(request.getParameter("id"));

PreparedStatement ps=con.prepareStatement("select * from students where stid=?");
ps.setInt(1,id);
rs=ps.executeQuery();
while(rs.next()){
	%>
	<section class="contact-section">
            <div class="container">

                <div class="row">
                  
                    <div class="col-lg-6">
                        <form class="form-contact contact_form" action="studentprofileupdatedata.jsp" method="post" enctype="multipart/form-data">
                            <div class="row">
                            <div class="col-12">
                                    <div class="form-group">
                                        <input type="number" class="form-control w-100" name="sid"  readonly value="<%=id%>"onfocus="this.placeholder = 'Enter Your  Name'" onblur="this.placeholder = 'Enter Your Name '" placeholder=" Enter Your Name " required/>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <input type="text" class="form-control w-100" name="sname" value="<%=rs.getString(2) %>"  onfocus="this.placeholder = 'Enter Your  Name'" onblur="this.placeholder = 'Enter Your Name '" placeholder=" Enter Your Name " required/>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <input type="email" class="form-control w-100" name="email" readonly value="<%=rs.getString(3) %>" onfocus="this.placeholder = 'Enter Your  Email'" onblur="this.placeholder = 'Enter Your Email '" placeholder=" Enter Your Email " required/>
                                    </div>
                                </div>
                                
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <input class="form-control " name="fname" type="text"  value="<%=rs.getString(5) %>"onfocus="this.placeholder = 'Enter Father Name'" onblur="this.placeholder = 'Enter Father Name'" placeholder="Enter Father Name" required />
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <input class="form-control valid" name="rno" value="<%=rs.getString(6) %>" type="text" onfocus="this.placeholder = 'Enter Roll Number'" onblur="this.placeholder = 'Enter Roll Number'" placeholder="Enter Roll Number" required />
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                   
                                        <input class="form-control" name="stream"  type="text"  value="<%=rs.getString(7) %>"onfocus="this.placeholder = 'Enter Your Stream'" onblur="this.placeholder = 'Enter Your Stream'" placeholder="Enter Your Stream " required />
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                   
                                        <input class="form-control" name="mobile"  value="<%=rs.getString(8) %>" type="tel" pattern="[6-9][0-9]{9}"  onfocus="this.placeholder = 'Enter Mobile No'" onblur="this.placeholder = 'Enter Mobile No '" placeholder="Enter Mobile No  " required />
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                   
                                        <input class="form-control" name="dob"  value="<%=rs.getString(9) %>" type="date" required />
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                   
                                        <select class="form-control form-select mb-4" name="gender" required>
                                        <option value="<%=rs.getString(10)%>"><%=rs.getString(10) %></option>
                                        	<option value="others">Others</option>
                                        	<option value="Male">Male</option>
                                        	<option value="Female">Female</option>
                                        </select>
                                    </div>
                                </div>
                                  <div class="col-12">
                                    <div class="form-group">
                                   
                                        <textarea class="form-control"  name="address" onfocus="this.placeholder = 'Enter Address'" onblur="this.placeholder = 'Enter Address '" placeholder="Enter Address  " required ><%=rs.getString(11) %></textarea>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                   
                                        <input type="text" class="form-control" name="city"  value="<%=rs.getString(12) %>" onfocus="this.placeholder = 'Enter City'" onblur="this.placeholder = 'Enter City '" placeholder="Enter City  " required />
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                   
                                        <input type="number" class="form-control" onwheel="blur()" value="<%=rs.getString(13) %>" name="pincode" onfocus="this.placeholder = 'Enter Pincode'" onblur="this.placeholder = 'Enter Pincode '" placeholder="Enter Pincode  " required/>
                                    </div>
                                </div>
                                 <div class="col-12">
                                    <div class="form-group">
                                   
                                        <input type="file" class="form-control"  name="image"  accept=".jpeg,.jpg,.png" required/>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group mt-3">
                                <button type="submit" style="text-transform:uppercase" class="button button-contactForm boxed-btn">SUBMIT</button>
                                
                            </div>
                        </form>
                    </div>
                    
                </div>
            </div>
        </section>
	<%
}
}catch(Exception e){
	e.printStackTrace();
}

%>
     
                
                
             
    </main>
 
     

<%@ include file="footer.jsp" %>
    <!-- JS here -->
</body>
</html>