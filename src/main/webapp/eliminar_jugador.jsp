<%@page import="ClasesDAO.JugadorDAO"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String idStr = request.getParameter("id");
    if (idStr != null) {
        new JugadorDAO().eliminar(Integer.parseInt(idStr));
    }
    response.sendRedirect("gestion_jugadores.jsp");
%>