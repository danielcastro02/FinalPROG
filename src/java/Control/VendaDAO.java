/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import Model.Carrinho;
import Model.Venda;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Daniel
 */
public class VendaDAO {
     public Venda vender(Venda v) {
        try {
            Connection con = Conexao.getConexao();
            String sql = "insert into venda values(default, ? , ? , ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setDouble(1, v.getValor());
            ps.setInt(2, v.getId_usuario());
            Date data = new Date(System.currentTimeMillis());
            ps.setDate(3, data);
            ps.execute();
            sql = "select * from venda where valor = ? and id_usuario = ? and data_venda = ?";
            ps = con.prepareStatement(sql);
            ps.setDouble(1, v.getValor());
            ps.setInt(2, v.getId_usuario());
            ps.setDate(3, data);
            ResultSet rs = ps.executeQuery();
            rs.next();
            v.setData_venda(data);
            v.setId_venda(rs.getInt(1));
            return v;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
        
        
    }
     
     
    public List selectPUsuario(int id){
        try {
            Connection con = Conexao.getConexao();
            String sql = "select * from venda where id_usuario = ? order by data_venda desc";
            PreparedStatement ps =  con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            List<Venda> lc = new ArrayList<Venda>();
            while(rs.next()){
                Venda v = new Venda();
                v.setId_venda(rs.getInt(1));
                v.setValor(rs.getDouble(2));
                v.setId_usuario(rs.getInt(3));
                v.setData_venda(rs.getDate(4));
                lc.add(v);
            }
            return lc;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }
}
