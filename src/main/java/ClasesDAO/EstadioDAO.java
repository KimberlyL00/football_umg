package ClasesDAO;

import modelos.Estadio; // Asegúrate de tener el modelo Estadio creado
import conexion.ConexionDB;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EstadioDAO {

    public List<Estadio> obtenerTodos() {
        List<Estadio> lista = new ArrayList<>();
        String sql = "SELECT id, nombre, ciudad, pais, capacidad FROM estadio ORDER BY id";
        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Estadio est = new Estadio();
                est.setId(rs.getInt("id"));
                est.setNombre(rs.getString("nombre"));
                est.setCiudad(rs.getString("ciudad"));
                est.setPais(rs.getString("pais"));
                est.setCapacidad(rs.getInt("capacidad"));
                lista.add(est);
            }
        } catch (SQLException e) {
            System.out.println("Error al listar estadios: " + e.getMessage());
        }
        return lista;
    }

    public void insertar(Estadio estadio) {
        String sql = "INSERT INTO estadio (nombre, ciudad, pais, capacidad) VALUES (?, ?, ?, ?)";
        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, estadio.getNombre());
            ps.setString(2, estadio.getCiudad());
            ps.setString(3, estadio.getPais());
            ps.setInt(4, estadio.getCapacidad());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al insertar estadio: " + e.getMessage());
        }
    }

    public void eliminar(int id) {
        String sql = "DELETE FROM estadio WHERE id = ?";
        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al eliminar estadio: " + e.getMessage());
        }
    }
}