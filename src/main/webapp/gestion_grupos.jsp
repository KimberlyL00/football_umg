<%@page import="java.sql.*"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Asegura que el servidor procese tildes correctamente
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Configuración de Grupos | Mundial 2026</title>
    <style>
        body { font-family: 'Inter', sans-serif; background: #0f172a; color: white; padding: 20px; }
        .card { background: #1e293b; padding: 30px; border-radius: 15px; max-width: 800px; margin: auto; box-shadow: 0 10px 25px rgba(0,0,0,0.3); }
        h1 { color: #38bdf8; text-align: center; font-size: 2em; border-bottom: 2px solid #334155; padding-bottom: 15px; margin-bottom: 25px; }
        .btn-add { background: #22c55e; color: white; padding: 12px 20px; text-decoration: none; border-radius: 8px; display: inline-block; font-weight: bold; margin-bottom: 20px; transition: 0.3s; }
        .btn-add:hover { background: #16a34a; transform: scale(1.02); }
        table { width: 100%; border-collapse: collapse; background: rgba(255,255,255,0.02); }
        th { background: #072357; color: #38bdf8; padding: 15px; text-transform: uppercase; font-size: 0.9em; }
        td { padding: 15px; border-bottom: 1px solid #334155; text-align: center; }
        .btn-delete { color: #ef4444; text-decoration: none; font-weight: bold; }
        .error-container { background: rgba(239, 68, 68, 0.1); border: 1px solid #ef4444; color: #ef4444; padding: 15px; border-radius: 8px; margin-top: 10px; }
    </style>
</head>
<body>
    <div class="card">
        <h1>CONFIGURACIÓN DE GRUPOS</h1>
        
        <div style="display: flex; justify-content: space-between; align-items: center;">
            <a href="agregar_grupo.jsp" class="btn-add">+ REGISTRAR NUEVO GRUPO</a>
            <a href="menu.jsp" style="color: #94a3b8; text-decoration: none;">← Volver al Menú</a>
        </div>

        <table>
            <thead>
                <tr>
                    <th>LETRA (ID)</th>
                    <th>NOMBRE DEL GRUPO</th>
                    <th>ACCIONES</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        Class.forName("org.postgresql.Driver");
                        // ¡IMPORTANTE! Cambia "admin123" por tu contraseña real de pgAdmin
                        Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/Mundial", "postgres", "admin123");
                        Statement st = conn.createStatement();
                        ResultSet rs = st.executeQuery("SELECT * FROM grupos ORDER BY id ASC");
                        
                        while(rs.next()){
                %>
                <tr>
                    <td style="font-weight: bold; color: #d4af37;"><%= rs.getString("id") %></td>
                    <td>Grupo <%= rs.getString("nombre") %></td>
                    <td>
                        <a href="eliminar_grupo.jsp?id=<%= rs.getString("id") %>" class="btn-delete" onclick="return confirm('¿Eliminar este grupo?')">Eliminar</a>
                    </td>
                </tr>
                <% 
                        } 
                        conn.close(); 
                    } catch(Exception e){ 
                %>
                <tr>
                    <td colspan="3">
                        <div class="error-container">
                            <strong>Error de conexión:</strong> Verifica que la contraseña en el código coincida con la de tu base de datos.
                        </div>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>