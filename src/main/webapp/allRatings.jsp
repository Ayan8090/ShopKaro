<%@page import="entites.ratings"%>
<%@page import="java.util.List"%>
<%@page import="helper.factroy"%>
<%@page import="userdao.ratingDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.0/css/bootstrap.min.css" integrity="sha384-SI27wrMjH3ZZ89r4o+fGIJtnzkAnFs3E4qz9DIYioCQ5l9Rd/7UAa8DHcaL8jkWt" crossorigin="anonymous">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">
<title>Ratings</title>
</head>
<body>
<%

int id = Integer.parseInt(request.getParameter("id"));
int page1 ;
int page2;

ratingDao rat = new ratingDao(factroy.gFactory());

List<ratings> rating = rat.showRatingbyId(id);


%>
<div class="container d-flex-justify-content-center">





<% for(ratings allrate : rating){ %>


<div class="row">
<h5><%=allrate.getRatings() %></h5>
  <div class="rateyo rate m-3" id= "rating"
         data-rateyo-rating="5"
         data-rateyo-num-stars="<%= allrate.getRatings() %>"
         data-rateyo-score="3">
         </div>
        
  </div>
  
  
  <h4><%=allrate.getUser_Name() %></h4>
   <p class="m-4 me-5"><%=allrate.getUser_Name() %></p>
    <span style="display: none;" class='result'><%= allrate.getRatings() %></span>





<%} %>

</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>
<script type="text/javascript" src="js/js.js"></script>
<!-- star rating-->
<script type="text/javascript">

$(function () {
	$(".rate").rateYo({
	
		starWidth:"30px"
		
		
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