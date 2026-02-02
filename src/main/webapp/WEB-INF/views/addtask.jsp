<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Task</title>

<style>
body {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
    font-family: Arial, sans-serif;
    background: #f5f5f5;
}

form {
    padding: 20px;
    background: white;
    border-radius: 10px;
    box-shadow: 0px 0px 12px rgba(0,0,0,0.2);
    display: flex;
    flex-direction: column;
    gap: 12px;
}

input[type="text"] {
    padding: 8px;
    width: 250px;
}

input[type="submit"] {
    padding: 8px;
    cursor: pointer;
    background: #2d89ef;
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
<form action="handle-task" method="post">
    Title:<input type="text" name="title" required />
    Description:<input type="text" name="description" />
    <input type="submit" value="Add Task" />
    <a class="back-btn" href="${pageContext.request.contextPath}/">back</a>
</form>
</body>
</html>
