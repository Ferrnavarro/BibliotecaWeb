package sv.edu.udb.beans;

import java.sql.*;
import java.util.*;
import org.apache.log4j.Logger;

public class Prestamo {
    static final Logger log = Logger.getLogger(Prestamo.class);
    
    private Usuario usuario;
    private EjemplarPrestamo ejemplar;
    
    private int idPrestamo;
    private String idUsuario;
    private int idEjemplar;
    private java.sql.Date fechaPre;
    private java.sql.Date fechaDev;
    private boolean estado;
    
    public Prestamo(){ };
    
    public Prestamo(int idPrestamo){
        this.idPrestamo = idPrestamo;
    }
    
    public Prestamo(int idPrestamo, String idUsuario, int idEjemplar, java.sql.Date fechaPre, java.sql.Date fechaDev, boolean estado){
        this.idPrestamo = idPrestamo;
        this.idUsuario = idUsuario;
        this.idEjemplar = idEjemplar;
        this.fechaPre = fechaPre;
        this.fechaDev = fechaDev;
        this.estado = estado;
    }

    public int getIdPrestamo() {
        return idPrestamo;
    }

    public void setIdPrestamo(int idPrestamo) {
        this.idPrestamo = idPrestamo;
    }

    public String getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(String idUsuario) {
        this.idUsuario = idUsuario;
        this.usuario = new Usuario(idUsuario);
    }

    public int getIdEjemplar() {
        return idEjemplar;
    }

    public void setIdEjemplar(int idEjemplar) {
        this.idEjemplar = idEjemplar;
        ejemplar = new EjemplarPrestamo(idEjemplar);
    }

    public java.sql.Date getFechaPre() {
        return fechaPre;
    }

    public void setFechaPre(java.sql.Date fechaPre) {
        this.fechaPre = fechaPre;
    }

    public java.sql.Date getFechaDev() {
        return fechaDev;
    }

    public void setFechaDev(java.sql.Date fechaDev) {
        this.fechaDev = fechaDev;
    }

    public boolean isEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }
    
    public boolean getIngresarPrestamo(){
        try {
            String query = "insert into prestamos(IdUsuario, IdEjemplar, Fecha, FechaDevolucion, Estado) values(?,?,?,?,1)";
            String query2 = "update ejemplar set Estado = 1 where IdEjemplar = ?";
            String query3 = "insert into mora (IdPrestamo, Mora, Estado, fecha) values(?,?,1,?)";
            
            Calendar hoy = Calendar.getInstance();
            Calendar devolver = Calendar.getInstance();
            devolver.add(Calendar.DATE, usuario.getTipoClass().getMaxDias());
            
            java.sql.Date sqlHoy = new java.sql.Date(hoy.getTime().getTime());
            java.sql.Date sqlDevolver = new java.sql.Date(devolver.getTime().getTime());
            
            Connection con = Conexion.getConnection();
            PreparedStatement stmt = con.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, idUsuario);
            stmt.setInt(2, idEjemplar);
            stmt.setDate(3, sqlHoy);
            stmt.setDate(4, sqlDevolver);
            
            int p = stmt.executeUpdate();
            int idGenerado = 0;
            ResultSet rs = stmt.getGeneratedKeys();
            if (rs.next()) idGenerado = rs.getInt(1);
            rs.close();
            
            stmt.close(); stmt = null;
            stmt = con.prepareStatement(query2);
            stmt.setInt(1, idEjemplar);
            
            int e = stmt.executeUpdate();
            
            stmt.close(); stmt = null;
            stmt = con.prepareStatement(query3);
            stmt.setInt(1, idGenerado);
            stmt.setFloat(2, 0.0F);
            stmt.setDate(3, sqlDevolver);
            
            int m = stmt.executeUpdate();
            
            return (p > 0 && e > 0 && m > 0);
        } catch (SQLException e) {
            log.fatal("Error en sql - " + e.getMessage());
        }
        return false;
    }
    
    public boolean getExiste(){
        try {
            String query = "select * from prestamos where IdPrestamo = ?";
            
            Connection con = Conexion.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, idPrestamo);
            
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()){
                idPrestamo = rs.getInt(1);
                idUsuario = rs.getString(2);
                idEjemplar = rs.getInt(3);
                fechaPre = rs.getDate(4);
                fechaDev = rs.getDate(5);
                estado = rs.getBoolean(6);
                return true;
            }
        } catch (SQLException e) {
            log.fatal("Error en sql - " + e.getMessage());
        }
        return false;
    }
    
    public boolean getDevolver(){
        try {
            String query = "update prestamos set Estado = ? where IdPrestamo = ?";
            String query2 = "update ejemplar set Estado = ? where IdEjemplar = ?";
            
            Connection con = Conexion.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setBoolean(1, false);
            stmt.setInt(2, idPrestamo);
            
            int p = stmt.executeUpdate();
            
            stmt.close(); stmt = null;
            stmt = con.prepareStatement(query2);
            stmt.setInt(1, 3);
            stmt.setInt(2, idEjemplar);
            
            int e = stmt.executeUpdate();
            
            return (p > 0 && e > 0);
        } catch (SQLException e) {
            log.fatal("Error en sql - " + e.getMessage());
        }
        return false;
    }
    
    public String[][] getListaPrestamos(){
        try {
            ArrayList<String[]> lista = new ArrayList<>();
            
            String query = "SELECT \n" +
                "    P.IdPrestamo, \n" +
                "    P.Fecha, \n" +
                "    P.FechaDevolucion, \n" +
                "    D.Titulo, \n" +
                "    P.IdEjemplar \n" + 
                "FROM \n" +
                "    usuarios AS U \n" +
                "    INNER JOIN prestamos AS P ON U.Carnet = P.IdUsuario\n" +
                "    INNER JOIN ejemplar AS E ON E.IdEjemplar = P.IdEjemplar\n" +
                "    INNER JOIN documentos AS D ON D.idDocumento = E.idDocumento\n" +
                "WHERE\n" +
                "    U.Carnet = ? AND P.Estado = 1";
            Connection con = Conexion.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, idUsuario);
            ResultSet rs = stmt.executeQuery();

            if (rs.isBeforeFirst())
                while (rs.next()){
                    String[] p = {String.valueOf(rs.getInt(1)),rs.getDate(2).toString(),rs.getDate(3).toString(),rs.getString(4),String.valueOf(rs.getInt(5))};
                    lista.add(p);
                }
            
            rs.close(); stmt.close(); con.close();
            return lista.toArray(new String[0][]);
        } catch (SQLException e) {
            log.fatal("Error en sql - " + e.getMessage());
        }
        return null;
    }
    
    public int getPrestamoValido(){
        if (!usuario.getExiste()) return 1;
        if (usuario.getMora() > 0) return 2;
        if (usuario.getTipoClass().getMaxLibros() <= usuario.getCantPrestamos()) return 3;
        if (!ejemplar.getExiste()) return 4;
        if (!ejemplar.getDisponible()) return 5;
        return 0;
    }
}
