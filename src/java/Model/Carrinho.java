/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author Daniel
 */
public class Carrinho {
    private int id_carrinho;
    private int id_usuario;
    private int id_produto;
    private int quantidade;

    public int getId_carrinho() {
        return id_carrinho;
    }

    public void setId_carrinho(int id_carrinho) {
        this.id_carrinho = id_carrinho;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public int getId_produto() {
        return id_produto;
    }

    public void setId_produto(int id_produto) {
        this.id_produto = id_produto;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }
    
    
    
    
}
