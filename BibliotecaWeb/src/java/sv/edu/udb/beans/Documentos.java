package sv.edu.udb.beans;
import java.sql.*;
import java.util.ArrayList;
import org.apache.log4j.Logger;


public class Documentos {

    public static Logger getLog() {
        return log;
    }

    public static void setLog(Logger aLog) {
        log = aLog;
    }

    public Documentos(){ }
    
    public Documentos(int idDocumento){
        this.iddocumento = idDocumento;
    }

    private static Logger log = Logger.getLogger(Documentos.class);
    
    private int iddocumento;
    private String edicion;
    private int idimprenedi;
    private String descripcion;
    private String notas;
    private String titulo;
    private int ididioma;
    
    public int getIdDocumento() {
        return iddocumento;
    }

    public void setIdDocumento(int IdDocumento) {
        this.iddocumento = IdDocumento;
    }
    
    public String getEdicion() {
        return edicion;
    }

    public void setEdicion(String Edicion) {
        this.edicion = Edicion;
    }
    
    public int getIdImprenEdi() {
        return idimprenedi;
    }

    public void setIdImprenEdi(int IdImprenEdi) {
        this.idimprenedi= IdImprenEdi;
    }
    
    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.descripcion = Descripcion;
    }
    
    public String getNotas() {
        return notas;
    }

    public void setNotas(String Notas) {
        this.notas = Notas;
    }
    
    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String Titulo) {
        this.titulo = Titulo;
    }
    
    public int getIdIdioma() {
        return ididioma;
    }

    public void setIdIdioma(int IdIdioma) {
        this.ididioma = IdIdioma;
    }
    
    public Documentos(int idDocumento, String Edicion, int IdImprenEdi, String Descripcion, String Notas, String Titulo, int IdIdioma){
        this.iddocumento=idDocumento;
        this.edicion=Edicion;
        this.idimprenedi=IdImprenEdi;
        this.descripcion=Descripcion;
        this.notas=Notas;
        this.titulo=Titulo;
        this.ididioma=IdIdioma;
    }
    
    public Documentos(String Edicion, int IdImprenEdi, String Descripcion, String Notas, String Titulo, int IdIdioma){
        this.edicion=Edicion;
        this.idimprenedi=IdImprenEdi;
        this.descripcion=Descripcion;
        this.notas=Notas;
        this.titulo=Titulo;
        this.ididioma=IdIdioma;
    }
    
    public boolean getLleno(){
        return edicion!=null && descripcion!=null && notas!=null && titulo!=null;
    }
    
    
    public Documentos[] getListaDocumentos(){
        ArrayList<Documentos> lista = new ArrayList();
        
        try {
            String query = "select * from documentos";
            Connection con = Conexion.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();

            if (rs.isBeforeFirst())
                while (rs.next()){
                    lista.add(new Documentos(rs.getInt(1),rs.getString(2),rs.getInt(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getInt(7)));
                }
            
            rs.close(); stmt.close(); con.close();
                
            return lista.toArray(new Documentos[0]);
        } catch (SQLException e) {
            System.out.println("Error en sql - " + e.getMessage());
        }
        return null;
    }
        
    public boolean getIngreso(){
        try {
            String query = "insert into Documentos values(DEFAULT,?,?,?,?,?,?)";
            Connection con = Conexion.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
        
            stmt.setString(1, getEdicion());
            stmt.setInt(2, getIdImprenEdi());
            stmt.setString(3, getDescripcion());
            stmt.setString(4, getNotas());
            stmt.setString(5, getTitulo());
            stmt.setInt(6, getIdIdioma());
            
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            getLog().fatal("Error en sql - " + e.getMessage());
        }
        return false;
    }
    
    public boolean getModif(){
        try {
            String query = "update documentos set Edicion=?, IdImprenEdi=?, Descripcion=?, Notas=?, Titulo=?, IdIdioma=? where idDocumento=?";
            
            Connection con = Conexion.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, getEdicion());
            stmt.setInt(2, getIdImprenEdi());
            stmt.setString(3, getDescripcion());
            stmt.setString(4, getNotas());
            stmt.setString(5, getTitulo());
            stmt.setInt(6, getIdIdioma());
            stmt.setInt(7, getIdDocumento());
            
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            getLog().fatal("Error en sql - " + e.getMessage());
        }
        return false;
    }
    
    public boolean getEliminar(){
        try {
            String query = "delete from documentos where idDocumento=?";
            
            Connection con = Conexion.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, getIdDocumento());
            
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            getLog().fatal("Error en sql - " + e.getMessage());
        }
        return false;
    }
    
    public boolean getExiste(){
        try {
            String query = "select * from documentos where idDocumento = ?";
            
            Connection con = Conexion.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, iddocumento);
            
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()){
                setEdicion(rs.getString(2));
                setIdImprenEdi(rs.getInt(3));
                setDescripcion(rs.getString(4));
                setNotas(rs.getString(5));
                setTitulo(rs.getString(6));
                setIdIdioma(rs.getInt(7));
                return true;
            }
        } catch (SQLException e) {
            getLog().fatal("Error en sql - " + e.getMessage());
        }
        return false;
    }
}
