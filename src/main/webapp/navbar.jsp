<style>
<!--

.op{
	
	text-decoration:none;
	font-size: 17px;
	list-style: none;
   border: solid 4px white;
    font-weight: bold;
     transition: .20s ease-out;
}
.op:hover{
	border-bottom:solid 4px  #8000ff;;
    color:#8000ff;
	
}

-->
</style>



<nav class="navbar navbar-expand-lg bg-white text-dark sticky-top sdw">
<i style="font-size:48px;" class="material-icons t-blueMian">shop</i>
  <a style="font-weight: bold;
	color:black; font-family: 'Audiowide';font-size: 22px;" class="navbar-brand text-dark" href="Homepage.jsp">ShopKaro</a>
  <button class="navbar-toggler secMain" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
  <i class="material-icons" style="font-size:20px;color:white">menu</i>
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
     <li style="list-style: none;">
   <a id="btnnew" class="btn btn-outline-light" style="cursor: pointer;" data-toggle="modal" data-target="#exampleModal"><i class="fa fa-user-plus mr-1" style="font-size:20px"></i>Post</a>
     </li>
      
 <div class="col-md-4 ">
   
      <div class="input-group">
    
   <form autocomplete="off" class="d-flex align-content-center autocomplete" action="Search" method="Post">
        <input id="myInput" name="name" style="border: solid 2px #ff7171; width: 350px;border-radius: 0; " type="text" class="form-control bg-light" id="validationDefaultUsername" placeholder="Search brands and Products..." aria-describedby="inputGroupPrepend2" required>
     <div class="input-group-prepend">
          <button  type="submit" style="cursor: pointer;" class="input-group-text secMain my-sm-0 border-0" id="inputGroupPrepend2 "><span class="fa fa-search" style="font-size:25px;text-decoration: none;"></span></button>
        </div> 
     </form>
   
      </div>
    </div>
  </div>

  
</nav>
