/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import Model.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Daniel
 */
public class UsuarioDAO {

    public boolean cadastro(Usuario us) throws ClassNotFoundException, SQLException {
        Connection cn = Conexao.getConexao();
        try{
            String sql = "insert into usuario values(default, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setString(1, us.getNome());
            ps.setString(2, us.getUsuario());
            ps.setString(3, us.getSenha());
            ps.setString(4, us.getTelefone());
            ps.setString(5, "Imagens/userGeneric.png");
            ps.setInt(6, 0);
            ps.execute();
            return true;
        }catch(Exception e){
            System.out.println(e.getMessage());
            return false;
        }
    }

    public Usuario login(Usuario us) throws ClassNotFoundException, SQLException {
        Connection cn = Conexao.getConexao();
        try{
            String sql = "select * from usuario where usuario = ? and senha = ?;";
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setString(1, us.getUsuario());
            ps.setString(2, us.getSenha());
            ResultSet rs = ps.executeQuery();
            rs.next();
            us = new Usuario(rs);
            return us;
        }catch(Exception e){
            System.out.println(e.getMessage());
            return null;
        }
        
    }
    
}
