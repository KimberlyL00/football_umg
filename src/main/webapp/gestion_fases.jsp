<%@page import="conexion.ConexionDB"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Fases</title>

<style>
body{font-family:Arial;background:#0f172a;color:white;padding:40px;}
.container{max-width:800px;margin:auto;background:#1e293b;padding:20px;border-radius:12px;}
table{width:100%;border-collapse:collapse;}
th{background:#072357;padding:12px;}
td{padding:12px;text-align:center;border-bottom:1px solid #334155;}
a{color:white;text-decoration:none;}
.btn{background:#22c55e;padding:8px 12px;border-radius:6px;}
.del{color:#ef4444;}
</style>

</head>

<body>

<div class="container">

<h1>Fases</h1>

<a class="btn" href="agregar_fase.jsp">+ Agregar Fase</a>
<a href="menu.jsp" style="float:right;">← Menú</a>

<br><br>

<table>

<tr>
    <th>ID</th>
    <th>Descripción</th>
    <th>Acción</th>
</tr>

<%
Connection conn = ConexionDB.conectar();

PreparedStatement ps = conn.prepareStatement(
    "SELECT * FROM fase ORDER BY id_fase"
);

ResultSet rs = ps.executeQuery();

while(rs.next()){
%>

<tr>
    <td>#<%= rs.getInt("id_fase") %></td>
    <td><%= rs.getString("descripcion") %></td>
    <td>
        <a class="del" href="eliminar_fase.jsp?id=<%= rs.getInt("id_fase") %>">
            Eliminar
        </a>
    </td>
</tr>

<%
}

conn.close();
%>

</table>

</div>

</body>
</html>