<%@page import="conexion.ConexionDB"%>
<%@page import="java.sql.*"%>

<%

Connection conn = null;

try{

    conn = ConexionDB.conectar();

    String sql =
    "UPDATE partido SET goles_local = NULL, goles_visitante = NULL";

    PreparedStatement ps = conn.prepareStatement(sql);
    ps.executeUpdate();

    response.sendRedirect("simulacion.jsp");

}catch(Exception e){
    out.println("Error: " + e.getMessage());
}finally{
    if(conn != null) conn.close();
}

%>