<%@page import="java.util.List"%>
<%@page import="modelos.Jugador"%>
<%@page import="ClasesDAO.JugadorDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Listado de Jugadores - UMG</title>
        <style>
            body { font-family: sans-serif; background-color: #f4f7f6; padding: 20px; }
            .card { background: white; padding: 20px; border-radius: 10px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
            table { width: 100%; border-collapse: collapse; margin-top: 20px; }
            th, td { padding: 10px; border: 1px solid #ddd; text-align: left; }
            th { background-color: #28a745; color: white; } /* Verde para diferenciar de equipos */
            .active { color: green; font-weight: bold; }
            .inactive { color: red; }
        </style>
    </head>
    <body>
        <div class="card">
            <h1>Plantilla de Jugadores</h1>
            <a href="prueba.jsp">ver Equipos</a>
            <%
                try {
                    JugadorDAO dao = new JugadorDAO();
                    List<Jugador> lista = dao.obtenerTodos();
                    if (lista != null && !lista.isEmpty()) {
            %>
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>ID Equipo</th>
                            <th>Nombre</th>
                            <th>Posición</th>
                            <th>No. Playera</th>
                            <th>Estado</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Jugador j : lista) { %>
                        <tr>
                            <td><%= j.getId() %></td>
                            <td><%= j.getId_equipo() %></td>
                            <td><%= j.getNombre() %></td>
                            <td><%= j.getPosicion() %></td>
                            <td><%= j.getNumero_playera() %></td>
                            <td class="<%= j.isJugador_activo() ? "active" : "inactive" %>">
                                <%= j.isJugador_activo() ? "Activo" : "Inactivo" %>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            <%
                    } else {
            %>
                <p>No hay jugadores registrados. Agrega algunos en pgAdmin.</p>
            <%
                    }
                } catch (Exception ex) {
            %>
                <p style="color:red;">Error: <%= ex.getMessage() %></p>
            <% } %>
        </div>
    </body>
</html>