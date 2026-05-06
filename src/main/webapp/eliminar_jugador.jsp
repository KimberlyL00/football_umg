<%@page import="conexion.ConexionDB, java.sql.*"%>
<%
    String id = request.getParameter("id");
    if(id != null){
        try {
            Connection conn = ConexionDB.conectar();
            PreparedStatement ps = conn.prepareStatement("DELETE FROM encuentros WHERE id = ?");
            ps.setInt(1, Integer.parseInt(id));
            ps.executeUpdate();
            conn.close();
        } catch(Exception e) {}
    }
    response.sendRedirect("gestion_partidos.jsp");
%>
