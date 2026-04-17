<%@page import="java.io.*, java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String rutaP = "C:\\Users\\leiva\\Desktop\\Universidad\\proyecto\\partido.txt";
    String accionP = request.getParameter("accion");

    if ("agregar".equals(accionP)) {
        String reg = request.getParameter("id")+","+request.getParameter("loc")+","+request.getParameter("vis")+","+request.getParameter("est")+","+request.getParameter("fase");
        try (PrintWriter outF = new PrintWriter(new BufferedWriter(new FileWriter(rutaP, true)))) { outF.println(reg); } catch(Exception e){}
    }
    if ("eliminar".equals(accionP)) {
        String idDel = request.getParameter("id");
        List<String> lista = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(rutaP))) {
            String l; while((l = br.readLine()) != null) { if(!l.startsWith(idDel+",")) lista.add(l); }
        } catch(Exception e){}
        try (PrintWriter pw = new PrintWriter(new FileWriter(rutaP))) { for(String s : lista) pw.println(s); } catch(Exception e){}
    }
%>
<!DOCTYPE html>
<html>
<head><title>Partidos</title><style>body{font-family:sans-serif;margin:30px;} table{width:100%;border-collapse:collapse;} th,td{padding:8px;border:1px solid #ddd;} th{background:#0056b3;color:white;}</style></head>
<body>
    <h1>📅 Gestión de Partidos</h1>
    <form method="POST" style="margin-bottom:20px;">
        <input type="text" name="id" placeholder="ID" required>
        <input type="text" name="loc" placeholder="ID Local">
        <input type="text" name="vis" placeholder="ID Visitante">
        <input type="text" name="est" placeholder="ID Estadio">
        <input type="text" name="fase" placeholder="Fase">
        <button type="submit" name="accion" value="agregar">Programar</button>
    </form>
    <table>
        <tr><th>ID</th><th>Local</th><th>Visitante</th><th>Estadio</th><th>Fase</th><th>Acción</th></tr>
        <% File fP = new File(rutaP); if(fP.exists()){ try(BufferedReader br=new BufferedReader(new FileReader(fP))){ String l; while((l=br.readLine())!=null){ String[] d=l.split(","); if(d.length>=5){ %>
        <tr><td><%=d[0]%></td><td><%=d[1]%></td><td><%=d[2]%></td><td><%=d[3]%></td><td><%=d[4]%></td>
        <td><a href="?accion=eliminar&id=<%=d[0]%>" style="color:red;">Eliminar</a></td></tr>
        <% } } } catch(Exception e){} } %>
    </table>
</body>
</html>