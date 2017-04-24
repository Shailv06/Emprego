package com.shail.dao;

import com.shail.model.Company;
import com.shail.model.JobPost;
import com.shail.model.SeekerNotification;
import com.shail.util.DbUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author SHAIL-PC
 */
public class SeekerAlertDao {

    private Connection con;
    
    public SeekerAlertDao(){
        con = DbUtil.getConnection();
    }
    
    public List<JobPost> filter(int userid, String category, String skill, String location, String salary, String exp){
        List<JobPost> posts = new ArrayList<JobPost>();
        try{
            PreparedStatement ps = con.prepareStatement("SELECT * FROM `jobpost` WHERE `jobDesignation` LIKE ? AND jobKeySkills LIKE ? AND location LIKE ? AND salary LIKE ? AND experience LIKE ?");
            ps.setString(1,"%"+category+"%");
            ps.setString(2,"%"+skill+"%");
            ps.setString(3,"%"+location+"%");
            ps.setString(4,"%"+salary+"%");
            ps.setString(5,"%"+exp+"%");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                JobPost post = new JobPost();
                post = new CompanyDao().getJobPostById(userid, rs.getInt("jobID"));
                posts.add(post);
            }
            return posts;
        }catch(SQLException e){
            e.printStackTrace();
        }
        return posts;
    }
    
    public List<JobPost> searchResult(int userid, String search){
        List<JobPost> posts = new ArrayList<JobPost>();
        try{
            PreparedStatement ps = con.prepareStatement("SELECT * FROM `jobpost` WHERE `jobDesignation` LIKE ? OR jobKeySkills LIKE ? OR experience LIKE ? OR specialization LIKE ? OR location LIKE ?");
            ps.setString(1,"%"+search+"%");
            ps.setString(2,"%"+search+"%");
            ps.setString(3,"%"+search+"%");
            ps.setString(4,"%"+search+"%");
            ps.setString(5,"%"+search+"%");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                JobPost post = new JobPost();
                post = new CompanyDao().getJobPostById(userid, rs.getInt("jobID"));
                posts.add(post);
            }
            return posts;
        }catch(SQLException e){
            e.printStackTrace();
        }
        return posts;
    }
    
    public void setNotification(SeekerNotification noti){
        try{
            PreparedStatement ps = con.prepareStatement("insert into seekernotification(seekerID,jobID,jobStatus,flag,time) values( ?, ?, ?, ?,?) ");
            DateFormat dateFormat = new SimpleDateFormat("HH:mm dd-MM-yy");
            Date date = new Date();
            ps.setInt(1,noti.getSeekerId());
            ps.setInt(2,noti.getJobId());
            ps.setString(3,noti.getJobStatus());
            ps.setInt(4,0);
            ps.setString(5,dateFormat.format(date));
            ps.executeUpdate();
        }catch(SQLException e){ 
            e.printStackTrace();
        }
    }
    
    public void seenAllNotification(int userid){
        try{
            PreparedStatement ps = con.prepareStatement("UPDATE `seekernotification` SET `flag` = ? WHERE `seekerID` = ? ");
            ps.setInt(1,1);
            ps.setInt(2,userid);
            ps.executeUpdate();
        }catch(SQLException e){ 
            e.printStackTrace();
        }
    }
    
    public List<SeekerNotification> getAllNotification (int userid){
        List<SeekerNotification> noti = new ArrayList<SeekerNotification>();
        try{
            PreparedStatement ps = con.prepareStatement("Select * from seekernotification where seekerID=? Order By id DESC");
            ps.setInt(1,userid);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                JobPost post = new CompanyDao().getJobPostById(userid,rs.getInt("jobID"));
                SeekerNotification snoti = new SeekerNotification();
                snoti.setCompanyName(post.getCompanyName());
                snoti.setJobName(post.getDesignation());
                snoti.setSeekerId(rs.getInt("seekerID"));
                snoti.setJobId(rs.getInt("jobID"));
                snoti.setJobStatus(rs.getString("jobStatus"));
                snoti.setFlag(rs.getInt("flag"));
                snoti.setTime(rs.getString("time"));
                noti.add(snoti);
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return noti;
    }
    
    public int getCountNotification (int userid){
        int noti=0;
        try{
            PreparedStatement ps = con.prepareStatement("Select count(*) as Count from seekernotification where seekerID=? and flag=?");
            ps.setInt(1,userid);
            ps.setInt(2,0);
            ResultSet rs = ps.executeQuery();
            rs.first();
            noti = rs.getInt("Count");
        }catch(SQLException e){
            e.printStackTrace();
        }
        return noti;
    }
    
    public void setApplied(int userid, int jobid){
        try{
            DateFormat dateFormat = new SimpleDateFormat("HH:mm dd-MM-yy");
            Date date = new Date();
            PreparedStatement ps = con.prepareStatement("insert into jobapplied(jobID,seekerID,time) values(?, ?, ?) ");
            SeekerNotification noti = new SeekerNotification();
            noti.setSeekerId(userid);
            noti.setJobId(jobid);
            noti.setJobStatus("Applied");
            new SeekerAlertDao().setNotification(noti);
            new CompanyAlertDao().setNotification(noti);
            ps.setInt(1,jobid);
            ps.setInt(2,userid);
            ps.setString(3,dateFormat.format(date));
            ps.executeUpdate();
        }catch(SQLException e){ 
            e.printStackTrace();
        }
    }
    
    public List<JobPost> getAllAppliedJob (int userid){
        List<JobPost> apost = new ArrayList<JobPost>();
        try{
            PreparedStatement ps = con.prepareStatement("Select * from jobapplied where seekerID=? Order By id DESC");
            ps.setInt(1,userid);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                JobPost post = new CompanyDao().getJobPostById(userid, rs.getInt("jobID"));
                post.setStatus(rs.getString("status"));
                apost.add(post);
            }
            return apost;
        }catch(SQLException e){
            e.printStackTrace();
        }
        return apost;
    }
    
    
    public int isShortlisted(int userid, int jobid){
        int count = 0;
        try{
            PreparedStatement preparedStatement= con.prepareStatement("Select count(*) as Count from seekershortlisted where seekerID=? and jobID=?");
            preparedStatement.setInt(1, userid);
            preparedStatement.setInt(2, jobid);
            ResultSet rs = preparedStatement.executeQuery();
            rs.first();
            count = rs.getInt("Count");
            return count;
        }catch(SQLException e){
            e.printStackTrace();
        }
        return count;
    }
    
    public void setShortlisted(int userid, int jobid){
        try{
            PreparedStatement ps = con.prepareStatement("insert into seekershortlisted(seekerID,jobID) values( ?, ?) ");
            ps.setInt(1,userid);
            ps.setInt(2,jobid);
            ps.executeUpdate();
        }catch(SQLException e){ 
            e.printStackTrace();
        }
    }
    
    public void removeShortlisted(int userid, int jobid){
        try{
            PreparedStatement ps = con.prepareStatement("DELETE FROM `seekershortlisted` WHERE `seekerID` = ? AND `jobID` = ? ");
            ps.setInt(1,userid);
            ps.setInt(2,jobid);
            ps.executeUpdate();
        }catch(SQLException e){ 
            e.printStackTrace();
        }
    }
    
    public List<JobPost> getAllShortlistedJob (int userid){
        List<JobPost> spost = new ArrayList<JobPost>();
        try{
            PreparedStatement ps = con.prepareStatement("Select * from seekershortlisted where seekerID=? Order By id DESC");
            ps.setInt(1,userid);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                JobPost post = new CompanyDao().getJobPostById(userid, rs.getInt("jobID"));
                spost.add(post);
            }
            return spost;
        }catch(SQLException e){
            e.printStackTrace();
        }
        return spost;
    }
    
    public int getCountShortlisted (int userid){
        int shor = 0;
        try{
            PreparedStatement ps = con.prepareStatement("Select count(*) as Count from seekerShortlisted where seekerID=?");
            ps.setInt(1,userid);
            ResultSet rs = ps.executeQuery();
            rs.first();
            shor = rs.getInt("Count");
        }catch(SQLException e){
            e.printStackTrace();
        }
        return shor;
    }
    
    public static void main(String args[]){
        List<JobPost> emps=new ArrayList<JobPost>();
            emps =new SeekerAlertDao().filter(1,"Web","photoshop","","Rs 9.00 - 15.00 Lacs p.a.","");
            for(JobPost emp:emps){
                 System.out.print(emp.getId()+"---");
                System.out.print(emp.getCompanyId()+"---");
                System.out.print(emp.getDesignation()+" -- ");
                System.out.println();
                
            }
//            new SeekerAlertDao().setShortlisted(1,3);
    }
    
}
