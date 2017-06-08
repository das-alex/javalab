<%@ page import="java.io.FileNotFoundException" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.FileReader" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: alexzh
  Date: 03/06/17
  Time: 18:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Task 6</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h1>Журнал посещений</h1>
    <p>Таблица должна быть в текстовом виде и содержать фамилию и инициалы, адрес, дату посещения. Поиск должен производиться по части фамилии или по дате посещения.</p>
    <form action="task6.jsp" method="post">
        <ul>
            <li><label for="last_name">Фамилия: </label><input type="text" name="last_name" id="last_name"></li>
            <li><label for="date">Дата посещения: </label><input type="text" name="date" id="date"></li>
        </ul>
        <input type="submit" name="do" value="поиск">
    </form>
    <%!
        private String line, output = "";
        private List<String> name = new ArrayList();
        private List<String> adress = new ArrayList();
        private List<String> date = new ArrayList();
    %>
    <%
        name.clear();
        adress.clear();
        date.clear();
        output = "";

        try(BufferedReader bf = new BufferedReader(new FileReader("/home/alexzh/IdeaProjects/laba5/web/input2.txt"))) {
            while((line = bf.readLine()) != null) {
                name.add(line);
                adress.add(bf.readLine());
                date.add(bf.readLine());
            }
        } catch(FileNotFoundException ex) {
            System.out.println("File doesn't found");
        }

        output += "<table border=1 style='padding=20px'><tr><td>ФИО</td><td>Адрес</td><td>Дата</td></tr>";
        for(int i=0; i<name.size(); i++) {
            output += "<tr><td>" + name.get(i) +
                    "</td><td>" + adress.get(i) +
                    "</td><td>" + date.get(i) + "</td></tr>";
        }
        output += "</table>";

        if(request.getParameter("do") != null) {
            String last_name = request.getParameter("last_name");
            String date = request.getParameter("date");

            if(last_name != "") {

            }
        }
    %>
    <%=output%>
</body>
</html>
