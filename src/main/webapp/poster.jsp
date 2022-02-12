<style>
@import url(https://fonts.googleapis.com/css?family=Khula:700);
body {
  background: #111;
}
.hidden {
  opacity:0;
}
.console-container {
 
  font-family:Khula;
  font-size:4em;
  text-align:center;
  height:200px;
  width:600px;
  display:block;
  position:absolute;
  color:white;
  top:0;
  bottom:0;
  left:0;
  right:0;
  margin:auto;
}
.console-underscore {
   display:inline-block;
  position:relative;
  top:-0.14em;
  left:10px;
}

</style>



<div id="pics" class="w3-content w3-section" style="max-width:500px;">
  <img class="mySlides" src="product/pexels-ray-piedra-1456705.jpg">
  <img class="mySlides" src="product/pexels-alex-andrews-821651 (1).jpg" >
  <img class="mySlides" src="product/pexels-andrea-piacquadio-761963.jpg">
   <img class="mySlides" src="product/pexels-ray-piedra-2720447.jpg">
<img class="mySlides" src="product/pexels-dio-alif-utomo-1897886.jpg" >
<img class="mySlides" src="product/pexels-evg-kowalievska-1126993.jpg" >


<!-- </div>

<div class="container12 d-flex justify-content-center ">
<div style="font-size:50px; font-family: 'Audiowide';" class="textnew">ShopKaro |</div> 
<div style="font-size:30px;" class="textnew d-flex align-items-center t-secMain"> 
  <span >into amazing experiences</span>
  
</div>
</div> -->
</div>


<div class='console-container'>
<span id='text'>
</span>
<div class='console-underscore' id='console'>&#95;</div>
</div>


<script>
var myIndex = 0;
carousel();

function carousel() {
  var i;
  var x = document.getElementsByClassName("mySlides");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";  
  }
  myIndex++;
  if (myIndex > x.length) {myIndex = 1}    
  x[myIndex-1].style.display = "block";  
  setTimeout(carousel, 7000); // Change image every 2 seconds
}
</script>
<script type="text/javascript">
//function([string1, string2],target id,[color1,color2])    
consoleText(['Stylish CLothes.', 'Beauty In Dresses.', 'Made with Love.'], 'text',['tomato','rebeccapurple','lightblue']);

function consoleText(words, id, colors) {
 if (colors === undefined) colors = ['#fff'];
 var visible = true;
 var con = document.getElementById('console');
 var letterCount = 1;
 var x = 1;
 var waiting = false;
 var target = document.getElementById(id)
 target.setAttribute('style', 'color:' + colors[0])
 window.setInterval(function() {

   if (letterCount === 0 && waiting === false) {
     waiting = true;
     target.innerHTML = words[0].substring(0, letterCount)
     window.setTimeout(function() {
       var usedColor = colors.shift();
       colors.push(usedColor);
       var usedWord = words.shift();
       words.push(usedWord);
       x = 1;
       target.setAttribute('style', 'color:' + colors[0])
       letterCount += x;
       waiting = false;
     }, 1000)
   } else if (letterCount === words[0].length + 1 && waiting === false) {
     waiting = true;
     window.setTimeout(function() {
       x = -1;
       letterCount += x;
       waiting = false;
     }, 1000)
   } else if (waiting === false) {
     target.innerHTML = words[0].substring(0, letterCount)
     letterCount += x;
   }
 }, 120)
 window.setInterval(function() {
   if (visible === true) {
     con.className = 'console-underscore hidden'
     visible = false;

   } else {
     con.className = 'console-underscore'

     visible = true;
   }
 }, 400)
}

</script>