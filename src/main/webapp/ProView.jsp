<%@page import="entites.massage"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="entites.ratings"%>
<%@page import="userdao.ratingDao"%>
<%@page import="entites.addCart"%>
<%@page import="java.util.List"%>
<%@page import="userdao.cartDao"%>
<%@page import="entites.product"%>
<%@page import="helper.factroy"%>
<%@page import="userdao.productDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     
     

 <% 

 
 int id = Integer.parseInt(request.getParameter("id"));
 
 int page1 = 0;
 int page2 = 3;
 

 

	 productDao dao = new productDao(factroy.gFactory());
	   
	 product pd = dao.proByID(id);

	 ratingDao rat = new ratingDao(factroy.gFactory());
	 
 List<ratings> rating = rat.showRatingBypage(page1,page2,id); 
 List<ratings> rating2 = rat.showRatingbyId(id); 
   %>
   
  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.0/css/bootstrap.min.css" integrity="sha384-SI27wrMjH3ZZ89r4o+fGIJtnzkAnFs3E4qz9DIYioCQ5l9Rd/7UAa8DHcaL8jkWt" crossorigin="anonymous">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Audiowide' rel='stylesheet'>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title><%=pd.getName() %></title>
</head>
<link rel="stylesheet" type="text/css" href="stylefile.css">
<style>
.picOption{

transition : 0.30s ease-in;
}

.picOption:hover{

opacity: 60%;
border: 3px solid  black;

}

</style>


<body>
 

<nav class="navbar navbar-expand-lg bg-white sticky-top sdw ">
<i class="material-icons t-blueMian" style="font-size:48px;">shop</i>
  <a style="font-weight: bold;
	 font-family: 'Audiowide';font-size: 22px;" class="navbar-brand text-dark" href="Homepage.jsp">ShopKaro</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
  <i class="material-icons " style="font-size:20px;color:white">menu</i>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
    </li>
      <li class="nav-item ">
        <a class="nav-link op" href="contactUs.jsp">Contact-us</a>
      </li>
      
      <li class="nav-item ">
        <a class="nav-link op" href="#footer">About</a>
      </li>
    
    
    </ul>
  
 <div class="col-md-4 ">
   
      <div class="input-group">
 
        <input style="border: solid 2px  #ff7171" type="search" class="form-control bg-light" id="validationDefaultUsername" placeholder="Searh..." aria-describedby="inputGroupPrepend2" required>
     <div class="input-group-prepend">
          <span  class="input-group-text secMain  my-sm-0 sdw border-0" id="inputGroupPrepend2 "><a href="#" class="fa fa-search " style="font-size:25px;text-decoration: none;"></a></span>
        </div> 
     
   
      </div>
    </div>
  </div>

  
</nav>


<%
massage msg = (massage)session.getAttribute("msg");

if(msg!=null){
%>
	<div class="alert <%= msg.getCss() %>" role="alert">
	<%= msg.getMsg() %>
	<button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
	
	
		</div>
		<%
		session.removeAttribute("msg");
}
		%>



	 
	
	 <div class="row m-5 ">
	<div class="col-md-auto mt-5">

<div class="w3-content text-center" style="max-width:1200px">
 <img style=" height:300px;width:300px;  object-fit: contain;" class="mySlides" src="product/<%=pd.getPhoto1()%>">
 <img style=" height:300px;width:300px;display:none;  object-fit: contain;" class="mySlides" src="product/<%=pd.getPhoto2()%>">
 <img style=" height:300px;width:300px;display:none;  object-fit: contain;" class="mySlides" src="product/<%=pd.getPhoto3()%>">


  <div class="w3-row-padding w3-section d-flex justify-content-center">
  <div class="row ">
    <div class="w3-col s4  border p-2 " >
    <img onclick="currentDiv(1)" style=" height:70px;width:70px;  object-fit: cover;" class="demo w3-opacity picOption" src="product/<%=pd.getPhoto1()%>">
     
    </div>
    <div class="w3-col s4  border p-2 "  >
      <img onclick="currentDiv(2)" style=" height:70px;width:70px;  object-fit: cover;" class="demo w3-opacity picOption" src="product/<%=pd.getPhoto2()%>">
    </div>
    <div class="w3-col s4  border p-2 " >
      <img onclick="currentDiv(3)" style=" height:70px;width:70px;  object-fit: cover;"class="demo w3-opacity picOption" src="product/<%=pd.getPhoto3()%>">
    </div>
     </div>
  </div>
