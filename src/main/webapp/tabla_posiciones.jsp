<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="conexion.ConexionDB"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
    class EquipoStats {
        String nombre, grupo, pais;
        int pj, pg, pe, pp, gf, gc, puntos;
    }

    String getBandera(String pais) {
        switch(pais) {
            case "Argentina": return "https://flagcdn.com/w40/ar.png";
            case "Australia": return "https://flagcdn.com/w40/au.png";
            case "Austria": return "https://flagcdn.com/w40/at.png";
            case "Arabia Saudita": return "https://flagcdn.com/w40/sa.png";
            case "Bélgica":
            case "Belgica": return "https://flagcdn.com/w40/be.png";
            case "Bolivia": return "https://flagcdn.com/w40/bo.png";
            case "Brasil": return "https://flagcdn.com/w40/br.png";
            case "Camerún":
            case "Camerun": return "https://flagcdn.com/w40/cm.png";
            case "Canadá":
            case "Canada": return "https://flagcdn.com/w40/ca.png";
            case "Chile": return "https://flagcdn.com/w40/cl.png";
            case "Colombia": return "https://flagcdn.com/w40/co.png";
            case "Corea del Sur": return "https://flagcdn.com/w40/kr.png";
            case "Costa Rica": return "https://flagcdn.com/w40/cr.png";
            case "Croacia": return "https://flagcdn.com/w40/hr.png";
            case "Dinamarca": return "https://flagcdn.com/w40/dk.png";
            case "Ecuador": return "https://flagcdn.com/w40/ec.png";
            case "Egipto": return "https://flagcdn.com/w40/eg.png";
            case "El Salvador": return "https://flagcdn.com/w40/sv.png";
            case "Escocia": return "https://flagcdn.com/w40/gb-sct.png";
            case "España":
            case "Espana": return "https://flagcdn.com/w40/es.png";
            case "Estados Unidos": return "https://flagcdn.com/w40/us.png";
            case "Francia": return "https://flagcdn.com/w40/fr.png";
            case "Ghana": return "https://flagcdn.com/w40/gh.png";
            case "Alemania": return "https://flagcdn.com/w40/de.png";
            case "Honduras": return "https://flagcdn.com/w40/hn.png";
            case "Holanda":
            case "Países Bajos":
            case "Paises Bajos": return "https://flagcdn.com/w40/nl.png";
            case "Inglaterra": return "https://flagcdn.com/w40/gb-eng.png";
            case "Irán":
            case "Iran": return "https://flagcdn.com/w40/ir.png";
            case "Italia": return "https://flagcdn.com/w40/it.png";
            case "Jamaica": return "https://flagcdn.com/w40/jm.png";
            case "Japón":
            case "Japon": return "https://flagcdn.com/w40/jp.png";
            case "Marruecos": return "https://flagcdn.com/w40/ma.png";
            case "México":
            case "Mexico": return "https://flagcdn.com/w40/mx.png";
            case "Nigeria": return "https://flagcdn.com/w40/ng.png";
            case "Nueva Zelanda": return "https://flagcdn.com/w40/nz.png";
            case "Panamá":
            case "Panama": return "https://flagcdn.com/w40/pa.png";
            case "Paraguay": return "https://flagcdn.com/w40/py.png";
            case "Perú":
            case "Peru": return "https://flagcdn.com/w40/pe.png";
            case "Portugal":
            case "Portugal B": return "https://flagcdn.com/w40/pt.png";
            case "Qatar": return "https://flagcdn.com/w40/qa.png";
            case "Senegal": return "https://flagcdn.com/w40/sn.png";
            case "Serbia": return "https://flagcdn.com/w40/rs.png";
            case "Suiza": return "https://flagcdn.com/w40/ch.png";
            case "Túnez":
            case "Tunez": return "https://flagcdn.com/w40/tn.png";
            case "Turquía":
            case "Turquia": return "https://flagcdn.com/w40/tr.png";
            case "Uruguay": return "https://flagcdn.com/w40/uy.png";
            case "Venezuela": return "https://flagcdn.com/w40/ve.png";
            case "Guatemala": return "https://flagcdn.com/w40/gt.png";
            default: return "https://flagcdn.com/w40/un.png";
        }
    }
