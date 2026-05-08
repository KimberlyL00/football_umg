<%@page import="conexion.ConexionDB"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Random"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">

<head>
<meta charset="UTF-8">
<title>Simulación de Partidos</title>

<style>

:root{
    --bg:#081028;
    --card:#121c33;
    --accent:#3b82f6;
    --text:#e2e8f0;
    --muted:#94a3b8;
    --border:#22304d;
    --green:#22c55e;
}

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

body{
    font-family:Arial, Helvetica, sans-serif;
    background:var(--bg);
    color:var(--text);
}

.container{
    margin-left:280px;
    padding:40px;
}

.title{
    font-size:42px;
    font-weight:bold;
    margin-bottom:10px;
}

.subtitle{
    color:var(--muted);
    margin-bottom:35px;
}

.card{
    background:var(--card);
    border-radius:22px;
    padding:30px;
    border:1px solid var(--border);
}

.btn{
    background:linear-gradient(90deg,#2563eb,#3b82f6);
    color:white;
    border:none;
    padding:14px 24px;
    border-radius:12px;
    font-size:16px;
    font-weight:bold;
    cursor:pointer;
    margin-bottom:20px;
}

.match{
    background:#172554;
    border-radius:14px;
    padding:15px;
    margin-bottom:12px;
}

.teams{
    font-size:18px;
    font-weight:bold;
}

.result{
    font-size:24px;
    color:#4ade80;
    font-weight:bold;
}

.back{
    display:inline-block;
    margin-top:20px;
    color:white;
    text-decoration:none;
    padding:12px 18px;
    background:#1d4ed8;
    border-radius:10px;
}

</style>

</head>

<body>

<div class="container">

<div class="title">Simulación de Partidos</div>
<div class="subtitle">Genera resultados del torneo</div>

<div class="card">

<form method="post">
    <button type="submit" class="btn">Simular Partidos</button>
</form>

<%
Connection conn = null;

try {
    conn = ConexionDB.conectar();

    if(request.getMethod().equalsIgnoreCase("POST")) {

        Random r = new Random();

        String sql = 
        "SELECT p.id_partido, el.nombre_equipo AS local, ev.nombre_equipo AS visitante, " +
        "p.goles_local, p.goles_visitante " +
        "FROM partido p " +
        "JOIN equipo el ON p.id_equipo_local = el.id_equipo " +
        "JOIN equipo ev ON p.id_equipo_visitante = ev.id_equipo";

        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();

        boolean haySimulados = false;

        while(rs.next()) {

            int golesL = rs.getInt("goles_local");
            int golesV = rs.getInt("goles_visitante");

            // SOLO simula si no tiene goles aún
            if(golesL == 0 && golesV == 0) {

                int gL = r.nextInt(5);
                int gV = r.nextInt(5);

                PreparedStatement up = conn.prepareStatement(
                    "UPDATE partido SET goles_local=?, goles_visitante=? WHERE id_partido=?"
                );

                up.setInt(1, gL);
                up.setInt(2, gV);
                up.setInt(3, rs.getInt("id_partido"));
                up.executeUpdate();

                golesL = gL;
                golesV = gV;

                haySimulados = true;
            }
%>

<div class="match">
    <div class="teams">
        <%= rs.getString("local") %> vs <%= rs.getString("visitante") %>
    </div>
    <div class="result">
        <%= golesL %> - <%= golesV %>
    </div>
</div>

<%
        }

        if(!haySimulados) {
%>

<div style="color:#fbbf24; font-weight:bold;">
Todos los partidos ya fueron simulados
</div>

<%
        }
    }

} catch(Exception e) {
    out.println(e.getMessage());
} finally {
    if(conn != null) conn.close();
}
%>

<a class="back" href="menu.jsp">Volver al menú</a>

</div>

</div>

</body>
</html>