</div>




	
	</div>
		<div class="col m-5">
		
  <div class="row m-4">
 
  <h2 class="text-danger mr-2">
  <i class="fa fa-rupee m-1" style="font-size:25px">
  </i><%=pd.getPrice() %>  </h2><p style="color: gray;font-style: italic;">
  (<%=pd.getDiscout() %>% off)</p>
  
  </div>
  <div class="contanier m-3">
	<h2><%=pd.getName() %></h2>
	<div><%=pd.getDes() %></div>
	
	<h5 class="text-danger m-3">Left In Stock <%=pd.getQuantity() %> </h5>
</div>

<div class="col">
 <div class="container me-5" style="font-size: 30px;">
 <span class="fa fa-star checked"></span>
<span class="fa fa-star checked"></span>
<span class="fa fa-star checked"></span>
<span class="fa fa-star"></span>
<span class="fa fa-star"></span>
<span><%=rating2.size() %></span>
</div>

</div>

<div class="col text-center m-3">



<a href="addcart?id=<%=pd.getId() %>" class=" btn btn-lg btn-outline-danger">Add To Cart</a>


</div>



</div>

<div class="row">
<div class="col">

<form action="rating" method="post">


<div class="row">


       <div class="rateyo data-rateYo-noraml-fill" id= "rating"
         data-rateyo-rating="0"
         data-rateyo-num-stars="5"
         data-rateyo-score="3">
         </div>
  

    <span style="font-size: 28px;" class='result'>0</span>
    <input type="hidden" name="rating">

    <input type="hidden" name="proid" value="<%=pd.getId() %>">

</div>
  
<div class="form-group">
		<label for="recipient-name" class="col-form-label">Name</label> <input
			name="name" type="text" class="form-control" id="recipient-name">
	</div>
	<div class="form-group">
		<label for="message-text" class="col-form-label">Comments</label>
		<textarea rows="4" name="comment" class="form-control" id="message-text"></textarea>
	</div>
	
    <div><input type="submit" class="btn" name="add"></div>

</form>



<%



for (ratings rate:rating){ %>

<p><%=rate.getUser_Name() %></p>
<p><%=rate.getComments() %></p>



       <div class="rateyo rate" id= "rating"
         data-rateyo-rating="5"
         data-rateyo-num-stars="<%=rate.getRatings() %>"
         data-rateyo-score="3">
         </div>
  
    <span class='result'><%=rate.getRatings() %></span>

 


<%} %>
<div>
<a href="allRatings.jsp?id=<%=id%>">View all</a>
</div>
</div>
</div>

 


<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>
<script type="text/javascript" src="js/js.js"></script>
<!-- star rating-->
<script type="text/javascript">

$(function () {
	$(".rate").rateYo({
	
		starWidth:"15px"
		
		
	});
});
</script>
<script type="text/javascript">

</script>

    <script>
 $(function () {
        $(".rateyo").rateYo().on("rateyo.change", function (e, data) {
            var rating = data.rating;
            $(this).parent().find('.score').text('score :'+ $(this).attr('data-rateyo-score'));
            $(this).parent().find('.result').text(rating);
            $(this).parent().find('input[name=rating]').val(rating); //add rating value to input field
        });
    }); 
    </script>

<!-- pic slider -->
<script type="text/javascript">
function currentDiv(n) {
  showDivs(slideIndex = n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  if (n > x.length) {slideIndex = 1}
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" w3-opacity-off", "");
  }
  x[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " w3-opacity-off";
}
</script>
</body>
</html>