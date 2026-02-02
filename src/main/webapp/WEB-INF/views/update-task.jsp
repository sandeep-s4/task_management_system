<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Task</title>

<style>
body {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
    font-family: Arial, sans-serif;
    background: #f2f2f2;
}

form {
    padding: 20px;
    background: white;
    border-radius: 10px;
    box-shadow: 0 0 12px rgba(0,0,0,0.2);
    display: flex;
    flex-direction: column;
    gap: 12px;
    width: 280px;
}

input[type="text"],
input[type="number"] {
    padding: 8px;
    width: 100%;
}

input[type="submit"] {
    padding: 8px;
    cursor: pointer;
    background: #4a90e2;
    color: white;
    border: none;
    border-radius: 5px;
}

.back-btn {
    padding: 8px;
    background: #777;
    color: white;
    text-decoration: none;
    text-align: center;
    border-radius: 5px;
}
</style>
</head>

<body>
<form action="${pageContext.request.contextPath}/update-handle" method="post">
    ID:<input type="number" name="id" value="${task.id}" readonly />
    Title:<input type="text" name="title" value="${task.title}" required />
    Description:<input type="text" name="description" value="${task.description}" />
    <input type="submit" value="update" />
    <a class="back-btn" href="${pageContext.request.contextPath}/">back</a>
</form>
</body>
</html>
