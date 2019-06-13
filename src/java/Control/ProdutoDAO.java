/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import Model.Produto;
import Model.Venda;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Daniel
 */
public class ProdutoDAO {

    public boolean cadastro(Produto pr) {
        try {
            Connection cn = Conexao.getConexao();
            String sql = "insert into produto values (default, ?, ?, ?, ?);";
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setString(1, pr.getNome());
            ps.setString(2, pr.getDescricao());
            ps.setDouble(3, pr.getValor());
            ps.setInt(4, pr.getQuantidade());
            ps.execute();
            return true;
        } catch (Exception e) {
            
            System.out.println(e.getMessage());
            return false;
        }
        
    }

    public Produto selectCompleto(Produto pr) {
        
        try {
            Connection cn = Conexao.getConexao();
            String sql = "select * from produto where nome = ? and descricao = ?;";
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setString(1, pr.getNome());
            ps.setString(2, pr.getDescricao());
            ResultSet rs = ps.executeQuery();
            rs.next();
            return new Produto(rs);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
        
    }
    
    public Produto selectId(int id) {
        
        try {
            Connection cn = Conexao.getConexao();
            String sql = "select * from produto where id_produto = ?;";
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            rs.next();
            return new Produto(rs);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
        
    }
    
    public List select() {
        
        try {
            Connection cn = Conexao.getConexao();
            String sql = "select * from produto;";
            PreparedStatement ps = cn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            List<Produto> ls = new ArrayList<Produto>();
            while(rs.next()){
                ls.add(new Produto(rs));
            }
            return ls;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
        
    }
    
    public List selectCarrinho(int id) {
        
        try {
            Connection cn = Conexao.getConexao();
            String sql = "select p.* from produto as p left outer join carrinho as c on c.id_produto = p.id_produto where c.id_usuario = ?;";
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            List<Produto> ls = new ArrayList<Produto>();
            while(rs.next()){
                ls.add(new Produto(rs));
            }
            return ls;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
        
    }

    boolean updateNome(Produto pr) {
        try {
            Connection cn = Conexao.getConexao();
            String sql = "update produto set nome = ? where id_produto = ?;";
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setString(1, pr.getNome());
            ps.setInt(2, pr.getId_produto());
            ps.execute();
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    boolean updateDescricao(Produto pr) {
        try {
            Connection cn = Conexao.getConexao();
            String sql = "update produto set descricao = ? where id_produto = ?;";
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setString(1, pr.getDescricao());
            ps.setInt(2, pr.getId_produto());
            System.out.println(ps.toString());
            ps.execute();
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }
    boolean updateValor(Produto pr) {
        try {
            Connection cn = Conexao.getConexao();
            String sql = "update produto set valor = ? where id_produto = ?;";
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setDouble(1, pr.getValor());
            ps.setInt(2, pr.getId_produto());
            ps.execute();
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }
    boolean updateQuantidade(Produto pr) {
        try {
            Connection cn = Conexao.getConexao();
            String sql = "update produto set quantidade = ? where id_produto = ?;";
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setInt(1, pr.getQuantidade());
            ps.setInt(2, pr.getId_produto());
            ps.execute();
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

   
    
}
