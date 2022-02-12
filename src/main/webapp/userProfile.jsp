<%@page import="entites.addCart"%>
<%@page import="userdao.cartDao"%>
<%@page import="userdao.userdao"%>
<%@page import="entites.massage"%>
<%@page import="entites.user"%>
<%@page import="java.util.List"%>
<%@page import="entites.category"%>
<%@page import="helper.factroy"%>
<%@page import="userdao.categroyDao"%>
<%@page import="entites.product"%>
<%@page import="helper.factroy"%>
<%@page import="userdao.productDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <% user user =(user)session.getAttribute("user");
    
    if(user==null){
    response.sendRedirect("Homepage.jsp");	
    	
  
    }
  
    
    %>
    
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


<title><%=user.getName() %></title>
</head>
<link rel="stylesheet" type="text/css" href="stylefile.css">

<body>

<%
user use = (user)session.getAttribute("user");
 
int id= use.getId();

cartDao ddo = new cartDao(factroy.gFactory());

List<addCart> crt = ddo.OnlycartbyId(id);


%>

<nav class="navbar navbar-expand-lg bg-white sticky-top sdw">
  
<button data-toggle="modal" data-target="#profile" class="btn"><i class="fa fa-user-plus mr-1" style="font-size:20px"></i>Profile</button>
   
  
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
  <i class="material-icons " style="font-size:20px;color:white">menu</i>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active ">
        <a class="nav-link op" href="Homepage.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item ">
        <a class="nav-link op" href="contactUs.jsp">Contact-us</a>
      </li>
      
      <li class="nav-item ">
        <a class="nav-link op" href="#footer">About</a>
      </li>
    </ul>
    
 <button data-toggle="modal" data-target="#chat" class="btn">Chat</button>
 <!--   add to card -->
<!--  -->
  <li class="m-2 t-secMain" style="list-style: none; font-size: 20px; align-content: center; display: flex;">
    <a  data-toggle="modal" data-target="#card"  class="material-icons " style="font-size:36px;cursor: pointer;color: #8000ff;">shopping_cart</a>
  (<%=crt.size() %>)
  </li>
  
   
  <!-- card model -->
   <div class="col-md-4 ">
   
      <div class="input-group">
    
   <form autocomplete="off" class="d-flex align-content-center autocomplete" action="Search" method="Post">
        <input id="myInput" name="name" style="border: solid 2px #ff7171; width: 350px;border-radius: 0; " type="text" class="form-control bg-light" id="validationDefaultUsername" placeholder="Searh..." aria-describedby="inputGroupPrepend2" required>
     <div class="input-group-prepend">
          <button  type="submit" style="cursor: pointer;" class="input-group-text secMain my-sm-0 border-0" id="inputGroupPrepend2 "><span class="fa fa-search" style="font-size:25px;text-decoration: none;"></span></button>
        </div> 
     </form>
   
      </div>
    </div>
    

  </div>
</nav>

<%@include file="poster.jsp" %>

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
<!-- chat -->


<!-- Profle model-->
<div class="modal fade" id="chat" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      
       <div class="text-right">
        <button type="button" class="close mr-2" data-dismiss="modal" aria-label="Close">
          <span style="font-size: 40px;" aria-hidden="true">&times;</span>
        </button>
       
     </div>
      
      <div class="modal-body">
     

<div class="footer">
<form action="chat" method="post">
<div class="form-group">
		<label for="message-text" class="col-form-label"></label>
		<textarea  rows="1" name="chat" class="form-control" id="message-text" placeholder="Write Massage...."></textarea>
	</div>
	<button type="submit" class="btn btn-danger">Send</button>
</form>

</div>

 </div>
  </div>
</div>
</div>

<!-- Profle model-->
<div class="modal fade" id="profile" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      
       <div class="text-right">
        <button type="button" class="close mr-2" data-dismiss="modal" aria-label="Close">
          <span style="font-size: 40px;" aria-hidden="true">&times;</span>
        </button>
       
     </div>
      
      <div class="modal-body">
     
  <!--    deteils page -->
  <div class="container text-center">
     <img style=" width:250px; object-fit:contain;" src="userpic/<%=user.getProfile() %>"  alt="...">
     </div>
     <div id="profile-N" class="container" >
     <table class="table table-hover">
  <thead>
    
  </thead>
  <tbody>
    <tr>
      <th scope="row">Name</th>
      <td><%=user.getName() %></td>
    
    </tr>
    <tr>
      <th scope="row">Email</th>
      <td><%=user.getEmail() %></td>
    
      
    </tr>
    <tr>
      <th scope="row">Password</th>
      <td colspan="2"><%=user.getPassword() %></td>
    
    </tr>
    <tr>
      <th scope="row">Phone</th>
      <td colspan="2"><%=user.getPhone() %></td>
      
    </tr>
    <tr>
      <th scope="row">City</th>
      <td colspan="2"><%=user.getCity() %></td>
     
    </tr>
  </tbody>
