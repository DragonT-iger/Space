<style>
* {
	box-sizing: border-box;
}

ul {
	list-style-type: none;
}

input, button {
	padding: 5px 10px;
}

#list {
	border: 1px solid #ccc;
	padding: 20px;
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
}

#list>li {
	flex-basis: 48%;
	margin-bottom: 20px;
}

#list>li>img {
	width: 80%;
}
</style>

<body>
	<section class="container">
		<h1>room Search List</h1>
		<form action="" id="search-form">
			<input type="text" id="search">
			<button id="searchBtn">search</button>
		</form>
		<ul id="list">
				<div class="searchbox">
		<div class="header">
			<h1>Search</h1>
			<input onkeyup="filter()" type="text" id="value"
				placeholder="Type to Search">
		</div>

	</div>
			
		</ul>
	</section>
	<script>
	const room=[
		{
			id:	1,
			name: '이상해씨',
			type: '풀',
			url:'https://a0.muscache.com/im/pictures/a0316ecb-e49b-4b3a-b6b6-c2876b820e8c.jpg?im_w=480'
		},
		{
			id:	2,
			name: '파이리',
			type: '불꽃',
			url:'https://a0.muscache.com/im/pictures/ce6814ba-ed53-4d6e-b8f8-c0bbcf821011.jpg?im_w=480'
		},
		{
			id:	3,
			name: '피카츄',
			type: '전기',
			url:'https://a0.muscache.com/im/pictures/ff69ac49-64e7-4f4a-ae2b-ee01163d0790.jpg?im_w=480'
		},
		{
			id:	4,
			name: '삐삐',
			type: '페어리',
			url:'https://a0.muscache.com/im/pictures/34b9d53a-8952-47f8-876d-bb927ea487b2.jpg?im_w=480'
		}
		
		
		
	]
	
	const list =document.getElementById('list');
	
	function showList(val){
		list.innerHTML='';
		const res = room.forEach(room	 =>{
			if(room.name.includes(val)){
				const li = document.createElement('li');
				var str = '<img src="'+room.url+'" />';
				str+='<p>이름: '+room.name+'</p>';
				str+='<p>속성: '+room.type+'</p>';
				li.innerHTML=str;
				list.appendChild(li);
			}
		})	//end showList
	}

	showList('');
	
	
	const searchInuput=document.getElementById('search');
	const searchBtn=document.getElementById('searchBtn')

	searchBtn.addEventListener('click', (e) => {
		e.preventDefault();
		const val = searchInuput.value;
		console.log(val);
		showList(val);

	})
	
</script>
</body>