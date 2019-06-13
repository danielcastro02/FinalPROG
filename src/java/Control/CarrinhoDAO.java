/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import Model.Carrinho;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Daniel
 */
public class CarrinhoDAO {

    public boolean inserir(Carrinho c) {
        try {
            Connection con = Conexao.getConexao();

            String sql = "select * from carrinho where id_usuario = ? and id_produto = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, c.getId_usuario());
            ps.setInt(2, c.getId_produto());
            ResultSet rs = ps.executeQuery();
            try {
                rs.next();
                int a = rs.getInt(1);
                sql = "update carrinho set quantidade = quantidade+1 where id_carrinho = ?";
                ps = con.prepareStatement(sql);
                ps.setInt(1, a);
                ps.execute();
                return true;
            } catch (Exception e) {
                sql = "insert into carrinho values (default, ? ,?,?)";
                ps = con.prepareStatement(sql);
                ps.setInt(1, c.getId_usuario());
                ps.setInt(2, c.getId_produto());
                ps.setInt(3, c.getQuantidade());
                ps.execute();
                return true;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public int countCarrinho(int id_usuario) {
        try {
            Connection con = Conexao.getConexao();
            String sql = "select count(id_carrinho) from carrinho where id_usuario = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id_usuario);
            ResultSet rs = ps.executeQuery();
            rs.next();
            return rs.getInt(1);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return 0;
        }
    }

    public boolean delete(int id) {
        try {
            Connection con = Conexao.getConexao();
            String sql = "delete from carrinho where id_carrinho = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.execute();
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public List selectCarrinho(int id) {
        try {
            Connection con = Conexao.getConexao();
            String sql = "select * from carrinho where id_usuario = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            List<Carrinho> lc = new ArrayList<Carrinho>();
            while (rs.next()) {
                Carrinho c = new Carrinho();
                c.setId_carrinho(rs.getInt(1));
                c.setId_produto(rs.getInt(3));
                c.setId_usuario(rs.getInt(2));
                c.setQuantidade(rs.getInt(4));
                lc.add(c);
            }
            return lc;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

}
