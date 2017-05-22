<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Task 3</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h1>Создать приложение, выводящее фамилию разработчика, дату и время получения задания, а также дату и время его выполнения</h1>
    <p>Студент: Жиженский Александр, Вариант 10</p>
    <p>Время получения задания: <%= new Date(System.currentTimeMillis() - 6000000000l)%></p>
    <p>Время выполнения: <%= new Date(System.currentTimeMillis())%></p>
</body>
</html>
