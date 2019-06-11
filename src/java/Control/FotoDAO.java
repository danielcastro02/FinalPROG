/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import Model.Foto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author 2017007243
 */
public class FotoDAO {

    public boolean cadastrar(Foto f) {
        try {
            Connection cn = Conexao.getConexao();
            String sql = "insert into foto values (default, ?, ?);";
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setInt(1, f.getId_produto());
            ps.setString(2, f.getCaminho());
            ps.execute();
            return true;
        } catch (Exception e) {
            
            System.out.println(e.getMessage());
            return false;
        }
    }
    
    public String selectPIdProdutO(int id){
        try{
            Connection cn = Conexao.getConexao();
            String sql = "select * from foto where id_produto = ?;";
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            rs.next();
            return rs.getString(3);
        }catch(Exception e){
            System.out.println(e.getMessage());
            return null;
        }
    }
    
}
