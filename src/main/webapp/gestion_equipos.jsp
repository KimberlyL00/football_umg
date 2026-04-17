<%@page import="java.io.*, java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String ruta = "C:\\Users\\leiva\\Desktop\\Universidad\\proyecto\\equipo.txt";
    String accion = request.getParameter("accion");

    // --- LÓGICA PARA AGREGAR ---
    if ("agregar".equals(accion)) {
        String nuevoRegistro = request.getParameter("id") + "," + 
                               request.getParameter("nombre") + "," + 
                               request.getParameter("pais") + "," + 
                               request.getParameter("grupo") + "," + 
                               request.getParameter("entrenador");
        try (PrintWriter outFiles = new PrintWriter(new BufferedWriter(new FileWriter(ruta, true)))) {
            outFiles.println(nuevoRegistro);
        } catch (IOException e) { e.printStackTrace(); }
    }

    // --- LÓGICA PARA ELIMINAR ---
    if ("eliminar".equals(accion)) {
        String idEliminar = request.getParameter("id");
        List<String> lineasRestantes = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(ruta))) {
            String linea;
            while ((linea = br.readLine()) != null) {
                if (!linea.startsWith(idEliminar + ",")) {
                    lineasRestantes.add(linea);
                }
            }
        } catch (IOException e) { e.printStackTrace(); }

        try (PrintWriter pw = new PrintWriter(new FileWriter(ruta))) {
            for (String l : lineasRestantes) pw.println(l);
        } catch (IOException e) { e.printStackTrace(); }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Equipos - Mundial 2026</title>
    <style>
        body { font-family: sans-serif; margin: 30px; background: #f0f2f5; }
        table { width: 100%; border-collapse: collapse; background: white; }
        th, td { padding: 10px; border: 1px solid #ccc; text-align: left; }
        th { background: #072357; color: white; }
        .form-add { background: white; padding: 20px; margin-bottom: 20px; border-radius: 8px; }
        .btn-del { color: red; text-decoration: none; font-weight: bold; }
    </style>
</head>
<body>
    <h1>⚽ Gestión de Equipos (Archivo TXT)</h1>

    <div class="form-add">
        <h3>Agregar Nuevo Equipo</h3>
        <form method="POST">
            <input type="text" name="id" placeholder="ID" required style="width: 40px;">
            <input type="text" name="nombre" placeholder="Nombre" required>
            <input type="text" name="pais" placeholder="País" required>
            <input type="text" name="grupo" placeholder="Grupo" maxlength="1" style="width: 50px;">
            <input type="text" name="entrenador" placeholder="Entrenador">
            <button type="submit" name="accion" value="agregar">Guardar Equipo</button>
        </form>
    </div>

    <table>
        <tr><th>ID</th><th>Nombre</th><th>País</th><th>Grupo</th><th>Entrenador</th><th>Acciones</th></tr>
        <%
            File arch = new File(ruta);
            if (arch.exists()) {
                try (BufferedReader br = new BufferedReader(new FileReader(arch))) {
                    String linea;
                    while ((linea = br.readLine()) != null) {
                        String[] d = linea.split(",");
                        if (d.length >= 5) {
        %>
        <tr>
            <td><%= d[0] %></td><td><%= d[1] %></td><td><%= d[2] %></td><td><%= d[3] %></td><td><%= d[4] %></td>
            <td><a href="?accion=eliminar&id=<%= d[0] %>" class="btn-del" onclick="return confirm('¿Borrar?')">Eliminar</a></td>
        </tr>
        <% } } } catch (Exception e) {} } %>
    </table>
    <br><a href="menu.jsp">Volver al Menú</a>
</body>
</html>