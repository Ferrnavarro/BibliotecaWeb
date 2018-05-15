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
public class Estado {
    public Estado(){
        
    }
    private String estado;
    private int idestado;

    public int getIdestado() {
        return idestado;
    }

    public void setIdestado(int idestado) {
        this.idestado = idestado;
    }
    
    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
   public Estado(int idestado, String estado){
       this.idestado = idestado;
       this.estado = estado;
       
   }
    public Estado[] getListaEstado(){
        ArrayList<Estado> lista = new ArrayList();
        
        try {
            String query = "select * from estado";
            Connection con = Conexion.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();

            if (rs.isBeforeFirst())
                while (rs.next()){
                    lista.add(new Estado(rs.getInt(1),rs.getString(2)));
                }
            
            rs.close(); stmt.close(); con.close();
                
            return lista.toArray(new Estado[0]);
        } catch (SQLException e) {
            System.out.println("Error en sql - " + e.getMessage());
        }
        return null;
    }
}
