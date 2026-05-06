package ClasesDAO;

import modelos.Estadio;
import conexion.ConexionDB;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EstadioDAO {

    public List<Estadio> obtenerTodos() {
        List<Estadio> lista = new ArrayList<>();
        String sql = "SELECT id_estadio, nombre, ciudad FROM estadio";

        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Estadio e = new Estadio();
                e.setId_estadio(rs.getInt("id_estadio"));
                e.setNombre(rs.getString("nombre"));
                e.setCiudad(rs.getString("ciudad"));
                lista.add(e);
            }
        } catch (SQLException ex) {
            System.out.println("Error al listar estadios: " + ex.getMessage());
        }
        return lista;
    }

    public void insertar(Estadio e) {
        String sql = "INSERT INTO estadio (nombre, ciudad) VALUES (?, ?)";

        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, e.getNombre());
            ps.setString(2, e.getCiudad());
            ps.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("Error al insertar estadio: " + ex.getMessage());
        }
    }

    public void actualizar(Estadio e) {
        String sql = "UPDATE estadio SET nombre = ?, ciudad = ? WHERE id_estadio = ?";

        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, e.getNombre());
            ps.setString(2, e.getCiudad());
            ps.setInt(3, e.getId_estadio());
            ps.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("Error al actualizar estadio: " + ex.getMessage());
        }
    }

    public void eliminar(int id_estadio) {
        String sql = "DELETE FROM estadio WHERE id_estadio = ?";

        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id_estadio);
            ps.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("Error al eliminar estadio: " + ex.getMessage());
        }
    }
}