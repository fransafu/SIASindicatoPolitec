/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package siasindicatopolitec;

 
import java.sql.*;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author francisco
 */
public class Database {
   
    private static ResultSet data = null;
     
    public static void main(String[] args) 
    {
        connection();
    }
 
    private static void connection()
    {
        Random random = new Random();
         
        System.out.println("MySQL conexion BD SIASindicatoPolitec.");
        String url = "jdbc:mysql://fsanchez.cl/";
        String dbName = "siasindicato";
        String userName = "sindicato"; 
        String password = "holasindicato";
        Connection db = null;
         
        try {
            System.out.println("Connected to the DB SIASindicatoPolitec");
            db = DriverManager.getConnection(url+dbName,userName,password);
            Statement query = (Statement) db.createStatement(); 
            //query.executeUpdate("INSERT INTO socio (rut, nombre, apellido, fenaci, cod_estado_civil_id, antiguedad) VALUES (19182515,'Francisco', 'Sanchez', 1995-06-02, 1, 2000-12-01)");
             
            data = query.executeQuery("select * from socio");
            printData(data);
            
            db.close();
            System.out.println("closed connection");
        } catch (SQLException ex) {
            System.out.println("SQL Exception");
            //Logger.getLogger(JavaCRUD.class.getName()).log(Level.SEVERE, null, ex);
        }
 
    }
 
    private static void printData(ResultSet data) throws SQLException
    {
        System.out.println("Now here are the names on the table");
        System.out.println("************************************");
        System.out.println("************************************");
        System.out.println("************************************");
        System.out.println("************************************");
         
        while (data.next()) 
        {
            //int id = data.getInt("id");
            
            String rut = data.getString("rut");
            String nombre = data.getString("nombre");
            String apellido = data.getString("apellido");
            String fenaci = data.getString("fenaci");
            String cod_estado_civil_id = data.getString("cod_estado_civil_id");
            String antiguedad = data.getString("antiguedad");


            System.out.println("rut: " + rut);
            System.out.println("nombre: " + nombre);
            System.out.println("apellido: " + apellido);
            System.out.println("fenaci: " + fenaci);
            System.out.println("cod_estado_civil_id: " + cod_estado_civil_id);
            System.out.println("antiguedad: " + antiguedad);
            System.out.println("************************************");
            System.out.println("************************************");
            System.out.println("************************************");
        }
    }
}