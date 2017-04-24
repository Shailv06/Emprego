package com.shail.dao;

import com.shail.model.JobSeeker;
import com.shail.model.Profile;
import com.shail.util.DbUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author SHAIL-PC
 */
public class JobSeekerDao {
    
    private Connection con;
    
    public JobSeekerDao(){
        con = DbUtil.getConnection(); 
    }
    
    public void addJobSeeker(JobSeeker employee){
        try{
            PreparedStatement ps = con.prepareStatement("insert into jobseeker(seekerName,seekerMobile, seekerEmail, seekerGender, seekerPassword) values( ?, ?, ?, ?, ?)");
            ps.setString(1,employee.getName());
            ps.setString(2,employee.getMobile());
            ps.setString(3,employee.getEmail());
            ps.setString(4,employee.getGender());
            ps.setString(5,employee.getPassword());
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
    
    
    public boolean authenticate(JobSeeker employee){
        try{
            PreparedStatement preparedStatement = con
                    .prepareStatement("select * from jobseeker where seekerEmail=? and seekerPassword=?");
            preparedStatement.setString(1,employee.getEmail());
            preparedStatement.setString(2,employee.getPassword());
            ResultSet rs = preparedStatement.executeQuery();
            if(rs.next()){
                return true;
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return false;
    }
    
    public JobSeeker getJobSeekerDetails(JobSeeker employee){
        JobSeeker new_emp = new JobSeeker();
        try{
            PreparedStatement preparedStatement = con
                    .prepareStatement("select * from jobseeker where seekerEmail=? and seekerPassword=?");
            preparedStatement.setString(1,employee.getEmail());
            preparedStatement.setString(2,employee.getPassword());
            ResultSet rs = preparedStatement.executeQuery();
            rs.first();
            new_emp.setId(rs.getInt("seekerID"));
            new_emp.setName(rs.getString("seekerName"));
            new_emp.setEmail(rs.getString("seekerEmail"));
            new_emp.setGender(rs.getString("seekerGender"));
        }catch(SQLException e){
            e.printStackTrace();
        }
        return new_emp;
    }
    
    public JobSeeker getJobSeekerByID(int id){
        try{
            PreparedStatement preparedStatement= con.prepareStatement("Select * from jobseeker where seekerID=?");
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            rs.first();
            JobSeeker employee = new JobSeeker();
            employee.setId(rs.getInt("seekerID"));
            employee.setName(rs.getString("seekerName"));
            employee.setEmail(rs.getString("seekerEmail"));
            employee.setGender(rs.getString("seekerGender"));
            employee.setPassword(rs.getString("seekerPassword"));
            return employee;
        }catch(SQLException e){
            e.printStackTrace();
        }
        return null;
    }
    
    public static void main(String args[]){
        JobSeeker employee=new JobSeeker();
        employee.setName("shail");    
        employee.setMobile("8853616224");    
            employee.setEmail("shailv06@gmail.com");
            employee.setGender("Male");
            employee.setPassword("12345");
            new JobSeekerDao().addJobSeeker(employee);
        
    }
}