</table>
 </div>
 
<!--  edit page -->


     <div id="profile-E" class="container" style="display: none;" >
       <form action="upadateProfile" method="Post" enctype="multipart/form-data">
       
        <!--    profile picture -->
       
       <div class="input-group mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text">Profile</span>
  </div>
  <div class="custom-file">
    <input name="profile" type="file" class="custom-file-input" id="inputGroupFile01">
    <label class="custom-file-label" for="inputGroupFile01">Choose file</label>
  </div>
</div>
       
       
  <input name="id" type="hidden" value="<%=user.getId() %>">
     <table class="table table-hover">
     
  <thead>
  
  </thead>
  <tbody>
    <tr>
      <th scope="row">Name</th>
  
      <td><input name="Ename" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value="<%=user.getName() %>"></td>
    
    </tr>
    <tr>
      <th scope="row">Email</th>
     <td><input name="Eemail" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value="<%=user.getEmail() %>"></td>
    
      
    </tr>
    <tr>
      <th scope="row">Password</th>
     <td><input name="Epassword" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value="<%=user.getPassword() %>"></td>
    
    </tr>
    <tr>
      <th scope="row">Phone</th>
     <td><input name="Ephone" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value="<%=user.getPhone() %>"></td>
      
    </tr>
    <tr>
      <th scope="row">City</th>
      <td><input name="Ecity" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value="<%=user.getCity() %>"></td>
    </tr>
  </tbody>
</table>
<div class="container text-center">
  <button  type="submit" class="btn btn-outline-danger">Save</button>
  </div>
</form>
 </div>

      </div>
      <div class="modal-footer">
       <a href="logout" class="btn my-2 my-sm-0" type="submit"><i class='far fa-share-square mr-2' style='font-size:20px;'></i>Logout</a>
        <button id="editbtn" type="button" class="btn btn-danger">Edit</button>
      </div>
    </div>
  </div>
</div>



<!-- card model -->


<!-- Modal -->
<div class="modal fade bd-example-modal-lg " id="card" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
    
    <div class="text-right">
        <button type="button" class="close mr-2" data-dismiss="modal" aria-label="Close">
          <span style="font-size: 40px;" aria-hidden="true">&times;</span>
        </button>
       
    </div>
    <div class="container text-center">
     <h1>Your Cart</h1>
     </div>
      <div class="modal-body">
     
     
     
<table class="table">
 <thead>
   <tr>
      <th scope="col">Name</th>
      <th scope="col">Price</th>
      <th scope="col">Qunitiy</th>
      <th scope="col">Total</th>
    
    
    </tr>
    
<% for(addCart addCart:crt) {%>
 <tr>
 
 <td><%=addCart.getName() %></td>
  <td><%=addCart.getPrice() %></td>
      <td><%=addCart.getQunitity() %></td>
      <td><%=addCart.getQunitity()*addCart.getPrice() %></td>
 
       <td><a href="order.jsp?pid=<%=addCart.getId() %>" class="btn btn-danger">Checkout</a></td>
   <td><a href="deleteCart?id=<%=addCart.getId() %>"style="font-size: 22px;" class="btn material-icons">close
   </a></td>
 </tr>

<%} %>


 </tbody>
 
 
</table>
     
     
     
     
     
      
      </div>
    </div> 
    </div>
 </div>
    
<%@include file="Product.jsp" %>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


<script type="text/javascript">


/*forms login*/

$(document).ready(function() {
	
	let status = false;
	
	$('#editbtn').click(function () {
		
		if (status == false) {
			
			$("#profile-N").hide();
			
			$("#profile-E").show();
			
			$(this).text("back");
			status=true;
		}
	else{
		
		$("#profile-N").show();
		
		$("#profile-E").hide();
		
		status=false;
	}
		
	})
})


</script>
<script>

