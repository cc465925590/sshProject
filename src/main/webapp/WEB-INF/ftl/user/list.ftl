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
        <#list userList as user>
            <tr>
                <td>${user.id }</td>
                <td>${user.password }</td>
                <td><a href="show/${user.id }">详细</a></td>
                <td><a href="edit/${user.id }">编辑</a></td>
                <td><a href="del/${user.id }">删除</a></td>
            </tr>
        </#list>
    </table>
           ${teststr }
</body>
</html>