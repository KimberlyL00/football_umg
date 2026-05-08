<%@page import="ClasesDAO.JugadorDAO"%>
<%@page import="modelos.Jugador"%>
<%@page import="conexion.ConexionDB"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");

    String nombre = request.getParameter("nombre_completo");
    String camisetaStr = request.getParameter("numero_camiseta");
    String idEquipoStr = request.getParameter("id_equipo");
    String idPosicionStr = request.getParameter("id_posicion");

    if (nombre != null && !nombre.trim().isEmpty() && camisetaStr != null && idEquipoStr != null && idPosicionStr != null) {
        Jugador j = new Jugador();
        j.setNombre_completo(nombre.trim());
        j.setNumero_camiseta(Integer.parseInt(camisetaStr));
        j.setId_equipo(Integer.parseInt(idEquipoStr));
        j.setId_posicion(Integer.parseInt(idPosicionStr));
        new JugadorDAO().insertar(j);
        response.sendRedirect("gestion_jugadores.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Agregar Jugador | Mundial 2026</title>
    <style>
        :root { --bg: #0f172a; --card: #1e293b; --accent: #38bdf8; --green: #22c55e; }
        body { font-family: 'Inter', sans-serif; background: var(--bg); color: white; padding: 40px; margin: 0; display: flex; justify-content: center; align-items: center; min-height: 100vh; }
        .container { background: var(--card); padding: 35px; border-radius: 20px; width: 100%; max-width: 450px; }
        h1 { color: var(--accent); text-align: center; margin-bottom: 30px; font-size: 1.5rem; text-transform: uppercase; }
        label { display: block; margin-bottom: 6px; color: #94a3b8; font-size: 0.9em; }
        input[type="text"], input[type="number"], select {
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
    <h1>Agregar Jugador</h1>
    <form method="post" action="agregar_jugador.jsp">
        <label>Nombre Completo</label>
        <input type="text" name="nombre_completo" placeholder="Ej: Lionel Messi" required />

        <label>Numero de Camiseta</label>
        <input type="number" name="numero_camiseta" placeholder="Ej: 10" min="1" max="99" required />

        <label>Equipo</label>
        <select name="id_equipo" required>
            <option value="">-- Selecciona un Equipo --</option>
            <%
                Connection conn = null;
                try {
                    conn = ConexionDB.conectar();
                    PreparedStatement ps = conn.prepareStatement("SELECT id_equipo, nombre_equipo FROM equipo ORDER BY nombre_equipo ASC");
                    ResultSet rs = ps.executeQuery();
                    while (rs.next()) {
            %>
            <option value="<%= rs.getInt("id_equipo") %>"><%= rs.getString("nombre_equipo") %></option>
            <%
                    }
                } catch (Exception ex) {
                    out.println("<option>Error al cargar equipos</option>");
                } finally {
                    if (conn != null) conn.close();
                }
            %>
        </select>

        <label>Posicion</label>
        <select name="id_posicion" required>
            <option value="">-- Selecciona una Posicion --</option>
            <%
                Connection conn2 = null;
                try {
                    conn2 = ConexionDB.conectar();
                    PreparedStatement ps2 = conn2.prepareStatement("SELECT id_posicion, descripcion FROM posicion ORDER BY descripcion ASC");
                    ResultSet rs2 = ps2.executeQuery();
                    while (rs2.next()) {
            %>
            <option value="<%= rs2.getInt("id_posicion") %>"><%= rs2.getString("descripcion") %></option>
            <%
                    }
                } catch (Exception ex) {
                    out.println("<option>Error al cargar posiciones</option>");
                } finally {
                    if (conn2 != null) conn2.close();
                }
            %>
        </select>

        <input type="submit" class="btn-submit" value="Guardar Jugador" />
    </form>
    <a href="gestion_jugadores.jsp" class="back">← Volver</a>
</div>
</body>
</html>