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
    <title>Sedes | Mundial 2026</title>
    <style>
        body { font-family: 'Inter', sans-serif; background: #0f172a; color: white; padding: 20px; }
        .card { background: #1e293b; padding: 40px; border-radius: 20px; max-width: 900px; margin: auto; box-shadow: 0 15px 35px rgba(0,0,0,0.4); }
        h1 { color: #38bdf8; text-align: center; text-transform: uppercase; letter-spacing: 2px; border-bottom: 2px solid #334155; padding-bottom: 15px; }
        .btn-add { background: #22c55e; color: white; padding: 12px 20px; text-decoration: none; border-radius: 8px; font-weight: bold; display: inline-block; margin-bottom: 25px; transition: 0.3s; }
        .btn-add:hover { background: #16a34a; transform: scale(1.02); }
        table { width: 100%; border-collapse: collapse; background: rgba(15, 23, 42, 0.5); border-radius: 12px; overflow: hidden; }
        th { background: #072357; color: #38bdf8; padding: 18px; text-transform: uppercase; font-size: 0.9em; }
        td { padding: 16px; border-bottom: 1px solid #334155; text-align: center; }
        .capacidad { color: #22c55e; font-weight: bold; }
        .btn-del { color: #ef4444; text-decoration: none; font-weight: bold; padding: 5px 10px; border: 1px solid #ef4444; border-radius: 5px; }
        .error-alert { background: rgba(239, 68, 68, 0.1); border: 1px solid #ef4444; color: #fca5a5; padding: 20px; border-radius: 10px; text-align: center; }
    </style>
</head>
<body>
    <div class="card">
        <h1>Sedes y Estadios</h1>
        
        <div style="display: flex; justify-content: space-between; align-items: center;">
            <a href="agregar_estadio.jsp" class="btn-add">+ REGISTRAR ESTADIO</a>
            <a href="menu.jsp" style="color: #94a3b8; text-decoration: none;">← Volver al Menú</a>
        </div>

        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre del Estadio</th>
                    <th>Capacidad</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Connection conn = null;
                    try {
                        // Usamos tu clase centralizada con la clave kL302006
                        conn = ConexionDB.conectar(); 
                        if (conn == null) throw new Exception("Error de credenciales");
                        
                        Statement st = conn.createStatement();
                        ResultSet rs = st.executeQuery("SELECT * FROM estadios ORDER BY id ASC");
                        
                        while(rs.next()){
                %>
                <tr>
                    <td style="color: #38bdf8;">#<%= rs.getInt("id") %></td>
                    <td style="font-weight: 500;"><%= rs.getString("nombre") %></td>
                    <td class="capacidad"><%= String.format("%,d", rs.getInt("capacidad")) %></td>
                    <td>
                        <a href="eliminar_estadio.jsp?id=<%= rs.getInt("id") %>" 
                           class="btn-del" onclick="return confirm('¿Eliminar este estadio?')">Eliminar</a>
                    </td>
                </tr>
                <% 
                        } 
                    } catch(Exception e){ 
                %>
                <tr>
                    <td colspan="4">
                        <div class="error-alert">
                            <strong>ERROR DE AUTENTICACIÓN:</strong><br>
                            El servidor de base de datos rechazó la contraseña.<br>
                            Asegúrate de que en <b>ConexionDB.java</b> la clave sea <b>kL302006</b>.
                        </div>
                    </td>
                </tr>
                <% } finally { if(conn != null) conn.close(); } %>
            </tbody>
        </table>
    </div>
</body>
</html>