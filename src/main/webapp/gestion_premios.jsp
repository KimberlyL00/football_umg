<%@page import="java.sql.*"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Forzamos la codificación en la respuesta del servidor
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Premios y Calificaciones</title>
    <style>
        body { font-family: 'Segoe UI', sans-serif; background: #0f172a; color: white; padding: 20px; }
        .card { background: #1e293b; padding: 30px; border-radius: 15px; max-width: 800px; margin: auto; box-shadow: 0 10px 25px rgba(0,0,0,0.3); }
        h1 { color: #38bdf8; text-align: center; font-size: 2em; margin-bottom: 25px; }
        .btn-add { background: #22c55e; color: white; padding: 12px 20px; text-decoration: none; border-radius: 8px; display: inline-block; font-weight: bold; margin-bottom: 20px; }
        table { width: 100%; border-collapse: collapse; }
        th { background: #d4af37; color: #0f172a; padding: 15px; text-transform: uppercase; }
        td { padding: 15px; border-bottom: 1px solid #334155; text-align: center; }
        .error-msg { background: rgba(239, 68, 68, 0.1); color: #ef4444; padding: 15px; border-radius: 8px; border: 1px solid #ef4444; margin: 10px 0; text-align: center; }
    </style>
</head>
<body>
    <div class="card">
        <h1>CALIFICACIONES DE JUGADORES (MVP)</h1>
        
        <a href="agregar_premio.jsp" class="btn-add">+ ASIGNAR NUEVA CALIFICACIÓN</a>

        <table>
            <tr>
                <th>PARTIDO</th>
                <th>JUGADOR</th>
                <th>CALIFICACIÓN</th>
            </tr>
            <%
                try {
                    Class.forName("org.postgresql.Driver");
                    // Asegúrate de poner la contraseña correcta aquí
                    Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/Mundial", "postgres", "admin123");
                    Statement st = conn.createStatement();
                    
                    String sql = "SELECT el.nombre || ' vs ' || ev.nombre as partido, j.nombre as jugador, p.calificacion " +
                                 "FROM premio p " +
                                 "JOIN encuentros e ON p.id_partido = e.id " +
                                 "JOIN equipos el ON e.id_equipo_local = el.id " +
                                 "JOIN equipos ev ON e.id_equipo_visitante = ev.id " +
                                 "JOIN jugadores j ON p.id_jugador = j.id ORDER BY p.calificacion DESC";
                    
                    ResultSet rs = st.executeQuery(sql);
                    while(rs.next()){
            %>
            <tr>
                <td><%= rs.getString("partido") %></td>
                <td><%= rs.getString("jugador") %></td>
                <td><strong><%= rs.getDouble("calificacion") %></strong></td>
            </tr>
            <% } conn.close(); } catch(Exception e){ 
                out.print("<tr><td colspan='3'><div class='error-msg'>Error de acceso: Credenciales incorrectas o base de datos inaccesible.</div></td></tr>"); 
            } %>
        </table>
        <br>
        <a href="menu.jsp" style="color: #94a3b8; text-decoration: none; display: block; text-align: center;">← VOLVER AL MENÚ</a>
    </div>
</body>
</html>