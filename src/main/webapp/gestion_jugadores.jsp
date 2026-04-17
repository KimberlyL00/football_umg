<%@page import="java.util.List"%>
<%@page import="modelos.Jugador"%>
<%@page import="ClasesDAO.JugadorDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Gestión de Jugadores</title>
    <style>
        body { font-family: Arial; margin: 40px; background: #f4f4f4; }
        .form-container { background: white; padding: 20px; margin-bottom: 20px; border-radius: 8px; }
        table { width: 100%; border-collapse: collapse; background: white; }
        th, td { padding: 10px; border: 1px solid #ddd; }
        th { background: #28a745; color: white; }
        .btn-save { background: #28a745; color: white; border: none; padding: 10px; cursor: pointer; border-radius: 4px; }
    </style>
</head>
<body>
    <h1>Gestión de Jugadores</h1>

    <div class="form-container">
        <form action="gestion_jugadores.jsp" method="POST">
            <input type="number" name="id_equipo" placeholder="ID Equipo" required>
            <input type="text" name="nombre" placeholder="Nombre Jugador" required>
            <input type="text" name="posicion" placeholder="Posición">
            <input type="number" name="numero" placeholder="No. Camisola">
            <button type="submit" name="accion" value="guardar" class="btn-save">Guardar Jugador</button>
        </form>
    </div>

    <%
        JugadorDAO dao = new JugadorDAO();
        String accion = request.getParameter("accion");
        if (accion != null) {
            if (accion.equals("guardar")) {
                Jugador j = new Jugador();
                j.setId_equipo(Integer.parseInt(request.getParameter("id_equipo")));
                j.setNombre(request.getParameter("nombre"));
                j.setPosicion(request.getParameter("posicion"));
                j.setNumero_playera(Integer.parseInt(request.getParameter("numero")));
                j.setJugador_activo(true);
                dao.insertar(j);
            } else if (accion.equals("eliminar")) {
                dao.eliminar(Integer.parseInt(request.getParameter("id")));
            }
        }
        List<Jugador> lista = dao.obtenerTodos();
    %>

    <table>
        <tr>
            <th>ID</th>
            <th>Equipo</th>
            <th>Nombre</th>
            <th>Acciones</th>
        </tr>
        <% for (Jugador j : lista) { %>
        <tr>
            <td><%= j.getId() %></td>
            <td><%= j.getId_equipo() %></td>
            <td><%= j.getNombre() %></td>
            <td>
                <a href="gestion_jugadores.jsp?accion=eliminar&id=<%= j.getId() %>" onclick="return confirm('¿Eliminar?')">Eliminar</a>
            </td>
        </tr>
        <% } %>
    </table>
    <br><a href="index.jsp">Volver al Menú</a>
</body>
</html>