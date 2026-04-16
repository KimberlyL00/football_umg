<%@page import="java.util.List"%>
<%@page import="modelos.Equipo"%>
<%@page import="ClasesDAO.EquipoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Panel de Control - Mundial</title>
        <style>
            body { font-family: sans-serif; background-color: #f4f7f6; margin: 40px; }
            .container { background-color: white; padding: 20px; border-radius: 8px; border: 1px solid #ccc; }
            h1 { color: #2c3e50; border-bottom: 2px solid #3498db; padding-bottom: 10px; }
            table { width: 100%; border-collapse: collapse; margin-top: 20px; }
            th, td { padding: 12px; border: 1px solid #ddd; text-align: left; }
            th { background-color: #3498db; color: white; }
            tr:nth-child(even) { background-color: #f9f9f9; }
            .status { font-weight: bold; padding: 10px; border-radius: 4px; margin-bottom: 20px; }
            .success { background-color: #d4edda; color: #155724; border: 1px solid #c3e6cb; }
            .error { background-color: #f8d7da; color: #721c24; border: 1px solid #f5c6cb; }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>World Cup Logistics - Panel de Prueba</h1>
            
            <%
                try {
                    /* Instancia del objeto de acceso a datos */
                    EquipoDAO dao = new EquipoDAO();
                    
                    /* Recuperacion de la lista de equipos mediante el metodo del DAO */
                    List<Equipo> lista = dao.obtenerTodos();
                    
                    if (lista != null && !lista.isEmpty()) {
            %>
                <div class="status success">Conexion establecida. Registros encontrados: <%= lista.size() %></div>
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nombre del Equipo</th>
                            <th>Pais</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            /* Iteracion sobre la lista de objetos de tipo Equipo */
                            for (Equipo e : lista) { 
                        %>
                        <tr>
                            <td><%= e.getId() %></td>
                            <td><%= e.getNombre() %></td>
                            <td><%= e.getPais() %></td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            <%
                    } else {
            %>
                <div class="status error">Conectado a la base de datos, pero la tabla equipos no contiene registros.</div>
            <%
                    }
                } catch (Exception ex) {
            %>
                <div class="status error">Error en la ejecucion: <%= ex.getMessage() %></div>
                <p>Verificar que el metodo obtenerTodos() este implementado en EquipoDAO.java</p>
            <%
                }
            %>
        </div>
    </body>
</html>
