<%@page import="java.sql.*"%>
<%@page import="conexion.ConexionDB"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");

String descripcion = request.getParameter("descripcion");

if(descripcion != null && !descripcion.trim().equals("")){

    Connection conn = null;

    try{

        conn = ConexionDB.conectar();

        PreparedStatement ps = conn.prepareStatement(
            "INSERT INTO fase (descripcion) VALUES (?) ON CONFLICT (descripcion) DO NOTHING"
        );

        ps.setString(1, descripcion.trim());
        ps.executeUpdate();

    }catch(Exception e){
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
    }finally{
        if(conn != null) conn.close();
    }

    response.sendRedirect("gestion_fases.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Agregar Fase</title>
</head>
<body style="background:#0f172a;color:white;font-family:Arial;padding:40px;">

<h2>Agregar Fase</h2>

<form method="post">
    <input type="text" name="descripcion" placeholder="Ej: Fase de Grupos" required>
    <button type="submit">Guardar</button>
</form>

<br>
<a href="gestion_fases.jsp" style="color:#38bdf8;">← Volver</a>

</body>
</html>