	<!doctype html>
	<html>
    <head>
        <%@include file="headlinks.jsp" %>
   </head>

   <body>
   <main> 
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
   <%@ include file="guideheader.jsp" %>
   <!-- Hero Start-->
   <%String email=(String)session.getAttribute("email");
   String name="";
   try{
	   PreparedStatement ps=con.prepareStatement("select * from guides where egmail=?");
	   ps.setString(1,email);
	   rs=ps.executeQuery();
	   while(rs.next()){
		   name=rs.getString(2);
	   }
   }catch(Exception e){
	   e.printStackTrace();
   }%>
      <!-- slider Area Start-->
        <div class="slider-area slider-height" style="height:550px"data-background="assets/img/hero/im.jpeg">
            <div class="slider-active">
                <!-- Single Slider -->
                <div class="single-slider">
                    <div class="slider-cap-wrapper">
                        <div class="col-md-12">
                             
                           <h1  style="margin-right:100px;color:white;text-align:center;font-weight:bold;margin-top:125px;text-transform:uppercase;" data-animation="fadeInRight" data-delay=".5s">Welcome <%=name %>!!</h1>
                           
                            <!-- Hero Btn -->
                            
                        </div>
                        
                    </div>
                </div>
                
                
            </div>
            </div>
        <!--Hero End -->
          <div class="support-company-area section-padding3 fix">
            <div class="container">
                <div class="row align-items-center">
                   
                    <div class="col-xl-6 col-lg-6">
                        <div class="left-caption">
                            <!-- Section Tittle -->
                            <div class="section-tittle">
                               
                                <h2>Inspiring Success Through Guidance</h2>
                            </div>
                            <div class="support-caption">
                                <p>Welcome to the Guide Portal, where mentorship meets opportunity. This platform is designed to empower you as a mentor, enabling you to oversee student progress, review their projects, and provide insightful feedback that fosters growth and innovation. </p>
                                <p>Your role as a guide is instrumental in shaping the aspirations and achievements of tomorrow's leaders. Together, we can build a collaborative and supportive environment that nurtures creativity, drives excellence, and transforms ideas into impactful outcomes. </p>
                                
                                <div class="select-suport-items">
                                    <label class="single-items">Oversee and track student project progress with ease.
                                        <input disabled type="checkbox" checked="checked active">
                                        <span class="checkmark"></span>
                                    </label>
                                    <label class="single-items">  Provide valuable feedback to enhance student outcomes.
                                        <input disabled type="checkbox" checked="checked active">
                                        <span class="checkmark"></span>
                                    </label>
                                    <label class="single-items">Collaborate with HODs and students for streamlined mentorship.
                                        <input disabled type="checkbox" checked="checked active">
                                        <span class="checkmark"></span>
                                    </label>
                                    <label class="single-items"> Inspire innovation and guide students toward success.
                                        <input disabled type="checkbox" checked="checked active">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                                <p>-- Thank you for being a vital part of this journey toward success.</p>
                            </div>
                        </div>
                    </div>
                     <div class="col-xl-6 col-lg-6">
                        <div class="support-location-img mb-50">
                            <img src="assets/img/g.png" style="height:750px"alt="">
                           
                        </div>
                    </div>
                </div>
            </div>
        </div>
       
    </main>
 
     
     
 
     

<%@ include file="footer.jsp" %>
   
        
</body>
</html>