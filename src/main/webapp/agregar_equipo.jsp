<%@page import="ClasesDAO.EquipoDAO"%>
<%@page import="modelos.Equipo"%>
<%@page import="conexion.ConexionDB"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");

    String nombre = request.getParameter("nombre_equipo");
    String idPaisStr = request.getParameter("id_pais");
    String grupo = request.getParameter("grupo");

    if (nombre != null && !nombre.trim().isEmpty() && idPaisStr != null && grupo != null && !grupo.trim().isEmpty()) {
        Equipo e = new Equipo();
        e.setNombre_equipo(nombre.trim());
        e.setId_pais(Integer.parseInt(idPaisStr));
        e.setGrupo(grupo.trim().charAt(0));
        new EquipoDAO().insertar(e);
        response.sendRedirect("gestion_equipos.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Agregar Equipo | Mundial 2026</title>
    <style>
        :root { --bg: #0f172a; --card: #1e293b; --accent: #38bdf8; --green: #22c55e; }
        body { font-family: 'Inter', sans-serif; background: var(--bg); color: white; padding: 40px; margin: 0; display: flex; justify-content: center; align-items: center; min-height: 100vh; }
        .container { background: var(--card); padding: 35px; border-radius: 20px; width: 100%; max-width: 450px; }
        h1 { color: var(--accent); text-align: center; margin-bottom: 30px; font-size: 1.5rem; text-transform: uppercase; }
        label { display: block; margin-bottom: 6px; color: #94a3b8; font-size: 0.9em; }
        input[type="text"], select {
            width: 100%; padding: 12px; border-radius: 8px;
            border: 1px solid #334155; background: #0f172a;
            color: white; font-size: 1em; box-sizing: border-box; margin-bottom: 20px;
        }
        input[type="text"]:focus, select:focus { outline: none; border-color: var(--accent); }
        .btn-submit {
            width: 100%; padding: 14px; background: var(--green);
            color: white; border: none; border-radius: 8px;
            font-size: 1em; font-weight: bold; cursor: pointer;
        }
        .btn-submit:hover { background: #16a34a; }
        .back { display: block; text-align: center; margin-top: 15px; color: #94a3b8; text-decoration: none; }
    </style>
</head>
<body>
<div class="container">
    <h1>Agregar Equipo</h1>
    <form method="post" action="agregar_equipo.jsp">
        <label>Nombre del Equipo</label>
        <input type="text" name="nombre_equipo" placeholder="Ej: Mexico" required />

        <label>Pais</label>
        <select name="id_pais" required>
            <option value="">-- Selecciona un Pais --</option>
            <%
                Connection conn = null;
                try {
                    conn = ConexionDB.conectar();
                    PreparedStatement ps = conn.prepareStatement("SELECT id_pais, nombre FROM pais ORDER BY nombre ASC");
                    ResultSet rs = ps.executeQuery();
                    while (rs.next()) {
            %>
            <option value="<%= rs.getInt("id_pais") %>"><%= rs.getString("nombre") %></option>
            <%
                    }
                } catch (Exception ex) {
                    out.println("<option>Error al cargar paises</option>");
                } finally {
                    if (conn != null) conn.close();
                }
            %>
        </select>

        <label>Grupo</label>
        <input type="text" name="grupo" placeholder="Ej: A, B, C..." maxlength="1" required />

        <input type="submit" class="btn-submit" value="Guardar Equipo" />
    </form>
    <a href="gestion_equipos.jsp" class="back">← Volver</a>
</div>
</body>
</html>