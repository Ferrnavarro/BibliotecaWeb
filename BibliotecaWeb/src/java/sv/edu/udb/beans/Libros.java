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
public class Libros {
        public Libros(){ }

    private static Logger log = Logger.getLogger(Documentos.class);

    public int getIddocumento() {
        return iddocumento;
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

    public void setIddocumento(int iddocumento) {
        this.iddocumento = iddocumento;
    }

    public int getIdlibro() {
        return idlibro;
    }

    public void setIdlibro(int idlibro) {
        this.idlibro = idlibro;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }
    
    private int iddocumento;
    private int idlibro;
    private String isbn;
    
    
    public Libros (int idlibro,int iddocumento,  String isbn){
        this.idlibro = idlibro;
                this.iddocumento = iddocumento;

        this.isbn = isbn;
    }
     public int retornariddoc(int idr){
        String query = "select iddocumento from libro WHERE idlibro="+idr+"";
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
     public String retornarisbn(int idr){
        String query = "select isbn from libro WHERE idlibro="+idr+"";
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
     public Libros[] getListaLibros(){
        ArrayList<Libros> lista = new ArrayList();
        
        try {
            String query = "select * from libro";
            Connection con = Conexion.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();

            if (rs.isBeforeFirst())
                while (rs.next()){
                    lista.add(new Libros(rs.getInt(1),rs.getInt(2),rs.getString(3)));
                    
                }
            
            rs.close(); stmt.close(); con.close();
                
            return lista.toArray(new Libros[0]);
        } catch (SQLException e) {
            System.out.println("Error en sql - " + e.getMessage());
        }
        return null;
    }
      public boolean getIngreso(){
        try {
            String query = "insert into libro values(DEFAULT,?,?)";
            Connection con = Conexion.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, getIddocumento());
            stmt.setString(2, getIsbn());
            
            
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            getLog().fatal("Error en sql - " + e.getMessage());
        }
        return false;
    }
      
    public boolean getModiff(int idr){
        try {
            String query = "update libro set iddocumento=?, isbn=? WHERE idlibro="+idr+"";
            Connection con = Conexion.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, getIddocumento());
            stmt.setString(2, getIsbn());
            
            
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            getLog().fatal("Error en sql - " + e.getMessage());
        }
        return false;
    }
     public boolean getEliminar(){
        try {
            String query = "delete from libro where idlibro=?";
            Connection con = Conexion.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, getIdlibro());
            
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            getLog().fatal("Error en sql - " + e.getMessage());
        }
        return false;
    }
      public boolean getExiste(){
        try {
            String query = "select * from libro where idlibro = ?";
            Connection con = Conexion.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, getIdlibro());
            
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

