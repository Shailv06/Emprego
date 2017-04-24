package com.shail.dao;

import com.shail.model.Company;
import com.shail.model.JobPost;
import com.shail.model.Profile;
import com.shail.util.DbUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Date;
import java.util.Map;
import java.util.HashMap;
import java.util.List;
import java.util.TreeMap;

/**
 *
 * @author SHAIL-PC
 */
public class CompanyDao {
    
    private Connection con;
    
    public CompanyDao(){
        con = DbUtil.getConnection();
    }
    
    public void addCompany(Company comp){
        try{
            PreparedStatement ps = con.prepareStatement("insert into company(orgNo,companyName,companyEmail,companyPassword) values( ?, ?, ?, ?)");
            ps.setInt(1,comp.getOrgNo());
            ps.setString(2,comp.getName());
            ps.setString(3,comp.getEmail());
            ps.setString(4,comp.getPassword());
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
    
    public boolean authenticate(Company comp){
        try{
            PreparedStatement preparedStatement = con
                    .prepareStatement("select * from company where companyEmail=? and companyPassword=?");
            preparedStatement.setString(1,comp.getEmail());
            preparedStatement.setString(2,comp.getPassword());
            ResultSet rs = preparedStatement.executeQuery();
            if(rs.next()){
                return true;
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return false;
    }
    
    public int countSkillsMatched(int userid,int jobid){
        int count = 0;
        Profile prof = new ProfileDao().getProfileById(userid);
        JobPost post = new CompanyDao().getJobPostById(userid, jobid);
        if(prof.getSkills()==null || post.getKeySkills().length==0 )
            return count;
        String user_skills[] = prof.getSkills().split(",");
        String jobPost_skills[] = post.getKeySkills();
        for(String jskill:jobPost_skills){
            for(String uskill:user_skills){
                if(uskill.equalsIgnoreCase(jskill))
                    count++;
            }
        }
        return count;
    }
    
    public Company getCompanyDetails(Company comp){
        Company new_comp = new Company();
        try{
            PreparedStatement ps = con
                    .prepareStatement("select * from company where companyEmail=? and companyPassword=?");
            ps.setString(1,comp.getEmail());
            ps.setString(2,comp.getPassword());
            ResultSet rs = ps.executeQuery();
            rs.first();
            new_comp.setOrgNo(rs.getInt("orgNo"));
            new_comp.setId(rs.getInt("companyID"));
            new_comp.setName(rs.getString("companyName"));
            new_comp.setEmail(rs.getString("companyEmail"));
            new_comp.setPassword(rs.getString("companyPassword"));
        }catch(SQLException e){
            e.printStackTrace();
        }
        return new_comp;
    }
    
    public Company getCompanyDetailsById(int id){
        try{
            PreparedStatement preparedStatement= con.prepareStatement("Select * from company where companyID=?");
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            rs.first();
            Company comp = new Company();
            comp.setOrgNo(rs.getInt("orgNo"));
            comp.setName(rs.getString("companyName"));
            comp.setEmail(rs.getString("companyEmail"));
            comp.setPassword(rs.getString("companyPassword"));
            return comp;
        }catch(SQLException e){
            e.printStackTrace();
        }
        return null;
    }
    
    public JobPost getJobPostById(int userid, int jobid){
        try{
            PreparedStatement preparedStatement= con.prepareStatement("Select * from jobpost where jobID=? ");
            PreparedStatement preparedStatement1= con.prepareStatement("Select count(*) as Count from jobapplied where seekerID=? and jobID=?");
            preparedStatement.setInt(1, jobid);
            preparedStatement1.setInt(1, userid);
            preparedStatement1.setInt(2, jobid);
            ResultSet rs = preparedStatement.executeQuery();
            ResultSet rs1 = preparedStatement1.executeQuery();
            rs.first();
            rs1.first();
            Company cmp =new CompanyDao().getCompanyDetailsById(rs.getInt("companyID"));
            int shortlisted = new SeekerAlertDao().isShortlisted(userid,rs.getInt("jobID"));
            JobPost post = new JobPost();
            post.setId(rs.getInt("jobID"));
            post.setCompanyId(rs.getInt("companyID"));  
            post.setCompanyName(cmp.getName());  
            post.setDesignation(rs.getString("jobDesignation"));
            post.setDetails(rs.getString("jobDetails"));
            post.setExperience(rs.getString("experience"));
            post.setSpecialization(rs.getString("specialization"));
            post.setQualification(rs.getString("qualification"));
            post.setSalary(rs.getString("salary"));
            post.setVacancy(rs.getInt("vacancy"));
            post.setLocation(rs.getString("location"));
            post.setMobile(rs.getString("contactMobile"));
            post.setEmail(rs.getString("contactEmail"));
            post.setRound(rs.getInt("round"));
            post.setTime(rs.getString("time"));
            post.setApplied(rs1.getInt("Count"));
            post.setShortlisted(shortlisted);
            String keyskills[] = rs.getString("jobKeySkills").split(",");
            post.setKeySkills(keyskills);
            return post;
        }catch(SQLException e){
            e.printStackTrace();
        }
        return null;
    }
    
    public List<JobPost> getAllJobPost(int low ,int upper,int userid){
        List<JobPost> posts = new ArrayList<JobPost>();
        HashMap<JobPost, Integer> map = new HashMap<JobPost, Integer>();
        ValueComparator bvc = new ValueComparator(map);
        TreeMap<JobPost, Integer> sorted_map = new TreeMap<JobPost, Integer>(bvc);

        try{
            PreparedStatement ps = con.prepareStatement("SELECT * FROM `jobpost` where flag=? LIMIT ? , ?");
            ps.setInt(1, 1);
            ps.setInt(2, low);
            ps.setInt(3, upper);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
               JobPost post = new CompanyDao().getJobPostById(userid, rs.getInt("jobID"));
//               System.out.println(rs.getInt("jobID") +"="+new CompanyDao().countSkillsMatched(userid, rs.getInt("jobID")));
               Integer skillCount = new CompanyDao().countSkillsMatched(userid, rs.getInt("jobID"));
               map.put(post,skillCount);
            }
            sorted_map.putAll(map);
            for(Map.Entry m:sorted_map.entrySet()){  
//                JobPost post = (JobPost)m.getKey();
//               System.out.println(post.getId());
               posts.add((JobPost)m.getKey());  
            }  
//            System.out.println("results: " + sorted_map);
            return posts;
        }catch(SQLException e){
            e.printStackTrace();
        }
        return posts;
    }
    
    public List<JobPost> getAllJobPostByCompanyId(int userid){
        List<JobPost> posts = new ArrayList<JobPost>();
        try{
            PreparedStatement ps = con.prepareStatement("SELECT * FROM `jobpost` where companyID =?");
            ps.setInt(1, userid);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
               JobPost post = new JobPost();
               post.setId(rs.getInt("jobID"));
               post.setCompanyId(rs.getInt("companyID"));  
               post.setDesignation(rs.getString("jobDesignation"));
               post.setDetails(rs.getString("jobDetails"));
               post.setExperience(rs.getString("experience"));
               post.setSpecialization(rs.getString("specialization"));
               post.setQualification(rs.getString("qualification"));
               post.setSalary(rs.getString("salary"));
               post.setVacancy(rs.getInt("vacancy"));
               post.setLocation(rs.getString("location"));
               post.setMobile(rs.getString("contactMobile"));
               post.setEmail(rs.getString("contactEmail"));
               post.setRound(rs.getInt("round"));
               post.setTime(rs.getString("time"));
               post.setShortlisted(new CompanyAlertDao().getShortlisted(rs.getInt("jobID")));
               post.setApplied(new CompanyAlertDao().getApplicant(rs.getInt("jobID")));
               String keyskills[] = rs.getString("jobKeySkills").split(",");
               post.setKeySkills(keyskills);
               post.setFlag(rs.getInt("flag"));
               posts.add(post);
            }
            return posts;
        }catch(SQLException e){
            e.printStackTrace();
        }
        return posts;
    }
    
    public void postJob(JobPost post){
        try{
            PreparedStatement ps = con.prepareStatement("Insert into jobPost(`companyID`, `jobDesignation`, `jobKeySkills`, `jobDetails`, `experience`, `specialization`, `qualification`, `salary`, `vacancy`, `location`, `contactMobile`, `contactEmail`, `time`, `flag`) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)"); 
            DateFormat dateFormat = new SimpleDateFormat("HH:mm dd-MM-yy");
            Date date = new Date();
            String skills[] = post.getKeySkills();
            String skill = "";
            for(int i=0;i<skills.length;i++){
                if(!skills[i].equals("")){
                    if(i==0)
                        skill += skills[i];
                    else
                        skill += ","+skills[i];
                }
            }
            ps.setInt(1, post.getCompanyId());
            ps.setString(2,post.getDesignation());
            ps.setString(3,skill);
            ps.setString(4,post.getDetails());
            ps.setString(5,post.getExperience());
            ps.setString(6,post.getSpecialization());
            ps.setString(7,post.getQualification());
            ps.setString(8,post.getSalary());
            ps.setInt(9,post.getVacancy());
            ps.setString(10,post.getLocation());
            ps.setString(11,post.getMobile());
            ps.setString(12,post.getEmail());
            ps.setString(13,dateFormat.format(date));
            ps.setInt(14,1);
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
    
    public static void main(String args[]){
        List<JobPost> employee=new ArrayList<JobPost>();
            employee =new CompanyDao().getAllJobPost(0,10,1);
            for(JobPost emp:employee){
                System.out.print(emp.getId()+"---");
                System.out.print(emp.getCompanyId()+"---");
                System.out.print(emp.getKeySkills()+" -- ");
            System.out.println();
            }
//            new CompanyDao().getAllJobPost(0, 10, 1);
//            System.out.println("Skil"+new CompanyDao().countSkillsMatched(1, 1));
////            Company cmp = new CompanyDao().getCompanyDetailsById(1);
//            System.out.println(cmp.getOrgNo());
//            System.out.println(cmp.getName());
////        String skill[] ={"dfsdfsd","sdf"}; 
//        JobPost post = new JobPost();
//        post.setCompanyId(1);
//        post.setDesignation("fd");
//        post.setKeySkills(skill);
//        new CompanyDao().postJob(post);
    }
}


class ValueComparator implements Comparator<JobPost> {
    Map<JobPost, Integer> base;

    public ValueComparator(Map<JobPost, Integer> base) {
        this.base = base;
    }

    // Note: this comparator imposes orderings that are inconsistent with
    // equals.
    public int compare(JobPost a, JobPost b) {
        if (base.get(a) >= base.get(b)) {
            return -1;
        } else {
            return 1;
        } // returning 0 would merge keys
    }
}