/*serach bar */



function autocomplete(inp, arr) {
  /*the autocomplete function takes two arguments,
  the text field element and an array of possible autocompleted values:*/
  var currentFocus;
  /*execute a function when someone writes in the text field:*/
  inp.addEventListener("input", function(e) {
      var a, b, i, val = this.value;
      /*close any already open lists of autocompleted values*/
      closeAllLists();
      if (!val) { return false;}
      currentFocus = -1;
      /*create a DIV element that will contain the items (values):*/
      a = document.createElement("DIV");
      a.setAttribute("id", this.id + "autocomplete-list");
      a.setAttribute("class", "autocomplete-items");
      /*append the DIV element as a child of the autocomplete container:*/
      this.parentNode.appendChild(a);
      /*for each item in the array...*/
      for (i = 0; i < arr.length; i++) {
        /*check if the item starts with the same letters as the text field value:*/
        if (arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
          /*create a DIV element for each matching element:*/
          b = document.createElement("DIV");
          /*make the matching letters bold:*/
          b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
          b.innerHTML += arr[i].substr(val.length);
          /*insert a input field that will hold the current array item's value:*/
          b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
          /*execute a function when someone clicks on the item value (DIV element):*/
          b.addEventListener("click", function(e) {
              /*insert the value for the autocomplete text field:*/
              inp.value = this.getElementsByTagName("input")[0].value;
              /*close the list of autocompleted values,
              (or any other open lists of autocompleted values:*/
              closeAllLists();
          });
          a.appendChild(b);
        }
      }
  });
  /*execute a function presses a key on the keyboard:*/
  inp.addEventListener("keydown", function(e) {
      var x = document.getElementById(this.id + "autocomplete-list");
      if (x) x = x.getElementsByTagName("div");
      if (e.keyCode == 40) {
        /*If the arrow DOWN key is pressed,
        increase the currentFocus variable:*/
        currentFocus++;
        /*and and make the current item more visible:*/
        addActive(x);
      } else if (e.keyCode == 38) { //up
        /*If the arrow UP key is pressed,
        decrease the currentFocus variable:*/
        currentFocus--;
        /*and and make the current item more visible:*/
        addActive(x);
      } else if (e.keyCode == 13) {
        /*If the ENTER key is pressed, prevent the form from being submitted,*/
        e.preventDefault();
        if (currentFocus > -1) {
          /*and simulate a click on the "active" item:*/
          if (x) x[currentFocus].click();
        }
      }
  });
  function addActive(x) {
    /*a function to classify an item as "active":*/
    if (!x) return false;
    /*start by removing the "active" class on all items:*/
    removeActive(x);
    if (currentFocus >= x.length) currentFocus = 0;
    if (currentFocus < 0) currentFocus = (x.length - 1);
    /*add class "autocomplete-active":*/
    x[currentFocus].classList.add("autocomplete-active");
  }
  function removeActive(x) {
    /*a function to remove the "active" class from all autocomplete items:*/
    for (var i = 0; i < x.length; i++) {
      x[i].classList.remove("autocomplete-active");
    }
  }
  function closeAllLists(elmnt) {
    /*close all autocomplete lists in the document,
    except the one passed as an argument:*/
    var x = document.getElementsByClassName("autocomplete-items");
    for (var i = 0; i < x.length; i++) {
      if (elmnt != x[i] && elmnt != inp) {
        x[i].parentNode.removeChild(x[i]);
      }
    }
  }
  /*execute a function when someone clicks in the document:*/
  document.addEventListener("click", function (e) {
      closeAllLists(e.target);
  });
}

/*An array containing all the country names in the world:*/
<%  categroyDao catedao1 = new categroyDao(factroy.gFactory());

 List<category> ctlist = catedao1.getcate();

%>

var countries = [

<% for(category cr6: ctlist){%>

"<%=cr6.getTitle()%>",

<%}%>

];

/*initiate the autocomplete function on the "myInput" element, and pass along the countries array as possible autocomplete values:*/
autocomplete(document.getElementById("myInput"), countries);

console.log("hello");


</script>
 
 <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.9.2/umd/popper.min.js" integrity="sha512-2rNj2KJ+D8s1ceNasTIex6z4HWyOnEYLVC3FigGOmyQCZc2eBXKgOxQmo3oKLHyfcj53uz4QMsRCWNbLd32Q1g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>



</body>
</html>