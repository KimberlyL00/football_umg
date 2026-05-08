<%@page import="ClasesDAO.PaisDAO"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String idStr = request.getParameter("id");
    if (idStr != null) {
        new PaisDAO().eliminar(Integer.parseInt(idStr));
    }
    response.sendRedirect("gestion_paises.jsp");
%>