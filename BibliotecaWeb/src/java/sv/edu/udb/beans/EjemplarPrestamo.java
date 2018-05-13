package sv.edu.udb.beans;
import java.sql.*;
import org.apache.log4j.Logger;

public class EjemplarPrestamo {
    static final Logger log = Logger.getLogger(EjemplarPrestamo.class);
    
    private int id;
    private int idDoc;
    private String ubicacion;
    private int idEstado;
    private String titulo;
    
    public EjemplarPrestamo(){ }
    
    public EjemplarPrestamo(int id){
        this.id = id;
    }
    
    public void setId(int id){
        this.id = id;
    }
    
    public int getId(){
        return id;
    }
    
    public void setIdDoc(int idDoc){
        this.idDoc = idDoc;
    }
    
    public int getIdDoc(){
        return idDoc;
    }
    
    public void setUbicacion(String ubicacion){
        this.ubicacion = ubicacion;
    }
    
    public String getUbicacion(){
        return ubicacion;
    }
    
    public boolean getDisponible(){
        return idEstado == 3;
    }
    
    public String getTitulo(){
        return titulo;
    }
    
    public boolean getExiste(){
        try {
            String query = "SELECT\n"
                    + "    E.*,\n"
                    + "    D.Titulo\n"
                    + "FROM\n"
                    + "    documentos AS D\n"
                    + "    INNER JOIN ejemplar AS E ON D.idDocumento = E.idDocumento\n"
                    + "WHERE IdEjemplar = ?";
            
            Connection con = Conexion.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, id);
            
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()){
                this.id = rs.getInt(1);
                idDoc = rs.getInt(2);
                ubicacion = rs.getString(3);
                idEstado = rs.getInt(4);
                titulo = rs.getString(5);
                return true;
            }
        } catch (SQLException e) {
            log.fatal("Error en sql - " + e.getMessage());
        }
        return false;
    }
}
