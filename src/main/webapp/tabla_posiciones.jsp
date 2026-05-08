<%@page import="controladores.TorneoService"%>
<%@page import="modelos.Posicion"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Tabla de Posiciones</title>

<style>

body{
    margin:0;
    font-family:Arial;
    background:#0f172a;
    color:white;
    padding:40px;
}

h1{
    text-align:center;
    color:#38bdf8;
    margin-bottom:30px;
}

table{
    width:100%;
    border-collapse:collapse;
    background:#1e293b;
    border-radius:12px;
    overflow:hidden;
}

th{
    background:#0b3a6e;
    padding:12px;
}

td{
    padding:12px;
    text-align:center;
    border-bottom:1px solid #334155;
}

tr:hover{
    background:#334155;
}

.back{
    display:inline-block;
    margin-top:20px;
    padding:10px 20px;
    background:#2563eb;
    color:white;
    text-decoration:none;
    border-radius:8px;
}

</style>

</head>

<body>

<h1>Tabla de Posiciones</h1>

<%
TorneoService ts = new TorneoService();
ArrayList<Posicion> grupoA = ts.getGrupoA();

ts.ordenarGrupo(grupoA);
%>

<table>

<tr>
<th>Equipo</th>
<th>PJ</th>
<th>PG</th>
<th>PE</th>
<th>PP</th>
<th>GF</th>
<th>GC</th>
<th>Puntos</th>
</tr>

<%
for(Posicion p : grupoA){
%>

<tr>
    <td><%= p.getNombreEquipo() %></td>
    <td><%= p.getPj() %></td>
    <td><%= p.getPg() %></td>
    <td><%= p.getPe() %></td>
    <td><%= p.getPp() %></td>
    <td><%= p.getGf() %></td>
    <td><%= p.getGc() %></td>
    <td><b><%= p.getPuntos() %></b></td>
</tr>

<%
}
%>

</table>

<a class="back" href="menu.jsp">Volver al menú</a>

</body>
</html>