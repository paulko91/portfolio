<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
table, tr, td {
	text-align: center;
	border: 1px solid black;
	border-collapse: collapse;
}

td input {
	text-align: center
}
</style>
<style type="text/css">
thead {
	background-color: lightgray
}
</style>

<script type="text/javascript">

	function subjrad(subjValue){
		if(subjValue == "1") {
			
		}
	}
	
</script>

</head>
<body>
<h1 id="h1Text"> 제목 </h1>
<h1 id="h2Text"> 성적표 </h1>
	<form commandName="sungjukVo" action="/sungjuk/sungpo" method="post"
		enctype="form-data">
		<table>
			<thead>
				<tr>
					<td rowspan="2">전공</td>
					<td rowspan="2">이름</td>
					<td colspan="3">전공과목</td>
					<td colspan="3">교양 필수 과목</td>

				</tr>
				<tr>
					<td>전산학 개론</td>
					<td>자바</td>
					<td>프로그래밍</td>
					<td><input type="radio" name="subj" value="1">통계학</input></td>
					<td><input type="radio" name="subj" value="2">전산영어</input></td>
					<td><input type="radio" name="subj" value="3">전산수학</input></td>
					
				</tr>
			</thead>
			<tbody>
				<%-- 	<c:forEach var = "i" begin = "1" end = "10"> --%>

				<c:forEach var="sung" items="${arrList}" varStatus="i">
					<tr>
						<td><input name="jungong" type="text"
							value="${arrList2[i.count-1]}"> </input>
							<input type="checkbox"/></td>
						<td><input name="name" type="text" value="${sung}"> </input></td>
						<td><input name="junge" type="number" autocomplate="off"
							min="0" max="100" value="${arrList2[i.count+10]}"> </input></td>
						<td><input name="java" type="number" autocomplate="off"
							min="0" max="100" value="${arrList2[i.count+20]}"> </input></td>
						<td><input name="program" type="number" autocomplate="off"
							min="0" max="100" value="${arrList2[i.count+30]}"> </input></td>
						<td><input name="tongge" type="number" autocomplate="off"
							min="0" max="100" value="${arrList2[i.count+40]}"> </input></td>
						<td><input name="juneng" type="number" autocomplate="off"
							min="0" max="100" value="${arrList2[i.count+50]}"> </input></td>
						<td><input name="junCal" type="number" autocomplate="off"
							min="0" max="100" value="${arrList2[i.count+60]}"> </input></td>
					</tr>
				</c:forEach>

			</tbody>

		</table>

		<br>
		<button type="submit">전송</button>
		<br>
		
	</form>


</body>


</html>