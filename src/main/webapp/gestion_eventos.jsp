<%@page import="java.io.*, java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Ruta exacta que me pasaste
    String rutaE = "C:\\Users\\leiva\\Desktop\\Universidad\\proyecto\\evento.txt";
    String accionE = request.getParameter("accion");

    // --- LÓGICA PARA AGREGAR EVENTO ---
    if ("agregar".equals(accionE)) {
        String nuevoEv = request.getParameter("id") + "," + 
                         request.getParameter("id_partido") + "," + 
                         request.getParameter("id_jugador") + "," + 
                         request.getParameter("tipo") + "," + 
                         request.getParameter("minuto");
        
        try (PrintWriter outF = new PrintWriter(new BufferedWriter(new FileWriter(rutaE, true)))) {
            outF.println(nuevoEv);
        } catch (IOException e) { 
            e.printStackTrace(); 
        }
    }

    // --- LÓGICA PARA ELIMINAR EVENTO ---
    if ("eliminar".equals(accionE)) {
        String idDel = request.getParameter("id");
        List<String> listaE = new ArrayList<>();
        
        try (BufferedReader br = new BufferedReader(new FileReader(rutaE))) {
            String l;
            while ((l = br.readLine()) != null) {
                // Si la línea no empieza con el ID que queremos borrar, la guardamos
                if (!l.startsWith(idDel + ",")) {
                    listaE.add(l);
                }
            }
        } catch (IOException e) { e.printStackTrace(); }

        // Sobreescribimos el archivo con la lista filtrada
        try (PrintWriter pw = new PrintWriter(new FileWriter(rutaE))) {
            for (String s : listaE) {
                pw.println(s);
            }
        } catch (IOException e) { e.printStackTrace(); }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Eventos - Mundial 2026</title>
    <style>
        body { font-family: 'Segoe UI', Arial, sans-serif; margin: 30px; background-color: #fffafa; }
        h1 { color: #b91d1d; text-align: center; }
        .container { background: white; padding: 20px; border-radius: 10px; box-shadow: 0 4px 10px rgba(0,0,0,0.1); }
        .form-box { background: #fef2f2; padding: 20px; border-radius: 8px; margin-bottom: 20px; border: 1px solid #fee2e2; }
        table { width: 100%; border-collapse: collapse; }
        th, td { padding: 12px; border: 1px solid #fca5a5; text-align: center; }
        th { background-color: #b91d1d; color: white; }
        tr:nth-child(even) { background-color: #fff5f5; }
        .btn-del { color: #b91d1d; text-decoration: none; font-weight: bold; }
        input { padding: 8px; margin-right: 5px; border: 1px solid #ccc; border-radius: 4px; }
        button { background: #b91d1d; color: white; border: none; padding: 8px 15px; border-radius: 4px; cursor: pointer; }
        button:hover { background: #991b1b; }
    </style>
</head>
<body>

<div class="container">
    <h1>📢 Registro de Eventos en Vivo</h1>

    <div class="form-box">
        <h3>Registrar Nuevo Suceso</h3>
        <form method="POST">
            <input type="text" name="id" placeholder="ID Evento" required style="width: 80px;">
            <input type="text" name="id_partido" placeholder="ID Partido" required style="width: 80px;">
            <input type="text" name="id_jugador" placeholder="ID Jugador" required style="width: 80px;">
            <input type="text" name="tipo" placeholder="Tipo (Gol, Tarjeta...)" required>
            <input type="number" name="minuto" placeholder="Minuto" required style="width: 80px;">
            <button type="submit" name="accion" value="agregar">Guardar</button>
        </form>
    </div>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Partido</th>
                <th>Jugador</th>
                <th>Acción</th>
                <th>Minuto</th>
                <th>Operación</th>
            </tr>
        </thead>
        <tbody>
            <%
                File fE = new File(rutaE);
                if (fE.exists()) {
                    try (BufferedReader br = new BufferedReader(new FileReader(fE))) {
                        String l;
                        while ((l = br.readLine()) != null) {
                            String[] d = l.split(",");
                            if (d.length >= 5) {
            %>
            <tr>
                <td><%= d[0] %></td>
                <td>Partido #<%= d[1] %></td>
                <td>Jugador #<%= d[2] %></td>
                <td><strong><%= d[3] %></strong></td>
                <td><%= d[4] %>'</td>
                <td>
                    <a href="?accion=eliminar&id=<%= d[0] %>" class="btn-del" onclick="return confirm('¿Eliminar este evento?')">Borrar</a>
                </td>
            </tr>
            <%
                            }
                        }
                    } catch (Exception e) { out.println("Error al leer datos."); }
                } else {
                    out.println("<tr><td colspan='6'>Crea el archivo evento.txt para empezar.</td></tr>");
                }
            %>
        </tbody>
    </table>

    <br>
    <a href="menu.jsp" style="text-decoration: none; color: #b91d1d; font-weight: bold;">← Regresar al Menú</a>
</div>

</body>
</html>