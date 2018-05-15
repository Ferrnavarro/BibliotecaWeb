package sv.edu.udb.beans;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import org.apache.log4j.Logger;


public class Revistas {

    public static Logger getLog() {
        return log;
    }

    public static void setLog(Logger aLog) {
        log = aLog;
    }

    public Revistas(){ }

    public Revistas(int iddocumento, int idrevista, String issn, String ejemplares, String contenido) {
        this.iddocumento = iddocumento;
        this.idRevista = idrevista;
        this.issn = issn;
        this.ejemplares = ejemplares;
        this.contenido = contenido;
    }
    

    private static Logger log = Logger.getLogger(Documentos.class);
    
    private int iddocumento;
    private int idRevista;
    private String issn;
    private String ejemplares;
    private String contenido;

    public String getISNN() {
        return issn;
    }

    public void setISNN(String ISNN) {
        this.issn = ISNN;
    }
    
    public int getIdDocumento() {
        return iddocumento;
    }

    public void setIdDocumento(int IdDocumento) {
        this.iddocumento = IdDocumento;
    }

    public int getIddocumento() {
        return iddocumento;
    }
    
    public int retornariddoc(int idr){
        String query = "select idDocumento from revistas WHERE idRevista="+idr+"";
            Connection con;
        try {
            con = Conexion.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();
            if(rs.next()){
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(Revistas.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
    
    public String retornarissn(int idr){
        String query = "select ISSN from revistas WHERE idRevista="+idr+"";
            Connection con;
        try {
            con = Conexion.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();
            if(rs.next()){
                return rs.getString(1);
            }
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(Revistas.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "";
    }
    
    public String retornarejemplares(int idr){
        String query = "select ejemplares from revistas WHERE idRevista="+idr+"";
            Connection con;
        try {
            con = Conexion.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();
            if(rs.next()){
                return rs.getString(1);
            }
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(Revistas.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "";
    }
    
    public String retornarecontenido(int idr){
        String query = "select contenido from revistas WHERE idRevista="+idr+"";
            Connection con;
        try {
            con = Conexion.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();
            if(rs.next()){
                return rs.getString(1);
            }
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(Revistas.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "";
    }

    public void setIddocumento(int iddocumento) {
        this.iddocumento = iddocumento;
    }

    public int getIdrevista() {
        return idRevista;
    }

    public int getIdRevista() {
        return idRevista;
    }

    public void setIdRevista(int idRevista) {
        this.idRevista = idRevista;
    }

    public void setIdrevista(int idrevista) {
        this.idRevista = idrevista;
    }

    public String getIsnn() {
        return issn;
    }

    public String getIssn() {
        return issn;
    }

    public void setIssn(String issn) {
        this.issn = issn;
    }

    public void setIsnn(String isnn) {
        this.issn = isnn;
    }

    public String getEjemplares() {
        return ejemplares;
    }

    public void setEjemplares(String ejemplares) {
        this.ejemplares = ejemplares;
    }

    public String getContenido() {
        return contenido;
    }
    
    public boolean getLleno(){
        return true;
    }

    public void setContenido(String contenido) {
        this.contenido = contenido;
    }
    
    public Revistas[] getListaRevistas(){
        ArrayList<Revistas> lista = new ArrayList();
        
        try {
            String query = "select * from revistas";
            Connection con = Conexion.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();

            if (rs.isBeforeFirst())
                while (rs.next()){
                    lista.add(new Revistas(rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getString(4),rs.getString(5)));
                }
            
            rs.close(); stmt.close(); con.close();
                
            return lista.toArray(new Revistas[0]);
        } catch (SQLException e) {
            System.out.println("Error en sql - " + e.getMessage());
        }
        return null;
    }
        
    public boolean getIngreso(){
        try {
            String query = "insert into revistas values(?,?,?,?,?)";
            Connection con = Conexion.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, getIddocumento());
            stmt.setInt(2, getIdRevista());
            stmt.setString(3, getIssn());
            stmt.setString(4, getEjemplares());
            stmt.setString(5, getContenido());
            
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            getLog().fatal("Error en sql - " + e.getMessage());
        }
        return false;
    }
    
    public boolean getModiff(int idr){
        try {
            String query = "update revistas set idDocumento=?, ISSN=?, ejemplares=?, contenido=? WHERE idRevista="+idr+"";
            Connection con = Conexion.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, getIddocumento());
            stmt.setString(2, getIssn());
            stmt.setString(3, getEjemplares());
            stmt.setString(4, getContenido());
            
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            getLog().fatal("Error en sql - " + e.getMessage());
        }
        return false;
    }
    
    public boolean getEliminar(){
        try {
            String query = "delete from revistas where idRevista=?";
            Connection con = Conexion.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, getIdRevista());
            
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            getLog().fatal("Error en sql - " + e.getMessage());
        }
        return false;
    }
    
    public boolean getExiste(){
        try {
            String query = "select * from revistas where idRevista = ?";
            Connection con = Conexion.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, getIdRevista());
            
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()){
                
                return true;
            }
        } catch (SQLException e) {
            getLog().fatal("Error en sql - " + e.getMessage());
        }
        return false;
    }
}
