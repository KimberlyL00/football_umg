<%@page import="ClasesDAO.AlineacionDAO"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String idPartidoStr = request.getParameter("id_partido");
    String idJugadorStr = request.getParameter("id_jugador");
    if (idPartidoStr != null && idJugadorStr != null) {
        new AlineacionDAO().eliminar(
            Integer.parseInt(idPartidoStr),
            Integer.parseInt(idJugadorStr)
        );
    }
    response.sendRedirect("gestion_alineaciones.jsp");
%>