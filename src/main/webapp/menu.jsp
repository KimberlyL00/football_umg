<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>World Cup 2026 | Dashboard</title>
<style>
:root{
    --bg:#081028;
    --text:#f8fafc;
    --muted:#94a3b8;
    --accent:#38bdf8;
}
*{ margin:0; padding:0; box-sizing:border-box; }
body{ font-family:system-ui,sans-serif; background:var(--bg); color:var(--text); }
.container{ width:92%; max-width:1300px; margin:auto; padding:50px 20px; }
.header{ margin-bottom:40px; border-left:5px solid var(--accent); padding-left:25px; }
.header h1{ font-size:3.8rem; }
.header p{ color:var(--muted); margin-top:8px; }
.grid{ display:grid; grid-template-columns:repeat(auto-fit,minmax(320px,1fr)); gap:25px; }
.card{ background:linear-gradient(135deg,#1f2a44,#273449); border-radius:20px; padding:28px; border:1px solid rgba(56,189,248,0.25); box-shadow:0 12px 30px rgba(0,0,0,0.35); transition:0.3s; }
.card:hover{ transform:translateY(-8px); border-color:var(--accent); }
.card h3{ margin-bottom:18px; font-size:1.4rem; color:var(--accent); }
.menu-list{ list-style:none; }
.menu-list li{ margin-bottom:12px; }
.menu-list a{ display:flex; justify-content:space-between; padding:14px 16px; background:rgba(255,255,255,0.08); border-radius:12px; text-decoration:none; color:var(--text); transition:0.2s; }
.menu-list a:hover{ background:rgba(56,189,248,0.2); transform:translateX(6px); }
.footer{ margin-top:60px; text-align:center; padding:22px; border-radius:16px; background:rgba(255,255,255,0.03); border:1px solid rgba(56,189,248,0.2); }
.footer-title{ color:var(--accent); font-size:13px; margin-bottom:6px; letter-spacing:2px; text-transform:uppercase; }
.footer-names{ font-size:18px; font-weight:bold; }
</style>
</head>
<body>
<div class="container">
<div class="header">
    <h1>MUNDIAL 2026</h1>
    <p>Panel de Administración y Logística</p>
</div>
<div class="grid">
    <div class="card">
        <h3>Catálogos</h3>
        <ul class="menu-list">
            <li><a href="gestion_paises.jsp">Países</a></li>
            <li><a href="gestion_estadios.jsp">Estadios</a></li>
            <li><a href="gestion_posiciones.jsp">Posiciones</a></li>
        </ul>
    </div>
    <div class="card">
        <h3>Plantillas</h3>
        <ul class="menu-list">
            <li><a href="gestion_equipos.jsp">Equipos</a></li>
            <li><a href="gestion_jugadores.jsp">Jugadores</a></li>
        </ul>
    </div>
    <div class="card">
        <h3>Competición</h3>
        <ul class="menu-list">
            <li><a href="gestion_partidos.jsp">Partidos</a></li>
            <li><a href="gestion_goles.jsp">Goles</a></li>
            <li><a href="gestion_amonestaciones.jsp">Amonestaciones</a></li>
            <li><a href="gestion_alineaciones.jsp">Alineaciones</a></li>
            <li><a href="grupos_mundial.jsp">Fase de Grupos</a></li>
            <li><a href="tabla_posiciones.jsp">Tabla de Posiciones</a></li>
            <li><a href="simulacion.jsp">Simulación</a></li>
        </ul>
    </div>
</div>
<div class="footer">
    <div class="footer-title">
        Sistema de Gestión Deportiva - UMG - 2026
    </div>
    <div class="footer-names">
        Grupo 1: Keila - Karen - Kimberly
    </div>
</div>
</div>
</body>
</html>