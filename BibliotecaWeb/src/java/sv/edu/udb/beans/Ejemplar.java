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
public class Ejemplar {
     private static Logger log = Logger.getLogger(Documentos.class);

   
     public static Logger getLog() {
        return log;
    }

    public static void setLog(Logger aLog) {
        log = aLog;
    }
 public boolean getLleno(){
        return true;
    }

    public int getIdejemplar() {
        return idejemplar;
    }

    public void setIdejemplar(int idejemplar) {
        this.idejemplar = idejemplar;
    }

    public int getIddocumento() {
        return iddocumento;
    }

    public void setIddocumento(int iddocumento) {
        this.iddocumento = iddocumento;
    }

    public String getUbicacion() {
        return ubicacion;
    }

    public void setUbicacion(String ubicacion) {
        this.ubicacion = ubicacion;
    }

    public int getIdestado() {
        return idestado;
    }

    public void setIdestado(int idestado) {
        this.idestado = idestado;
    }
 private int idejemplar;
 private int iddocumento;
 private String ubicacion;
 private int idestado;
 
  public int retornariddoc(int idr){
        String query = "select iddocumento from ejemplar WHERE idejemplar="+idr+"";
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
    } public String retornarubicacion(int idr){
        String query = "select ubicacion from ejemplar WHERE idejemplar ="+idr+"";
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
    public int retornarestado(int idr){
        String query = "select fk_idestado from ejemplar WHERE idejemplar="+idr+"";
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
  private String titulo;

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }
 public Ejemplar(){
     
 }
 public Ejemplar(int idejemplar, int iddocumento, String ubicacion, int idestado, String titulo){
     this.idejemplar = idejemplar;
     this.iddocumento = iddocumento;
    this.ubicacion = ubicacion;
        this.titulo = titulo;

    this.idestado = idestado;
 }
 public Ejemplar[] getListaEjemplar(){
        ArrayList<Ejemplar> lista = new ArrayList();
        
        try {
            String query = "SELECT documentos.Titulo as titulo,ejemplar.idejemplar as ide, documentos.iddocumento as id, ejemplar.Ubicacion as ubicacion, ejemplar.fk_IdEstado as estado from documentos INNER JOIN ejemplar on documentos.idDocumento=ejemplar.idDocumento";
            Connection con = Conexion.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();

            if (rs.isBeforeFirst())
                while (rs.next()){
                    lista.add(new Ejemplar(rs.getInt("ide"),rs.getInt("id"),rs.getString("ubicacion"),rs.getInt("estado"),rs.getString("titulo")));
                    }
            
            rs.close(); stmt.close(); con.close();
                
            return lista.toArray(new Ejemplar[0]);
        } catch (SQLException e) {
            System.out.println("Error en sql - " + e.getMessage());
        }
        return null;
    }
   public boolean getIngreso(){
        try {
            String query = "insert into ejemplar values(DEFAULT,?,?,?)";
            Connection con = Conexion.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, getIddocumento());
            stmt.setString(2, getUbicacion());
            stmt.setInt(3, getIdestado());
            
            
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            getLog().fatal("Error en sql - " + e.getMessage());
        }
        return false;
    }
     public boolean getModiff(int idr){
        try {
            String query = "update ejemplar set iddocumento=?, ubicacion=?, fk_idestado=? WHERE idejemplar="+idr+"";
            Connection con = Conexion.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
             stmt.setInt(1, getIddocumento());
            stmt.setString(2, getUbicacion());
            stmt.setInt(3, getIdestado());
            
            
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            getLog().fatal("Error en sql - " + e.getMessage());
        }
        return false;
    }
      public boolean getEliminar(){
        try {
            String query = "delete from ejemplar where idejemplar=?";
            Connection con = Conexion.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, getIdejemplar());
            
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            getLog().fatal("Error en sql - " + e.getMessage());
        }
        return false;
    }
      public boolean getExiste(){
        try {
            String query = "select * from ejemplar where idejemplar = ?";
            Connection con = Conexion.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, getIdejemplar());
            
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
