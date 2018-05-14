package sv.edu.udb.beans;
import java.sql.*;
import java.util.ArrayList;
import org.apache.log4j.Logger;

public class Usuario {
    
    public Usuario(){ }
    
    public Usuario(String carnet){
        this.carnet = carnet;
    }
    public Usuario(String carnet, String nombre, String apellido, String correo, String telefono, String pass, int tipoUsuario){
        this.carnet = carnet;
        this.nombre = nombre;
        this.apellido = apellido;
        this.correo = correo;
        this.telefono = telefono;
        this.pass = pass;
        this.tipoUsuario = tipoUsuario;
    }


    public String getCarnet() {
        return carnet;
    }

    public void setCarnet(String carnet) {
        this.carnet = carnet;
    }

    public String getNombre() {
        
        try{
            String query = "select carnet, nombre from usuarios where Carnet=?";
            Connection con = Conexion.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, carnet);
            ResultSet rs = stmt.executeQuery();

            if (rs.isBeforeFirst())
                while (rs.next()){
                    this.nombre = rs.getString(2);
                } 
        }
        catch(Exception a){
            
        }
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getCorreo() {
         try{
            String query = "select carnet, correo from usuarios where Carnet=?";
            Connection con = Conexion.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, carnet);
            ResultSet rs = stmt.executeQuery();

            if (rs.isBeforeFirst())
                while (rs.next()){
                    this.correo = rs.getString(2);
                } 
        }
        catch(Exception a){
            
        }
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getTelefono() {
         try{
            String query = "select carnet, telefono from usuarios where Carnet=?";
            Connection con = Conexion.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, carnet);
            ResultSet rs = stmt.executeQuery();

            if (rs.isBeforeFirst())
                while (rs.next()){
                    this.telefono = rs.getString(2);
                } 
        }
        catch(Exception a){
            
        }
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public int getTipo() {
         try{
            String query = "select carnet, tipodeusuario from usuarios where Carnet=?";
            Connection con = Conexion.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, carnet);
            ResultSet rs = stmt.executeQuery();

            if (rs.isBeforeFirst())
                while (rs.next()){
                    this.tipoUsuario = rs.getInt(2);
                } 
        }
        catch(Exception a){
            
        }
        return tipoUsuario;
    }

    public void setTipo(int tipoUsuario) {
        this.tipoUsuario = tipoUsuario;
    }
    
    static final Logger log = Logger.getLogger(Usuario.class);
    
    private String carnet;
    private String nombre;
    private String apellido;
    private String correo;
    private String telefono;
    private String pass;
    private int tipoUsuario;
    private int prestamosActivos;
        
    public String getNombreComp(){
        return getNombre() + " " + getApellido();
    }
    
    public boolean getLleno(){
        return carnet!=null && nombre!=null && apellido!=null && correo!=null && telefono!=null && pass!=null;
    }
    
    public TipoUsuario getTipoClass(){
        return new TipoUsuario(tipoUsuario);
    }
    
    public Usuario[] getListaUsuarios(){
        ArrayList<Usuario> lista = new ArrayList();
        
        try {
            String query = "select * from usuarios";
            Connection con = Conexion.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();

            if (rs.isBeforeFirst())
                while (rs.next()){
                    lista.add(new Usuario(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getInt(7)));
                }
            
            rs.close(); stmt.close(); con.close();
                
            return lista.toArray(new Usuario[0]);
        } catch (SQLException e) {
            System.out.println("Error en sql - " + e.getMessage());
        }
        return null;
    }
        
    public boolean getIngreso(){
        try {
            String query = "insert into usuarios values(?,?,?,?,?,?,?)";
            
            Connection con = Conexion.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, getCarnet());
            stmt.setString(2, getNombre());
            stmt.setString(3, getApellido());
            stmt.setString(4, getCorreo());
            stmt.setString(5, getTelefono());
            stmt.setString(6, getPass());
            stmt.setInt(7, getTipo());
            
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            log.fatal("Error en sql - " + e.getMessage());
        }
        return false;
    }
    
    public boolean getModif(){
        try {
            String query = "update usuarios set nombre=?, Apellido=?, Correo=?, TipodeUsuario=?, Telefono=? where Carnet=?";
            
            Connection con = Conexion.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, getNombre());
            stmt.setString(2, getApellido());
            stmt.setString(3, getCorreo());
            stmt.setInt(4, getTipo());
            stmt.setString(5, getTelefono());
            stmt.setString(6, getCarnet());
            
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            log.fatal("Error en sql - " + e.getMessage());
        }
        return false;
    }
    
    public boolean getModPass(){
        try {
            String query = "update usuarios set Pass=? where Carnet=?";
            
            Connection con = Conexion.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, getPass());
            stmt.setString(2, getCarnet());
            
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            log.fatal("Error en sql - " + e.getMessage());
        }
        return false;
    }
    
    public boolean getEliminar(){
        try {
            String query = "delete from usuarios where Carnet=?";
            
            Connection con = Conexion.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, getCarnet());
            
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            log.fatal("Error en sql - " + e.getMessage());
        }
        return false;
    }
    
    public boolean getExiste(){
        try {
            String query = "select * from usuarios where Carnet = ?";
            
            Connection con = Conexion.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, carnet);
            
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()){
                setCarnet(rs.getString(1));
                setNombre(rs.getString(2));
                setApellido(rs.getString(3));
                setCorreo(rs.getString(4));
                setTelefono(rs.getString(5));
                setPass(rs.getString(6));
                setTipo(rs.getInt(7));
                return true;
            }
        } catch (SQLException e) {
            log.fatal("Error en sql - " + e.getMessage());
        }
        return false;
    }
    
    public double getMora(){
        try {
            String query = "SELECT\n" +
                "    SUM(M.Mora)\n" +
                "FROM\n" +
                "    mora as M\n" +
                "    INNER JOIN prestamos as P ON M.IdPrestamo = P.IdPrestamo\n" +
                "    INNER JOIN usuarios as U ON U.Carnet = P.IdUsuario\n" +
                "WHERE\n" +
                "    U.Carnet = ? AND M.Estado = 1";
            
            Connection con = Conexion.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, carnet);
            
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                double mora = rs.getDouble(1);
                rs.close(); stmt.close(); con.close();
                return mora;
            }
        } catch (SQLException e) {
            log.fatal("Error en sql - " + e.getMessage());
        }
        return 0;
    }
    
    public int getCantPrestamos(){
        try {
            String query = "SELECT COUNT(IdPrestamo) FROM prestamos WHERE estado=1 and IdUsuario=?";
            
            Connection con = Conexion.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, carnet);
            
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                int cant = rs.getInt(1);
                rs.close(); stmt.close(); con.close();
                return cant;
            }
        } catch (SQLException e) {
            log.fatal("Error en sql - " + e.getMessage());
        }
        return 0;
    }
    
    public boolean getSesion(){
        
        try {
            String query = "SELECT * FROM usuarios WHERE Carnet=? AND Pass=?";
            
            Connection con = Conexion.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, carnet);
            stmt.setString(2, pass);
            
            ResultSet rs = stmt.executeQuery();
            if (rs.isBeforeFirst()) {
                
                return  true;
            }
        } catch (SQLException e) {
            log.fatal("Error en sql - " + e.getMessage());
        }        
        return false;
    }
    
    //SELECT COUNT(IdPrestamo) FROM `prestamos` WHERE estado=1 and IdUsuario='MM150054'
}