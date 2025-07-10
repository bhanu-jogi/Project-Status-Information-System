<!doctype html>
<%@ page  import="java.sql.*" import="java.util.*"  import="project.*"%>

<html >
<head>
        <%@include file="headlinks.jsp" %>
 <script type="text/javascript">
        	function getBtnCheck(){
        		var sel1=document.getElementById("sel1").value;
        		var sel2=document.getElementById("sel2").value;
        		
        		if(sel1=="select" || sel2=="select" ){
        			document.getElementById("btn").style.display="none";
        		}else{
        			document.getElementById("btn").style.display="block";
        		}
        		}
 </script>
</head>

<body onload="getBtnCheck()">
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
   <%@ include file="hodheader.jsp" %>
    
    <main>
    <div class="slider-area slider-height" style="height:550px"data-background="assets/img/hero/im.jpeg">
            <div class="slider-active">
                <!-- Single Slider -->
                <div class="single-slider">
                    <div class="slider-cap-wrapper">
                        <div class="col-md-12">
                             
                           <h1  style="margin-right:100px;color:white;text-align:center;font-weight:bold;margin-top:125px;text-transform:uppercase;" data-animation="fadeInRight" data-delay=".5s">Assign Guide</h1>
                           
                            <!-- Hero Btn -->
                            
                        </div>        
                    </div>
                </div>     
            </div>
            </div>
 

<!-- slider Area Start-->
        <section class="m-5">
        		<div class="container">
                    
                    <div class="col-lg-8">
                        <form class="form-contact contact_form" action="hodassignguidetostudentdata.jsp" method="post" >
                            <div class="row">
                                
                               <div class="col-sm-7 mb-2">
                                    <div class="form-group">
                                    <label>Guide:</label>
                                    <select name="guide" id="sel1"  onchange="getBtnCheck()" required class="form-select ">
                                    <option value="select">Please Select Below</option>
                                    <%try{
                                    	PreparedStatement ps=con.prepareStatement("select * from guides");
                                    	rs=ps.executeQuery();
                                    	while(rs.next()){
                                    		%>
                                    		<option value="<%=rs.getString(2)%>,<%=rs.getString(3)%>"><%=rs.getString(2) %></option>
                                    		<%
                                    	}
                                    }catch(Exception e){
                                    	e.printStackTrace();
                                    } %>
                                    </select>
                                       
                                    </div>
                                </div>  
                                 <div class="col-sm-7">
                                    <div class="form-group">
                                    <label>Student:</label>
                                    <select name="student" id="sel2" onchange="getBtnCheck()" required class="form-select ">
                                    <option value="select">Please Select Below</option>
                                    <%try{
                                    	PreparedStatement ps=con.prepareStatement("select * from students where guidename='pending'");
                                    	rs=ps.executeQuery();
                                    	while(rs.next()){
                                    		%>
                                    		<option value="<%=rs.getString(2)%>,<%=rs.getString(3)%>"><%=rs.getString(2) %></option>
                                    		<%
                                    	}
                                    }catch(Exception e){
                                    	e.printStackTrace();
                                    } %>
                                    </select>  
                                    </div>
                                </div>    
                            </div>
                            <div class="form-group mt-3">
                                <button type="submit" id="btn" style="text-transform:uppercase" class="button button-contactForm boxed-btn">SUBMIT</button>
                            </div>
                        </form>
                    </div>  
                </div>
             </section>
          </main>
<%@ include file="footer.jsp" %>
</body>
</html>