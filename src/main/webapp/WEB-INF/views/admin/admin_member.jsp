<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<td>환영합니다. 
<spring:eval expression="@config['manager.id']"/> 님
</td>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 회원 관리</title>
<style>
table{
		position :relative;
		top : 120px;
		left: 300px;
		height: 300px;
		width: 1000px;
	}
		
	table,th,td{
		border : 1px solid black;
		border-collapse: collapse;
	}
			
	th,td{
		border : 1px solid black;
		border-collapse: collapsed;
		padding: 5px;
	}
</style>
<script src = "https://code.jquery.com/jquery-3.5.1.min.js"> </script>
</head>
<body>

<a href="admin"><div>게시글 관리</div></a>
<table>
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>이메일</th>
			<th>회원탈퇴</th>
		</tr>
		<c:forEach items="${admemberlist}" var="market_member">
		<tr>
			<td>${market_member.id}</td>
			<td>${market_member.name}</td>
			<td>${market_member.email}</td>
			<td>
			<input type="button" onclick="ajaxCall('${market_member.id}')" value="탈퇴"/>
			</td>
		</tr>	
		</c:forEach>	
	</table>
</body>
<script>
 
 	function ajaxCall(id){
		if(confirm('탈퇴시키겠습니까?')){
			$.ajax({
				url:"adminmemberdel",
				type:'GET',
				data:{'id':id},
				dataType:'JSON',
				success:function(d){	
					console.log("성공했니?");
					location.reload();
				},
				error:function(e){
					console.log(e);
				}
			});
		}else{
			console.log("취소");
		}	
	}
 	
 	
 

</script>
</html>