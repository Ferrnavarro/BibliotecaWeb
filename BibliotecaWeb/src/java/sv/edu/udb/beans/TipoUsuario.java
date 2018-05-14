package sv.edu.udb.beans;
import java.sql.*;
import java.util.*;
import org.apache.log4j.Logger;

public class TipoUsuario {

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }
    
    public int getMaxDias(){
        return maxDias;
    }
    
    public int getMaxLibros(){
        return maxLibros;
    }
    
    public void setStrMaxLibros(String strMaxLibros){
        this.strMaxLibros = strMaxLibros;
    }
    
    public void setStrMaxDias(String strMaxDias){
        this.strMaxDias = strMaxDias;
    }
    
    static final Logger log = Logger.getLogger(TipoUsuario.class);
    
    private int id;
    private String tipo;
    private String desc;
    private int maxLibros;
    private int maxDias;
    private String strMaxLibros;
    private String strMaxDias;
    
    public TipoUsuario(){}
    
    public TipoUsuario(int id){
        try {
            String query = "select * from tipodeusuario where idTipo = ?";
            
            Connection con = Conexion.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, id);
            
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()){
                this.id = rs.getInt(1);
                tipo = rs.getString(2);
                desc = rs.getString(3);
                maxLibros = rs.getInt(4);
                maxDias = rs.getInt(5);
            }
        } catch (SQLException e) {
            log.fatal("Error en sql - " + e.getMessage());
        }
    }
    
    public TipoUsuario(int id, String tipo){
        this.id = id;
        this.tipo = tipo;
    }
    
    public TipoUsuario[] getTipos(){
        ArrayList<TipoUsuario> lista = new ArrayList();
        
        try {
            String query = "select * from tipodeusuario";
            Connection con = Conexion.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();

            if (rs.isBeforeFirst())
                while (rs.next()){
                    lista.add(new TipoUsuario(rs.getInt(1), rs.getString(2)));
                }
            
            rs.close(); stmt.close(); con.close();
            
            return lista.toArray(new TipoUsuario[0]);
        } catch (SQLException e) {
            log.fatal("Error en sql - " + e.getMessage());
        }
        return null;
    }
    
    public boolean setMax(){
        try {
            String query = "update tipodeusuario set TotalDias = ?, TotalLibro = ? where idTipo = ?";
            
            Connection con = Conexion.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, maxDias);
            stmt.setInt(2, maxLibros);
            stmt.setInt(3, id);
            
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            log.fatal("Error en sql - " + e.getMessage());
        }
        return false;
    }
    
    public boolean numValido(){
        try {
            int dias = Integer.parseInt(strMaxDias);
            int libros = Integer.parseInt(strMaxLibros);
            
            if (dias > 0 && libros > 0) {
                maxDias = dias;
                maxLibros = libros;
                return true;
            } 
        } catch (NumberFormatException e) {
            return false;
        }
        return false;
    }
    
    public void iniciar(){
        try {
            String query = "select * from tipodeusuario where idTipo = ?";
            
            Connection con = Conexion.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, id);
            
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                tipo = rs.getString(2);
                desc = rs.getString(3);
                maxLibros = rs.getInt(4);
                maxDias= rs.getInt(5);
            }
        } catch (SQLException e) {
            log.fatal("Error en sql - " + e.getMessage());
        }
    }
    
    @Override
    public String toString(){
        return getTipo();
    }
}