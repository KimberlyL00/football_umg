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
    <title>Calendario | Mundial 2026</title>
    <style>
        body { font-family: 'Inter', sans-serif; background: #0f172a; color: white; padding: 20px; }
        .card { background: #1e293b; padding: 35px; border-radius: 20px; max-width: 1100px; margin: auto; box-shadow: 0 15px 35px rgba(0,0,0,0.4); }
        h1 { color: #38bdf8; text-align: center; text-transform: uppercase; letter-spacing: 2px; border-bottom: 2px solid #334155; padding-bottom: 15px; }
        .btn-new { background: #22c55e; color: white; padding: 12px 20px; text-decoration: none; border-radius: 8px; font-weight: bold; display: inline-block; margin-bottom: 25px; }
        table { width: 100%; border-collapse: collapse; background: rgba(15, 23, 42, 0.5); }
        th { background: #072357; color: #38bdf8; padding: 15px; font-size: 0.85em; text-transform: uppercase; }
        td { padding: 15px; border-bottom: 1px solid #334155; text-align: center; }
        .status { padding: 5px 10px; border-radius: 15px; font-size: 0.8em; font-weight: bold; }
        .pendiente { background: #f59e0b; color: #000; }
        .finalizado { background: #10b981; color: #fff; }
        .error-msg { background: rgba(239, 68, 68, 0.1); border: 1px solid #ef4444; color: #fca5a5; padding: 20px; border-radius: 10px; text-align: center; }
    </style>
</head>
<body>
    <div class="card">
        <h1>Calendario de Encuentros</h1>
        
        <div style="display: flex; justify-content: space-between; align-items: center;">
            <a href="programar_partido.jsp" class="btn-new">+ PROGRAMAR NUEVO ENCUENTRO</a>
            <a href="menu.jsp" style="color: #94a3b8; text-decoration: none;">← Volver al Menú</a>
        </div>

        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Encuentro</th>
                    <th>Marcador</th>
                    <th>Estadio</th>
                    <th>Fase</th>
                    <th>Estado</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Connection conn = null;
                    try {
                        conn = ConexionDB.conectar();
                        if (conn == null) throw new Exception("Error: Contraseña de DB incorrecta.");
                        
                        Statement st = conn.createStatement();
                        // Consulta con JOIN para ver los nombres de los equipos y estadios
                        String sql = "SELECT e.id, el.nombre as local, ev.nombre as visitante, " +
                                     "e.marcador_local, e.marcador_visitante, est.nombre as estadio, " +
                                     "e.fase, e.estado FROM encuentros e " +
                                     "JOIN equipos el ON e.id_equipo_local = el.id " +
                                     "JOIN equipos ev ON e.id_equipo_visitante = ev.id " +
                                     "JOIN estadios est ON e.id_estadio = est.id ORDER BY e.id ASC";
                        
                        ResultSet rs = st.executeQuery(sql);
                        while(rs.next()){
                            String estado = rs.getString("estado");
                            String claseEstado = estado.equalsIgnoreCase("PENDIENTE") ? "pendiente" : "finalizado";
                %>
                <tr>
                    <td>#<%= rs.getInt("id") %></td>
                    <td style="font-weight: bold;"><%= rs.getString("local") %> vs <%= rs.getString("visitante") %></td>
                    <td style="color: #38bdf8; font-family: monospace; font-size: 1.2em;">
                        <%= rs.getInt("marcador_local") %> - <%= rs.getInt("marcador_visitante") %>
                    </td>
                    <td style="color: #94a3b8;"><%= rs.getString("estadio") %></td>
                    <td><%= rs.getString("fase") %></td>
                    <td><span class="status <%= claseEstado %>"><%= estado %></span></td>
                    <td>
                        <a href="eliminar_partido.jsp?id=<%= rs.getInt("id") %>" 
                           style="color: #ef4444; text-decoration: none; font-size: 0.9em;"
                           onclick="return confirm('¿Eliminar este encuentro?')">Eliminar</a>
                    </td>
                </tr>
                <% 
                        } 
                    } catch(Exception e){ 
                %>
                <tr>
                    <td colspan="7">
                        <div class="error-msg">
                            <strong>ERROR DE CONEXIÓN:</strong> Verifica que la contraseña en tu clase Java coincida con la de pgAdmin.
                        </div>
                    </td>
                </tr>
                <% } finally { if(conn != null) conn.close(); } %>
            </tbody>
        </table>
    </div>
</body>
</html>