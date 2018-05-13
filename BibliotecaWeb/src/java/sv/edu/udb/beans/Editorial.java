package sv.edu.udb.beans;
import java.sql.*;
import java.util.*;
import org.apache.log4j.Logger;

public class Editorial {

    public static Logger getLog() {
        return log;
    }

    public static void setLog(Logger aLog) {
        log = aLog;
    }

    public int getIdImprenEdi() {
        return idImprenEdi;
    }

    public void setIdImprenEdi(int idImprenEdi) {
        this.idImprenEdi = idImprenEdi;
    }

    public String getLugar() {
        return lugar;
    }

    public void setLugar(String lugar) {
        this.lugar = lugar;
    }

    public int getAnio() {
        return anio;
    }

    public void setAnio(int anio) {
        this.anio = anio;
    }

    
    private static Logger log = Logger.getLogger(Editorial.class);
    
    private int idImprenEdi;
    private String lugar;
    private int anio;
    
    public Editorial(){}
    
    public Editorial(int id){
        try {
            String query = "select * from imprentaeditorial where idImprenEdi = ?";
            
            Connection con = Conexion.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, id);
            
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()){
                this.idImprenEdi = rs.getInt(1);
                lugar = rs.getString(2);
                anio = rs.getInt(3);
            }
        } catch (SQLException e) {
            log.fatal("Error en sql - " + e.getMessage());
        }
    }
    
    public Editorial(int id, String lugar, int anio){
        this.idImprenEdi = id;
        this.lugar = lugar;
        this.anio = anio;
    }
    
    public Editorial[] getEditorial(){
        ArrayList<Editorial> lista = new ArrayList();
        
        try {
            String query = "select * from imprentaeditorial";
            Connection con = Conexion.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();

            if (rs.isBeforeFirst())
                while (rs.next()){
                    lista.add(new Editorial(rs.getInt(1), rs.getString(2), rs.getInt(3)));
                }
            
            rs.close(); stmt.close(); con.close();
            
            return lista.toArray(new Editorial[0]);
        } catch (SQLException e) {
            getLog().fatal("Error en sql - " + e.getMessage());
        }
        return null;
    }
    
    
    
    public void iniciar(){
        try {
            String query = "select * from tipodeusuario where idTipo = ?";
            
            Connection con = Conexion.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, idImprenEdi);
            
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                lugar = rs.getString(2);
                anio = rs.getInt(3);
            }
        } catch (SQLException e) {
            getLog().fatal("Error en sql - " + e.getMessage());
        }
    }
    
    @Override
    public String toString(){
        return getLugar();
    }
}