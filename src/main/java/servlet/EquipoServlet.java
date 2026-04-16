package servlet;

import ClasesDAO.EquipoDAO;
import modelos.Equipo;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/equipos")
public class EquipoServlet extends HttpServlet {

    private EquipoDAO equipoDAO = new EquipoDAO();

    // GET — mostrar lista de equipos
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Equipo> lista = equipoDAO.obtenerTodos();
        request.setAttribute("equipos", lista);
        request.getRequestDispatcher("/equipos.jsp").forward(request, response);
    }

    // POST — recibir datos del formulario
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");

        if (accion.equals("insertar")) {
            Equipo equipo = new Equipo(
                0,
                request.getParameter("nombre"),
                request.getParameter("pais"),
                request.getParameter("grupo"),
                request.getParameter("entrenador")
            );
            equipoDAO.insertar(equipo);

        } else if (accion.equals("actualizar")) {
            Equipo equipo = new Equipo(
                Integer.parseInt(request.getParameter("id")),
                request.getParameter("nombre"),
                request.getParameter("pais"),
                request.getParameter("grupo"),
                request.getParameter("entrenador")
            );
            equipoDAO.actualizar(equipo);

        } else if (accion.equals("eliminar")) {
            int id = Integer.parseInt(request.getParameter("id"));
            equipoDAO.eliminar(id);
        }

        // Después de cualquier acción, redirige de vuelta a la lista
        response.sendRedirect("equipos");
    }
}