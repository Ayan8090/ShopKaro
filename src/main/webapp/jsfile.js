
/*forms login*/

$(document).ready(function() {
	
	let status = false;
	
	$('#bt').click(function () {
		
		if (status == false) {
			
			$("#log").hide();
			
			$("#sin").show();
			
			$(this).text("back");
			status=true;
		}
	else{
		
		$("#log").show();
		
		$("#sin").hide();
		

		status=false;
	}
		
	})
})


/*profile eedit*/


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
		
		$("#profile-N").hide();
		
		status=false;
	}
		
	})
})




function Add_Cart(pid,pname,price){
	
	let cart = localStorage.getItem("cart");
	if (cart==null) {
		
		let products=[];
		let product ={productid: pid,productname: pname,productprice:price}
		products.push(product);
		localStorage.setItem("cart",JSON.stringify(product));
	} else {

	}
	}


/*serach bar */
