<%@ page import="java.io.FileNotFoundException" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.FileReader" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%--
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
        private Integer k = 0;
        private String line, output = "", output2 = "";
        private List<String> name = new ArrayList();
        private List<String> adress = new ArrayList();
        private List<String> date = new ArrayList();
    %>
    <%
        name.clear();
        adress.clear();
        date.clear();
        output = "";
//        output2 = "";

        try(BufferedReader bf = new BufferedReader(new FileReader("/home/alexzh/IdeaProjects/laba5/web/input2.txt"))) {
            while((line = bf.readLine()) != null) {
                name.add(line);
                adress.add(bf.readLine());
                date.add(bf.readLine());
            }
        } catch(FileNotFoundException ex) {
            System.out.println("File doesn't found");
        }

        output += "<table border=1 cellpadding=3><tr><td>ФИО</td><td>Адрес</td><td>Дата</td></tr>";
        for(int i=0; i<name.size(); i++) {
            output += "<tr><td>" + name.get(i) +
                    "</td><td>" + adress.get(i) +
                    "</td><td>" + date.get(i) + "</td></tr>";
        }
        output += "</table>";

        if(request.getParameter("do") != null) {
            String last_name = request.getParameter("last_name");
            String dat = request.getParameter("date");

            if(last_name != "" || dat != "") {

                if(dat != "" && last_name == "") {

                    if(date.contains(dat)) {
                        k = 0;
                        date.forEach(s -> {
                            if(dat.equals(s)) {
                                output2 = "<table border=1 cellpadding=3><tr><td>"+ name.get(k) +
                                        "</td><td>"+ adress.get(k) +
                                        "</td><td>"+ date.get(k) +"</td></tr></table>";
                            }
                            k++;
                        });
                    } else {
                        output2 = "<p>Нет совпадений</p>";
                    }

                } else if(dat == "" && last_name != "") {
                    k = 0;
                    output2 = "<table border=1 cellpadding=3>";

                    for(String str : name) {
                        System.out.println("do " + k + " - " + str + " - " + last_name);

                        if(str.contains(last_name)) {
                            System.out.println("output");
                            output2 += "<tr><td>"+ name.get(k) +
                                    "</td><td>"+ adress.get(k) +
                                    "</td><td>"+ date.get(k) +"</td></tr>";
                        }
                        k++;
                    }

                    output2 += "</table>";

                } else {
                    output2 = "Уфффф";
                }


            } else {
                output2 = "<p>Для поиска введите фамилию или дату (в формате дд-мм-гггг)</p>";
            }
        }
    %>
    <%=output%>
    <%="<p>Найдено:</p>" + output2%>
</body>
</html>
