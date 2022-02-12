<%@page import="entites.product"%>
<%@page import="userdao.productDao"%>

<%@page import="entites.category"%>
<%@page import="java.util.List"%>
<%@page import="helper.factroy"%>
<%@page import="userdao.categroyDao"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Audiowide' rel='stylesheet'>

<title>Insert title here</title>
</head>
<body>


<%

int upid = Integer.parseInt(request.getParameter("proid"));


productDao productdao = new productDao(factroy.gFactory());


product uid = productdao.proByID(upid);

%>

<form action="upadateProfile" method="Post" enctype="multipart/form-data">

<input name="id" type="hidden" value="<%=uid.getId()%>">

<input type="hidden" class="form-control" name="opreation"
		value="addproduct">
		
<div class="form-group">
	<label for="exampleFormControlInput1">Picture</label> <input
		name="pPic" type="file" class="form-control"
		id="exampleFormControlInput1" placeholder="Product Name">
</div>



<div class="form-group">
	<label for="exampleFormControlInput1">Name</label> <input name="pName"
		type="text" class="form-control" id="exampleFormControlInput1"
		value="<%= uid.getName()%>">
</div>


<div class="form-group">
	<label for="exampleFormControlTextarea1">Description</label>
	<textarea name="pDes" class="form-control"
		id="exampleFormControlTextarea1" rows="3"><%=uid.getDes() %></textarea>
</div>


<div class="row">
	<div class="col">
		<label for="exampleFormControlSelect1">Price</label> <input
		 name="pPrice"	type="number" class="form-control" value="<%= uid.getPrice()%>">
	</div>
	<div class="col">
		<label for="exampleFormControlSelect1">Quntity</label> <input
			name="pQun" type="number" class="form-control" value="<%= uid.getQuantity()%>">
	</div>
</div>




<div class="row">
	<div class="col">

<%

categroyDao dao = new categroyDao(factroy.gFactory());
List<category> cate = dao.getcate();


%>

		<div class="form-group">
			<label for="exampleFormControlSelect1">Categroy</label> <select
				name="pCate" class="form-control" id="exampleFormControlSelect1">
				
				<%for(category c:cate){
					
					%>
					
				<option value="<%= c.getCatId()%>"><%=c.getTitle() %></option>
				<% 
				}
				
				%>
				
				
				
			</select>
		</div>


	</div>
	<div class="col">
		<label for="exampleFormControlSelect1">Discout</label> <input
			name="pDis" type="number" class="form-control" value="<%=uid.getDiscout()%>">
	</div>
	
</div>
<button type="submit" class="btn btn-primary">Update</button>
</form>


 <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script type="text/javascript" src="js.js"></script>


</body>
</html>