<%@page import="ClasesDAO.AmonestacionDAO"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String idPartidoStr = request.getParameter("id_partido");
    String idJugadorStr = request.getParameter("id_jugador");
    String minutoStr = request.getParameter("minuto");
    if (idPartidoStr != null && idJugadorStr != null && minutoStr != null) {
        new AmonestacionDAO().eliminar(
            Integer.parseInt(idPartidoStr),
            Integer.parseInt(idJugadorStr),
            Integer.parseInt(minutoStr)
        );
    }
    response.sendRedirect("gestion_amonestaciones.jsp");
%>