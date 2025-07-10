<!doctype html>
<html class="no-js" lang="zxx">
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
    <main>
     <!-- Hero Start-->
      <!-- slider Area Start-->
        <div class="slider-area slider-height" style="height:550px"data-background="assets/img/hero/im.jpeg">
            <div class="slider-active">
                <!-- Single Slider -->
                <div class="single-slider">
                    <div class="slider-cap-wrapper">
                        <div class="col-md-12">
                             
                           <h1  style="margin-right:100px;color:white;text-align:center;font-weight:bold;margin-top:125px;text-transform:uppercase;" data-animation="fadeInRight" data-delay=".5s">student Register </h1>
                           
                            <!-- Hero Btn -->
                            
                        </div>
                        
                    </div>
                </div>
                
                
            </div>
            </div>
        <!--Hero End -->
   

     <section class="contact-section">
            <div class="container">

                <div class="row">
                  
                    <div class="col-lg-6">
                        <form class="form-contact contact_form" action="studentregisterdata.jsp" method="post" enctype="multipart/form-data">
                            <div class="row">
                                <div class="col-12">
                                    <div class="form-group">
                                        <input type="text" class="form-control w-100" name="sname"  onfocus="this.placeholder = 'Enter Your  Name'" onblur="this.placeholder = 'Enter Your Name '" placeholder=" Enter Your Name " required/>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <input type="email" class="form-control w-100" name="email"  onfocus="this.placeholder = 'Enter Your  Email'" onblur="this.placeholder = 'Enter Your Email '" placeholder=" Enter Your Email " required/>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <input type="password" class="form-control w-100" name="pwd"  onfocus="this.placeholder = 'Enter Password'" onblur="this.placeholder = 'Enter Password '" placeholder=" Enter Password " required/>
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <input class="form-control " name="fname" type="text" onfocus="this.placeholder = 'Enter Father Name'" onblur="this.placeholder = 'Enter Father Name'" placeholder="Enter Father Name" required />
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <input class="form-control valid" name="rno"  type="text" onfocus="this.placeholder = 'Enter Roll Number'" onblur="this.placeholder = 'Enter Roll Number'" placeholder="Enter Roll Number" required />
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                   
                                        <input class="form-control" name="stream"  type="text" onfocus="this.placeholder = 'Enter Your Stream'" onblur="this.placeholder = 'Enter Your Stream'" placeholder="Enter Your Stream " required />
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                   
                                        <input class="form-control" name="mobile"  type="tel" pattern="[6-9][0-9]{9}"  onfocus="this.placeholder = 'Enter Mobile No'" onblur="this.placeholder = 'Enter Mobile No '" placeholder="Enter Mobile No  " required />
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                   
                                        <input class="form-control" name="dob"  type="date" required />
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                   
                                        <select class="form-control form-select mb-4" name="gender" required>
                                        <option value="select">Please Select Below</option>
                                        	<option value="others">Others</option>
                                        	<option value="Male">Male</option>
                                        	<option value="Female">Female</option>
                                        </select>
                                    </div>
                                </div>
                                  <div class="col-12">
                                    <div class="form-group">
                                   
                                        <textarea class="form-control" name="address" onfocus="this.placeholder = 'Enter Address'" onblur="this.placeholder = 'Enter Address '" placeholder="Enter Address  " required ></textarea>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                   
                                        <input type="text" class="form-control" name="city" onfocus="this.placeholder = 'Enter City'" onblur="this.placeholder = 'Enter City '" placeholder="Enter City  " required />
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                   
                                        <input type="number" class="form-control" onwheel="blur()" name="pincode" onfocus="this.placeholder = 'Enter Pincode'" onblur="this.placeholder = 'Enter Pincode '" placeholder="Enter Pincode  " required/>
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
                                <a href="student.jsp" style="text-transform:uppercase"class="button button-contactForm boxed-btn" >Back</a>
                            </div>
                        </form>
                    </div>
                    
                </div>
            </div>
        </section>
                
                
             
    </main>
 
     

<%@ include file="footer.jsp" %>
    <!-- JS here -->
		 
</body>
</html>