package ClasesDAO;

import modelos.Fase;
import conexion.ConexionDB;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FaseDAO {

    public List<Fase> obtenerTodos() {
        List<Fase> lista = new ArrayList<>();
        String sql = "SELECT id_fase, descripcion FROM fase";

        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Fase f = new Fase();
                f.setId_fase(rs.getInt("id_fase"));
                f.setDescripcion(rs.getString("descripcion"));
                lista.add(f);
            }
        } catch (SQLException ex) {
            System.out.println("Error al listar fases: " + ex.getMessage());
        }
        return lista;
    }

    public void insertar(Fase f) {
        String sql = "INSERT INTO fase (descripcion) VALUES (?)";

        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, f.getDescripcion());
            ps.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("Error al insertar fase: " + ex.getMessage());
        }
    }

    public void actualizar(Fase f) {
        String sql = "UPDATE fase SET descripcion = ? WHERE id_fase = ?";

        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, f.getDescripcion());
            ps.setInt(2, f.getId_fase());
            ps.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("Error al actualizar fase: " + ex.getMessage());
        }
    }

    public void eliminar(int id_fase) {
        String sql = "DELETE FROM fase WHERE id_fase = ?";

        try (Connection conn = ConexionDB.conectar();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id_fase);
            ps.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("Error al eliminar fase: " + ex.getMessage());
        }
    }
}