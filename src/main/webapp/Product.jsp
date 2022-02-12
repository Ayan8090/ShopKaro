<%@page import="entites.getWords"%>
<%@page import="java.util.List"%>
<%@page import="entites.category"%>
<%@page import="helper.factroy"%>
<%@page import="userdao.categroyDao"%>
<%@page import="entites.product"%>
<%@page import="helper.factroy"%>
<%@page import="userdao.productDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Products</title>
</head>

<link rel="stylesheet" type="text/css" href="stylefile.css">
<style>
<!--
#btnCard{
width: 100%;
}
.hover{
color :red;
}

.nav a{

transition: .20s ease-in;
}
.nav a:hover{
	background-color: #8000ff;
color: white;
}

</style>
<body>



 <% 
 



productDao productdao = new productDao(factroy.gFactory());

List<product> productItem = null;

 
 categroyDao catedao = new categroyDao(factroy.gFactory());
 
 String cateid2 = request.getParameter("cateId");


List<category> catelist = catedao.getcate();


List<product> productItem2 = productdao.getProduct();


int pages=16;


String start = request.getParameter("page");




if(start==null){

	
	int start2=0;
	productItem = productdao.getProductSE(start2, pages);
	
}

if(start!=null){
	

	int start2 = Integer.parseInt(request.getParameter("page"));

	
	start2 = start2*pages;
	
	productItem = productdao.getProductSE(start2, pages);
	
 
	
}




if(cateid2==null||cateid2.trim().equals("all")){
	
	
	


}
else{
	
int cid = Integer.parseInt(cateid2.trim());

productItem = productdao.getItemsByCate(cid);
   
} 



%>

  
     
  
  <nav >
  <div class="d-flex justify-content-center sdw" >
  <div class="nav nav-tabs border-0" id="nav-tab" role="tablist">
  
  
    <a style="font-size: 17px;" href="?cateId=all" class="nav-item nav-link " role="tab" id="navselect" aria-selected="true">
   <i class="fa fa-chevron-down p-1" style="font-size:17px"></i>All</a>
    
     <% for(category cateItem :catelist) {%>
   
 
 <a style="font-size: 17px;" href="?cateId=<%=cateItem.getCatId() %>" id="navselect" class="nav-item nav-link "  role="tab"  aria-selected="false">
 <i class="fa fa-chevron-down p-1" style="font-size:17px"></i> <%=cateItem.getTitle() %></a>
    
       
   <%}%>
 </div>
   </div>
   
   
  
</nav>
  
  
   <div class="container-fluid p-5">

<div class="col">


<div class="row">



<%for(product product:productItem)
	

{%>



	
	
  <div class="col-sm-3">
  
  
  <div class="card d-flex align-items-center border-white flip-card-inner mb-3">


  <img class="m-3 " style=" height:250px;width:250px;  object-fit: contain;" alt="" src="product/<%=product.getPhoto1()%>"> 
 

 <div class="d-flex align-items-baseline ">
 <div class="d-flex align-items-baseline text-center">
 
     <div class="col"><a style="cursor: pointer; color: black" href="ProView.jsp?id=<%=product.getId() %>">
     <%=getWords.getWord(product.getName())  %></a>
     
     
     <div class="container m-2">
   <span class="fa fa-star checked"></span>
<span class="fa fa-star checked"></span>
<span class="fa fa-star checked"></span>
<span class="fa fa-star"></span>
<span class="fa fa-star"></span>
</div>

<div class="container text-center">

<div class="row d-flex justify-content-center">

<h4 class="text-danger"><i class="fa fa-rupee" style="font-size:19px"></i>

<%=product.getPrice() %> </h4>

<p style="color: gray;font-style: italic;">(<%=product.getDiscout() %>% off)</p>
</div></div>
 <p class="text-danger">Left In Stock <%=product.getQuantity() %> </p>
 </div>
  </div>
 
  </div>
 
 
 
  
   <a style="width: 100%;font-size: 20px;" href="addcart?id=<%=product.getId() %>" class="btn">Add To Cart</a>
 </div>


 
  </div>
  
  

 
<% } %>
<div class="container d-flex justify-content-center mt-5">
<nav aria-label="Page navigation example">

  <%

int total;

total = productItem2.size()/pages;

int pagenum=0;
%>

  <ul class="pagination pagination-lg">
  <li class="page-item"><a class="page-link" href="?page=0">Home</a></li> 
   <%for(int i=0;i<total;i++) {%>
    <li class="page-item "><a class="page-link" href="?page=<%=i %>"><%=i %></a></li>
    <%} %> 
 <%-- <li class="page-item"><a class="page-link" href="?page=<%=pagenum++  %>">Next</a></li>  --%>
  </ul>
</nav>
</div>
</div>
</div>

</div>




</body>
</html>