<%@ page import="java.io.FileReader" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.io.FileNotFoundException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Task 4_8b</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h1>Информация о среднесуточной температуре воздуха за месяц задана в виде списка, хранящегося в файле. Определить количество дней, когда температура была выше среднемесячной</h1>
    <%!
        private int a = 0, count = 0, midMonth = 0;
        private int mas[] = new int[30];
    %>
    <%
        a = 0;
        midMonth = 0;
        count = 0;

        try(BufferedReader br = new BufferedReader(new FileReader("/home/alexzh/IdeaProjects/laba5/web/input.txt"))) {
            System.out.println("I'm here");
            String line;
            while((line = br.readLine()) != null) {
                mas[a] = Integer.parseInt(line);
                a++;
            }
        } catch (FileNotFoundException ex) {
            System.out.println("Error");
        }

        for(int m : mas) {
            midMonth += m;
        }

        midMonth /= a;

        for(int i=0; i<a; i++) {
            if(mas[i] > midMonth) {
                count++;
            }
        }


    %>
    <p>Среднемесячная температура: <%= midMonth%> °C</p>
    <p>Количество дней, выше среднемесячной: <%=count%></p>
</body>
</html>
