/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DataBase;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


/**
 *
 * @author asus
 */
public class DatabaseConnection {
    private static final String Url = "jdbc:sqlserver://localhost:20880;databaseName=LeaveManagementSystem;encrypt=true;trustServerCertificate=true";
    private static final String User = "dat";
    private static final String Password = "12345";
public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(Url, User, Password);
    
    }
}
