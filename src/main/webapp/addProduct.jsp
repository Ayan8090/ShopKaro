
<!--       add product form -->

<%@page import="entites.category"%>
<%@page import="java.util.List"%>
<%@page import="helper.factroy"%>
<%@page import="userdao.categroyDao"%>
<form action="addcate" method="Post" enctype="multipart/form-data">

<input type="hidden" class="form-control" name="opreation"
		value="addproduct">
		
<div class="form-group">
	<label for="exampleFormControlInput1">Picture 1</label> <input
		name="pPic1" type="file" class="form-control"
		id="exampleFormControlInput1" placeholder="Product Name">
</div>

		
<div class="form-group">
	<label for="exampleFormControlInput1">Picture 2</label> <input
		name="pPic2" type="file" class="form-control"
		id="exampleFormControlInput1" placeholder="Product Name">
</div>
		
<div class="form-group">
	<label for="exampleFormControlInput1">Picture 2</label> <input
		name="pPic3" type="file" class="form-control"
		id="exampleFormControlInput1" placeholder="Product Name">
</div>



<div class="form-group">
	<label for="exampleFormControlInput1">Name</label> <input name="pName"
		type="text" class="form-control" id="exampleFormControlInput1"
		placeholder="Product Name">
</div>


<div class="form-group">
	<label for="exampleFormControlTextarea1">Description</label>
	<textarea name="pDes" class="form-control"
		id="exampleFormControlTextarea1" rows="3" placeholder="about product"></textarea>
</div>


<div class="row">
	<div class="col">
		<label for="exampleFormControlSelect1">Price</label> <input
		 name="pPrice"	type="number" class="form-control" placeholder="Price">
	</div>
	<div class="col">
		<label for="exampleFormControlSelect1">Quntity</label> <input
			name="pQun" type="number" class="form-control" placeholder="Quinity">
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
			name="pDis" type="number" class="form-control" placeholder="Discout">
	</div>
	
</div>
<button type="submit" class="btn btn-primary">Upload</button>
</form>