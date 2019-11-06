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
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Daniel
 */
public class UsuarioDAO {

    public boolean cadastro(Usuario us) throws ClassNotFoundException, SQLException {
        Connection cn = Conexao.getConexao();
        try {
            String sql = "insert into usuario values(default, ?, ?, ?, ?, ?, ?, 1)";
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setString(1, us.getNome());
            ps.setString(2, us.getUsuario());
            ps.setString(3, us.getSenha());
            ps.setString(4, us.getTelefone());
            ps.setString(5, "Imagens/userGeneric.png");
            ps.setInt(6, 0);
            ps.execute();
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public Usuario login(Usuario us) throws ClassNotFoundException, SQLException {
        Connection cn = Conexao.getConexao();
        try {
            String sql1 = "select count(id_usuario) as a from usuario where usuario = ? and senha = ? and ativo = 1;";
            PreparedStatement ps1 = cn.prepareStatement(sql1);
            ps1.setString(1, us.getUsuario());
            ps1.setString(2, us.getSenha());
            ResultSet rs1 = ps1.executeQuery();
            rs1.next();
            if (rs1.getInt("a") > 0) {
                String sql = "select * from usuario where usuario = ? and senha = ? and ativo = 1;";
                PreparedStatement ps = cn.prepareStatement(sql);
                ps.setString(1, us.getUsuario());
                ps.setString(2, us.getSenha());
                ResultSet rs = ps.executeQuery();
                rs.next();
                us = new Usuario(rs);

                return us;
            } else {
                return null;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }

    }

    boolean updatePerfil(Usuario us) {
        try {
            Connection cn = Conexao.getConexao();
            String sql = "update usuario set foto_perfil = ? where id_usuario = ?;";
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setInt(2, us.getId_usuario());
            ps.setString(1, us.getFoto_perfil());
            ps.execute();
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }

    }

    public List select() {
        try {
            Connection cn = Conexao.getConexao();
            String sql = "select * from usuario";
            PreparedStatement ps = cn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            List<Usuario> ls = new ArrayList<Usuario>();
            while (rs.next()) {
                Usuario us = new Usuario(rs);
                ls.add(us);
            }
            return ls;
        } catch (Exception e) {
            return null;
        }
    }

    boolean update(Usuario user) {
        try {
            Connection cn = Conexao.getConexao();
            String sql = "update usuario set usuario = ?, nome = ? , telefone = ? where id_usuario = ?;";
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setString(2, user.getNome());
            ps.setString(1, user.getUsuario());
            ps.setString(3, user.getTelefone());
            ps.setInt(4, user.getId_usuario());
            ps.execute();
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    boolean updateNome(String parameter, int parseInt) {
        try {
            Connection cn = Conexao.getConexao();
            String sql = "update usuario set nome = ? where id_usuario = ?;";
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setString(1, parameter);
            ps.setInt(2, parseInt);
            ps.execute();
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    boolean updateUsuario(String parameter, int parseInt) {
        try {
            Connection cn = Conexao.getConexao();
            String sql = "update usuario set usuario = ? where id_usuario = ?;";
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setString(1, parameter);
            ps.setInt(2, parseInt);
            ps.execute();
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    boolean updateSenha(String parameter, int parseInt) {
        try {
            Connection cn = Conexao.getConexao();
            String sql = "update usuario set senha = ? where id_usuario = ?;";
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setString(1, parameter);
            ps.setInt(2, parseInt);
            ps.execute();
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    boolean updateTelefone(String parameter, int parseInt) {
        try {
            Connection cn = Conexao.getConexao();
            String sql = "update usuario set telefone = ? where id_usuario = ?;";
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setString(1, parameter);
            ps.setInt(2, parseInt);
            ps.execute();
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    boolean tornaAdm(int parseInt) {
        try {
            Connection cn = Conexao.getConexao();
            String sql = "update usuario set administrador = 1 where id_usuario = ?;";
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setInt(1, parseInt);
            ps.execute();
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    boolean removeAdm(int parseInt) {
        try {
            Connection cn = Conexao.getConexao();
            String sql = "update usuario set administrador = 0 where id_usuario = ?;";
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setInt(1, parseInt);
            ps.execute();
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    boolean ativar(int parseInt) {
        try {
            Connection cn = Conexao.getConexao();
            String sql = "update usuario set ativo = 1 where id_usuario = ?;";
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setInt(1, parseInt);
            ps.execute();
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    boolean desativar(int parseInt) {
        try {
            Connection cn = Conexao.getConexao();
            String sql = "update usuario set ativo = 0 where id_usuario = ?;";
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setInt(1, parseInt);
            ps.execute();
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

}
