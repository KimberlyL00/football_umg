package ClasesDAO;

import modelos.Equipo;
import conexion.ConexionDB;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EquipoDAO {

    public List<Equipo> obtenerTodos() {
        List<Equipo> lista = new ArrayList<>();
        String sql = "SELECT id_equipo, nombre_equipo, id_pais, grupo FROM equipo";

        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Equipo e = new Equipo();
                e.setId_equipo(rs.getInt("id_equipo"));
                e.setNombre_equipo(rs.getString("nombre_equipo"));
                e.setId_pais(rs.getInt("id_pais"));
                e.setGrupo(rs.getString("grupo").charAt(0));
                lista.add(e);
            }
        } catch (SQLException ex) {
            System.out.println("Error al listar equipos: " + ex.getMessage());
        }
        return lista;
    }

    public void insertar(Equipo e) {
        String sql = "INSERT INTO equipo (nombre_equipo, id_pais, grupo) VALUES (?, ?, ?)";

        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, e.getNombre_equipo());
            ps.setInt(2, e.getId_pais());
            ps.setString(3, String.valueOf(e.getGrupo()));
            ps.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("Error al insertar equipo: " + ex.getMessage());
        }
    }

    public void actualizar(Equipo e) {
        String sql = "UPDATE equipo SET nombre_equipo = ?, id_pais = ?, grupo = ? WHERE id_equipo = ?";

        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, e.getNombre_equipo());
            ps.setInt(2, e.getId_pais());
            ps.setString(3, String.valueOf(e.getGrupo()));
            ps.setInt(4, e.getId_equipo());
            ps.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("Error al actualizar equipo: " + ex.getMessage());
        }
    }

    public void eliminar(int id_equipo) {
        String sql = "DELETE FROM equipo WHERE id_equipo = ?";

        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id_equipo);
            ps.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("Error al eliminar equipo: " + ex.getMessage());
        }
    }
}