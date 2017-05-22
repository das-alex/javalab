<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Task 1</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h1>Вывести полное название страны и языка</h1>
    <p>Страна: <%= java.util.Locale.getDefault().getDisplayCountry() %></p>
    <p>Язык: <%= java.util.Locale.getDefault().getDisplayLanguage() %></p>
</body>
</html>
