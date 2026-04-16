package ClasesDAO;

import modelos.Equipo;
import conexion.ConexionDB;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class EquipoDAO {

    // CREATE Insertar equipo
    public void insertar(Equipo equipo) {
        String sql = "INSERT INTO equipos (nombre, pais, grupo) VALUES (?, ?, ?)";
        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, equipo.getNombre());
            ps.setString(2, equipo.getPais());
            ps.setString(3, equipo.getGrupo());
            ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Error al insertar equipo: " + e.getMessage());
        }
    }

    // READ  Obtener todos los equipos
    public List<Equipo> obtenerTodos() {
        List<Equipo> lista = new ArrayList<>();
        String sql = "SELECT * FROM equipos";
        try (Connection conn = ConexionDB.conectar();
             Statement st = conn.createStatement();
             ResultSet rs = st.executeQuery(sql)) {

            while (rs.next()) {
                Equipo e = new Equipo(
                    rs.getInt("id"),
                    rs.getString("nombre"),
                    rs.getString("pais"),
                    rs.getString("grupo")
                );
                lista.add(e);
            }
        } catch (SQLException e) {
            System.out.println("Error al obtener equipos: " + e.getMessage());
        }
        return lista;
    }

    // UPDATE Actualizar equipo
    public void actualizar(Equipo equipo) {
        String sql = "UPDATE equipos SET nombre=?, pais=?, grupo=? WHERE id=?";
        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, equipo.getNombre());
            ps.setString(2, equipo.getPais());
            ps.setString(3, equipo.getGrupo());
            ps.setInt(5, equipo.getId());
            ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Error al actualizar equipo: " + e.getMessage());
        }
    }

    //  Eliminar equipo
    public void eliminar(int id) {
        String sql = "DELETE FROM equipos WHERE id=?";
        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Error al eliminar equipo: " + e.getMessage());
        }
    }
}