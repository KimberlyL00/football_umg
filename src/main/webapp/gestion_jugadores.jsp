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
    <title>Plantillas | Mundial 2026</title>
    <style>
        body { font-family: 'Inter', sans-serif; background: #0f172a; color: white; padding: 20px; }
        .card { background: #1e293b; padding: 40px; border-radius: 20px; max-width: 1000px; margin: auto; box-shadow: 0 15px 35px rgba(0,0,0,0.4); }
        h1 { color: #38bdf8; text-align: center; font-size: 2.5em; border-bottom: 2px solid #334155; padding-bottom: 15px; text-transform: uppercase; letter-spacing: 2px; }
        .btn-add { background: #22c55e; color: white; padding: 14px 24px; text-decoration: none; border-radius: 10px; display: inline-block; font-weight: bold; margin-bottom: 30px; transition: 0.3s; }
        .btn-add:hover { background: #16a34a; transform: translateY(-2px); }
        table { width: 100%; border-collapse: collapse; background: rgba(15, 23, 42, 0.5); border-radius: 12px; overflow: hidden; }
        th { background: #072357; color: #38bdf8; padding: 18px; text-transform: uppercase; font-size: 0.9em; border-bottom: 2px solid #1e293b; }
        td { padding: 16px; border-bottom: 1px solid #334155; text-align: center; font-size: 1.05em; }
        .btn-delete { color: #ef4444; text-decoration: none; font-weight: bold; padding: 5px 10px; border: 1px solid #ef4444; border-radius: 5px; transition: 0.2s; }
        .btn-delete:hover { background: #ef4444; color: white; }
        .error-msg { background: rgba(239, 68, 68, 0.15); color: #f87171; padding: 20px; border-radius: 10px; border: 1px solid #ef4444; text-align: center; font-weight: 500; }
    </style>
</head>
<body>
    <div class="card">
        <h1>PLANTILLAS DE JUGADORES</h1>
        
        <div style="display: flex; justify-content: space-between; align-items: center;">
            <a href="agregar_jugador.jsp" class="btn-add">+ REGISTRAR JUGADOR</a>
            <a href="menu.jsp" style="color: #94a3b8; text-decoration: none; font-weight: 500;">← VOLVER AL MENÚ</a>
        </div>

        <table>
            <thead>
                <tr>
                    <th>NOMBRE</th>
                    <th>POSICIÓN</th>
                    <th>EQUIPO</th>
                    <th>ACCIONES</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Connection conn = null;
                    try {
                        conn = ConexionDB.conectar();
                        if (conn == null) throw new Exception("Error de conexion");
                        
                        Statement st = conn.createStatement();
                        String sql = "SELECT j.id, j.nombre, j.posicion, e.nombre as equipo " +
                                     "FROM jugadores j " +
                                     "LEFT JOIN equipos e ON j.id_equipo = e.id ORDER BY j.nombre ASC";
                        
                        ResultSet rs = st.executeQuery(sql);
                        while(rs.next()){
                %>
                <tr>
                    <td style="color: #f1f5f9; font-weight: 500;"><%= rs.getString("nombre") %></td>
                    <td style="color: #94a3b8;"><%= rs.getString("posicion") %></td>
                    <td style="color: #d4af37; font-weight: bold;"><%= rs.getString("equipo") %></td>
                    <td>
                        <a href="eliminar_jugador.jsp?id=<%= rs.getInt("id") %>" class="btn-delete" onclick="return confirm('¿Eliminar permanentemente?')">Eliminar</a>
                    </td>
                </tr>
                <% 
                        } 
                    } catch(Exception e){ 
                %>
                <tr>
                    <td colspan="4">
                        <div class="error-msg">
                            ERROR DE ACCESO: Credenciales incorrectas o Base de Datos desconectada. [<%= e.getMessage() %>]
                        </div>
                    </td>
                </tr>
                <% } finally { if(conn != null) conn.close(); } %>
            </tbody>
        </table>
    </div>
</body>
</html>