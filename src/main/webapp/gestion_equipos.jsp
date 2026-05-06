<%@page import="conexion.ConexionDB"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Selecciones | Mundial 2026</title>
    <style>
        :root { --bg: #0f172a; --card: #1e293b; --accent: #38bdf8; --green: #22c55e; --red: #ef4444; }
        body { font-family: 'Inter', sans-serif; background: var(--bg); color: white; padding: 40px; margin: 0; }
        .container { max-width: 1000px; margin: auto; background: var(--card); padding: 30px; border-radius: 20px; box-shadow: 0 20px 50px rgba(0,0,0,0.4); }
        h1 { text-align: center; color: var(--accent); text-transform: uppercase; letter-spacing: 2px; border-bottom: 2px solid #334155; padding-bottom: 20px; }
        .nav-bar { display: flex; justify-content: space-between; align-items: center; margin-bottom: 30px; }
        .btn-add { background: var(--green); color: white; padding: 12px 24px; text-decoration: none; border-radius: 10px; font-weight: bold; transition: 0.3s; }
        .btn-add:hover { transform: translateY(-3px); box-shadow: 0 5px 15px rgba(34, 197, 94, 0.3); }
        table { width: 100%; border-collapse: separate; border-spacing: 0 8px; }
        th { background: #072357; color: var(--accent); padding: 15px; text-transform: uppercase; font-size: 0.8em; }
        td { background: rgba(255,255,255,0.03); padding: 15px; text-align: center; border-top: 1px solid #334155; border-bottom: 1px solid #334155; }
        .btn-del { color: var(--red); text-decoration: none; border: 1px solid var(--red); padding: 6px 12px; border-radius: 6px; font-weight: bold; }
        .error-box { background: rgba(239, 68, 68, 0.1); border: 1px solid var(--red); color: #fca5a5; padding: 20px; border-radius: 12px; text-align: center; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Selecciones Nacionales</h1>
        <div class="nav-bar">
            <a href="agregar_equipo.jsp" class="btn-add">+ REGISTRAR EQUIPO</a>
            <a href="menu.jsp" style="color: #94a3b8; text-decoration: none;">← Volver</a>
        </div>

        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre de Seleccion</th>
                    <th>Grupo</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        Connection conn = ConexionDB.conectar();
                        if(conn != null) {
                            Statement st = conn.createStatement();
                            ResultSet rs = st.executeQuery("SELECT * FROM equipos ORDER BY id ASC");
                            while(rs.next()) {
                %>
                <tr>
                    <td style="color: var(--accent); font-weight: bold;">#<%= rs.getInt("id") %></td>
                    <td><%= rs.getString("nombre") %></td>
                    <td><span style="background: #0ea5e9; padding: 4px 10px; border-radius: 15px; font-size: 0.9em;">Grupo <%= rs.getString("id_grupo") %></span></td>
                    <td>
                        <a href="eliminar_equipo.jsp?id=<%= rs.getInt("id") %>" class="btn-del" onclick="return confirm('¿Eliminar?')">Eliminar</a>
                    </td>
                </tr>
                <% 
                            }
                            conn.close();
                        } else { throw new Exception("Error de conexion"); }
                    } catch(Exception e) { 
                %>
                <tr>
                    <td colspan="4">
                        <div class="error-box">
                            <b>ERROR:</b> Los datos no se cargaron. Asegurate de que el proceso de importacion en pgAdmin haya terminado con exito.
                        </div>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>