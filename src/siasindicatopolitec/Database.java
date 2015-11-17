/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package siasindicatopolitec;

import java.sql.*;

/**
 *
 *  @author francisco
 */
public class Database {
    public static void main(String args[]) throws SQLException{

    }

    public static Statement conexion(){
        try{
            Class.forName("com.mysql.jdbc.Driver");

            Connection conexion = DriverManager.getConnection("jdbc:mysql://fsanchez.cl/siasindicato","sindicato","holasindicato");

            Statement instruccion = conexion.createStatement();

            return instruccion;
        }
        catch(ClassNotFoundException e){
            System.out.println(e);
            return null;
        }
        catch(SQLException e){
            System.out.println(e);
            return null;
        }
        catch(Exception e){
            System.out.println(e);
            return null;
        }
    }   
}
