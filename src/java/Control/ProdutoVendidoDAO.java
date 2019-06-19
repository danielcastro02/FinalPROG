package Control;

import Model.ProdutoVendido;
import Model.Venda;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProdutoVendidoDAO {


    public boolean inserir(ProdutoVendido pv){
        try {
            Connection con = Conexao.getConexao();
            String sql = "insert into produtovendido values (default , ? ,? , ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, pv.getId_venda());
            ps.setInt(2, pv.getId_produto());
            ps.setDouble(3, pv.getQuantidade());
            System.out.println(ps.toString());
            ps.execute();
            sql = "update produto set quantidade = quantidade - ? where id_produto = ? ";
            ps = con.prepareStatement(sql);
            ps.setDouble(1, pv.getQuantidade());
            ps.setInt(2, pv.getId_produto());
            System.out.println(ps.toString());
            ps.execute();
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public List selectPVenda(int id){
        try {
            Connection con = Conexao.getConexao();
            String sql = "select * from produtovendido where id_venda = ?";
            PreparedStatement ps =  con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            List<ProdutoVendido> lc = new ArrayList<ProdutoVendido>();
            while(rs.next()){
                ProdutoVendido pv = new ProdutoVendido();
                pv.setId_produto_vendido(rs.getInt(1));
                pv.setId_venda(rs.getInt(2));
                pv.setId_produto(rs.getInt(3));
                pv.setQuantidade(rs.getDouble(4));
                lc.add(pv);
            }
            return lc;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }
    
}
