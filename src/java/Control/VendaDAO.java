/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import Model.Carrinho;
import Model.ProdutoVendido;
import Model.Venda;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
//            Date data = new Date(System.currentTimeMillis());
            Date data = this.geraData();
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

    public List selectPUsuario(int id) {
        try {
            Connection con = Conexao.getConexao();
            String sql = "select * from venda where id_usuario = ? order by data_venda desc";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            List<Venda> lc = new ArrayList<Venda>();
            while (rs.next()) {
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

    List selectDataMaior(String inicio, String fim) throws ParseException {
        try {
            DateFormat dfm = new SimpleDateFormat("yyyy-MM-dd");
            java.sql.Date dateinicio = new java.sql.Date(dfm.parse(inicio).getTime());
            java.sql.Date datefim = new java.sql.Date(dfm.parse(fim).getTime());
            Connection con = Conexao.getConexao();
            String sql = "select pv.id_produto, count(pv.id_produto), sum(pv.quantidade) from produtoVendido as pv left outer join venda as v on v.id_venda = pv.id_venda where data_venda between ? and ? group by id_produto order by 3 desc";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setDate(1, dateinicio);
            ps.setDate(2, datefim);
            ResultSet rs = ps.executeQuery();
            List<ProdutoVendido> lc = new ArrayList<ProdutoVendido>();
            while (rs.next()) {
                ProdutoVendido v = new ProdutoVendido();
                v.setId_produto(rs.getInt(1));
                v.setQuantidade(rs.getDouble(3));
                lc.add(v);
            }
            return lc;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

    public java.sql.Date geraData() throws ParseException {
        int dia = this.sorteador(1, 28);
        int mes = this.sorteador(1, 12);
        int ano = this.sorteador(2016, 2019);
        String data = "" + ano + "-" + mes + "-" + dia;
        DateFormat dfm = new SimpleDateFormat("yyyy-MM-dd");
        java.sql.Date date = new java.sql.Date(dfm.parse(data).getTime());
        return date;
    }

    public int sorteador(int inicio, int fim) {
        int x = -1;
        while (x == -1 || x > fim || x < inicio) {
            x = (int) Math.random() * fim;
        }
        return x;
    }

    ResultSet selectUsuariosAtivos(String inicio, String fim) {
        try {
            DateFormat dfm = new SimpleDateFormat("yyyy-MM-dd");
            java.sql.Date dateinicio = new java.sql.Date(dfm.parse(inicio).getTime());
            java.sql.Date datefim = new java.sql.Date(dfm.parse(fim).getTime());
            Connection con = Conexao.getConexao();
            String sql = "select\n"
                    + " u.nome,\n"
                    + " count(distinct v.id_venda),\n"
                    + " sum(pv.quantidade),\n"
                    + " sum(pv.quantidade * pr.valor)\n"
                    + "     from \n"
                    + "        (venda as v left outer join \n"
                    + "            (produtovendido as pv left outer join produto as pr \n"
                    + "                on pr.id_produto = pv.id_produto)\n"
                    + "                    on pv.id_venda = v.id_venda) left outer join usuario as u \n"
                    + "                        on v.id_usuario = u.id_usuario where v.data_venda between ? and ?\n"
                    + "                            group by u.id_usuario \n"
                    + "                                ORDER by 4 desc";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setDate(1, dateinicio);
            ps.setDate(2, datefim);
            ResultSet rs = ps.executeQuery();
            return rs;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }
}
