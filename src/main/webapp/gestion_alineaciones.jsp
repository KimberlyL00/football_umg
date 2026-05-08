<%@page import="conexion.ConexionDB"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Alineaciones | Mundial 2026</title>
    <style>
        :root { --bg: #0f172a; --card: #1e293b; --accent: #38bdf8; --red: #ef4444; --green: #22c55e; }
        body { font-family: 'Inter', sans-serif; background: var(--bg); color: white; padding: 40px; margin: 0; }
        .container { max-width: 1100px; margin: auto; background: var(--card); padding: 30px; border-radius: 20px; }
        h1 { text-align: center; color: var(--accent); text-transform: uppercase; letter-spacing: 2px; border-bottom: 2px solid #334155; padding-bottom: 15px; }
        .nav-bar { display: flex; justify-content: space-between; align-items: center; margin-bottom: 25px; }
        .btn-add { background: var(--green); color: white; padding: 10px 20px; text-decoration: none; border-radius: 8px; font-weight: bold; }
        table { width: 100%; border-collapse: collapse; }
        th { background: #072357; color: var(--accent); padding: 14px; text-transform: uppercase; font-size: 0.85em; }
        td { padding: 14px; border-bottom: 1px solid #334155; text-align: center; }
        .btn-del { color: var(--red); text-decoration: none; border: 1px solid var(--red); padding: 5px 12px; border-radius: 6px; font-weight: bold; }
        .titular { background: var(--green); color: white; padding: 4px 10px; border-radius: 15px; font-size: 0.85em; font-weight: bold; }
        .suplente { background: #475569; color: white; padding: 4px 10px; border-radius: 15px; font-size: 0.85em; font-weight: bold; }
        .error-msg { background: rgba(239,68,68,0.1); border: 1px solid var(--red); color: #fca5a5; padding: 20px; border-radius: 10px; text-align: center; }
    </style>
</head>
<body>
<div class="container">
    <h1>Alineaciones</h1>
    <div class="nav-bar">
        <a href="agregar_alineacion.jsp" class="btn-add">+ Registrar Alineacion</a>
        <a href="menu.jsp" style="color: #94a3b8; text-decoration: none;">← Volver al Menu</a>
    </div>
    <table>
        <thead>
            <tr>
                <th>Partido</th>
                <th>Jugador</th>
                <th>Equipo</th>
                <th>Titular</th>
                <th>Minutos Jugados</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <%
                Connection conn = null;
                try {
                    conn = ConexionDB.conectar();
                    PreparedStatement ps = conn.prepareStatement(
                        "SELECT a.id_partido, a.id_jugador, a.es_titular, a.minutos_jugados, " +
                        "j.nombre_completo, e.nombre_equipo, " +
                        "el.nombre_equipo as local, ev.nombre_equipo as visitante " +
                        "FROM alineacion a " +
                        "JOIN jugador j ON a.id_jugador = j.id_jugador " +
                        "JOIN equipo e ON j.id_equipo = e.id_equipo " +
                        "JOIN partido p ON a.id_partido = p.id_partido " +
                        "JOIN equipo el ON p.id_equipo_local = el.id_equipo " +
                        "JOIN equipo ev ON p.id_equipo_visitante = ev.id_equipo " +
                        "ORDER BY a.id_partido ASC, e.nombre_equipo ASC, a.es_titular DESC"
                    );
                    ResultSet rs = ps.executeQuery();
                    while (rs.next()) {
                        boolean esTitular = rs.getBoolean("es_titular");
            %>
            <tr>
                <td style="color: var(--accent);">#<%= rs.getInt("id_partido") %> <%= rs.getString("local") %> vs <%= rs.getString("visitante") %></td>
                <td style="font-weight: bold;"><%= rs.getString("nombre_completo") %></td>
                <td style="color: #d4af37;"><%= rs.getString("nombre_equipo") %></td>
                <td><span class="<%= esTitular ? "titular" : "suplente" %>"><%= esTitular ? "Titular" : "Suplente" %></span></td>
                <td><%= rs.getInt("minutos_jugados") %>'</td>
                <td>
                    <a href="eliminar_alineacion.jsp?id_partido=<%= rs.getInt("id_partido") %>&id_jugador=<%= rs.getInt("id_jugador") %>"
                       class="btn-del" onclick="return confirm('¿Eliminar esta alineacion?')">Eliminar</a>
                </td>
            </tr>
            <%
                    }
                } catch (Exception e) {
            %>
            <tr>
                <td colspan="6">
                    <div class="error-msg">Error al cargar alineaciones: <%= e.getMessage() %></div>
                </td>
            </tr>
            <% } finally { if (conn != null) conn.close(); } %>
        </tbody>
    </table>
</div>
</body>
</html>