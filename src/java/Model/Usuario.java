/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author 2017007243
 */
public class Usuario {

    private int id_usuario;
    private String nome;
    private String usuario;
    private String telefone;
    private String foto_perfil;
    private int administrador;
    private String senha;

    public Usuario() {
    }

    public Usuario(ResultSet rs) {
        try {
            this.id_usuario = rs.getInt(1);
            this.nome = rs.getString(2);
            this.usuario = rs.getString(3);
            this.telefone = rs.getString(5);
            this.foto_perfil = rs.getString(6);
            this.administrador = rs.getInt(7);
            this.senha = rs.getString(4);
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
    }

    public Usuario(HttpServletRequest rs) {
        try {
            this.id_usuario = Integer.parseInt(rs.getParameter("id_usuario"));
        }catch (Exception e) {
            System.out.println(e.getMessage());
        }
        try {
            this.nome = rs.getParameter("nome");
        }catch (Exception e) {
            System.out.println(e.getMessage());
        }
        try {
            this.usuario = rs.getParameter("usuario");
        }catch (Exception e) {
            System.out.println(e.getMessage());
        }
        try {
            this.telefone = rs.getParameter("telefone");
        }catch (Exception e) {
            System.out.println(e.getMessage());
        }
        try {
            this.foto_perfil = rs.getParameter("foto_perfil");
        }catch (Exception e) {
            System.out.println(e.getMessage());
        }
        try {
            this.administrador = Integer.parseInt(rs.getParameter("administrador"));
        }catch (Exception e) {
            System.out.println(e.getMessage());
        }
        try {
            this.senha = rs.getParameter("senha1");
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getFoto_perfil() {
        return foto_perfil;
    }

    public void setFoto_perfil(String foto_perfil) {
        this.foto_perfil = foto_perfil;
    }

    public int getAdministrador() {
        return administrador;
    }

    public void setAdministrador(int administrador) {
        this.administrador = administrador;
    }

}
