<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script type = "text/javascript">

/* function confirm(){
	
	
	window.location.href="confirm";
} */
function popup_confirm(){
	
	window.open("confirm", "confirm", "width=400, height=300, left=100, top=50");
}
	
</script>
<head>
	<title>Insert title here</title>
	 <!-- Custom fonts for this template -->
    <link href="../../resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="../../resources/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="../../resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

</head>
<body>

<div>
	<h1> 휴먼 교육 센터 - 포트폴리오 2021-01-27 평가 문제 <고대형> </h1>
</div>
<div>
	<ul>
		<li>1 과정1</li>
		<li></li>
		<li>2 과정2</li>
		<li></li>		
	</ul>
	
	<div style="float:right;">
		<!-- <button onclick=confirm()> 확인</button> -->
		<button onclick=popup_confirm()> 확인</button>
	</div>
	
	<div>
		<table border = "1" width=100% style= "text-align: auto">	
			<thead style = "color:red;">
				<tr>
					<th>2단</th>
					<th>3단</th>
					<th>4단</th>
					<th>5단</th>
				</tr>
			</thead>
			<tfoot style = "color:blue;">
				<tr>
					<th>2단 합계 : ${dansum2}</th>
					<th>3단 합계 : ${dansum3}</th>
					<th>4단 합계 : ${dansum4}</th>
					<th>5단 합계 : ${dansum5}</th>
				</tr>
			</tfoot>
			<tbody>
				<tr>
					<td>${dan2}</td>
					<td>${dan3}</td>
					<td>${dan4}</td>
					<td>${dan5}</td>
				</tr>
				
			</tbody>
		</table>
		
		<br/>
		
		<table border = "1" width=100% style= "text-align: auto">	
			<thead style = "color:red;">
				<tr>
					<th>6단</th>
					<th>7단</th>
					<th>8단</th>
					<th>9단</th>
				</tr>
			</thead>
			<tfoot style = "color:blue;">
				<tr>
					<th>6단 합계 : ${dansum6}</th>
					<th>7단 합계 : ${dansum7}</th>
					<th>8단 합계 : ${dansum8}</th>
					<th>9단 합계 : ${dansum9}</th>
				</tr>
			</tfoot>
			<tbody>
				<tr>
					<td>${dan6}</td>
					<td>${dan7}</td>
					<td>${dan8}</td>
					<td>${dan9}</td>
				</tr>
				
			</tbody>
		</table>
		
		<br/>
		
	</div>
</div>
	
</body>
</html>