package Control;

import Model.ProdutoVendido;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class ProdutoVendidoDAO {


    public boolean inserir(ProdutoVendido pv){
        try {
            Connection con = Conexao.getConexao();
            String sql = "insert into produtovendido values (default , ? ,? , ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, pv.getId_venda());
            ps.setInt(2, pv.getId_produto());
            ps.setDouble(3, pv.getQuantidade());
            ps.execute();
            sql = "update produto set quantidade = quantidade - ? where id_produto = ? ";
            ps = con.prepareStatement(sql);
            ps.setDouble(1, pv.getQuantidade());
            ps.setInt(2, pv.getId_produto());
            ps.execute();
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    
}
