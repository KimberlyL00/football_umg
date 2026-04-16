package ClasesDAO;

import modelos.Estadio;
import conexion.ConexionDB;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EstadioDAO {

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

    public List<Estadio> obtenerTodos() {
        List<Estadio> lista = new ArrayList<>();
        String sql = "SELECT * FROM estadio";
        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Estadio e = new Estadio(
                    rs.getInt("id"),
                    rs.getString("nombre"),
                    rs.getString("ciudad"),
                    rs.getString("pais"),
                    rs.getInt("capacidad")
                );
                lista.add(e);
            }
        } catch (SQLException e) {
            System.out.println("Error al obtener estadios: " + e.getMessage());
        }
        return lista;
    }

    public void actualizar(Estadio estadio) {
        String sql = "UPDATE estadio SET nombre=?, ciudad=?, pais=?, capacidad=? WHERE id=?";
        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, estadio.getNombre());
            ps.setString(2, estadio.getCiudad());
            ps.setString(3, estadio.getPais());
            ps.setInt(4, estadio.getCapacidad());
            ps.setInt(5, estadio.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al actualizar estadio: " + e.getMessage());
        }
    }

    public void eliminar(int id) {
        String sql = "DELETE FROM estadio WHERE id=?";
        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al eliminar estadio: " + e.getMessage());
        }
    }
}