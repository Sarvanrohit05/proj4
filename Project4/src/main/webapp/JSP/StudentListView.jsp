<%@page import="in.co.rays.proj4.util.HTMLUtility"%>
<%@page import="in.co.rays.proj4.model.StudentModel"%>
<%@page import="in.co.rays.proj4.util.ServletUtility"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="in.co.rays.proj4.bean.StudentBean"%>
<%@page import="in.co.rays.proj4.controller.StudentListCtl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student List</title>

 <script src="<%=ORSView.APP_CONTEXT %>/js/jquery.min.js"></script>
<script src="<%=ORSView.APP_CONTEXT %>/js/Checkbox11.js"></script>

</head>
<body>
<jsp:useBean id="cbean" class="in.co.rays.proj4.bean.CollegeBean" scope="request" ></jsp:useBean>
<jsp:useBean id="bean" class="in.co.rays.proj4.bean.StudentBean" scope="request" ></jsp:useBean>

  <form action="<%=ORSView.STUDENT_LIST_CTL%>" method="post">
    <%@include file="Header.jsp"%>
   
    <center>
    
     <div align="center">
	        <h1>Student List</h1>
            <h3><font color="red"><%=ServletUtility.getErrorMessage(request)%></font>
            <font color="green"><%=ServletUtility.getSuccessMessage(request)%></font></h3>
     </div>
     
     <% 
         List clist=(List) request.getAttribute("CollegeList");
     %>
     
       <%
                    int pageNo = ServletUtility.getPageNo(request);
                    int pageSize = ServletUtility.getPageSize(request);
                    int index = ((pageNo - 1) * pageSize) + 1;

                    List list = ServletUtility.getList(request);
                    Iterator<StudentBean> it = list.iterator();

	       			if(list.size() !=0){
                    %>
            
            <table width="100%" align="center">
                 <tr>
                 <td align="right">
                 <label> First Name:</label> 
                 	<input type="text" name="firstName" placeholder="Enter Student Name" Size= "25" value="<%=ServletUtility.getParameter("firstName", request)%>">
					&nbsp;
                 	<label>Last Name:</label> 
    	             <input type="text" name="lastName" placeholder="Enter last Name" Size= "25" value="<%=ServletUtility.getParameter("lastName", request)%>">
                    &nbsp;
                 	<label>EmailId:</label> 
    	             <input type="text" name="email" placeholder="Enter Email_id" Size= "25" value="<%=ServletUtility.getParameter("email", request)%>">
                    &nbsp; 
                    <label>College Name:</label> 
    	             <%=HTMLUtility.getList("collegeid",ServletUtility.getParameter("collegeid", request), clist) %>
                    &nbsp;   
        	         <input type="submit" name="operation" value="<%=StudentListCtl.OP_SEARCH%>">
        	       
        	         <input type="submit" name="operation" value="<%=StudentListCtl.OP_RESET%>">
        	         
                 </td>
                </tr>
            </table>
            
            <br>
            
            <table border="1" width="100%" align="center" cellpadding=6px
				cellspacing="2">

				<tr style="background: #E5E4E2">

					<th width="8%"><input type="checkbox" id="select_all" name="Select">Select
						All.</th>
                
                <th>S No.</th>
                <th>College.</th>
                <th>First Name.</th>
                <th>Last Name.</th>
                <th>Date Of Birth.</th>
                <th>Mobile No.</th>
                <th>Email_Id.</th>
                <th>Edit</th>
                </tr>
                
                <%
                	while(it.hasNext())
                	{
                	 bean = it.next();
                %>
                
                
                
       <tr align="center">
           	<td><input type="checkbox" class="checkbox" name="ids" value="<%=bean.getId() %>">
                    <td><%=index++%></td>
                    <td><%=bean.getCollegeName()%></td>
                    <td><%=bean.getFirstName()%></td>
                    <td><%=bean.getLastName()%></td>
                    <td><%=bean.getDob()%></td>
                    <td><%=bean.getMobileNo()%></td>
                    <td><%=bean.getEmail()%></td>
                    <td><a href="StudentCtl?id=<%=bean.getId()%>">Edit</a></td>
                </tr>
                <%
                    }
                %>
            </table>
            <table width="100%">
                <tr>
                <%if(pageNo == 1){ %>
                    <td><input type="submit" name="operation" disabled="disabled" value="<%=StudentListCtl.OP_PREVIOUS%>">
       				<%}else{ %>
       				<td><input type="submit" name="operation"  value="<%=StudentListCtl.OP_PREVIOUS%>"></td>
       				<%} %>		
                     
                     <td><input type="submit" name="operation" value="<%=StudentListCtl.OP_DELETE%>"> </td>
                    <td> <input type="submit" name="operation" value="<%=StudentListCtl.OP_NEW%>"></td>
                    
                  <% StudentModel model = new StudentModel();                  
                  %>  
                  <% if(list.size() < pageSize || model.nextPK()-1 == bean.getId()){ %>
                  <td align="right"> <input type="submit" name="operation" disabled="disabled" value="<%=StudentListCtl.OP_NEXT%>"></td>
  					<%}else{ %>                   
  				  <td align="right"> <input type="submit" name="operation"  value="<%=StudentListCtl.OP_NEXT%>"></td>
   					<%} %>                 
                    
                </tr>
            </table>
            		<%}if(list.size() == 0){ %>
            		<td align="center"><input type="submit" name="operation" value="<%=StudentListCtl.OP_BACK%>"></td>	
            		<% } %>
            	
            <input type="hidden" name="pageNo" value="<%=pageNo%>"> 
            <input type="hidden" name="pageSize" value="<%=pageSize%>">
        </form>
        </br>
         </br>
    </center>

 <%@include file="Footer.jsp"%>
 </body>
</html>