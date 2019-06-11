package Model;

public class ProdutoVendido {

    private int id_produto_vendido;
    private int id_venda;
    private int id_produto;
    private double quantidade;

    public int getId_produto_vendido() {
        return id_produto_vendido;
    }

    public void setId_produto_vendido(int id_produto_vendido) {
        this.id_produto_vendido = id_produto_vendido;
    }

    public int getId_venda() {
        return id_venda;
    }

    public void setId_venda(int id_venda) {
        this.id_venda = id_venda;
    }

    public int getId_produto() {
        return id_produto;
    }

    public void setId_produto(int id_produto) {
        this.id_produto = id_produto;
    }

    public double getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(double quantidade) {
        this.quantidade = quantidade;
    }
    
    
    
}