%>
<%
HashMap<String, EquipoStats> tabla = new HashMap<>();
Connection conn = null;
try {
    conn = ConexionDB.conectar();

    PreparedStatement psEquipos = conn.prepareStatement(
        "SELECT e.nombre_equipo, e.grupo, p.nombre as pais " +
        "FROM equipo e JOIN pais p ON e.id_pais = p.id_pais"
    );
    ResultSet rsEquipos = psEquipos.executeQuery();
    while (rsEquipos.next()) {
        EquipoStats es = new EquipoStats();
        es.nombre = rsEquipos.getString("nombre_equipo");
        es.grupo = rsEquipos.getString("grupo");
        es.pais = rsEquipos.getString("pais");
        tabla.put(es.nombre, es);
    }

    PreparedStatement ps = conn.prepareStatement(
        "SELECT p.goles_local, p.goles_visitante, " +
        "el.nombre_equipo as local, ev.nombre_equipo as visitante " +
        "FROM partido p " +
        "JOIN equipo el ON p.id_equipo_local = el.id_equipo " +
        "JOIN equipo ev ON p.id_equipo_visitante = ev.id_equipo"
    );
    ResultSet rs = ps.executeQuery();
    while (rs.next()) {
        String local = rs.getString("local");
        String visitante = rs.getString("visitante");
        int gl = rs.getInt("goles_local");
        int gv = rs.getInt("goles_visitante");

        EquipoStats l = tabla.get(local);
        EquipoStats v = tabla.get(visitante);
        if (l == null || v == null) continue;

        l.pj++; v.pj++;
        l.gf += gl; l.gc += gv;
        v.gf += gv; v.gc += gl;

        if (gl > gv) {
            l.pg++; v.pp++;
            l.puntos += 3;
        } else if (gl < gv) {
            v.pg++; l.pp++;
            v.puntos += 3;
        } else {
            l.pe++; v.pe++;
            l.puntos += 1;
            v.puntos += 1;
        }
    }
} catch (Exception e) {
    out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
} finally {
    if (conn != null) conn.close();
}

List<EquipoStats> lista = new ArrayList<>(tabla.values());
lista.sort((a, b) -> {
    int cmp = a.grupo.compareTo(b.grupo);
    if (cmp != 0) return cmp;
    return b.puntos - a.puntos;
});

TreeMap<String, List<EquipoStats>> porGrupo = new TreeMap<>();
for (EquipoStats e : lista) {
    porGrupo.computeIfAbsent(e.grupo, k -> new ArrayList<>()).add(e);
}
%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Tabla de Posiciones | Mundial 2026</title>
<style>
body { margin: 0; font-family: Arial; background: #0f172a; color: white; padding: 40px; }
h1 { text-align: center; color: #38bdf8; margin-bottom: 30px; }
.grupos { display: flex; flex-wrap: wrap; gap: 30px; justify-content: center; }
.grupo { background: #1e293b; border-radius: 15px; overflow: hidden; width: 560px; }
.grupo-header { background: #072357; padding: 14px 20px; font-size: 1.1em; font-weight: bold; color: #4ade80; }
table { width: 100%; border-collapse: collapse; }
th { background: #0b3a6e; padding: 10px; font-size: 0.82em; text-transform: uppercase; color: #38bdf8; text-align: center; }
td { padding: 10px; border-bottom: 1px solid #334155; text-align: center; font-size: 0.95em; }
.equipo-cell { display: flex; align-items: center; gap: 10px; padding-left: 10px; }
.equipo-cell img { width: 28px; height: 20px; border-radius: 2px; object-fit: cover; }
.primero { background: rgba(74, 222, 128, 0.08); }
.segundo { background: rgba(56, 189, 248, 0.06); }
.pts { font-weight: bold; color: #4ade80; font-size: 1.1em; }
.nav { display: flex; gap: 15px; justify-content: center; margin-top: 30px; }
.btn { color: white; padding: 10px 20px; border-radius: 8px; text-decoration: none; font-weight: bold; }
.btn-blue { background: #2563eb; }
.btn-green { background: #22c55e; }
</style>
</head>
<body>
<h1>Tabla de Posiciones — Mundial 2026</h1>
<div class="grupos">
<%
for (Map.Entry<String, List<EquipoStats>> entry : porGrupo.entrySet()) {
    String grupo = entry.getKey();
    List<EquipoStats> equipos = entry.getValue();
%>
<div class="grupo">
    <div class="grupo-header">Grupo <%= grupo %></div>
    <table>
        <tr>
            <th>Equipo</th>
            <th>PJ</th>
            <th>PG</th>
            <th>PE</th>
            <th>PP</th>
            <th>GF</th>
            <th>GC</th>
            <th>Pts</th>
        </tr>
        <%
        int pos = 0;
        for (EquipoStats e : equipos) {
            pos++;
            String rowClass = pos == 1 ? "primero" : pos == 2 ? "segundo" : "";
        %>
        <tr class="<%= rowClass %>">
            <td>
                <div class="equipo-cell">
                    <img src="<%= getBandera(e.pais) %>" alt="<%= e.pais %>">
                    <span><%= e.nombre %></span>
                </div>
            </td>
            <td><%= e.pj %></td>
            <td><%= e.pg %></td>
            <td><%= e.pe %></td>
            <td><%= e.pp %></td>
            <td><%= e.gf %></td>
            <td><%= e.gc %></td>
            <td class="pts"><%= e.puntos %></td>
        </tr>
        <% } %>
    </table>
</div>
<% } %>
</div>
<div class="nav">
    <a href="grupos_mundial.jsp" class="btn btn-green">Ver Grupos</a>
    <a href="simulacion.jsp" class="btn btn-blue">Simulacion</a>
    <a href="menu.jsp" class="btn btn-blue">← Volver al Menu</a>
</div>
</body>
</html>