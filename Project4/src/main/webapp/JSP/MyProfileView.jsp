<%@page import="in.co.rays.proj4.controller.MyProfileCtl"%>
<%@page import="in.co.rays.proj4.util.HTMLUtility"%>
<%@page import="java.util.HashMap"%>
<%@page import="in.co.rays.proj4.util.DataUtility"%>
<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@page import="in.co.rays.proj4.controller.ORSView"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#date" ).datepicker({
      changeMonth: true,
      changeYear: true,
	  yearRange:'1980:2020',
	  dateFormat:'dd-mm-yy'
    });
  } );
  </script>


</head>
<body>
        <jsp:useBean id="bean" class="in.co.rays.proj4.bean.UserBean" scope="request"></jsp:useBean>
<form action="<%=ORSView.MY_PROFILE_CTL%>" method="post">

	 <%@ include file="Header.jsp"%>
<center>
         
            
            <input type="hidden" name="id" value="<%=bean.getId()%>">
            <input type="hidden" name="createdBy" value="<%=bean.getCreatedBy()%>">
            <input type="hidden" name="modifiedBy" value="<%=bean.getModifiedBy()%>"> 
            <input type="hidden" name="createdDatetime" value="<%=DataUtility.getTimestamp(bean.getCreatedDatetime())%>">
            <input type="hidden" name="modifiedDatetime" value="<%=DataUtility.getTimestamp(bean.getModifiedDatetime())%>">
            

            
     <div align="center">
                <h1>My Profile</h1>
            <H2><font color="red"> <%=ServletUtility.getErrorMessage(request)%></font></H2>
            <H2><font color="green"> <%=ServletUtility.getSuccessMessage(request)%></font></H2>
     </div>
          <!--   <table style="font-size: 20px"> -->
            <table>
                <tr>
                    <th align="left">LoginId <span style="color: red">*</span> :</th>
                    <td><input type="text" name="login" readonly="readonly" style="width: 170px" value="<%=DataUtility.getStringData(bean.getLogin())%>"readonly="readonly"></td>          
                   <td style="position: fixed"> <font  color="red"> <%=ServletUtility.getErrorMessage("login", request)%></font></td>
                </tr>
	
	<tr><th style="padding: 3px"></th></tr>

                <tr>
                    <th align="left">First Name <span style="color: red">*</span> :</th>
                    <td><input type="text" name="firstName" style="width: 170px"  value="<%=DataUtility.getStringData(bean.getFirstName())%>">
                   </td><td style="position: fixed"> <font color="red"> <%=ServletUtility.getErrorMessage("firstName", request)%></font></td>
                </tr>
    
    <tr><th style="padding: 3px"></th></tr>
                <tr>
                    <th align="left">Last Name <span style="color: red">*</span> :</th>
                    <td><input type="text" name="lastName" style="width: 170px"  value="<%=DataUtility.getStringData(bean.getLastName())%>">
                   </td><td style="position: fixed"> <font  color="red"> <%=ServletUtility.getErrorMessage("lastName", request)%></font></td>
                </tr>
   <tr><th style="padding: 3px"></th></tr>             
                <tr>
                    <th align="left">Gender <span style="color: red">*</span> :</th>
                    <td>
                        <%
                            HashMap map = new HashMap();
                            map.put("Male", "Male");
                            map.put("Female", "Female");
                            
                        %> <%=HTMLUtility.getList("gender", bean.getGender(),map)%>
                    </td>
                    <td style="position: fixed"> <font  color="red"> <%=ServletUtility.getErrorMessage("gender", request)%></font></td>
                </tr>
    <tr><th style="padding: 3px"></th></tr>
                <tr>
                    <th align="left">Mobile No <span style="color: red">*</span> :</th>
                    <td><input type="text" name="mobileNo" style="width: 170px" maxlength="10" value="<%=DataUtility.getStringData(bean.getMobileNo())%>"></td>
                    
					<td style="position: fixed"><font color="red"> <%=ServletUtility.getErrorMessage("mobileNo", request)%></font></td>
                </tr>
<tr><th style="padding: 3px"></th></tr>
                <tr>
                    <th align="left">Date Of Birth <span style="color: red">*</span> :</th>
                    <td><input type="text" name="dob" id="date" style="width: 170px" value="<%=DataUtility.getDateString(bean.getDob())%>">
                    
                    </td><td><font style="position: fixed"  color="red"> <%=ServletUtility.getErrorMessage("dob", request)%></font></td>
                </tr>
   <tr><th style="padding: 3px"></th></tr>	
                <tr> <th></th><td colspan="2">
                    
                    <input type="submit" name="operation" value="<%=MyProfileCtl.OP_SAVE %>"> 
                   
                    <input type="submit" name="operation" value="<%=MyProfileCtl.OP_CHANGE_MY_PASSWORD %>"> 
                    
                    </td>
                </tr>
            </table>
     
    </form>
    
    </center>
 
    <%@ include file="Footer.jsp"%>
</body>
</html>