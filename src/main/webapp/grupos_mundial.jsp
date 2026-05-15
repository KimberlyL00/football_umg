<%@page import="java.sql.*"%>
<%@page import="conexion.ConexionDB"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Grupos Mundial 2026</title>
<style>
body { font-family: Arial; background: #0f172a; color: white; padding: 40px; margin: 0; }
h1 { text-align: center; color: #38bdf8; margin-bottom: 30px; }
.container { display: flex; flex-wrap: wrap; justify-content: center; gap: 25px; }
.grupo { background: #1e293b; padding: 20px; border-radius: 15px; width: 280px; }
.grupo h2 { text-align: center; color: #4ade80; border-bottom: 1px solid #334155; padding-bottom: 8px; margin-top: 0; }
.equipo { display: flex; align-items: center; gap: 12px; margin: 10px 0; padding: 10px; background: #0b3a6e; border-radius: 10px; }
.equipo img { width: 32px; height: 22px; border-radius: 3px; object-fit: cover; }
.equipo span { font-size: 15px; font-weight: bold; }
.nav { display: flex; gap: 15px; justify-content: center; margin-top: 30px; }
.btn { color: white; padding: 10px 20px; border-radius: 8px; text-decoration: none; font-weight: bold; }
.btn-blue { background: #2563eb; }
.btn-green { background: #22c55e; }
</style>
</head>
<body>
<h1>Fase de Grupos — Mundial 2026</h1>
<div class="container">
<%
Connection conn = null;
try {
    conn = ConexionDB.conectar();
    PreparedStatement ps = conn.prepareStatement(
        "SELECT e.nombre_equipo, e.grupo, p.nombre as pais " +
        "FROM equipo e JOIN pais p ON e.id_pais = p.id_pais " +
        "ORDER BY e.grupo, e.nombre_equipo"
    );
    ResultSet rs = ps.executeQuery();
    String grupoActual = "";
    while (rs.next()) {
        String equipo = rs.getString("nombre_equipo");
        String grupo = rs.getString("grupo");
        String pais = rs.getString("pais");
        if (!grupo.equals(grupoActual)) {
            if (!grupoActual.equals("")) out.println("</div>");
            grupoActual = grupo;
%>
<div class="grupo">
<h2>Grupo <%= grupo %></h2>
<%
        }
        String bandera = "";
        switch(pais) {
            case "Argentina": bandera = "https://flagcdn.com/w40/ar.png"; break;
            case "Australia": bandera = "https://flagcdn.com/w40/au.png"; break;
            case "Austria": bandera = "https://flagcdn.com/w40/at.png"; break;
            case "Arabia Saudita": bandera = "https://flagcdn.com/w40/sa.png"; break;
            case "Bélgica":
            case "Belgica": bandera = "https://flagcdn.com/w40/be.png"; break;
            case "Bolivia": bandera = "https://flagcdn.com/w40/bo.png"; break;
            case "Brasil": bandera = "https://flagcdn.com/w40/br.png"; break;
            case "Camerún":
            case "Camerun": bandera = "https://flagcdn.com/w40/cm.png"; break;
            case "Canadá":
            case "Canada": bandera = "https://flagcdn.com/w40/ca.png"; break;
            case "Chile": bandera = "https://flagcdn.com/w40/cl.png"; break;
            case "Colombia": bandera = "https://flagcdn.com/w40/co.png"; break;
            case "Corea del Sur": bandera = "https://flagcdn.com/w40/kr.png"; break;
            case "Costa Rica": bandera = "https://flagcdn.com/w40/cr.png"; break;
            case "Croacia": bandera = "https://flagcdn.com/w40/hr.png"; break;
            case "Dinamarca": bandera = "https://flagcdn.com/w40/dk.png"; break;
            case "Ecuador": bandera = "https://flagcdn.com/w40/ec.png"; break;
            case "Egipto": bandera = "https://flagcdn.com/w40/eg.png"; break;
            case "El Salvador": bandera = "https://flagcdn.com/w40/sv.png"; break;
            case "Escocia": bandera = "https://flagcdn.com/w40/gb-sct.png"; break;
            case "España":
            case "Espana": bandera = "https://flagcdn.com/w40/es.png"; break;
            case "Estados Unidos": bandera = "https://flagcdn.com/w40/us.png"; break;
            case "Francia": bandera = "https://flagcdn.com/w40/fr.png"; break;
            case "Ghana": bandera = "https://flagcdn.com/w40/gh.png"; break;
            case "Alemania": bandera = "https://flagcdn.com/w40/de.png"; break;
            case "Honduras": bandera = "https://flagcdn.com/w40/hn.png"; break;
            case "Holanda":
            case "Países Bajos":
            case "Paises Bajos": bandera = "https://flagcdn.com/w40/nl.png"; break;
            case "Inglaterra": bandera = "https://flagcdn.com/w40/gb-eng.png"; break;
            case "Irán":
            case "Iran": bandera = "https://flagcdn.com/w40/ir.png"; break;
            case "Italia": bandera = "https://flagcdn.com/w40/it.png"; break;
            case "Jamaica": bandera = "https://flagcdn.com/w40/jm.png"; break;
            case "Japón":
            case "Japon": bandera = "https://flagcdn.com/w40/jp.png"; break;
            case "Marruecos": bandera = "https://flagcdn.com/w40/ma.png"; break;
            case "México":
            case "Mexico": bandera = "https://flagcdn.com/w40/mx.png"; break;
            case "Nigeria": bandera = "https://flagcdn.com/w40/ng.png"; break;
            case "Nueva Zelanda": bandera = "https://flagcdn.com/w40/nz.png"; break;
            case "Panamá":
            case "Panama": bandera = "https://flagcdn.com/w40/pa.png"; break;
            case "Paraguay": bandera = "https://flagcdn.com/w40/py.png"; break;
            case "Perú":
            case "Peru": bandera = "https://flagcdn.com/w40/pe.png"; break;
            case "Portugal":
            case "Portugal B": bandera = "https://flagcdn.com/w40/pt.png"; break;
            case "Qatar": bandera = "https://flagcdn.com/w40/qa.png"; break;
            case "Senegal": bandera = "https://flagcdn.com/w40/sn.png"; break;
            case "Serbia": bandera = "https://flagcdn.com/w40/rs.png"; break;
            case "Suiza": bandera = "https://flagcdn.com/w40/ch.png"; break;
            case "Túnez":
            case "Tunez": bandera = "https://flagcdn.com/w40/tn.png"; break;
            case "Turquía":
            case "Turquia": bandera = "https://flagcdn.com/w40/tr.png"; break;
            case "Uruguay": bandera = "https://flagcdn.com/w40/uy.png"; break;
            case "Venezuela": bandera = "https://flagcdn.com/w40/ve.png"; break;
            case "Guatemala": bandera = "https://flagcdn.com/w40/gt.png"; break;
            default: bandera = "https://flagcdn.com/w40/un.png";
        }
%>
<div class="equipo">
    <img src="<%= bandera %>" alt="<%= pais %>">
    <span><%= equipo %></span>
</div>
<%
    }
    if (!grupoActual.equals("")) out.println("</div>");
} catch (Exception e) {
    out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
} finally {
    if (conn != null) conn.close();
}
%>
</div>
<div class="nav">
    <a href="tabla_posiciones.jsp" class="btn btn-green">Ver Tabla de Posiciones</a>
    <a href="simulacion.jsp" class="btn btn-blue">Simulacion de Partidos</a>
    <a href="menu.jsp" class="btn btn-blue">← Volver al Menu</a>
</div>
</body>
</html>