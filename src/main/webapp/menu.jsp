<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>World Cup 2026 | Dashboard</title>
    <style>
        :root {
            --bg-color: #0f172a;
            --card-bg: #1e293b;
            --text-main: #f8fafc;
            --text-dim: #94a3b8;
            --accent: #38bdf8;
            --accent-hover: #0ea5e9;
        }

        body {
            font-family: 'Inter', system-ui, sans-serif;
            background-color: var(--bg-color);
            color: var(--text-main);
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            width: 90%;
            max-width: 1000px;
            padding: 20px;
        }

        .header {
            text-align: left;
            margin-bottom: 40px;
            border-left: 4px solid var(--accent);
            padding-left: 20px;
        }

        .header h1 {
            font-size: 2.5rem;
            margin: 0;
            letter-spacing: -1px;
        }

        .header p {
            color: var(--text-dim);
            margin: 5px 0 0;
        }

        .grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 25px;
        }

        .card {
            background: var(--card-bg);
            border-radius: 16px;
            padding: 24px;
            transition: all 0.3s ease;
            border: 1px solid rgba(255,255,255,0.05);
        }

        .card:hover {
            transform: translateY(-8px);
            border-color: var(--accent);
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.3);
        }

        .card h3 {
            margin-top: 0;
            color: var(--accent);
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 1.3rem;
        }

        .menu-list {
            list-style: none;
            padding: 0;
            margin: 20px 0 0;
        }

        .menu-list li {
            margin-bottom: 12px;
        }

        .menu-list a {
            color: var(--text-main);
            text-decoration: none;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 12px 16px;
            background: rgba(255,255,255,0.03);
            border-radius: 8px;
            transition: background 0.2s;
        }

        .menu-list a:hover {
            background: rgba(56, 189, 248, 0.1);
            color: var(--accent);
        }

        .menu-list a::after {
            content: '→';
            font-size: 1.1rem;
            opacity: 0.5;
        }

        .footer-text {
            text-align: center;
            margin-top: 50px;
            color: var(--text-dim);
            font-size: 0.85rem;
            text-transform: uppercase;
            letter-spacing: 2px;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="header">
        <h1>World Cup 2026</h1>
        <p>Panel de Administración y Logística</p>
    </div>

    <div class="grid">
        <div class="card">
            <h3>⚽ Gestión de Plantillas</h3>
            <ul class="menu-list">
                <li><a href="gestion_equipos.jsp">Selecciones Nacionales</a></li>
                <li><a href="gestion_jugadores.jsp">Registro de Jugadores</a></li>
                <li><a href="gestion_grupos.jsp">Fase de Grupos</a></li>
            </ul>
        </div>

        <div class="card">
            <h3>🏟️ Competición y Sedes</h3>
            <ul class="menu-list">
                <li><a href="gestion_partidos.jsp">Calendario Oficial</a></li>
                <li><a href="gestion_estadios.jsp">Infraestructura Sedes</a></li>
                <li><a href="gestion_eventos.jsp">Cronología de Eventos</a></li>
            </ul>
        </div>

        <div class="card">
            <h3>🏆 Rendimiento</h3>
            <ul class="menu-list">
                <li><a href="gestion_premios.jsp">Calificaciones MVP</a></li>
                <li><a href="#" style="opacity: 0.5; pointer-events: none;">Estadísticas Generales</a></li>
            </ul>
        </div>
    </div>

    <p class="footer-text">Sistema de Gestión Deportiva • UMG • 2026</p>
</div>

</body>
</html>