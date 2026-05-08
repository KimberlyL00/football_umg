<%@page import="ClasesDAO.PartidoDAO"%>
<%@page import="modelos.Partido"%>
<%@page import="conexion.ConexionDB"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");

    String fechaHora = request.getParameter("fecha_hora");
    String idEstadioStr = request.getParameter("id_estadio");
    String idFaseStr = request.getParameter("id_fase");
    String idLocalStr = request.getParameter("id_equipo_local");
    String idVisitanteStr = request.getParameter("id_equipo_visitante");

    if (fechaHora != null && idEstadioStr != null && idFaseStr != null && idLocalStr != null && idVisitanteStr != null) {
        Partido p = new Partido();
        p.setFecha_hora(java.sql.Timestamp.valueOf(fechaHora.replace("T", " ") + ":00"));
        p.setId_estadio(Integer.parseInt(idEstadioStr));
        p.setId_fase(Integer.parseInt(idFaseStr));
        p.setId_equipo_local(Integer.parseInt(idLocalStr));
        p.setId_equipo_visitante(Integer.parseInt(idVisitanteStr));
        p.setGoles_local(0);
        p.setGoles_visitante(0);
        new PartidoDAO().insertar(p);
        response.sendRedirect("gestion_partidos.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Agregar Partido | Mundial 2026</title>
    <style>
        :root { --bg: #0f172a; --card: #1e293b; --accent: #38bdf8; --green: #22c55e; }
        body { font-family: 'Inter', sans-serif; background: var(--bg); color: white; padding: 40px; margin: 0; display: flex; justify-content: center; align-items: center; min-height: 100vh; }
        .container { background: var(--card); padding: 35px; border-radius: 20px; width: 100%; max-width: 500px; }
        h1 { color: var(--accent); text-align: center; margin-bottom: 30px; font-size: 1.5rem; text-transform: uppercase; }
        label { display: block; margin-bottom: 6px; color: #94a3b8; font-size: 0.9em; }
        input[type="datetime-local"], select {
            width: 100%; padding: 12px; border-radius: 8px;
            border: 1px solid #334155; background: #0f172a;
            color: white; font-size: 1em; box-sizing: border-box; margin-bottom: 20px;
        }
        input:focus, select:focus { outline: none; border-color: var(--accent); }
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
    <h1>Agregar Partido</h1>
    <form method="post" action="agregar_partido.jsp">
        <label>Fecha y Hora</label>
        <input type="datetime-local" name="fecha_hora" required />

        <label>Estadio</label>
        <select name="id_estadio" required>
            <option value="">-- Selecciona un Estadio --</option>
            <%
                Connection conn = null;
                try {
                    conn = ConexionDB.conectar();
                    PreparedStatement ps = conn.prepareStatement("SELECT id_estadio, nombre, ciudad FROM estadio ORDER BY nombre ASC");
                    ResultSet rs = ps.executeQuery();
                    while (rs.next()) {
            %>
            <option value="<%= rs.getInt("id_estadio") %>"><%= rs.getString("nombre") %> - <%= rs.getString("ciudad") %></option>
            <%
                    }
                } catch (Exception ex) {
                    out.println("<option>Error al cargar estadios</option>");
                } finally {
                    if (conn != null) conn.close();
                }
            %>
        </select>

        <label>Fase</label>
        <select name="id_fase" required>
            <option value="">-- Selecciona una Fase --</option>
            <%
                Connection conn2 = null;
                try {
                    conn2 = ConexionDB.conectar();
                    PreparedStatement ps2 = conn2.prepareStatement("SELECT id_fase, descripcion FROM fase ORDER BY id_fase ASC");
                    ResultSet rs2 = ps2.executeQuery();
                    while (rs2.next()) {
            %>
            <option value="<%= rs2.getInt("id_fase") %>"><%= rs2.getString("descripcion") %></option>
            <%
                    }
                } catch (Exception ex) {
                    out.println("<option>Error al cargar fases</option>");
                } finally {
                    if (conn2 != null) conn2.close();
                }
            %>
        </select>

        <label>Equipo Local</label>
        <select name="id_equipo_local" required>
            <option value="">-- Selecciona Equipo Local --</option>
            <%
                Connection conn3 = null;
                try {
                    conn3 = ConexionDB.conectar();
                    PreparedStatement ps3 = conn3.prepareStatement("SELECT id_equipo, nombre_equipo FROM equipo ORDER BY nombre_equipo ASC");
                    ResultSet rs3 = ps3.executeQuery();
                    while (rs3.next()) {
            %>
            <option value="<%= rs3.getInt("id_equipo") %>"><%= rs3.getString("nombre_equipo") %></option>
            <%
                    }
                } catch (Exception ex) {
                    out.println("<option>Error al cargar equipos</option>");
                } finally {
                    if (conn3 != null) conn3.close();
                }
            %>
        </select>

        <label>Equipo Visitante</label>
        <select name="id_equipo_visitante" required>
            <option value="">-- Selecciona Equipo Visitante --</option>
            <%
                Connection conn4 = null;
                try {
                    conn4 = ConexionDB.conectar();
                    PreparedStatement ps4 = conn4.prepareStatement("SELECT id_equipo, nombre_equipo FROM equipo ORDER BY nombre_equipo ASC");
                    ResultSet rs4 = ps4.executeQuery();
                    while (rs4.next()) {
            %>
            <option value="<%= rs4.getInt("id_equipo") %>"><%= rs4.getString("nombre_equipo") %></option>
            <%
                    }
                } catch (Exception ex) {
                    out.println("<option>Error al cargar equipos</option>");
                } finally {
                    if (conn4 != null) conn4.close();
                }
            %>
        </select>

        <input type="submit" class="btn-submit" value="Guardar Partido" />
    </form>
    <a href="gestion_partidos.jsp" class="back">← Volver</a>
</div>
</body>
</html>