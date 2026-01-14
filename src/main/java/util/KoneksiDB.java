/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package util;
import java.sql.*;

public class KoneksiDB {
    public static Connection getConnection() {
        try {
            Class.forName("org.postgresql.Driver"); // Penting agar driver terdeteksi
            String url = "jdbc:postgresql://localhost:5432/dbresto";
            String user = "postgres";
            String pass = "mercy1830";
            return DriverManager.getConnection(url, user, pass);
        } catch (Exception e) {
            System.out.println("Error Koneksi: " + e.getMessage());
            return null;
        }
    }
}
