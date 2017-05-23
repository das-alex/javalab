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
                </select>
            </li>
        </ul>
        <input type="submit" name="do" value="поиск">
    </form>
    <%!
        String key, value, output = "";

        LinkedHashMap<String, String> coll = new LinkedHashMap();
        String[] keyO = {"one", "twoo", "three", "four", "five", "six", "seven", "eight", "nine", "ten"};
        String[] valueO = {"gomel", "gsu", "car", "street", "Math", "since", "rocket", "space", "computer", "mouse"};
    %>
    <%
        for(int i=0; i<10; i++)
            coll.put(keyO[i], valueO[i]);

        if(request.getParameter("do") != null) {
            if(request.getParameter("key") != "" || request.getParameter("value") != "") {
                key = request.getParameter("key");
                value = request.getParameter("value");

                switch(request.getParameter("chose")) {
                    case "search": {
                        check();
                        break;
                    }
                    case "replace": {
                        replace();
                        break;
                    }
                }

            } else {
                output += "Введите ключ и (или) значение";
            }
        } else {
            output += "Введите или ключ или значение";
        }
    %>
    <%!
        public void check() {
            if(key != "" && value != "") {

                if (coll.containsKey(key) && coll.containsValue(value)) {

                    coll.forEach((key1, val1) -> {
                        if (key.equals(key1) || value.equals(val1)) {
                            output += "<p>" + key1 + " - " + coll.get(key1) + "</p>";
                        }
                    });

                } else if (coll.containsKey(key) || coll.containsValue(value)) {

                    if (coll.containsKey(key)) {
                        coll.forEach((key1, val1) -> {
                            if (key.equals(key1)) {
                                output += "<p>" + key1 + " - " + coll.get(key1) + "</p>";
                            }
                        });
                    } else if (coll.containsValue(value)){
                        coll.forEach((key1, val1) -> {
                            if (value.equals(val1)) {
                                output += "<p>" + key1 + " - " + coll.get(key1) + "</p>";
                            }
                        });
                    } else {
                        output += "Нет совпадений";
                    }

                } else {
                    output += "Нет совпадений";
                }

            } else  if (key != "" && value == "") {

                output += "<p>" + key + " - " + coll.get(key) + "</p>";

            } else if (key == "" && value != "") {

                coll.forEach((key, val) -> {
                    if (val.equals(value)) {
                        output += "<p>" + key + " - " + coll.get(key) + "</p>";
                    }
                });

            } else {
                output += "Нет совпадений";
            }
        }

        public void replace() {
            if(key != "") {
                if (coll.containsKey(key)) {
                    coll.replace(key, value);
                } else {
                    output += "Введите правильное значение ключа";
                }
            } else {
                output += "Введите значение ключа";
            }
        }
    %>
    <%=
        output + "<br><br>" + coll.entrySet()
    %>
    <%
        output = "";
    %>
</body>
</html>
