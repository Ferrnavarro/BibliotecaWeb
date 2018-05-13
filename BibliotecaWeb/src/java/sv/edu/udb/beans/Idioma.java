package sv.edu.udb.beans;
import java.sql.*;
import java.util.*;
import org.apache.log4j.Logger;

public class Idioma {


    public static Logger getLog() {
        return log;
    }

    public static void setLog(Logger aLog) {
        log = aLog;
    }


    public int getIdIdioma() {
        return idIdioma;
    }


    public void setIdIdioma(int idIdioma) {
        this.idIdioma = idIdioma;
    }


    public String getIdioma() {
        return idioma;
    }


    public void setIdioma(String idioma) {
        this.idioma = idioma;
    }

    
    private static Logger log = Logger.getLogger(Editorial.class);
    
    private int idIdioma;
    private String idioma;
    
    public Idioma(){}
    
    public Idioma(int id){
        try {
            String query = "select * from idioma where idIdioma = ?";
            
            Connection con = Conexion.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, id);
            
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()){
                this.idIdioma = rs.getInt(1);
                idioma = rs.getString(2);
            }
        } catch (SQLException e) {
            log.fatal("Error en sql - " + e.getMessage());
        }
    }
    
    public Idioma(int id, String idioma){
        this.idIdioma = id;
        this.idioma = idioma;
    }
    
    public Idioma[] getIdiomas(){
        ArrayList<Idioma> lista = new ArrayList();
        
        try {
            String query = "select * from idioma";
            Connection con = Conexion.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();

            if (rs.isBeforeFirst())
                while (rs.next()){
                    lista.add(new Idioma(rs.getInt(1), rs.getString(2)));
                }
            
            rs.close(); stmt.close(); con.close();
            
            return lista.toArray(new Idioma[0]);
        } catch (SQLException e) {
            getLog().fatal("Error en sql - " + e.getMessage());
        }
        return null;
    }
    
    
    
    public void iniciar(){
        try {
            String query = "select * from idioma where idIdioma = ?";
            
            Connection con = Conexion.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, idIdioma);
            
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                idioma = rs.getString(2);
            }
        } catch (SQLException e) {
            getLog().fatal("Error en sql - " + e.getMessage());
        }
    }
    
    @Override
    public String toString(){
        return getIdioma();
    }
}