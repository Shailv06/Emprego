package com.shail.dao;

import com.shail.model.JobPost;
import com.shail.model.JobSeeker;
import com.shail.model.Profile;
import java.sql.PreparedStatement;
import com.shail.model.SeekerNotification;
import com.shail.util.DbUtil;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author SHAIL-PC
 */
public class CompanyAlertDao {

    private Connection con;

    public CompanyAlertDao() {
        con = DbUtil.getConnection();
    }
    
    public List<Profile> filter(String skill, boolean internship, boolean project){
        List<Profile> profile = new ArrayList<Profile>();
        try{
            String sql;
            if(internship == true && project == false)
                sql = "SELECT * FROM `jobseekerprofile` WHERE skills Like ? and intern_features1 IS NOT NULL ";
            else if(project == true && internship == false)
                sql = "SELECT * FROM `jobseekerprofile` WHERE skills Like ?  and proj_features1 IS NOT NULL ";
            else if(project == true && internship == true)
                sql = "SELECT * FROM `jobseekerprofile` WHERE skills Like ? and intern_features1 IS NOT NULL and job_features1 IS NOT NULL ";
            else 
                sql = "SELECT * FROM `jobseekerprofile` WHERE skills Like ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1,"%"+skill+"%");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Profile prof = new Profile();
                profile.add(new ProfileDao().getProfileById(rs.getInt("seekerID")));
            }
            return profile;
        }catch(SQLException e){
            e.printStackTrace();
        }
        return profile;
    }
    
    public List<Profile> searchResult(String search){
        List<Profile> profile = new ArrayList<Profile>();
        try{
            String sql = "SELECT * FROM jobseeker a, jobseekerprofile b WHERE (a.seekerID = b.seekerID) AND (a.seekerName LIKE ? OR skills Like ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1,"%"+search+"%");
            ps.setString(2,"%"+search+"%");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Profile prof = new Profile();
                profile.add(new ProfileDao().getProfileById(rs.getInt("seekerID")));
            }
            return profile;
        }catch(SQLException e){
            e.printStackTrace();
        }
        return profile;
    }
    
    public void setNotification(SeekerNotification noti){
        try{
            DateFormat dateFormat = new SimpleDateFormat("HH:mm dd-MM-yy");
            Date date = new Date();
            PreparedStatement ps = con.prepareStatement("insert into companyNotification(jobID,companyID,seekerID,notification,flag,time) values(?, ?, ?, ?, ?, ?) ");
            PreparedStatement ps1 = con.prepareStatement("select * from jobPost where jobID = ?");
            ps1.setInt(1,noti.getJobId());
            ResultSet rs = ps1.executeQuery();
            rs.first();
            ps.setInt(1, noti.getJobId());
            ps.setInt(2, rs.getInt("companyID"));
            ps.setInt(3, noti.getSeekerId());
            ps.setString(4, noti.getJobStatus());
            ps.setInt(5, noti.getFlag());
            ps.setString(6, dateFormat.format(date));
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
        
    }
    
    public void seenAllNotification(int userid){
        try{
            PreparedStatement ps = con.prepareStatement("UPDATE `companyNotification` SET `flag` = ? WHERE `companyID` = ? ");
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
            PreparedStatement ps = con.prepareStatement("Select * from companyNotification where companyID = ? Order By id DESC");
            ps.setInt(1,userid);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                SeekerNotification snoti = new SeekerNotification();
                if(rs.getInt("seekerID")!=0){
                    JobSeeker emp = new JobSeekerDao().getJobSeekerByID(rs.getInt("seekerID"));
                    snoti.setSeekerName(emp.getName());
                }
                JobPost post = new CompanyDao().getJobPostById(userid,rs.getInt("jobID"));
                snoti.setJobName(post.getDesignation());
                snoti.setSeekerId(rs.getInt("seekerID"));
                snoti.setJobId(rs.getInt("jobID"));
                snoti.setJobStatus(rs.getString("notification"));
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
            PreparedStatement ps = con.prepareStatement("Select count(*) as Count from companynotification where companyID=? and flag=?");
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
    
    public void setShortlisted(int userid, int jobid){
        try{
            PreparedStatement ps = con.prepareStatement("UPDATE `jobApplied` SET `Status` = ? WHERE `seekerID` = ? and jobID = ?");
            ps.setString(1,"Shortlisted");
            ps.setInt(2,userid);
            ps.setInt(3,jobid);
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
    
    public int getShortlisted(int jobid){
        try{
            PreparedStatement ps = con.prepareStatement("Select count(*) as Count from jobApplied where status = ? and jobID = ?");
            ps.setString(1,"Shortlisted");
            ps.setInt(2,jobid);
            ResultSet rs = ps.executeQuery();
            rs.first();
            return rs.getInt("Count");
        }catch(SQLException e){
            e.printStackTrace();
        }
        return 0;
    }
    
    public List<Profile> getAllSelected(int jobid){
        List<Profile> seekers = new ArrayList<Profile>();
        try{
            PreparedStatement ps = con.prepareStatement("Select * from jobApplied where status = ? and jobID = ?");
            ps.setString(1,"Selected");
            ps.setInt(2,jobid);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                seekers.add(new ProfileDao().getProfileById(rs.getInt("seekerID")));
            }
            return seekers;
        }catch(SQLException e){
            e.printStackTrace();
        }
        return seekers;
    }
    
    public List<Profile> getAllShortlisted(int jobid){
        List<Profile> seekers = new ArrayList<Profile>();
        try{
            PreparedStatement ps = con.prepareStatement("Select * from jobApplied where status = ? and jobID = ?");
            ps.setString(1,"Shortlisted");
            ps.setInt(2,jobid);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                seekers.add(new ProfileDao().getProfileById(rs.getInt("seekerID")));
            }
            return seekers;
        }catch(SQLException e){
            e.printStackTrace();
        }
        return seekers;
    }
    
    public int getApplicant(int jobid){
        try{
            PreparedStatement ps = con.prepareStatement("Select count(*) as Count from jobApplied where jobID = ?");
            ps.setInt(1,jobid);
            ResultSet rs = ps.executeQuery();
            rs.first();
            return rs.getInt("Count");
        }catch(SQLException e){
            e.printStackTrace();
        }
        return 0;
    }
    
    public List<Profile> getAllApplicant(int jobid){
        List<Profile> seekers = new ArrayList<Profile>();
        try{
            PreparedStatement ps = con.prepareStatement("Select * from jobApplied where status IS NULL and jobID = ?");
            ps.setInt(1,jobid);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Profile prof = new ProfileDao().getProfileById(rs.getInt("seekerID"));
                seekers.add(prof);
            }
            return seekers;
        }catch(SQLException e){
            e.printStackTrace();
        }
        return seekers;
    }
    
    public void selectProfile(int userid, int jobid){
        try{
            PreparedStatement ps = con.prepareStatement("UPDATE `jobApplied` SET `status` = ? where seekerID = ? and jobID = ?");
            ps.setString(1, "Selected");
            ps.setInt(2, userid);
            ps.setInt(3, jobid);
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
    
    public void shortlistProfile(int userid, int jobid){
        try{
            PreparedStatement ps = con.prepareStatement("UPDATE `jobApplied` SET `status` = ? where seekerID = ? and jobID = ?");
            ps.setString(1, "Shortlisted");
            ps.setInt(2, userid);
            ps.setInt(3, jobid);
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }

    public void rejectProfile(int userid, int jobid){
        try{
            PreparedStatement ps = con.prepareStatement("UPDATE `jobApplied` SET `status` = ? where seekerID = ? and jobID = ?");
            ps.setString(1, "Rejected");
            ps.setInt(2, userid);
            ps.setInt(3, jobid);
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
    
    public int getCountPost (int userid){
        int noti=0;
        try{
            PreparedStatement ps = con.prepareStatement("Select count(*) as Count from jobPost where companyID=?");
            ps.setInt(1,userid);
            ResultSet rs = ps.executeQuery();
            rs.first();
            noti = rs.getInt("Count");
        }catch(SQLException e){
            e.printStackTrace();
        }
        return noti;
    }
    
    public void stopPost(int jobid){
        try{
            PreparedStatement ps = con.prepareStatement("UPDATE `jobpost` SET `flag` = ? where jobID = ?");
            ps.setInt(1, 0);
            ps.setInt(2, jobid);
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }

    public static void main(String arg[]){
        List<Profile> noti = new CompanyAlertDao().filter("Pattern Rcognition",true,true);
        for(Profile notif:noti){
            System.out.println(notif.getSeekerName());
        }
//          SeekerNotification not = new SeekerNotification();
//          not.setCompanyId(1);
//          not.setJobId(6);
//          not.setFlag(0);
//          not.setJobStatus("Posted");
//          not.setTime("d");
//          new CompanyAlertDao().setNotification(not);
//            new CompanyAlertDao().shortlistProfile(2,1);
//            new CompanyAlertDao().rejectProfile(1,1);
//            System.out.println(new CompanyAlertDao().getShortlisted(1));
//            System.out.println(new CompanyAlertDao().getApplicant(1));
    }
}
