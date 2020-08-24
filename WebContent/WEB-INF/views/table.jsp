<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/common/head.jsp"></jsp:include>
</head>
<script>
var colList = [
	{colNo:1, colArea:'대구', colSum:6978, colNew:0},
	{colNo:2, colArea:'서울', colSum:2986, colNew:97},
	{colNo:3, colArea:'경북', colSum:2612, colNew:85},
	{colNo:4, colArea:'검역', colSum:1443, colNew:6},
	{colNo:5, colArea:'인천', colSum:1322, colNew:4},
	{colNo:6, colArea:'광주', colSum:543, colNew:20},
	{colNo:7, colArea:'부산', colSum:280, colNew:1},
	];

var loadData = function(){
	var html ='';
	var total = 0;
	var colNewTotal = 0;
	for(i=0;i<colList.length;i++){
		var cor = colList[i];
		html += '<tr>';
		$('th[data-col]').each(function(idx,th){
			var col = th.getAttribute('data-col');
			html += '<td>' + cor[col] + '</td>';
			if(col=='colSum'){
				total += cor[col];
			}else if(col=='colNew'){
				colNewTotal += cor[col];
			}
			
		})
		html += '</tr>';
	}
	html += '<tr><td colspan="2">합계</td>'; /*colspan값 data-col -2   */
	html += '<td>'+total+'</td>';
	html += '<td>'+colNewTotal+'</td></tr>';
	$('#databody').html(html);
}
$(document).ready(loadData);
</script>
<body>
	<table class="table table-bordered">
		<tr>
			<th data-col="colNo">번호</th>
			<th data-col="colArea">지역</th>
			<th data-col="colSum">총확진자</th>
			<th data-col="colNew">신규확진자</th>
		</tr>
		<tbody id="databody">
		</tbody>
	</table>
</body>
</html>