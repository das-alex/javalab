<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Task 4_3</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h1>Генерация таблиц по переданным параметрам: заголовок, количество строк и столбцов, цвет фона</h1>
    <form action="task4_3.jsp" method="post">
        <ul>
            <li><label for="header">Введите заголовок таблицы: </label><input type="text" name="header" id="header"></li>
            <li><label for="lines">Введите количество строк: </label><input type="text" name="lines" id="lines"></li>
            <li><label for="colums">Введите количество столбцов: </label><input type="text" name="colums" id="colums"></li>
            <li>
                <label for="color">Введите :</label>
                <select name="color" id="color">
                    <option value="red">Красный</option>
                    <option value="blue">Синий</option>
                    <option value="green">Зелёный</option>
                </select>
            </li>
        </ul>
        <input type="submit" name="submit" value="создать">
    </form>
    <%!
        String header, color, output = "";
        Integer rows, cols;
    %>
    <%
        if(request.getParameter("submit") != null) {
            color = request.getParameter("color");

            if(request.getParameter("header") != "") {
                header = request.getParameter("header");

                output += "<table border=1 bgcolor='" + color + "'><caption>" + header + "</caption>";
            } else {
                output += "<p>Введите заголовок</p>";
            }

            try {
                if(request.getParameter("lines") != "" && request.getParameter("colums") != "") {
                    rows = Integer.parseInt(request.getParameter("lines"));
                    cols = Integer.parseInt(request.getParameter("colums"));

                    for(int i=0; i<rows; i++) {
                        output += "<tr>";

                        for(int j=0; j<cols; j++) {
                            output += "<td>test</td>";
                        }

                        output += "</tr>";
                    }
                } else {
                    output += "<p>Введите кол-во строк и столбцов<p>";
                }
            } catch(NumberFormatException ex) {
                output += "<p>Введите кол-во строк и столбцов<p>";
            }

            output += "</table>";
        } else {
            output = "Введите данные, пожалуйста";
        }
    %>
    <div>
        <%= output %>
    </div>
    <%
        output = "";
    %>
</body>
</html>
