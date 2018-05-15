/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.edu.udb.beans;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import org.apache.log4j.Logger;
/**
 *
 * @author Anthony
 */
public class dvd {
     private static Logger log = Logger.getLogger(Documentos.class);

     public dvd(){
         
     }
    
     public static Logger getLog() {
        return log;
    }

    public static void setLog(Logger aLog) {
        log = aLog;
    }
 public boolean getLleno(){
        return true;
    }
 
       private int iddocumento;

       private int iddvd;
       private String isan;

    public int getIddocumento() {
        return iddocumento;
    }

    public void setIddocumento(int iddocumento) {
        this.iddocumento = iddocumento;
    }

    public int getIddvd() {
        return iddvd;
    }

    public void setIddvd(int iddvd) {
        this.iddvd = iddvd;
    }

    public String getIsan() {
        return isan;
    }

    public void setIsan(String isan) {
        this.isan = isan;
    }
       public int retornariddoc(int idr){
        String query = "select iddocumento from dvd WHERE iddvd="+idr+"";
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
        public int retornarisan(int idr){
        String query = "select isan from dvd WHERE iddvd="+idr+"";
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
       public dvd (int iddocumento, int iddvd, String isan){
           this.iddocumento = iddocumento;
           this.iddvd = iddvd;
           this.isan = isan;
       }
       
        public dvd[] getListadvds(){
        ArrayList<dvd> lista = new ArrayList();
        
        try {
            String query = "select * from dvd";
            Connection con = Conexion.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();

            if (rs.isBeforeFirst())
                while (rs.next()){
                    lista.add(new dvd(rs.getInt(1),rs.getInt(2),rs.getString(3)));
                    
                }
            
            rs.close(); stmt.close(); con.close();
                
            return lista.toArray(new dvd[0]);
        } catch (SQLException e) {
            System.out.println("Error en sql - " + e.getMessage());
        }
        return null;
    }
        public boolean getIngreso(){
        try {
            String query = "insert into dvd values(?,DEFAULT,?)";
            Connection con = Conexion.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, getIddocumento());
            stmt.setString(2, getIsan());
            
            
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            getLog().fatal("Error en sql - " + e.getMessage());
        }
        return false;
    }
        public boolean getModiff(int idr){
        try {
            String query = "update dvd set iddocumento=?, isan=? WHERE iddvd="+idr+"";
            Connection con = Conexion.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, getIddocumento());
            stmt.setString(2, getIsan());
            
            
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            getLog().fatal("Error en sql - " + e.getMessage());
        }
        return false;
    }
        public boolean getEliminar(){
        try {
            String query = "delete from dvd where iddvd=?";
            Connection con = Conexion.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, getIddvd());
            
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            getLog().fatal("Error en sql - " + e.getMessage());
        }
        return false;
    }
         public boolean getExiste(){
        try {
            String query = "select * from dvd where iddvd = ?";
            Connection con = Conexion.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, getIddvd());
            
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

