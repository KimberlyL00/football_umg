<%@page import="java.sql.*"%>
<%@page import="conexion.ConexionDB"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Grupos del Mundial</title>

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
}

.grupos{
    display:flex;
    flex-wrap:wrap;
    gap:20px;
    justify-content:center;
    margin-top:30px;
}

.grupo{
    background:#1e293b;
    padding:20px;
    border-radius:15px;
    width:250px;
}

.grupo h2{
    text-align:center;
    color:#4ade80;
    border-bottom:1px solid #334155;
    padding-bottom:8px;
}

.equipo{
    display:flex;
    align-items:center;
    gap:10px;
    margin:10px 0;
    padding:8px;
    background:#0b3a6e;
    border-radius:10px;
}

.equipo img{
    width:25px;
    height:18px;
    border-radius:3px;
}

a{
    display:inline-block;
    margin-top:30px;
    color:white;
    text-decoration:none;
    background:#2563eb;
    padding:10px 18px;
    border-radius:8px;
}

</style>

</head>

<body>

<h1>Fase de Grupos</h1>

<div class="grupos">

<%

Connection conn = null;

try{

    conn = ConexionDB.conectar();

    PreparedStatement ps = conn.prepareStatement(
        "SELECT nombre_equipo, grupo FROM equipo ORDER BY grupo"
    );

    ResultSet rs = ps.executeQuery();

    String grupoActual = "";

    while(rs.next()){

        String equipo = rs.getString("nombre_equipo");
        String grupo = rs.getString("grupo");

        if(!grupo.equals(grupoActual)){
            if(!grupoActual.equals("")){
                out.println("</div>");
            }

%>

<div class="grupo">
<h2><%= grupo %></h2>

<%

            grupoActual = grupo;
        }

        // 🌍 bandera por país (básico)
        String bandera = "";

        if(equipo.equalsIgnoreCase("Argentina")) bandera = "https://flagcdn.com/w40/ar.png";
        else if(equipo.equalsIgnoreCase("Brasil")) bandera = "https://flagcdn.com/w40/br.png";
        else if(equipo.equalsIgnoreCase("Chile")) bandera = "https://flagcdn.com/w40/cl.png";
        else if(equipo.equalsIgnoreCase("Uruguay")) bandera = "https://flagcdn.com/w40/uy.png";
        else if(equipo.equalsIgnoreCase("Mexico")) bandera = "https://flagcdn.com/w40/mx.png";
        else if(equipo.equalsIgnoreCase("España")) bandera = "https://flagcdn.com/w40/es.png";
        else if(equipo.equalsIgnoreCase("Francia")) bandera = "https://flagcdn.com/w40/fr.png";
        else bandera = "https://flagcdn.com/w40/un.png";

%>

<div class="equipo">
    <img src="<%= bandera %>">
    <span><%= equipo %></span>
</div>

<%

    }

    if(!grupoActual.equals("")){
        out.println("</div>");
    }

}catch(Exception e){
    out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
}finally{
    if(conn != null) conn.close();
}

%>

</div>

<a href="menu.jsp">← Volver al menú</a>

</body>
</html>