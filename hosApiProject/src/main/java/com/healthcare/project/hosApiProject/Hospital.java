package com.healthcare.project.hosApiProject;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class Hospital {

    private Connection connect() {

        Connection con = null;
        String url ="jdbc:mysql://localhost:3306/hospital?serverTimezone=UTC";
		String username ="root";
		String password="";

        try {

        	Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url,username,password);

        } catch (Exception e) {

            e.printStackTrace();

        }

        return con;

    }

    public String readHospital() {

        String output = "";

        try {

            Connection con = connect();

            if (con == null) {

                return "Error while connecting to the database for reading. ";

            }

            // Prepare the html table to be displayed
            output = "<table border='1'><tr><th> Hospital id</th > <th> Hospital name</th ><th > Hospital address</th ><th > H_phone </th ><th > H_email </th > " + " <th> Update </th ><th > Remove </th ></tr > ";

            String query = "select * from hospital_table";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            // iterate through the rows in the result set
            while (rs.next()) {

                String h_id = rs.getString("h_id");
                String h_name = rs.getString("h_name");
                String h_address = rs.getString("h_address");
                String h_phone = rs.getString("h_phone");
                String h_email = rs.getString("h_email");

                // Add into the html table
                //output += "<tr><td><input id='hidHosIDUpdate' name = 'hidHosIDUpdate' type = 'hidden'>"  ;
                output += "<td>" + h_id + "</td>";
                output += "<td>" + h_name + "</td>";
                output += "<td>" + h_address + "</td>";
                output += "<td>" + h_phone + "</td>";
                output += "<td>" + h_email + "</td>";

                // buttons
                output += "<td><input name='btnUpdate' type = 'button' value = 'Update' class='btnUpdate btn btn-secondary' ></td > " + "<td><input name='btnRemove' type = 'button' value = 'Remove' class='btnRemove btn btn-danger' data-itemid = '" + h_id + "'>" + "</td></tr>";

            }

            con.close();

            // Complete the html table
            output += "</table>";

        } catch (Exception e) {

            output = "Error while reading the hospitals.";
            System.err.println(e.getMessage());

        }

        return output;

    }

    public String insertHospital(String h_id,String h_name, String h_address, String h_phone,String h_email) {

        String output = "";

        try {

            Connection con = connect();

            if (con == null) {

                return "Error while connecting to the database for inserting. ";

            }

            // create a prepared statement
    		String quary = " insert into hospital_table (h_id,h_name,h_address,h_phone,h_email)" + " values (?, ?, ?, ?, ?)";
            PreparedStatement preparedStmt = con.prepareStatement(quary);

            // binding values
            preparedStmt.setString(1, h_id);
            preparedStmt.setString(2, h_name);
            preparedStmt.setString(3, h_address);
            preparedStmt.setString(4, h_phone);
            preparedStmt.setString(5, h_email);

            // execute the statement
            preparedStmt.execute();
            con.close();
            String newHospital = readHospital();
            output = "{\"status\":\"success\", \"data\": \"" + newHospital + "\"}";

        } catch (Exception e) {

            output = "{\"status\":\"error\", \"data\":\"Error while inserting the hospital.\"}";
            System.err.println(e.getMessage());

        }

        return output;

    }

    public String updateHospital(String h_id, String h_name, String h_address, String h_phone, String h_email) {

        String output = "";

        try {

            Connection con = connect();

            if (con == null) {

                return "Error while connecting to the database for updating. ";

            }

            // create a prepared statement
            String query = "UPDATE `hospital_table` SET `h_name`=?,`h_address`=?,`h_phone`=?,`h_email`=? WHERE `h_id`=?";
            PreparedStatement preparedStmt = con.prepareStatement(query);

            // binding values
            preparedStmt.setString(1, h_name);
            preparedStmt.setString(2, h_address);
            preparedStmt.setString(3, h_phone);
            preparedStmt.setString(4, h_email);
            preparedStmt.setString(5,h_id);

            // execute the statement
            preparedStmt.execute();
            con.close();
            String newHospital = readHospital();
            output = "{\"status\":\"success\", \"data\": \"" + newHospital + "\"}";

        } catch (Exception e) {

            output = "{\"status\":\"error\", \"data\":\"Error while updating the hospital.\"}";
            System.err.println(e.getMessage());

        }

        return output;

    }

    public String deleteHospital(String h_id) {

        String output = "";

        try {

            Connection con = connect();

            if (con == null) {

                return "Error while connecting to the database for deleting. ";

            }

            // create a prepared statement
            String query = "DELETE FROM `hospital_table` WHERE `h_id`=?";
            PreparedStatement preparedStmt = con.prepareStatement(query);

            // binding values
            preparedStmt.setString(1,h_id);

            // execute the statement
            preparedStmt.execute();
            con.close();
            String newHospital = readHospital();
            output = "{\"status\":\"success\", \"data\": \"" + newHospital + "\"}";

        } catch (Exception e) {

            output = "{\"status\":\"error\", \"data\":\"Error while deleting the hospital.\"}";
            System.err.println(e.getMessage());

        }

        return output;

    }

}
