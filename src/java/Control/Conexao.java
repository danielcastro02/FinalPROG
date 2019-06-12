/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import java.sql.Connection;
 
import java.sql.DriverManager;
 
import java.sql.SQLException;
/**
 *
 * @author Daniel
 */
public class Conexao {
    
    public static Connection conexao;
    
    public static Connection getConexao() throws ClassNotFoundException, SQLException{
        Class.forName("com.mysql.jdbc.Driver");
        if(conexao!=null){
            return conexao;
        }else{
            conexao = DriverManager.getConnection("jdbc:mysql://localhost/cartinhas", "root", "windows#s3rv3r");
            return conexao;
        }
    }
}
