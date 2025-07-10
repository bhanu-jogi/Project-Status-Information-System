<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="headlinks.jsp" %>
<script >
function getDropCheck(){
	var sel=document.getElementById("dropdown1").value;
	var sel1=document.getElementById("dropdown2").value;
	
	if(sel=="select" || sel1=="select"){
		document.getElementById("btn").style.display="none";
	}else{
		document.getElementById("btn").style.display="block";
	}
}
function getGuide(){
   var gudet=document.getElementById("dropdown1").value;
   var guidedetails=gudet.split(",");
   var gname=guidedetails[0];
   var gemail=guidedetails[1];
   
  
   
   const xhr=new XMLHttpRequest();
   xhr.open("POST","hodguideselect.jsp",true);
   xhr.setRequestHeader("content-type","application/x-www-form-urlencoded");
   xhr.onreadystatechange=function(){
	   if(xhr.readyState==4 && xhr.status==200){
		   document.getElementById("option").innerHTML=xhr.responseText;
	   }
   };
   xhr.send("gemail="+gemail);
   
   
   
   
}
document.getElementById("ddate").addEventListener('input', function() {
    var selectedDate = new Date(this.value);
    var today = new Date();
    if (selectedDate < today) {
        alert('Please select a date from today onwards.');
        this.value = '';
    }
});

</script>
</head>
<body onload="getDropCheck()">
<%@include file="hodheader.jsp" %>


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
                             
                           <h1  style="margin-right:100px;color:white;text-align:center;font-weight:bold;margin-top:125px;text-transform:uppercase;" data-animation="fadeInRight" data-delay=".5s">Add PCR</h1>
                           
                            <!-- Hero Btn -->
                            
                        </div>
                        
                    </div>
                </div>
                
                
            </div>
            </div>
<section class="contact-section">
            <div class="container">

                <div class="row">
         
                    <div class="col-lg-6">
                        <form class="form-contact contact_form" action="hodaddpcrdata.jsp" method="post" >
                            <div class="row">
                                <div class="col-12">
                                    <div class="form-group">
                                    <label>Title:</label>
                                        <input type="text"   class="form-control w-100" name="title"  onfocus="this.placeholder = 'Enter   Title'" onblur="this.placeholder = 'Enter  Title '" placeholder=" Enter  Title "  required/>
                                    </div>
                                </div>
                                 <div class="col-12">
                                    <div class="form-group">
                                    <label>Description:</label>
                                        <textarea class="form-control" name="desc" onfocus="this.placeholder = 'Enter Description'" onblur="this.placeholder = 'Enter Description '" placeholder="Enter Description  " required ></textarea>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                    <label>Date Of PRC:</label>
                                        <input type="date" id="ddate" class="form-control w-100" name="dateprc"  min="<%=LocalDate.now() %>" onfocus="this.placeholder = 'Enter   Title'" onblur="this.placeholder = 'Enter  Title '" placeholder=" Enter  Title " required/>
                                    </div>
                                </div>
                               
                     
                                 
                                <div class="col-12">
                                    <div class="form-group">
                                   	<label>DueDate:</label>
                                        <input type="date" class="form-control" name="ddate"id="ddate" min="<%=LocalDate.now() %>" required />
                                    </div>
                                </div>
                                  <div class="col-12">
                                    <div class="form-group">
                                   	<label>PRC Panel:</label>
                                   	<select id="dropdown1" class="form-select mb-2" name="dropdown1" onchange="getGuide();getDropCheck()">
                                   		<option value="select">Select The Below</option>
                                   		<%try{
                                   			PreparedStatement ps=con.prepareStatement("select * from guides");
                                   			rs=ps.executeQuery();
                                   			int count=0;
                                   			while(rs.next()){
                                   				count++;
                                   				%>
                                   				<option value="<%=rs.getString(2)%>,<%=rs.getString(3)%>"><%=rs.getString(2) %></option>
                                   				<% 
                                   			}if(count==0){
                                   				%>
                                   				<option disabled>No Guides Are Available..</option>
                                   				<%
                                   			}
                                   		}catch(Exception e){
                                   			e.printStackTrace();
                                   		} %>
                                   	</select>
                                   	<div id="option">
                                   		
                                   	</div>
                                   <%-- 	<select id="dropdown2" class="form-select" onchange="updateDropdown('dropdown2', 'dropdown1')">
                                   		<option value="select">Select The Below</option>
                                   		<%try{
                                   			PreparedStatement ps=con.prepareStatement("select * from guides");
                                   			rs=ps.executeQuery();
                                   			int count=0;
                                   			while(rs.next()){
                                   				count++;
                                   				%>
                                   				<option value="<%=rs.getString(2)%>,<%=rs.getString(3)%>"><%=rs.getString(2) %></option>
                                   				<% 
                                   			}if(count==0){
                                   				%>
                                   				<option disabled>No Guides Are Available..</option>
                                   				<%
                                   			}
                                   		}catch(Exception e){
                                   			e.printStackTrace();
                                   		} %>
                                   	</select> --%>
                                         </div>
                                </div>
                               
                                
                            </div>
                            <div class="form-group mt-3">
                                <button type="submit" id="btn" style="display:none;text-transform:uppercase" class="button button-contactForm boxed-btn">SUBMIT</button>
                                
                            </div>
                        </form>
                    </div>
                    
                </div>
            </div>
        </section>
<%@include file="footer.jsp" %>
</body>
</html>