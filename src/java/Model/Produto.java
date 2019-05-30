/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Daniel
 */
public class Produto {
    private int id_produto;
    private String nome;
    private String descricao;
    private double valor;
    private int quantidade;

    public Produto() {
    }

    public Produto(ResultSet rs) throws SQLException{
        this.id_produto = rs.getInt(1);
        this.nome = rs.getString(2);
        this.descricao = rs.getString(3);
        this.valor = rs.getDouble(4);
        this.quantidade = rs.getInt(5);
    }
    
    
    public Produto(HttpServletRequest rs) {
        try {
            this.id_produto = Integer.parseInt(rs.getParameter("id_produto"));
        }catch (Exception e) {
            System.out.println(e.getMessage());
        }
        try {
            this.nome = rs.getParameter("nome");
        }catch (Exception e) {
            System.out.println(e.getMessage());
        }
        try {
            this.descricao = rs.getParameter("descricao");
        }catch (Exception e) {
            System.out.println(e.getMessage());
        }
        try {
            this.valor = Double.parseDouble(rs.getParameter("valor"));
        }catch (Exception e) {
            System.out.println(e.getMessage());
        }
        try {
            this.quantidade = Integer.parseInt(rs.getParameter("quantidade"));
        }catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    
    
    public int getId_produto() {
        return id_produto;
    }

    public void setId_produto(int id_produto) {
        this.id_produto = id_produto;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public double getValor() {
        return valor;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }
    
    
}
