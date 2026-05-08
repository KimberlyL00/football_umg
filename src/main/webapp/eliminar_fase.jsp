<%@page import="ClasesDAO.FaseDAO"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String idStr = request.getParameter("id");
    if (idStr != null) {
        new FaseDAO().eliminar(Integer.parseInt(idStr));
    }
    response.sendRedirect("gestion_fases.jsp");
%>