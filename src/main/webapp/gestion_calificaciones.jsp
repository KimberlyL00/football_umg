<%@page import="conexion.ConexionDB, java.sql.*"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>MVP | Mundial 2026</title>
    <style>
        body { font-family: 'Inter', sans-serif; background: #0f172a; color: white; padding: 20px; }
        .card { background: #1e293b; padding: 35px; border-radius: 20px; max-width: 900px; margin: auto; box-shadow: 0 15px 35px rgba(0,0,0,0.4); }
        h1 { color: #38bdf8; text-align: center; text-transform: uppercase; border-bottom: 2px solid #334155; padding-bottom: 15px; }
        .btn-add { background: #22c55e; color: white; padding: 12px 20px; text-decoration: none; border-radius: 8px; font-weight: bold; display: inline-block; margin-bottom: 25px; }
        table { width: 100%; border-collapse: collapse; background: rgba(15, 23, 42, 0.5); }
        th { background: #072357; color: #38bdf8; padding: 15px; text-transform: uppercase; font-size: 0.9em; }
        td { padding: 15px; border-bottom: 1px solid #334155; text-align: center; }
        .score { font-weight: bold; color: #fbbf24; }
        .btn-del { color: #ef4444; text-decoration: none; font-weight: bold; }
    </style>
</head>
<body>
    <div class="card">
        <h1>Calificaciones de Jugadores (MVP)</h1>
        <div style="display: flex; justify-content: space-between; align-items: center;">
            <a href="asignar_calificacion.jsp" class="btn-add">+ ASIGNAR CALIFICACIÓN</a>
            <a href="menu.jsp" style="color: #94a3b8; text-decoration: none;">← Volver</a>
        </div>
        <table>
            <thead>
                <tr>
                    <th>PARTIDO</th>
                    <th>JUGADOR</th>
                    <th>CALIFICACIÓN</th>
                    <th>ACCIONES</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try (Connection conn = ConexionDB.conectar()) {
                        String sql = "SELECT c.id, e.id as p_id, j.nombre, c.punteo FROM calificaciones c " +
                                     "JOIN encuentros e ON c.id_encuentro = e.id JOIN jugadores j ON c.id_jugador = j.id";
                        ResultSet rs = conn.createStatement().executeQuery(sql);
                        while(rs.next()){
                %>
                <tr>
                    <td>Encuentro #<%= rs.getInt("p_id") %></td>
                    <td><%= rs.getString("nombre") %></td>
                    <td class="score"><%= rs.getInt("punteo") %> / 10</td>
                    <td><a href="eliminar_calificacion.jsp?id=<%= rs.getInt("id") %>" class="btn-del" onclick="return confirm('¿Eliminar?')">Eliminar</a></td>
                </tr>
                <% } } catch(Exception e) { %>
                <tr><td colspan="4" style="color:#ef4444;">Error: Verifica la clave de PostgreSQL.</td></tr>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>