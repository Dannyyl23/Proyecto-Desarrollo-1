import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConeccionBD {
    public static void main(String[] args) {
        // Configuración de conexión
        String url = "jdbc:postgresql://localhost:5432/BD_CINE";
        String usuario = "postgres";
        String contraseña = "America1927";

        Connection conexion = null;

        try {
            // Establecer la conexión
            conexion = DriverManager.getConnection(url, usuario, contraseña);
            System.out.println("Conexión exitosa a PostgreSQL!");

        } catch (SQLException e) {
            System.out.println("Error al conectar con PostgreSQL:");
            e.printStackTrace();
        } finally {
            // Cerrar la conexión
            if (conexion != null) {
                try {
                    conexion.close();
                    System.out.println("Conexión cerrada.");
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}