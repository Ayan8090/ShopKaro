<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.0/css/bootstrap.min.css" integrity="sha384-SI27wrMjH3ZZ89r4o+fGIJtnzkAnFs3E4qz9DIYioCQ5l9Rd/7UAa8DHcaL8jkWt" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">


<title>Rating</title>
</head>
<body>



<div class="container">
    <div class="row">

<form action="rating" method="post">

    <div>
        <h3>Student Rating System</h3>
    </div>

    <div>
         <label>Name</label>
        <input type="text" name="name">
    </div>

         <div class="rateyo data-rateYo-noraml-fill" id= "rating"
         data-rateyo-rating="4"
         data-rateyo-num-stars="5"
         data-rateyo-score="3">
         </div>

    <span class='result'>0</span>
    <input type="hidden" name="rating">

    </div>

    <div><input type="submit" name="add"> </div>

</form>
</div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>
<!-- <script>

 var normalFill = $("#rateYo").rateYo("option","normalFill");

 $("#rateYo").rateYo("option","normalFill","#B0B0B0");
 
$(function() {
	
	$("#rateYo").rateYO({
		
		normalFill: "#A0A0A0"
	});	
	
});
</script> -->
<script>
 $(function () {
        $(".rateyo").rateYo().on("rateyo.change", function (e, data) {
            var rating = data.rating;
            $(this).parent().find('.score').text('score :'+ $(this).attr('data-rateyo-score'));
            $(this).parent().find('.result').text('rating :'+ rating);
            $(this).parent().find('input[name=rating]').val(rating); //add rating value to input field
        });
    }); 
    </script>
</body>
</html>