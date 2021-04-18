<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<html>
<head>
	<title>Home</title>
	
	<style>
		table, tr, td, th {
		text-align: center;
		border: 1px solid black;
		border-collapse: collapse;
		}
	</style>
	
	
</head>
<body>
<h1> 고대형 </h1>
	<table>
		<thead>
			<tr>
				<th>순번</th>
				<th>파일명</th>
				<th>파일사이즈</th>
				<th>업로드 버튼</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var = "arrlist" items = "${arrList}" varStatus="i">
			<form action="/upload" method="post" enctype="multipart/form-data">
				<tr>
					<td>${i.count}</td>
					<td><a href="http://localhost/filedownload?filename=${arrlist.fileName}">${arrlist.fileName}</a></td>
					<td>${arrlist.fileSize}</td>
					<td>
					<input type="file" name="mediaFile"/>
					<input type="hidden" name="a" value="${i.count}"/>
					<button type = "submit">파일 업로드</button>
					</td>			
				</tr>
				</form>
			</c:forEach>
			
		</tbody>
<%-- 		<tbody>
			<c:forEach var = "arrlist" items = "${arrList}" varStatus="i">
			<form action="/upload" method="post" enctype="multipart/form-data">
				<tr>
					<td>${i.count}</td>
					<td><a href="http://localhost/filedownload?filename=${arrlist.fileName}">${arrlist.fileName}</a></td>
					<td>${arrlist.fileSize}</td>
					<td>
					<input type="hidden" name="filename" value="${arrlist.fileName}"/>
					</td>
					<input type="hidden" name="a" value="${i.count}"/>
					<td><button type = "submit">파일 업로드</button></td>
				</tr>
				</form>
			</c:forEach>
			
		</tbody> --%>
		
	</table>
	
	<br>
	<br>
	<br> <p>&nbsp;&nbsp;&nbsp;</p>
	<form id= "formname" action="/mainupload" method="post" enctype="multipart/form-data">
		<input type = "file" NAME = "mediaFile"> </input>
		<button type = "submit">파일 업로드</button>
	</form>
	
	<button id="request" >서버와 통신시작</button>
	
	
</body>
</html>
