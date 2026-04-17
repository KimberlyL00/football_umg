package ClasesDAO;

import modelos.Equipo;
import conexion.ConexionDB;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EquipoDAO {

    public List<Equipo> obtenerTodos() {
        List<Equipo> lista = new ArrayList<>();
        String sql = "SELECT id, nombre, pais, grupo, entrenador FROM equipo ORDER BY id";
        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Equipo e = new Equipo(rs.getInt("id"), rs.getString("nombre"), 
                                     rs.getString("pais"), rs.getString("grupo"), 
                                     rs.getString("entrenador"));
                lista.add(e);
            }
        } catch (SQLException e) {
            System.out.println("Error al listar equipos: " + e.getMessage());
        }
        return lista;
    }

    public void insertar(Equipo equipo) {
        String sql = "INSERT INTO equipo (nombre, pais, grupo, entrenador) VALUES (?, ?, ?, ?)";
        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, equipo.getNombre());
            ps.setString(2, equipo.getPais());
            ps.setString(3, equipo.getGrupo());
            ps.setString(4, equipo.getEntrenador());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al insertar equipo: " + e.getMessage());
        }
    }

    public void eliminar(int id) {
        String sql = "DELETE FROM equipo WHERE id = ?";
        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al eliminar equipo: " + e.getMessage());
        }
    }
}