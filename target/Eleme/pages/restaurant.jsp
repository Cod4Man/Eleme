<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${restaurantName}首页</title>
</head>
<body>
	<table>
			<tr>
				<td width="120px">名字</td>
				<td width="80px">价格</td>
				<td width="80px">评分</td>
			</tr>
		<c:forEach items="${foodsList }" var="foods">
			<tr>
				<td>${foods.foodsName }</td>
				<td>${foods.foodsPrice }</td>
				<td>${foods.foodsScore }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>