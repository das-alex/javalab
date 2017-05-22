<%@ page import="java.util.LinkedHashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %><%--
  Created by IntelliJ IDEA.
  User: alexzh
  Date: 22/05/17
  Time: 22:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Task 4_6</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h1>Поиск и (или) замена информации в коллекции по ключу (значению)</h1>
    <form action="task4_6.jsp" method="post">
        <ul>
            <li><label for="key">Ключ: </label><input type="text" name="key" id="key"></li>
            <li><label for="value">Значение: </label><input type="text" name="value" id="value"></li>
            <li>
                <label for="chose">Выберите :</label>
                <select name="chose" id="chose">
                    <option value="search">Поиск</option>
                    <option value="replace">Замена</option>
                    <option value="sr_rpl">Поиск и замена</option>
                </select>
            </li>
        </ul>
        <input type="submit" name="do" value="поиск">
    </form>
    <%!
        String key, value, output = "";

        LinkedHashMap coll = new LinkedHashMap();
        Object[] keyO = {"one", "twoo", "three", "four", "five", "six", "seven", "eight", "nine", "ten"};
        Object[] valueO = {"gomel", "gsu", "car", "street", "Math", "since", "rocket", "space", "computer", "mouse"};
    %>
    <%
        for(int i=0; i<10; i++)
            coll.put(keyO[i], valueO[i]);

//        coll.entrySet().toArray();

        if(request.getParameter("do") != null) {
            if(request.getParameter("key") != "" || request.getParameter("value") != "") {
                key = request.getParameter("key");
                value = request.getParameter("value");

                switch(request.getParameter("chose")) {
                    case "search": {
                        if(coll.containsKey(key)) {
                            output += "<p>" + coll.entrySet() + "</p>";
                        } else if(coll.containsValue(value)) {
//                            output += "<p>" + coll.get(value) + "</p>";
                        } else {
                            output += "Нет совпадений";
                        }
                    }
                }

            } else {
                output += "Введите ключ и (или) значение";
            }
        } else {
            output += "Введите или ключ или значение";
        }
    %>
    <%=
        output + "<br>" + coll.entrySet().toArray()
    %>
    <%
        output = "";
    %>
</body>
</html>
