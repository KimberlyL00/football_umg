package ClasesDAO;

import modelos.Posicion;
import conexion.ConexionDB;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PosicionDAO {

    public List<Posicion> obtenerTodos() {
        List<Posicion> lista = new ArrayList<>();
        String sql = "SELECT id_posicion, descripcion FROM posicion";

        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Posicion p = new Posicion();
                p.setId_posicion(rs.getInt("id_posicion"));
                p.setDescripcion(rs.getString("descripcion"));
                lista.add(p);
            }
        } catch (SQLException ex) {
            System.out.println("Error al listar posiciones: " + ex.getMessage());
        }
        return lista;
    }

    public void insertar(Posicion p) {
        String sql = "INSERT INTO posicion (descripcion) VALUES (?)";

        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, p.getDescripcion());
            ps.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("Error al insertar posicion: " + ex.getMessage());
        }
    }

    public void actualizar(Posicion p) {
        String sql = "UPDATE posicion SET descripcion = ? WHERE id_posicion = ?";

        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, p.getDescripcion());
            ps.setInt(2, p.getId_posicion());
            ps.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("Error al actualizar posicion: " + ex.getMessage());
        }
    }

    public void eliminar(int id_posicion) {
        String sql = "DELETE FROM posicion WHERE id_posicion = ?";

        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id_posicion);
            ps.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("Error al eliminar posicion: " + ex.getMessage());
        }
    }
}