<%@page import="helper.factroy"%>
<%@page import="entites.product"%>
<%@page import="java.util.List"%>
<%@page import="userdao.productDao"%>
<%@page import="entites.category"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
	category catg = (category) session.getAttribute("SearchResult");

	productDao pDao = new productDao(factroy.gFactory());

	List<product> products = pDao.getItemsByCate(catg.getCatId());
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">


<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<script src='https://kit.fontawesome.com/a076d05399.js'
	crossorigin='anonymous'></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Audiowide'
	rel='stylesheet'>



<title>Result</title>
</head>
<link rel="stylesheet" type="text/css" href="stylefile.css">
<style>
<!--
.checked {
	color: orange;
}
-->
</style>
<body>

	<%@include file="navbar.jsp"%>


	<h1 style="font-style: italic;" class="text-center m-5">Search
		Results....</h1>


	<%
		for (product pr : products) {
	%>

	<div class="row m-5  border">
		<div class="col-md-auto mt-5">
			<img style="height: 300px; width: 300px; object-fit: contain;" alt=""
				src="product/<%=pr.getPhoto1()%>">
		</div>
		<div class="col m-5">

			<div class="row m-4">

				<h2 class="text-danger mr-2">
					<i class="fa fa-rupee m-1" style="font-size: 25px"> </i><%=pr.getPrice()%>
				</h2>
				<h5 style="color: gray; font-style: italic;">
					(<%=pr.getDiscout()%>% off)
				</h5>

			</div>
			<div class="contanier m-3">

				<a href="ProView.jsp?id=<%=pr.getId()%>"><h2><%=pr.getName()%></h2></a>
				<div><%=pr.getDes()%></div>

				<h5 class="text-danger m-3">
					Left In Stock
					<%=pr.getQuantity()%>
				</h5>
			</div>

			<div class="col">
				<div class="container me-5" style="font-size: 30px;">
					<span class="fa fa-star checked"></span> <span
						class="fa fa-star checked"></span> <span
						class="fa fa-star checked"></span> <span class="fa fa-star"></span>
					<span class="fa fa-star"></span>
				</div>
			</div>

			<div class="col text-center m-3">
				<a href="addcart?id=<%=pr.getId()%>"
					class=" btn btn-lg btn-outline-danger">Add To Cart</a>
			</div>


		</div>

	</div>




	<%
		}
	%>

	</div>



	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script type="text/javascript" src="js/js.js"></script>

</body>
</html>