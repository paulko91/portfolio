<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<style>
table, tr, td, th {
	text-align: center;
	border: 1px solid black;
	border-collapse: collapse
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

		function radioFun(selValue){
	
	
			if(selValue == "1"){
				/* <c:set var="radioSelect" value="1"/> */
					alert("${radioSelect}" + " =====1");
					
					$("#tdh1").show();
					$("#tdh2").show();
					$("#tdh3").show();
					$("#tdh4").show();
					
					for(var i=1; i<=10; i++){
						$("#tdt"+i).show();
						$("#tde"+i).show();
						$("#tdc"+i).show();
						$("#tds"+i).show();	
						
					}
					
					$("#thf1").show();
					$("#thf2").show();
					$("#thf3").show();
		
					
					
					/* for(var i=1; i<=10; i++){
						$("#divBox" + i + "").slideLeft();	
					} */
				
				
			}else
			{
				/* <c:set var="radioSelect" value="2"/> */
					alert("${radioSelect}" + " =====2");
					
					$("#tdh1").hide();
					$("#tdh2").hide();
					$("#tdh3").hide();
					$("#tdh4").hide();
					
					for(var i=1; i<=10; i++){
						$("#tdt"+i).hide();
						$("#tde"+i).hide();
						$("#tdc"+i).hide();
						$("#tds"+i).hide();	
						
					}
					
						$("#thf1").hide();
						$("#thf2").hide();
						$("#thf3").hide();	
					
					
			}
			
		}
	</script>

</head>
<body>

	<input type="radio" name="sel" checked onclick="radioFun('1')">전공
	</input>
	<input type="radio" name="sel" onclick="radioFun('2')">필수
	</input>


	<br>
	<table id="tableId">
		<thead>
			<tr>
				<td rowspan="2">전공</td>
				<td rowspan="2">이름</td>
				<td colspan="3">전공과목</td>
				<td id="tdh1" colspan="3">교양 필수 과목</td>
				<td rowspan="2">총점</td>
				<td rowspan="2">평균</td>
				<td rowspan="2">순위(등수)</td>
			</tr>
			<tr id="tr1">
				<td>전산학 개론</td>
				<td>자바</td>
				<td>프로그래밍</td>
				<td id="tdh2">통계학</td>
				<td id="tdh3">전산영어</td>
				<td id="tdh4">전산수학</td>
			</tr>
		</thead>

		<tbody id="tbodyId">

			<c:forEach var="sungjuk" items="${sungjuk}"  varStatus="i">
				<tr>

					<c:if test="${i.count eq 1}">
						<td rowspan="5">컴공</td>
						<!-- // 전공 -->
					</c:if>

					<c:if test="${i.count == 6}">
						<td rowspan="5">비컴공</td>
						<!-- // 전공 -->
					</c:if>

					<c:set var="SubjTotal" value="${sungjuk.junge + sungjuk.java + sungjuk.program
													+ sungjuk.tongge + sungjuk.juneng + sungjuk.junCal}">
					</c:set>
					<c:set var="SubjAvg" value="${SubjTotal / 6}">
					</c:set>
					
					
				

					<td id="td1">${sungjuk.name}</td>
					<!-- // 이름 -->
					<td>${sungjuk.junge}</td>
					<!-- // 전산학개론 -->
					<td>${sungjuk.java}</td>
					<!-- // 자바 -->
					<td>${sungjuk.program}</td>
					<!-- // 프로그래밍 -->
					<div id="divBox${i.count}">
					<%-- <c:if test="${radioSelect eq 2}"> --%>
						<td id="tdt${i.count}">${sungjuk.tongge}</td>
						<!-- // 통계학 -->
						<td id="tde${i.count}">${sungjuk.juneng}</td>
						<!-- // 전산영어 -->
						<td id="tdc${i.count}">${sungjuk.junCal}</td>
						<!-- // 전산수학 -->
						<td><c:out value="${SubjTotal}"></c:out></td>
						<td><c:out value="${SubjAvg}"></c:out></td>	
						<td><td>

						
					<%-- </c:if> --%>
					</div>
					
					
					<c:set var="jungeTotal" value="${jungeTotal + sungjuk.junge}">
					</c:set>
					<c:set var="javaTotal" value="${javaTotal + sungjuk.java}">
					</c:set>
					<c:set var="programTotal" value="${programTotal + sungjuk.program}">
					</c:set>
					<c:set var="tonggeTotal" value="${tonggeTotal + sungjuk.tongge}">
					</c:set>
					<c:set var="junengTotal" value="${junengTotal + sungjuk.juneng}">
					</c:set>
					<c:set var="junCalTotal" value="${junCalTotal + sungjuk.junCal}">
					</c:set>
					<c:set var="totTotal" value="${jungeTotal + javaTotal + programTotal
													+ tonggeTotal + junengTotal + junCalTotal}">
					</c:set>
					
					<c:set var="jungeAvg" value="${(jungeTotal + sungjuk.junge)/(i.count+1)}">
					</c:set>
					<c:set var="javaAvg" value="${(javaTotal + sungjuk.java)/(i.count+1)}">
					</c:set>
					<c:set var="programAvg" value="${(programTotal + sungjuk.program)/(i.count+1)}">
					</c:set>
					<c:set var="tonggeAvg" value="${(tonggeTotal + sungjuk.tongge)/(i.count+1)}">
					</c:set>
					<c:set var="junengAvg" value="${(junengTotal + sungjuk.juneng)/(i.count+1)}">
					</c:set>
					<c:set var="junCalAvg" value="${(junCalTotal + sungjuk.junCal)/(i.count+1)}">
					</c:set>
					<c:set var="totAvg" value="${(totTotal)/6}">
					</c:set>
					
				</tr>
			</c:forEach>
		</tbody>

		<tfoot>
			<tr>
				<th colspan="2">합계</th>
				<th><c:out value="${jungeTotal}"></c:out></th>
				<th><c:out value="${javaTotal}"></c:out></th>
				<th><c:out value="${programTotal}"></c:out></th>
				
				<th id="thf1"><c:out value="${tonggeTotal}"></c:out></th>
				<th id="thf2"><c:out value="${junengTotal}"></c:out></th>
				<th id="thf3"><c:out value="${junCalTotal}"></c:out></th>
				<th><c:out value="${totTotal}"></c:out></th>
				<th><c:out value="${totAvg}"></c:out></th>
			</tr>
			<tr>
				<th colspan="2">평균</th>
				<th><c:out value="${jungeAvg}"></c:out></th>
				<th><c:out value="${javaAvg}"></c:out></th>
				<th><c:out value="${programAvg}"></c:out></th>
				
				<th id="thf1"><c:out value="${tonggeAvg}"></c:out></th>
				<th id="thf2"><c:out value="${junengAvg}"></c:out></th>
				<th id="thf3"><c:out value="${junCalAvg}"></c:out></th>
				
			</tr>
		</tfoot>
	</table>
</body>
	<script type="text/javascript">
	
	var i=0;
	
	function addJumSu(subjAvg){
		
		numArr[i] = subjAvg;
		i=i+1;
		
	}
	
	numArr.sort();
	
	
	</script>
</html>