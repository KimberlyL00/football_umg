<%@page import="java.util.List"%>
<%@page import="modelos.Estadio"%>
<%@page import="ClasesDAO.EstadioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Gestión de Estadios</title>
    <style>
        body { font-family: Arial; margin: 40px; background: #f4f4f4; }
        .form-container { background: white; padding: 20px; margin-bottom: 20px; }
        table { width: 100%; border-collapse: collapse; background: white; }
        th, td { padding: 10px; border: 1px solid #ddd; }
        th { background: #6c757d; color: white; }
    </style>
</head>
<body>
    <h1>Gestión de Estadios</h1>
    <div class="form-container">
        <form action="gestion_estadios.jsp" method="POST">
            <input type="text" name="nombre" placeholder="Nombre Estadio" required>
            <input type="text" name="ciudad" placeholder="Ciudad" required>
            <input type="text" name="pais" placeholder="País" required>
            <input type="number" name="capacidad" placeholder="Capacidad">
            <button type="submit" name="accion" value="guardar">Guardar Estadio</button>
        </form>
    </div>

    <%
        EstadioDAO dao = new EstadioDAO();
        String acc = request.getParameter("accion");
        if (acc != null) {
            if (acc.equals("guardar")) {
                Estadio est = new Estadio();
                est.setNombre(request.getParameter("nombre"));
                est.setCiudad(request.getParameter("ciudad"));
                est.setPais(request.getParameter("pais"));
                est.setCapacidad(Integer.parseInt(request.getParameter("capacidad")));
                dao.insertar(est);
            } else if (acc.equals("eliminar")) {
                dao.eliminar(Integer.parseInt(request.getParameter("id")));
            }
        }
        List<Estadio> lista = dao.obtenerTodos();
    %>

    <table>
        <tr>
            <th>Nombre</th>
            <th>Ciudad</th>
            <th>Capacidad</th>
            <th>Acciones</th>
        </tr>
        <% for (Estadio e : lista) { %>
        <tr>
            <td><%= e.getNombre() %></td>
            <td><%= e.getCiudad() %></td>
            <td><%= e.getCapacidad() %></td>
            <td>
                <a href="gestion_estadios.jsp?accion=eliminar&id=<%= e.getId() %>">Eliminar</a>
            </td>
        </tr>
        <% } %>
    </table>
    <br><a href="index.jsp">Volver al Menú</a>
</body>
</html>
