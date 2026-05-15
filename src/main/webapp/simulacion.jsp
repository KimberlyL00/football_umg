<%@page import="conexion.ConexionDB"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Random"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Simulacion de Partidos | Mundial 2026</title>
<style>
body { margin: 0; font-family: Arial; background: #0f172a; color: white; padding: 40px; }
h1 { text-align: center; color: #38bdf8; margin-bottom: 10px; }
.subtitle { text-align: center; color: #94a3b8; margin-bottom: 30px; }
.nav { display: flex; gap: 15px; justify-content: center; margin-bottom: 30px; }
.btn { color: white; padding: 12px 22px; border-radius: 8px; text-decoration: none; font-weight: bold; font-size: 0.95em; }
.btn-green { background: #22c55e; }
.btn-blue { background: #2563eb; }
.container { max-width: 900px; margin: auto; }
.grupo-titulo { color: #4ade80; font-size: 1.1em; font-weight: bold; margin: 25px 0 10px; border-left: 4px solid #4ade80; padding-left: 10px; }
.match { background: #1e293b; margin: 10px 0; padding: 18px 20px; border-radius: 12px; display: flex; align-items: center; justify-content: space-between; border: 1px solid #334155; }
.match:hover { border-color: #38bdf8; }
.teams { display: flex; align-items: center; gap: 12px; flex: 1; }
.team { display: flex; align-items: center; gap: 8px; font-weight: bold; font-size: 1em; }
.team img { width: 28px; height: 20px; border-radius: 2px; object-fit: cover; }
.score { font-size: 1.5em; font-weight: bold; color: #38bdf8; padding: 0 20px; min-width: 80px; text-align: center; font-family: monospace; }
.meta { font-size: 12px; color: #94a3b8; text-align: right; min-width: 180px; }
.winner { color: #4ade80; font-size: 11px; font-weight: bold; margin-top: 4px; }
.empty { text-align: center; padding: 40px; color: #94a3b8; background: #1e293b; border-radius: 12px; }
</style>
</head>
<body>
<div class="container">
    <h1>Simulacion de Partidos</h1>
    <p class="subtitle">Simula los partidos del torneo y registra los resultados.</p>
    <div class="nav">
        <a href="simulacion.jsp?accion=simular" class="btn btn-green">Simular Partidos</a>
        <a href="tabla_posiciones.jsp" class="btn btn-blue">Ver Tabla</a>
        <a href="grupos_mundial.jsp" class="btn btn-blue">Ver Grupos</a>
        <a href="menu.jsp" class="btn btn-blue">← Menu</a>
    </div>
<%
Connection conn = null;
try {
    conn = ConexionDB.conectar();
    String accion = request.getParameter("accion");
    if ("simular".equals(accion)) {
        Random r = new Random();
        PreparedStatement ps = conn.prepareStatement(
            "SELECT p.id_partido, p.fecha_hora, " +
            "el.nombre_equipo AS local, ev.nombre_equipo AS visitante, " +
            "est.nombre AS estadio, f.descripcion AS fase, " +
            "eql.grupo AS grupo, " +
            "pl.nombre AS pais_local, pv.nombre AS pais_visitante " +
            "FROM partido p " +
            "JOIN equipo eql ON p.id_equipo_local = eql.id_equipo " +
            "JOIN equipo eqv ON p.id_equipo_visitante = eqv.id_equipo " +
            "JOIN equipo el ON p.id_equipo_local = el.id_equipo " +
            "JOIN equipo ev ON p.id_equipo_visitante = ev.id_equipo " +
            "JOIN estadio est ON p.id_estadio = est.id_estadio " +
            "JOIN fase f ON p.id_fase = f.id_fase " +
            "JOIN pais pl ON eql.id_pais = pl.id_pais " +
            "JOIN pais pv ON eqv.id_pais = pv.id_pais " +
            "ORDER BY eql.grupo, p.fecha_hora"
        );
        ResultSet rs = ps.executeQuery();
        String grupoActual = "";
        while (rs.next()) {
            int id = rs.getInt("id_partido");
            int gl = r.nextInt(5);
            int gv = r.nextInt(5);
            PreparedStatement up = conn.prepareStatement(
                "UPDATE partido SET goles_local=?, goles_visitante=? WHERE id_partido=?"
            );
            up.setInt(1, gl); up.setInt(2, gv); up.setInt(3, id);
            up.executeUpdate();
            String grupo = rs.getString("grupo");
            String paisLocal = rs.getString("pais_local");
            String paisVisitante = rs.getString("pais_visitante");
            if (!grupo.equals(grupoActual)) {
                if (!grupoActual.equals("")) out.println("</div>");
                grupoActual = grupo;
                out.println("<div class='grupo-titulo'>Grupo " + grupo + "</div><div>");
            }
            String winner = gl > gv ? "Victoria: " + rs.getString("local") :
                            gv > gl ? "Victoria: " + rs.getString("visitante") : "Empate";
            String bLocal = getBandera(paisLocal);
            String bVisitante = getBandera(paisVisitante);
%>
<div class="match">
    <div class="teams">
        <div class="team">
            <img src="<%= bLocal %>" alt="<%= paisLocal %>">
            <span><%= rs.getString("local") %></span>
        </div>
        <div class="score"><%= gl %> - <%= gv %></div>
        <div class="team">
            <img src="<%= bVisitante %>" alt="<%= paisVisitante %>">
            <span><%= rs.getString("visitante") %></span>
        </div>
    </div>
    <div class="meta">
        🏟 <%= rs.getString("estadio") %><br>
        📅 <%= rs.getTimestamp("fecha_hora") %><br>
        <span class="winner">🏆 <%= winner %></span>
    </div>
</div>
<%
        }
        if (!grupoActual.equals("")) out.println("</div>");
    } else {
%>
<div class="empty">
    Presiona <strong>Simular Partidos</strong> para generar resultados aleatorios
</div>
<%
    }
} catch (Exception e) {
    out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
} finally {
    if (conn != null) conn.close();
}
%>
</div>
<%!
    String getBandera(String pais) {
        switch(pais) {
            case "Argentina": return "https://flagcdn.com/w40/ar.png";
            case "Australia": return "https://flagcdn.com/w40/au.png";
            case "Austria": return "https://flagcdn.com/w40/at.png";
            case "Arabia Saudita": return "https://flagcdn.com/w40/sa.png";
            case "Bélgica":
            case "Belgica": return "https://flagcdn.com/w40/be.png";
            case "Bolivia": return "https://flagcdn.com/w40/bo.png";
            case "Brasil": return "https://flagcdn.com/w40/br.png";
            case "Camerún":
            case "Camerun": return "https://flagcdn.com/w40/cm.png";
            case "Canadá":
            case "Canada": return "https://flagcdn.com/w40/ca.png";
            case "Chile": return "https://flagcdn.com/w40/cl.png";
            case "Colombia": return "https://flagcdn.com/w40/co.png";
            case "Corea del Sur": return "https://flagcdn.com/w40/kr.png";
            case "Costa Rica": return "https://flagcdn.com/w40/cr.png";
            case "Croacia": return "https://flagcdn.com/w40/hr.png";
            case "Dinamarca": return "https://flagcdn.com/w40/dk.png";
            case "Ecuador": return "https://flagcdn.com/w40/ec.png";
            case "Egipto": return "https://flagcdn.com/w40/eg.png";
            case "El Salvador": return "https://flagcdn.com/w40/sv.png";
            case "Escocia": return "https://flagcdn.com/w40/gb-sct.png";
            case "España":
            case "Espana": return "https://flagcdn.com/w40/es.png";
            case "Estados Unidos": return "https://flagcdn.com/w40/us.png";
            case "Francia": return "https://flagcdn.com/w40/fr.png";
            case "Ghana": return "https://flagcdn.com/w40/gh.png";
            case "Alemania": return "https://flagcdn.com/w40/de.png";
            case "Honduras": return "https://flagcdn.com/w40/hn.png";
            case "Holanda":
            case "Países Bajos":
            case "Paises Bajos": return "https://flagcdn.com/w40/nl.png";
            case "Inglaterra": return "https://flagcdn.com/w40/gb-eng.png";
            case "Irán":
            case "Iran": return "https://flagcdn.com/w40/ir.png";
            case "Italia": return "https://flagcdn.com/w40/it.png";
            case "Jamaica": return "https://flagcdn.com/w40/jm.png";
            case "Japón":
            case "Japon": return "https://flagcdn.com/w40/jp.png";
            case "Marruecos": return "https://flagcdn.com/w40/ma.png";
            case "México":
            case "Mexico": return "https://flagcdn.com/w40/mx.png";
            case "Nigeria": return "https://flagcdn.com/w40/ng.png";
            case "Nueva Zelanda": return "https://flagcdn.com/w40/nz.png";
            case "Panamá":
            case "Panama": return "https://flagcdn.com/w40/pa.png";
            case "Paraguay": return "https://flagcdn.com/w40/py.png";
            case "Perú":
            case "Peru": return "https://flagcdn.com/w40/pe.png";
            case "Portugal":
            case "Portugal B": return "https://flagcdn.com/w40/pt.png";
            case "Qatar": return "https://flagcdn.com/w40/qa.png";
            case "Senegal": return "https://flagcdn.com/w40/sn.png";
            case "Serbia": return "https://flagcdn.com/w40/rs.png";
            case "Suiza": return "https://flagcdn.com/w40/ch.png";
            case "Túnez":
            case "Tunez": return "https://flagcdn.com/w40/tn.png";
            case "Turquía":
            case "Turquia": return "https://flagcdn.com/w40/tr.png";
            case "Uruguay": return "https://flagcdn.com/w40/uy.png";
            case "Venezuela": return "https://flagcdn.com/w40/ve.png";
            case "Guatemala": return "https://flagcdn.com/w40/gt.png";
            default: return "https://flagcdn.com/w40/un.png";
        }
    }
%>
</body>
</html>