<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Sistema Mundial UMG</title>
    <style>
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background: #eef2f3; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; }
        .menu-container { background: white; padding: 40px; border-radius: 15px; box-shadow: 0 10px 25px rgba(0,0,0,0.1); text-align: center; width: 400px; }
        h1 { color: #072357; margin-bottom: 30px; border-bottom: 2px solid #072357; padding-bottom: 10px; }
        .btn { display: block; background: #072357; color: white; padding: 12px; margin: 10px 0; text-decoration: none; border-radius: 8px; transition: 0.3s; font-weight: bold; }
        .btn:hover { background: #0a368c; transform: scale(1.02); }
        .footer { margin-top: 20px; font-size: 0.8em; color: #666; }
    </style>
</head>
<body>
    <div class="menu-container">
        <h1>🏆 Mundial 🏆</h1>
        <a href="gestion_equipos.jsp" class="btn"> Equipos</a>
        <a href="gestion_jugadores.jsp" class="btn"> Jugadores</a>
        <a href="gestion_estadios.jsp" class="btn">️ Estadios</a>
        <a href="gestion_partidos.jsp" class="btn"> Partidos</a>
        <a href="gestion_eventos.jsp" class="btn"> Eventos</a>
        
        <div class="footer">
            Facultad de Ingeniería - UMG 2026
        </div>
    </div>
</body>
</html>