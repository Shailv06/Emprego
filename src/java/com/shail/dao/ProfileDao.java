package com.shail.dao;

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
public class ProfileDao {
 
    private Connection con;
    
    public ProfileDao(){
        con = DbUtil.getConnection();
    }
    
    public void setProfile(int userid){
        try{
            PreparedStatement ps = con.prepareStatement("INSERT INTO `emprego`.`jobseekerprofile` (`seekerID`, `details_10`, `details_12`, `details_graduation`, `other_education1`, `other_education2`, `job_features1`, `job_details1`, `job_features2`, `job_details2`, `skills`, `intern_features1`, `intern_details1`, `intern_features2`, `intern_details2`, `proj_features1`, `proj_details1`, `proj_features2`, `proj_details2`, `proj_features3`, `proj_details3`, `proj_features4`, `proj_details4`, `work_link`) VALUES (?, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)");
            ps.setInt(1,userid);
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
    
    public Profile getProfileDetails(int userId){
        Profile profile = new Profile();
        try{
            PreparedStatement ps = con.prepareStatement("select * from jobSeekerProfile where seekerID=?");
            ps.setInt(1,userId);
            ResultSet rs = ps.executeQuery();
            rs.first();
            profile.setSeekerId(rs.getInt("seekerID"));
            profile.setDetails_10(rs.getString("details_10"));
            profile.setDetails_12(rs.getString("details_12"));
            profile.setDetails_graduation(rs.getString("details_graduation"));
            profile.setOther_education1(rs.getString("other_education1"));
            profile.setOther_education2(rs.getString("other_education2"));
            profile.setJob_features1(rs.getString("job_features1"));
            profile.setJob_details1(rs.getString("job_details1"));
            profile.setJob_features2(rs.getString("job_features2"));
            profile.setJob_details2(rs.getString("job_details2"));
            profile.setSkills(rs.getString("skills"));
            profile.setIntern_features1(rs.getString("intern_features1"));
            profile.setIntern_details1(rs.getString("intern_details1"));
            profile.setIntern_features2(rs.getString("intern_features2"));
            profile.setIntern_details2(rs.getString("intern_details2"));
            profile.setProj_features1(rs.getString("proj_features1"));
            profile.setProj_details1(rs.getString("proj_details1"));
            profile.setProj_features2(rs.getString("proj_features2"));
            profile.setProj_details2(rs.getString("proj_details2"));
            profile.setProj_features3(rs.getString("proj_features3"));
            profile.setProj_details3(rs.getString("proj_details3"));
            profile.setProj_features4(rs.getString("proj_features4"));
            profile.setProj_details4(rs.getString("proj_details4"));
            profile.setWork_link(rs.getString("work_link"));
            return profile;
        }catch(SQLException e){
            e.printStackTrace();
        }
        return profile;
    }
        
    public void updateDetails_10(Profile prof){
        try{ 
            PreparedStatement ps = con.prepareStatement("UPDATE `jobseekerprofile` SET `details_10` = ? where seekerID=?");
            ps.setString(1,prof.getDetails_10());
            ps.setInt(2,prof.getSeekerId());
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
    
    
    public void updateDetails_12(Profile prof){
        try{
            PreparedStatement ps = con.prepareStatement("UPDATE `jobseekerprofile` SET `details_12` = ? where seekerID = ?");
            ps.setString(1,prof.getDetails_12());
            ps.setInt(2,prof.getSeekerId());
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
       
    public void updateDetails_graduation(Profile prof){
        try{
            PreparedStatement ps = con.prepareStatement("UPDATE `jobseekerprofile` SET `details_graduation` = ? where seekerID = ?");
            ps.setString(1,prof.getDetails_graduation());
            ps.setInt(2,prof.getSeekerId());
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
        
    public void updateOther_edu1(Profile prof){
        try{
            PreparedStatement ps = con.prepareStatement("UPDATE `jobseekerprofile` SET `other_education1` = ? where seekerID = ?");
            ps.setString(1,prof.getOther_education1());
            ps.setInt(2,prof.getSeekerId());
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
      
    public void updateOther_edu2(Profile prof){
        try{
            PreparedStatement ps = con.prepareStatement("UPDATE `jobseekerprofile` SET `other_education2` = ? where seekerID = ?");
            ps.setString(1,prof.getOther_education2());
            ps.setInt(2,prof.getSeekerId());
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
    
    public void updateJob1(Profile prof){
        try{
            PreparedStatement ps = con.prepareStatement("UPDATE `jobseekerprofile` SET `job_features1` = ? , `job_details1` = ? where seekerID = ?");
            ps.setString(1,prof.getJob_features1());
            ps.setString(2,prof.getJob_details1());
            ps.setInt(3,prof.getSeekerId());
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
    
    public void updateJob2(Profile prof){
        try{
            PreparedStatement ps = con.prepareStatement("UPDATE `jobseekerprofile` SET `job_features2` = ? , `job_details2` = ? where seekerID = ?");
            ps.setString(1,prof.getJob_features2());
            ps.setString(2,prof.getJob_details2());
            ps.setInt(3,prof.getSeekerId());
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
    
    public void updateSkills(Profile prof){
        try{
            PreparedStatement ps = con.prepareStatement("UPDATE `jobseekerprofile` SET `skills` = ? where seekerID = ?");
            ps.setString(1,prof.getSkills());
            ps.setInt(2,prof.getSeekerId());
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
    
   public void updateIntern1(Profile prof){
        try{
            PreparedStatement ps = con.prepareStatement("UPDATE `jobseekerprofile` SET `intern_features1` = ?, `intern_details1` = ? where seekerID = ?");
            ps.setString(1,prof.getIntern_features1());
            ps.setString(2,prof.getIntern_details1());
            ps.setInt(3,prof.getSeekerId());
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
        
    public void updateIntern2(Profile prof){
        try{
            PreparedStatement ps = con.prepareStatement("UPDATE `jobseekerprofile` SET `intern_features2` = ? , `intern_details2` = ? where seekerID = ?");
            ps.setString(1,prof.getIntern_features2());
            ps.setString(2,prof.getIntern_details2());
            ps.setInt(3,prof.getSeekerId());
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
     
    public void updateProj1(Profile prof){
        try{
            PreparedStatement ps = con.prepareStatement("UPDATE `jobseekerprofile` SET `proj_features1` = ? , `proj_details1` = ? where seekerID = ?");
            ps.setString(1,prof.getProj_features1());
            ps.setString(2,prof.getProj_details1());
            ps.setInt(3,prof.getSeekerId());
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
    
    public void updateProj2(Profile prof){
        try{
            PreparedStatement ps = con.prepareStatement("UPDATE `jobseekerprofile` SET `proj_features2` = ? , `proj_details2` = ? where seekerID = ?");
            ps.setString(1,prof.getProj_features2());
            ps.setString(2,prof.getProj_details2());
            ps.setInt(3,prof.getSeekerId());
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
    
    public void updateProj3(Profile prof){
        try{
            PreparedStatement ps = con.prepareStatement("UPDATE `jobseekerprofile` SET `proj_features3` = ? , `proj_details3` = ? where seekerID = ?");
            ps.setString(1,prof.getProj_features3());
            ps.setString(2,prof.getProj_details3());
            ps.setInt(3,prof.getSeekerId());
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
    
    public void updateProj4(Profile prof){
        try{
            PreparedStatement ps = con.prepareStatement("UPDATE `jobseekerprofile` SET `proj_features4` = ? , `proj_details4` = ? where seekerID = ?");
            ps.setString(1,prof.getProj_features4());
            ps.setString(2,prof.getProj_details4());
            ps.setInt(3,prof.getSeekerId());
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
    
    public void updateWork_link(Profile prof){
        try{
            PreparedStatement ps = con.prepareStatement("UPDATE `jobseekerprofile` SET `work_link` = ? where seekerID = ?");
            ps.setString(1,prof.getWork_link());
            ps.setInt(2,prof.getSeekerId());
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
    
    public int profilePercent(int userid){
        int count = 0, percent = 1;
        try{
            PreparedStatement ps = con.prepareStatement("Select * from jobseekerprofile where seekerID = ?");
            ps.setInt(1,userid);
            ResultSet rs = ps.executeQuery();
            rs.first();
            if(rs.getString("details_10")!=null)
                count++;
            if(rs.getString("details_12")!=null)
                count++;
            if(rs.getString("details_graduation")!=null)
                count++;
            if(rs.getString("other_education1")!=null)
                count++;
            if(rs.getString("other_education2")!=null)
                count++;
            if(rs.getString("job_features1")!=null)
                count++;
            if(rs.getString("job_details1")!=null)
                count++;
            if(rs.getString("job_features1")!=null)
                count++;
            if(rs.getString("skills")!=null)
                count++;
            if(rs.getString("intern_features1")!=null)
                count++;
            if(rs.getString("intern_details1")!=null)
                count++;
            if(rs.getString("intern_features2")!=null)
                count++;
            if(rs.getString("intern_details2")!=null)
                count++;
            if(rs.getString("proj_features1")!=null)
                count++;
            if(rs.getString("proj_details1")!=null)
                count++;
            if(rs.getString("proj_features2")!=null)
                count++;
            if(rs.getString("proj_details2")!=null)
                count++;
            if(rs.getString("proj_features3")!=null)
                count++;
            if(rs.getString("proj_details3")!=null)
                count++;
            if(rs.getString("proj_features4")!=null)
                count++;
            if(rs.getString("proj_details4")!=null)
                count++;
            if(rs.getString("work_link")!=null)
                count++;
            percent = count*100/23;
            return percent;
        }catch(SQLException e){
            e.printStackTrace();
        }
        return percent;
    }
    
    public Profile getProfileById(int userid){
        Profile prof = new Profile();
        try{
            PreparedStatement ps = con.prepareStatement("Select * from jobSeekerProfile where seekerID = ?");
            PreparedStatement ps1 = con.prepareStatement("Select * from jobSeeker where seekerID = ?");
            ps.setInt(1, userid);
            ResultSet rs = ps.executeQuery();
            rs.first();
            ps1.setInt(1,rs.getInt("seekerID"));
            ResultSet rs1 = ps1.executeQuery();
            rs1.first();
            prof.setSeekerId(rs.getInt("seekerID"));
            prof.setSeekerName(rs1.getString("seekerName"));
            prof.setSeekerMobile(rs1.getString("seekerMobile"));
            prof.setSeekerEmail(rs1.getString("seekerEmail"));
            prof.setDetails_10(rs.getString("details_10"));
            prof.setDetails_12(rs.getString("details_12"));
            prof.setDetails_graduation(rs.getString("details_graduation"));
            prof.setOther_education1(rs.getString("other_education1"));
            prof.setOther_education2(rs.getString("other_education2"));
            prof.setJob_features1(rs.getString("job_features1"));
            prof.setJob_details1(rs.getString("job_details1"));
            prof.setJob_features2(rs.getString("job_features2"));
            prof.setJob_details2(rs.getString("job_details2"));
            prof.setSkills(rs.getString("skills"));
            prof.setIntern_features1(rs.getString("intern_features1"));
            prof.setIntern_details1(rs.getString("intern_details1"));
            prof.setIntern_features2(rs.getString("intern_features2"));
            prof.setIntern_details2(rs.getString("intern_details2"));
            prof.setProj_features1(rs.getString("proj_features1"));
            prof.setProj_details1(rs.getString("proj_details1"));
            prof.setProj_features2(rs.getString("proj_features2"));
            prof.setProj_details2(rs.getString("proj_details2"));
            prof.setProj_features3(rs.getString("proj_features3"));
            prof.setProj_details3(rs.getString("proj_details3"));
            prof.setProj_features4(rs.getString("proj_features4"));
            prof.setProj_details4(rs.getString("proj_details4"));
            prof.setWork_link(rs.getString("work_link"));
            return prof;
        }catch(SQLException e){
            e.printStackTrace();
        }
        return prof;
    }
    
    public List<Profile> getAllProfile(){
        List<Profile> profiles = new ArrayList<Profile>();
        try{
            PreparedStatement ps = con.prepareStatement("Select * from jobSeekerProfile");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                PreparedStatement ps1 = con.prepareStatement("Select * from jobSeeker where seekerID = ?");
                ps1.setInt(1,rs.getInt("seekerID"));
                ResultSet rs1 = ps1.executeQuery();
                rs1.first();
                Profile prof = new Profile();
                prof.setSeekerId(rs.getInt("seekerID"));
                prof.setSeekerName(rs1.getString("seekerName"));
                prof.setSeekerMobile(rs1.getString("seekerMobile"));
                prof.setSeekerEmail(rs1.getString("seekerEmail"));
                prof.setDetails_10(rs.getString("details_10"));
                prof.setDetails_12(rs.getString("details_12"));
                prof.setDetails_graduation(rs.getString("details_graduation"));
                prof.setOther_education1(rs.getString("other_education1"));
                prof.setOther_education2(rs.getString("other_education2"));
                prof.setJob_features1(rs.getString("job_features1"));
                prof.setJob_details1(rs.getString("job_details1"));
                prof.setJob_features2(rs.getString("job_features2"));
                prof.setJob_details2(rs.getString("job_details2"));
                prof.setSkills(rs.getString("skills"));
                prof.setIntern_features1(rs.getString("intern_features1"));
                prof.setIntern_details1(rs.getString("intern_details1"));
                prof.setIntern_features2(rs.getString("intern_features2"));
                prof.setIntern_details2(rs.getString("intern_details2"));
                prof.setProj_features1(rs.getString("proj_features1"));
                prof.setProj_details1(rs.getString("proj_details1"));
                prof.setProj_features2(rs.getString("proj_features2"));
                prof.setProj_details2(rs.getString("proj_details2"));
                prof.setProj_features3(rs.getString("proj_features3"));
                prof.setProj_details3(rs.getString("proj_details3"));
                prof.setProj_features4(rs.getString("proj_features4"));
                prof.setProj_details4(rs.getString("proj_details4"));
                prof.setWork_link(rs.getString("work_link"));
                profiles.add(prof);
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return profiles;
    }
    
    
    public static void main(String args[]){
//        Profile employee=new Profile();
//        employee.setName("shail");    
//            employee.setSeekerId(2);
////            employee.setGender("Male");
//            employee.setDetails_10("12345");
//            employee.setDetails_12("12345");
//            employee = new ProfileDao().getProfileDetails(1);
//            System.out.println(new ProfileDao().profilePercent(1));
//        List<Profile> prof = new ArrayList<Profile>();
        Profile pro = new ProfileDao().getProfileById(1);
//        for(Profile pro:prof){
            System.out.println(pro.getDetails_10());
            System.out.println(pro.getSeekerId());
            System.out.println(pro.getSeekerName());
            System.out.println(pro.getSeekerEmail());
            System.out.println(pro.getDetails_12());
            System.out.println(pro.getJob_features1());
//        }
    }
}
