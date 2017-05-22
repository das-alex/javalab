<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Task 2</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h1>Задать температуру. Если она меньше нуля, вывести значение температуры синим цветом, если больше, то красным</h1>
    <form action="task2.jsp" method="post">
        <label for="input">Введите температуру</label>
        <input type="text" name="input" id="input" value="0">
        <input type="submit" value="задать">
    </form>
    <%!
        String color = "", error = "";
        Integer temp;
    %>
    <%
        if(request.getParameter("input") != "" && request.getParameter("input") != null) {
            try {
                temp = Integer.parseInt(request.getParameter("input"));
                color = temp > 0 ? "red" : (temp < 0 ? "blue" : "black");
            } catch(NumberFormatException ex) {
    %>
    <p>Неправильное число! Введите заново</p>
    <%
                temp = 0;
            }
        } else {
    %>
        <p>Неправильное число! Введите заново</p>
    <%
        }
    %>

    <p class="<%=color%>"> <%= temp %> </p>
</body>
</html>
