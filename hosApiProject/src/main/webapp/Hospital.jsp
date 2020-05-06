<%@page import="com.healthcare.project.hosApiProject.Hospital"%>
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
   <%! // Save
   
  /* if (request.getParameter("h_id") != null)
		{
	    Hospital HospitalObj = new Hospital();

		String stsMsg = "";
		}
   
 //Insert--------------------------
   if (request.getParameter("hidHosIDSave") == "")
    {
    stsMsg = hospitalObj.insertHospital(request.getParameter("h_id"),
    request.getParameter("h_name"),
    request.getParameter("h_address"),
    request.getParameter("h_phone"),
    request.getParameter("h_email"));
    }
 
   else//Update----------------------
   {
   stsMsg = hospitalObj.updateItem(request.getParameter("hidItemIDSave"),
   request.getParameter("h_name"),
   request.getParameter("h_address"),
   request.getParameter("h_phone"),
   request.getParameter("h_email"));
   }
 
   session.setAttribute("statusMsg", stsMsg);
   }
   
   //Delete-----------------------------
   if (request.getParameter("hidItemIDDelete") != null)
   {
    Hospital hospitalObj = new Hospital();
    String stsMsg =
    hospitalObj.deleteItem(request.getParameter("hidHosIDDelete"));
    session.setAttribute("statusMsg", stsMsg); */

   %>
 
<!DOCTYPE html>
<html>
<meta charset="ISO-8859-1">
    <title>Hospital Management</title>
    <link rel="stylesheet" href="Views/css/bootstrap.min.css">
    <script src="Components/jquery-3.5.0.min.js"></script>
    <script src="Components/hospital.js"></script>
    
    
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-6">
            <h1>Hospital Management </h1>
            <form id="formHospital" name="formHospital">  
            Hospital Id:
                <input id="h_id" name="h_id" type="text"
                       class="form-control form-control-sm">
               <br> Hospital Name:
                <input id="h_name" name="h_name" type="text"
                       class="form-control form-control-sm">
                <br> Hospital Address:
                <input id="h_address" name="h_address" type="text"
                       class="form-control form-control-sm">
                <br> Hospital Phone Number:
                <input id="h_phone" name="h_phone" type="text"
                       class="form-control form-control-sm">
                <br> Hospital Email:
                <input id="h_email" name="h_email" type="text"
                       class="form-control form-control-sm">
                <br>
                <input id="btnSave" name="btnSave" type="button" value="Save"
                       class="btn btn-primary">
                <input type="hidden" id="hidHosIDSave" name="hidHosIDSave" value="">
            </form>
            <div id="alertSuccess" class="alert alert-success"></div>
            <div id="alertError" class="alert alert-danger"></div>
            <br>
            <div id="divHospitalGrid">
                <%
                    Hospital hospitalObj = new Hospital();
                    out.print(hospitalObj.readHospital());
                %>
            </div>

        </div>
    </div>
</div>

</body>
</html>
