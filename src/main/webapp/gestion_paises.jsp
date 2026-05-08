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
    <title>Paises | Mundial 2026</title>
    <style>
        :root { --bg: #0f172a; --card: #1e293b; --accent: #38bdf8; --red: #ef4444; --green: #22c55e; }
        body { font-family: 'Inter', sans-serif; background: var(--bg); color: white; padding: 40px; margin: 0; }
        .container { max-width: 800px; margin: auto; background: var(--card); padding: 30px; border-radius: 20px; }
        h1 { text-align: center; color: var(--accent); text-transform: uppercase; letter-spacing: 2px; border-bottom: 2px solid #334155; padding-bottom: 15px; }
        .nav-bar { display: flex; justify-content: space-between; align-items: center; margin-bottom: 25px; }
        .btn-add { background: var(--green); color: white; padding: 10px 20px; text-decoration: none; border-radius: 8px; font-weight: bold; }
        table { width: 100%; border-collapse: collapse; }
        th { background: #072357; color: var(--accent); padding: 14px; text-transform: uppercase; font-size: 0.85em; }
        td { padding: 14px; border-bottom: 1px solid #334155; text-align: center; }
        .btn-del { color: var(--red); text-decoration: none; border: 1px solid var(--red); padding: 5px 12px; border-radius: 6px; font-weight: bold; }
        .error-msg { background: rgba(239,68,68,0.1); border: 1px solid var(--red); color: #fca5a5; padding: 20px; border-radius: 10px; text-align: center; }
    </style>
</head>
<body>
<div class="container">
    <h1>Paises</h1>
    <div class="nav-bar">
        <a href="agregar_pais.jsp" class="btn-add">+ Agregar Pais</a>
        <a href="menu.jsp" style="color: #94a3b8; text-decoration: none;">← Volver al Menu</a>
    </div>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <%
                Connection conn = null;
                try {
                    conn = ConexionDB.conectar();
                    PreparedStatement ps = conn.prepareStatement("SELECT id_pais, nombre FROM pais ORDER BY nombre ASC");
                    ResultSet rs = ps.executeQuery();
                    while (rs.next()) {
            %>
            <tr>
                <td style="color: var(--accent);">#<%= rs.getInt("id_pais") %></td>
                <td><%= rs.getString("nombre") %></td>
                <td>
                    <a href="eliminar_pais.jsp?id=<%= rs.getInt("id_pais") %>" class="btn-del"
                       onclick="return confirm('¿Eliminar este pais?')">Eliminar</a>
                </td>
            </tr>
            <%
                    }
                } catch (Exception e) {
            %>
            <tr>
                <td colspan="3">
                    <div class="error-msg">Error al cargar paises: <%= e.getMessage() %></div>
                </td>
            </tr>
            <% } finally { if (conn != null) conn.close(); } %>
        </tbody>
    </table>
</div>
</body>
</html>