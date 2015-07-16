<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="springdemo.cc.model.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="add">Add</a>
	<table>
		<tr>
			<td>Id</td>
			<td>Password</td>
		</tr>
		<c:forEach var="userlist" items="${userPage.result }">
			<tr>
				<td>${userlist.id }</td>
				<td>${userlist.password }</td>
				<td><a href="show/${userlist.id }">详细</a></td>
				<td><a href="edit/${userlist.id }">编辑</a></td>
				<td><a href="del/${userlist.id }">删除</a></td>
			</tr>
		</c:forEach>
	</table>
	总记录数为:${userPage.totalsCount }
	<c:if test="${userPage.currentPage == 1}">
		<span class="disabled"><< 前一页</span>
	</c:if>
	<c:if test="${userPage.currentPage != 1}">
		<a href="/springdemo/user/pagelist?currentPage=${userPage.currentPage-1}"><< 前一页</a>
	</c:if>
	<c:if test="${userPage.currentPage == 1}">
		<span class="current">1</span>
	</c:if>
	<c:if test="${userPage.currentPage != 1}">
		<a href="/springdemo/user/pagelist?currentPage=1">1</a>
	</c:if>
	<%
		/* Page<User> userPage = (Page<User>)session.getAttribute("userPage"); */
		Page<User> userPage = (Page<User>)request.getAttribute("userPage");
		int pageTimes =  userPage.getTotalsPage();
		for (int i = 1; i < pageTimes; i++) {
			request.setAttribute("page", i + 1);
	%>
	<c:if test="${currentPage == page}">
		<span class="current"><%=i + 1%></span>
	</c:if>
	<c:if test="${currentPage != page}">
		<a href="/springdemo/user/pagelist?currentPage=<%=i + 1%>"><%=i + 1%></a>
	</c:if>
	<%
		}
	%>
	<c:if test="${userPage.currentPage == userPage.totalsPage}">
		<span class="disabled">后一页 >></span>
	</c:if>
	<c:if test="${userPage.currentPage != userPage.totalsPage}">
		<a href="/springdemo/user/pagelist?currentPage=${userPage.currentPage+1}">后一页 >></a>
	</c:if>
</body>
</html>