<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Task Management</title>

<style>
body {
    font-family: Arial, Helvetica, sans-serif;
    background: #f5f7fa;
    margin: 0;
    padding: 20px;
    text-align: center;
}

h1 {
    color: #333;
    margin-bottom: 25px;
}

table {
    margin: auto;
    width: 80%;
    border-collapse: collapse;
    background: white;
    box-shadow: 0 0 12px rgba(0,0,0,0.1);
}

th, td {
    padding: 12px;
    border-bottom: 1px solid #ddd;
}

th {
    background: #2d89ef;
    color: white;
}

tr:hover {
    background: #f1f1f1;
}

a, input[type="submit"] {
    text-decoration: none;
    font-weight: bold;
    padding: 6px 12px;
    border-radius: 6px;
    border: none;
    cursor: pointer;
}

.delete-btn {
    background: #e81123;
    color: white;
}

.update-btn {
    background: #107c10;
    color: white;
}

.add-btn {
    display: inline-block;
    margin-top: 25px;
    padding: 10px 18px;
    background: #2d89ef;
    color: white;
    border-radius: 6px;
}

a:hover, input[type="submit"]:hover {
    opacity: 0.85;
}

.empty-container {
    margin-top: 80px;
    padding: 40px;
    background: white;
    width: 60%;
    margin-left: auto;
    margin-right: auto;
    border-radius: 10px;
    box-shadow: 0 0 12px rgba(0,0,0,0.1);
}

.empty-container h2 {
    color: #555;
    margin-bottom: 20px;
}

.empty-subtext {
    color: #777;
    margin-bottom: 20px;
    font-size: 15px;
}

</style>
</head>

<body>
<h1>Task Management System</h1>

<c:choose>
    <c:when test="${empty task}">
    <div class="empty-container">
        <h2>No tasks available</h2>
        <p class="empty-subtext">Get started by adding your first task</p>
        <a href="add-task" class="add-btn">Add Task</a>
    </div>
   </c:when>

    <c:otherwise>
        <table>
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Description</th>
                <th colspan="2">Action</th>
            </tr>

            <c:forEach items="${task}" var="t" varStatus="status">
                <tr>
                    <td>${status.index + 1}</td>
                    <td>${t.title}</td>
                    <td>${t.description}</td>

                    <td>
                        <form action="delete/${t.id}" method="post" style="display:inline;">
                            <input type="submit" value="delete" class="delete-btn"/>
                        </form>
                    </td>

                    <td>
                        <a href="update/${t.id}" class="update-btn">update</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        
        <a href="add-task" class="add-btn">Add Task</a>
    </c:otherwise>
</c:choose>

</body>
</html>
