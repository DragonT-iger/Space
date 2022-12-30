<head>
<script type="text/javascript">
      function filter(){

        var value, name, item, i;

        value = document.getElementById("value").value.toUpperCase();
        item = document.getElementsByClassName("item");

        for(i=0;i<item.length;i++){
          name = item[i].getElementsByClassName("name");
          if(name[0].innerHTML.toUpperCase().indexOf(value) > -1){
            item[i].style.display = "flex";
          }else{
            item[i].style.display = "none";
          }
        }
      }
</script>
</head>

<style>


.padding80 {
	padding: 10px;
}

.margin50 {
	margin: 10px;
}

@import
	url('https://fonts.googleapis.com/css2?family=Lobster&display=swap');

.tag {
	font-family: 'Lobster', cursive;
	font-weight: 30;
	text-align: center;
	margin: 20px;
	padding: 20px;
}

.choice {
	text-align: center;
}

.searchbox {
	width: 50%;
	margin: 10px auto;
}

.header {
	background: #ECDFBF;
	overflow: hidden;
	padding: 20px;
	text-align: center;
}

.header h1 {
	text-transform: uppercase;
	color: white;
	margin: 0;
	margin-bottom: 8px;
}

#value {
	border: none;
	background: #E0D3B6;
	padding: 6px;
	font-size: 18px;
	width: 80%;
	border-radius: 6px;
	color: white;
	text-align:center;
}

#value:focus {
	outline: none;
}

.search {
	background: #FFFFF5;
	padding: 1%;
}

.name {
	font-size: 17px;
	font-weight: 470;
	color: #333;
}
</style>

<body>
	<div class="tag"
		class="section-title ff-secondary text-start text-primary fw-normal mb-4">
		<a href="#" class="tag">#Christmas</a> <a href="#" class="tag">#Winter</a>


		<a href="#" class="tag">#Travel</a> <a href="#" class="tag">#New
			Year</a>
	</div>



	<div class="searchbox">
		<div class="header">
			<h1>Search</h1>
			<input onkeyup="filter()" type="text" id="value"
				placeholder="Type to Search">
		</div>

	</div>

	<section class="padding80 margin50">
		<ul class="items quarter">
			<table>
				<tr>
					<td><img class="img" alt=""
						src="https://a0.muscache.com/im/pictures/a0316ecb-e49b-4b3a-b6b6-c2876b820e8c.jpg?im_w=480"
						width="90%" /></td>&nbsp;
					<td><img class="img" alt=""
						src="https://a0.muscache.com/im/pictures/ce6814ba-ed53-4d6e-b8f8-c0bbcf821011.jpg?im_w=480"
						width="90%" /></td>
					<td><img class="img" alt=""
						src="https://a0.muscache.com/im/pictures/ff69ac49-64e7-4f4a-ae2b-ee01163d0790.jpg?im_w=480"
						width="90%" /></td>
					<td><img class="img" alt=""
						src="https://a0.muscache.com/im/pictures/34b9d53a-8952-47f8-876d-bb927ea487b2.jpg?im_w=480"
						width="90%" /></td>
				<tr>
			</table>

			<br>
			<br>

			<table>
				<tr>
					<td><img class="img" alt=""
						src="https://a0.muscache.com/im/pictures/a0316ecb-e49b-4b3a-b6b6-c2876b820e8c.jpg?im_w=480"
						width="90%" /></td>
					<td><img class="img" alt=""
						src="https://a0.muscache.com/im/pictures/ce6814ba-ed53-4d6e-b8f8-c0bbcf821011.jpg?im_w=480"
						width="90%" /></td>
					<td><img class="img" alt=""
						src="https://a0.muscache.com/im/pictures/ff69ac49-64e7-4f4a-ae2b-ee01163d0790.jpg?im_w=480"
						width="90%" /></td>
					<td><img class="img" alt=""
						src="https://a0.muscache.com/im/pictures/34b9d53a-8952-47f8-876d-bb927ea487b2.jpg?im_w=480"
						width="90%" /></td>
				<tr>
			</table>

		</ul>
	</section>
	<a href="http://pf.kakao.com/_xnHWixj">링크</a>
</body>

<script type="text/javascript">
      function filter(){

        var value, name, item, i;

        value = document.getElementById("value").value.toUpperCase();
        item = document.getElementsByClassName("item");

        for(i=0;i<item.length;i++){
          name = item[i].getElementsByClassName("name");
          if(name[0].innerHTML.toUpperCase().indexOf(value) > -1){
            item[i].style.display = "flex";
          }else{
            item[i].style.display = "none";
          }
        }
      }
</script>