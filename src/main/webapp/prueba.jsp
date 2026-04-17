<%@page import="java.util.List"%>
<%@page import="modelos.Equipo"%>
<%@page import="ClasesDAO.EquipoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Prueba de Conexión UMG</title>
        <style>
            body { font-family: sans-serif; background-color: #f4f7f6; padding: 20px; }
            .card { background: white; padding: 20px; border-radius: 10px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
            table { width: 100%; border-collapse: collapse; margin-top: 20px; }
            th, td { padding: 10px; border: 1px solid #ddd; text-align: left; }
            th { background-color: #072357; color: white; }
            .success { color: #155724; background-color: #d4edda; padding: 10px; border-radius: 5px; }
        </style>
    </head>
    <body>
        <div class="card">
            <h1>Estado de la Base de Datos - Mundial</h1>
            <%
                try {
                    EquipoDAO dao = new EquipoDAO();
                    List<Equipo> lista = dao.obtenerTodos();
                    if (lista != null && !lista.isEmpty()) {
            %>
                <div class="success">✅ Conexión Exitosa. Se encontraron <%= lista.size() %> equipos.</div>
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nombre</th>
                            <th>País</th>
                            <th>Grupo</th>
                            <th>Entrenador</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Equipo e : lista) { %>
                        <tr>
                            <td><%= e.getId() %></td>
                            <td><%= e.getNombre() %></td>
                            <td><%= e.getPais() %></td>
                            <td><%= e.getGrupo() %></td>
                            <td><%= e.getEntrenador() %></td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            <%
                    } else {
            %>
                <p>Conectado, pero no hay datos. Revisa los INSERTS en pgAdmin.</p>
            <%
                    }
                } catch (Exception ex) {
            %>
                <p style="color:red;">Error: <%= ex.getMessage() %></p>
            <% } %>
        </div>
    </body>
</html>