<%@page import="conexion.ConexionDB, java.sql.*"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Eventos | Mundial</title>
    <style>
        body { background: #0f172a; color: white; font-family: sans-serif; padding: 20px; }
        .card { background: #1e293b; padding: 30px; border-radius: 15px; max-width: 950px; margin: auto; }
        h1 { color: #38bdf8; text-align: center; }
        .btn-add { background: #22c55e; color: white; padding: 10px 15px; text-decoration: none; border-radius: 5px; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th { background: #072357; color: #38bdf8; padding: 12px; }
        td { padding: 12px; border-bottom: 1px solid #334155; text-align: center; }
    </style>
</head>
<body>
    <div class="card">
        <h1>Eventos de Partidos</h1>
        <div style="margin-bottom: 20px;">
            <a href="registrar_evento.jsp" class="btn-add">+ REGISTRAR EVENTO</a>
        </div>
        <table>
            <thead>
                <tr>
                    <th>PARTIDO</th>
                    <th>JUGADOR</th>
                    <th>MINUTO</th>
                    <th>EVENTO</th>
                    <th>ACCIONES</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try (Connection conn = ConexionDB.conectar()) {
                        String sql = "SELECT ev.id, ev.id_encuentro, j.nombre, ev.minuto, ev.tipo_evento " +
                                     "FROM eventos ev JOIN jugadores j ON ev.id_jugador = j.id ORDER BY ev.id DESC";
                        ResultSet rs = conn.createStatement().executeQuery(sql);
                        while(rs.next()){
                %>
                <tr>
                    <td>#<%= rs.getInt("id_encuentro") %></td>
                    <td><%= rs.getString("nombre") %></td>
                    <td><%= rs.getInt("minuto") %>'</td>
                    <td style="color: #f59e0b; font-weight: bold;"><%= rs.getString("tipo_evento") %></td>
                    <td><a href="eliminar_evento.jsp?id=<%= rs.getInt("id") %>" style="color:#ef4444;" onclick="return confirm('¿Borrar?')">Eliminar</a></td>
                </tr>
                <% } } catch(Exception e) { %>
                <tr><td colspan="5" style="color: #ef4444;">Error de conexión. Revisa ConexionDB.java</td></tr>
                <% } %>
            </tbody>
        </table>
        <br><center><a href="menu.jsp" style="color: #94a3b8;">Volver al Menú</a></center>
    </div>
</body>
</html>