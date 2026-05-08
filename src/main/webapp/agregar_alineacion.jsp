<%@page import="ClasesDAO.AlineacionDAO"%>
<%@page import="modelos.Alineacion"%>
<%@page import="conexion.ConexionDB"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");

    String idPartidoStr = request.getParameter("id_partido");
    String idJugadorStr = request.getParameter("id_jugador");
    String esTitularStr = request.getParameter("es_titular");
    String minutosStr = request.getParameter("minutos_jugados");

    if (idPartidoStr != null && idJugadorStr != null && esTitularStr != null && minutosStr != null) {
        Alineacion a = new Alineacion();
        a.setId_partido(Integer.parseInt(idPartidoStr));
        a.setId_jugador(Integer.parseInt(idJugadorStr));
        a.setEs_titular(esTitularStr.equals("true"));
        a.setMinutos_jugados(Integer.parseInt(minutosStr));
        new AlineacionDAO().insertar(a);
        response.sendRedirect("gestion_alineaciones.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registrar Alineacion | Mundial 2026</title>
    <style>
        :root { --bg: #0f172a; --card: #1e293b; --accent: #38bdf8; --green: #22c55e; }
        body { font-family: 'Inter', sans-serif; background: var(--bg); color: white; padding: 40px; margin: 0; display: flex; justify-content: center; align-items: center; min-height: 100vh; }
        .container { background: var(--card); padding: 35px; border-radius: 20px; width: 100%; max-width: 450px; }
        h1 { color: var(--accent); text-align: center; margin-bottom: 30px; font-size: 1.5rem; text-transform: uppercase; }
        label { display: block; margin-bottom: 6px; color: #94a3b8; font-size: 0.9em; }
        input[type="number"], select {
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
    <h1>Registrar Alineacion</h1>
    <form method="post" action="agregar_alineacion.jsp">
        <label>Partido</label>
        <select name="id_partido" required>
            <option value="">-- Selecciona un Partido --</option>
            <%
                Connection conn = null;
                try {
                    conn = ConexionDB.conectar();
                    PreparedStatement ps = conn.prepareStatement(
                        "SELECT p.id_partido, el.nombre_equipo as local, ev.nombre_equipo as visitante " +
                        "FROM partido p " +
                        "JOIN equipo el ON p.id_equipo_local = el.id_equipo " +
                        "JOIN equipo ev ON p.id_equipo_visitante = ev.id_equipo " +
                        "ORDER BY p.id_partido ASC"
                    );
                    ResultSet rs = ps.executeQuery();
                    while (rs.next()) {
            %>
            <option value="<%= rs.getInt("id_partido") %>">#<%= rs.getInt("id_partido") %> <%= rs.getString("local") %> vs <%= rs.getString("visitante") %></option>
            <%
                    }
                } catch (Exception ex) {
                    out.println("<option>Error al cargar partidos</option>");
                } finally {
                    if (conn != null) conn.close();
                }
            %>
        </select>

        <label>Jugador</label>
        <select name="id_jugador" required>
            <option value="">-- Selecciona un Jugador --</option>
            <%
                Connection conn2 = null;
                try {
                    conn2 = ConexionDB.conectar();
                    PreparedStatement ps2 = conn2.prepareStatement(
                        "SELECT j.id_jugador, j.nombre_completo, e.nombre_equipo " +
                        "FROM jugador j JOIN equipo e ON j.id_equipo = e.id_equipo " +
                        "ORDER BY e.nombre_equipo ASC, j.nombre_completo ASC"
                    );
                    ResultSet rs2 = ps2.executeQuery();
                    while (rs2.next()) {
            %>
            <option value="<%= rs2.getInt("id_jugador") %>"><%= rs2.getString("nombre_completo") %> (<%= rs2.getString("nombre_equipo") %>)</option>
            <%
                    }
                } catch (Exception ex) {
                    out.println("<option>Error al cargar jugadores</option>");
                } finally {
                    if (conn2 != null) conn2.close();
                }
            %>
        </select>

        <label>Condicion</label>
        <select name="es_titular" required>
            <option value="">-- Selecciona --</option>
            <option value="true">Titular</option>
            <option value="false">Suplente</option>
        </select>

        <label>Minutos Jugados</label>
        <input type="number" name="minutos_jugados" placeholder="Ej: 90" min="0" max="120" required />

        <input type="submit" class="btn-submit" value="Registrar Alineacion" />
    </form>
    <a href="gestion_alineaciones.jsp" class="back">← Volver</a>
</div>
</body>
</html>