<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="/res/vendor/jquery/jquery-3.2.1.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
var colList =[
	{colNo:1, colArea:'대구', colSum:4987, colNew:0},
	{colNo:2, colArea:'서울', colSum:567, colNew:4},
];
 var loadData = function(){
	 var html ='';
	 var total = 0;
	 var coNewTotal =0;
	 
	 for(var i=0;i<colList.length;i++){
		 var cor = colList[i];
		html +='<tr>';
		$('th[data-col]').each(function(idx,th){
			var col = th.getAttribute('data-col');
			html += '<td>'+cor[col]+'</td>';
			if(col=='colSum'){
				total += cor[col];
			}else if(col=='colNew'){
				coNewTotal += cor[col];
			}
			
		})
		 html += '</tr>';
		 
	 }
	 html += '<tr><td colspan="2">합계</td>';
	 html += '<td>'+total+'</td>';
	 html += '<td>'+coNewTotal+'</td>';
	 $('#colbody').html(html);
 }
 $(document).ready(loadData);
 </script>
 
 <table class="table table-bordered" border="1">
 	<tr>
 		<th data-col="colNo">번호</th>
 		<th data-col="colArea">지역</th>
		<th data-col="colSum">확진자</th>
		<th data-col="colNew">신규감염자</th>
		</tr>
		<tbody id=colbody></tbody>
 		</table>
 		



</body>
</html>