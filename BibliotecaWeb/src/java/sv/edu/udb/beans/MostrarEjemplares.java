/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.edu.udb.beans;

/**
 *
 * @author Oscar
 */
public class MostrarEjemplares {
    
    public MostrarEjemplares(){ }
    
    
    
    private String id;
    private String titulo;
    private String autor;
    private String descripcion;
    private String notas;
    private String idioma;
    private String edicion;
    private String generico1;
    private String generico2;
    private String generico3;
    
    
    
     public String getAutor() {
        return autor;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }
    
    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getNotas() {
        return notas;
    }

    public void setNotas(String notas) {
        this.notas = notas;
    }

    public String getIdioma() {
        return idioma;
    }

    public void setIdioma(String idioma) {
        this.idioma = idioma;
    }

    public String getEdicion() {
        return edicion;
    }

    public void setEdicion(String edicion) {
        this.edicion = edicion;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getGenerico1() {
        return generico1;
    }

    public void setGenerico1(String generico1) {
        this.generico1 = generico1;
    }

    public String getGenerico2() {
        return generico2;
    }

    public void setGenerico2(String generico2) {
        this.generico2 = generico2;
    }

    public String getGenerico3() {
        return generico3;
    }

    public void setGenerico3(String generico3) {
        this.generico3 = generico3;
    }
}
