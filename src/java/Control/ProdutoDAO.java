/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import Model.Produto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
            String sql = "selct * from produto where nome = ?, desxricao = ?, calor = ?, quantidade = ?;";
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setString(1, pr.getNome());
            ps.setString(2, pr.getDescricao());
            ps.setDouble(3, pr.getValor());
            ps.setInt(4, pr.getQuantidade());
            ResultSet rs = ps.executeQuery();
            rs.next();
            return new Produto(rs);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
        
    }
    
}
