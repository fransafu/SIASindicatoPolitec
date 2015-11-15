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
<<<<<<< HEAD
    public static Connection conexion1() throws SQLException{
        try{
            Class.forName("com.mysql.jdbc.Driver");

            Connection conexion = DriverManager.getConnection("jdbc:mysql://fsanchez.cl/siasindicato","sindicato","holasindicato");

            Statement instruccion = conexion.createStatement();

            return conexion;
        }
        catch(ClassNotFoundException | SQLException e){
            System.out.println(e);
            return null;
        }
       }

    private static void query(String sql) throws SQLException{
        Statement instruccion = conexion();
        ResultSet tabla = instruccion.executeQuery(sql);

        System.out.println("Codigo \t estado");

        while(tabla.next()){
            System.out.println(tabla.getInt(1) + " " + tabla.getString(2));
        }
    }
=======
>>>>>>> 80390864386dc556154e3c75a6ed42e127ffb796
}