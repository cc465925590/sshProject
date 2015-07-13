<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:url var="saveUrl" value="/user/save/${userAttribute.id }}" />
	<form method="post" action="${saveUrl }">
	${userAttribute.id }
	${saveUrl}
		<table>
			<tr>
				<td>ID:</td>
				<td><input id="Id" name="Id" type="text" value="${userAttribute.id}" /></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input id="Password" name="Password" type="text" value="${userAttribute.password}" /></td>
			</tr>
		</table>
		<input type="submit" value="Save">
	</form>
</body>
</html>