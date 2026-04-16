package conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionDB {
    private static final String URL = "jdbc:postgresql://localhost:5432/Mundial";
    private static final String USER = "postgres";
    private static final String PASS = "kL302006";

    public static Connection conectar() {
        Connection conexion = null;
        try {
            Class.forName("org.postgresql.Driver");
            conexion = DriverManager.getConnection(URL, USER, PASS);
            if (conexion != null) {
                System.out.println("CONEXIÓN EXITOSA");
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(" Error: " + e.getMessage());
        }
        return conexion;
    }
}