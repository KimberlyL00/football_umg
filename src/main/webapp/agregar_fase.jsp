<%@page import="ClasesDAO.FaseDAO"%>
<%@page import="modelos.Fase"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");

    String descripcion = request.getParameter("descripcion");

    if (descripcion != null && !descripcion.trim().isEmpty()) {
        Fase f = new Fase();
        f.setDescripcion(descripcion.trim());
        new FaseDAO().insertar(f);
        response.sendRedirect("gestion_fases.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Agregar Fase | Mundial 2026</title>
    <style>
        :root { --bg: #0f172a; --card: #1e293b; --accent: #38bdf8; --green: #22c55e; }
        body { font-family: 'Inter', sans-serif; background: var(--bg); color: white; padding: 40px; margin: 0; display: flex; justify-content: center; align-items: center; min-height: 100vh; }
        .container { background: var(--card); padding: 35px; border-radius: 20px; width: 100%; max-width: 450px; }
        h1 { color: var(--accent); text-align: center; margin-bottom: 30px; font-size: 1.5rem; text-transform: uppercase; }
        label { display: block; margin-bottom: 6px; color: #94a3b8; font-size: 0.9em; }
        input[type="text"] {
            width: 100%; padding: 12px; border-radius: 8px;
            border: 1px solid #334155; background: #0f172a;
            color: white; font-size: 1em; box-sizing: border-box; margin-bottom: 20px;
        }
        input[type="text"]:focus { outline: none; border-color: var(--accent); }
        .btn-submit {
            width: 100%; padding: 14px; background: var(--green);
            color: white; border: none; border-radius: 8px;
            font-size: 1em; font-weight: bold; cursor: pointer;
        }
        .btn-submit:hover { background: #16a34a; }
        .back { display: block; text-align: center; margin-top: 15px; color: #94a3b8; text-decoration: none; }
    </style>
</head>
<body>
<div class="container">
    <h1>Agregar Fase</h1>
    <form method="post" action="agregar_fase.jsp">
        <label>Descripcion</label>
        <input type="text" name="descripcion" placeholder="Ej: Grupos, Octavos, Final" required />
        <input type="submit" class="btn-submit" value="Guardar Fase" />
    </form>
    <a href="gestion_fases.jsp" class="back">← Volver</a>
</div>
</body>
</html>