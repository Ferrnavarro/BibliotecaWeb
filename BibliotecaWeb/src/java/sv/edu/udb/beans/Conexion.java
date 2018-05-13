package sv.edu.udb.beans;
import java.sql.*;
import org.apache.log4j.Logger;

public class Conexion {
    static final Logger log = Logger.getLogger(Conexion.class);
    
    private static String jdbcDriver = "com.mysql.jdbc.Driver";
    private static String jdbcUrl = "jdbc:mysql://localhost/biblioteca";
    private static String jdbcUser = "root";
    private static String jdbcPass = "";
    
    public static synchronized Connection getConnection() throws SQLException{
        try {
            Class.forName(jdbcDriver);
            return DriverManager.getConnection(jdbcUrl,jdbcUser,jdbcPass);
        } catch (ClassNotFoundException e) {
            log.fatal("Fallo al cargar el driver jdbc - " + e.getMessage());
        } catch (SQLException e) {
            log.fatal("Otra Excepción\n" + e.getMessage());
        }
        return null;
    }
}
