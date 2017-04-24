/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shail.controller;

import com.shail.dao.CompanyAlertDao;
import com.shail.dao.CompanyDao;
import com.shail.dao.ProfileDao;
import com.shail.dao.SeekerAlertDao;
import com.shail.model.Company;
import com.shail.model.JobPost;
import com.shail.model.JobSeeker;
import com.shail.model.SeekerNotification;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author SHAIL-PC
 */
@WebServlet(name = "CompanyController", urlPatterns = {"/home2"})
public class CompanyController extends HttpServlet {
    ProfileDao pdao;
    CompanyDao cdao;
    CompanyAlertDao cadao;
    SeekerAlertDao sadao;

    public CompanyController() {
        pdao = new ProfileDao();
        cdao = new CompanyDao();
        cadao = new CompanyAlertDao();
        sadao = new SeekerAlertDao();
    }
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //When someone is logined
        if(request.getParameter("action")!=null){
            if(request.getParameter("action").equalsIgnoreCase("jobNotification")){
                Company user = (Company)request.getSession().getAttribute("user");
                request.setAttribute("notification", cadao.getAllNotification(user.getId()));
                cadao.seenAllNotification(user.getId());
                request.setAttribute("notiCount", cadao.getCountNotification(user.getId()));
                request.setAttribute("postCount", cadao.getCountPost(user.getId()));
                RequestDispatcher view = request.getRequestDispatcher("notification.jsp");
                view.forward(request,response);
            }
            else if(request.getParameter("action").equalsIgnoreCase("postJob")){
                Company user = (Company)request.getSession().getAttribute("user");
                request.setAttribute("notiCount", cadao.getCountNotification(user.getId()));
                request.setAttribute("postCount", cadao.getCountPost(user.getId()));
                RequestDispatcher view = request.getRequestDispatcher("post-job.jsp");
                view.forward(request,response);
            }
            else if(request.getParameter("action").equalsIgnoreCase("jobPosted")){
                Company user = (Company)request.getSession().getAttribute("user");
                request.setAttribute("posts",cdao.getAllJobPostByCompanyId(user.getId()));
                RequestDispatcher view = request.getRequestDispatcher("job-posted.jsp");
                request.setAttribute("notiCount", cadao.getCountNotification(user.getId()));
                request.setAttribute("postCount", cadao.getCountPost(user.getId()));
                view.forward(request,response);
            }
            else if(request.getParameter("action").equalsIgnoreCase("profile_details")){
                int profileid = Integer.parseInt(request.getParameter("profileid"));
                Company user = (Company)request.getSession().getAttribute("user");
                request.setAttribute("profile",pdao.getProfileById(profileid));
                request.setAttribute("notiCount", cadao.getCountNotification(user.getId()));
                request.setAttribute("postCount", cadao.getCountPost(user.getId()));
                RequestDispatcher view = request.getRequestDispatcher("profile-details.jsp");
                view.forward(request,response);
            }
            else if(request.getParameter("action").equalsIgnoreCase("stop")){
                Company user = (Company)request.getSession().getAttribute("user");
                int jobid = Integer.parseInt(request.getParameter("jobid"));
                cadao.stopPost(jobid);
                request.setAttribute("notiCount", cadao.getCountNotification(user.getId()));
                request.setAttribute("postCount", cadao.getCountPost(user.getId()));
                RequestDispatcher view = request.getRequestDispatcher("home?action=jobPosted");
                view.forward(request,response);
            }
            else if(request.getParameter("action").equalsIgnoreCase("applicant")){
                Company user = (Company)request.getSession().getAttribute("user");
                int jobid = Integer.parseInt(request.getParameter("jobid"));
                request.setAttribute("jobid",jobid);
                request.setAttribute("shortlist",cadao.getAllShortlisted(jobid));
                request.setAttribute("selected",cadao.getAllSelected(jobid));
                request.setAttribute("applicant",cadao.getAllApplicant(jobid));
                request.setAttribute("notiCount", cadao.getCountNotification(user.getId()));
                request.setAttribute("postCount", cadao.getCountPost(user.getId()));
                RequestDispatcher view = request.getRequestDispatcher("job-selection.jsp");
                view.forward(request,response);
            }
            else if(request.getParameter("action").equalsIgnoreCase("selection")){
                Company user = (Company)request.getSession().getAttribute("user");
                int jobid = Integer.parseInt(request.getParameter("jobid"));
                int userid = Integer.parseInt(request.getParameter("seekerid"));
                cadao.selectProfile(userid, jobid);
                SeekerNotification noti = new SeekerNotification();
                noti.setSeekerId(userid);
                noti.setJobId(jobid);
                noti.setJobStatus("Selected");
                sadao.setNotification(noti);
                request.setAttribute("notiCount", cadao.getCountNotification(user.getId()));
                request.setAttribute("postCount", cadao.getCountPost(user.getId()));
                RequestDispatcher view = request.getRequestDispatcher("home2?action=applicant&jobid="+jobid);
                view.forward(request,response);
            }
            else if(request.getParameter("action").equalsIgnoreCase("shortlist")){
                Company user = (Company)request.getSession().getAttribute("user");
                int jobid = Integer.parseInt(request.getParameter("jobid"));
                int userid = Integer.parseInt(request.getParameter("seekerid"));
                cadao.shortlistProfile(userid, jobid);
                SeekerNotification noti = new SeekerNotification();
                noti.setSeekerId(userid);
                noti.setJobId(jobid);
                noti.setJobStatus("Shortlisted");
                sadao.setNotification(noti);
                request.setAttribute("notiCount", cadao.getCountNotification(user.getId()));
                request.setAttribute("postCount", cadao.getCountPost(user.getId()));
                RequestDispatcher view = request.getRequestDispatcher("home2?action=applicant&jobid="+jobid);
                view.forward(request,response);
            }
            else if(request.getParameter("action").equalsIgnoreCase("reject")){
                Company user = (Company)request.getSession().getAttribute("user");
                int jobid = Integer.parseInt(request.getParameter("jobid"));
                int userid = Integer.parseInt(request.getParameter("seekerid"));
                cadao.rejectProfile(userid, jobid);
                SeekerNotification noti = new SeekerNotification();
                noti.setSeekerId(userid);
                noti.setJobId(jobid);
                noti.setJobStatus("Rejected");
                sadao.setNotification(noti);
                request.setAttribute("notiCount", cadao.getCountNotification(user.getId()));
                request.setAttribute("postCount", cadao.getCountPost(user.getId()));
                RequestDispatcher view = request.getRequestDispatcher("home2?action=applicant&jobid="+jobid);
                view.forward(request,response);
            }
        }  
        //When someone is logined
        if(request.getSession().getAttribute("user") != null){
            //When company is login then show seeker profile
            if(request.getSession().getAttribute("action")=="company"){
                Company user = (Company)request.getSession().getAttribute("user");
                request.setAttribute("profile",pdao.getAllProfile());
                request.setAttribute("notiCount", cadao.getCountNotification(user.getId()));
                request.setAttribute("postCount", cadao.getCountPost(user.getId()));
                RequestDispatcher view = request.getRequestDispatcher("home.jsp");
                view.forward(request,response);
            }
        }
        
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if(request.getParameter("action").equalsIgnoreCase("signup")){
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            int orgno = Integer.parseInt(request.getParameter("orgNo"));
            String password = request.getParameter("password");
            Company user = new Company();
            user.setName(name);
            user.setEmail(email);
            user.setOrgNo(orgno);
            user.setPassword(password);
            cdao.addCompany(user);
            Company comp = cdao.getCompanyDetails(user);
            request.getSession().setAttribute("user",comp);
            //Setting company  as Session
            request.getSession().setAttribute("action","company");
            RequestDispatcher view = request.getRequestDispatcher("index.jsp");
            view.forward(request,response);
        }
        else if(request.getParameter("action").equalsIgnoreCase("post")){
            JobPost post = new JobPost();
            Company cmp = (Company)request.getSession().getAttribute("user");
            String work[] = request.getParameterValues("work");
            String works = "";
            for(int i=0;i<work.length;i++){
                if(!work[i].equals("")){
                    if(i==0)
                        works += work[i];
                    else
                        works += "|"+work[i];
                }
            }
            post.setCompanyId(cmp.getId());
            post.setDesignation(request.getParameter("designation"));
            post.setKeySkills(request.getParameterValues("skill"));
            post.setDetails(request.getParameter("description"));
            post.setExperience(request.getParameter("experience"));
            post.setSpecialization(request.getParameter("spec"));
            post.setQualification(request.getParameter("qualif"));
            post.setSalary(request.getParameter("salary"));
            post.setVacancy(Integer.parseInt(request.getParameter("vacancy")));
            post.setLocation(works);
            post.setMobile(request.getParameter("mobile"));
            post.setEmail(request.getParameter("email"));
            cdao.postJob(post);
            RequestDispatcher view = request.getRequestDispatcher("index.jsp");
            view.forward(request,response);
        }
        //Filter Section 
        else if(request.getParameter("action").equalsIgnoreCase("filter")){
            String skill = request.getParameter("skills");
            boolean internship =  Boolean.parseBoolean(request.getParameter("internship"));
            boolean project =  Boolean.parseBoolean(request.getParameter("project"));
            if(request.getSession().getAttribute("user")!=null){
                Company user = (Company)request.getSession().getAttribute("user");
                request.setAttribute("notiCount", cadao.getCountNotification(user.getId()));
                request.setAttribute("postCount", cadao.getCountPost(user.getId()));
            }
            request.setAttribute("profile",cadao.filter(skill,internship,project));
            RequestDispatcher view = request.getRequestDispatcher("home.jsp");
            view.forward(request,response);
        }
        else if(request.getParameter("action").equalsIgnoreCase("search")){
            String search = request.getParameter("search");
            if(request.getSession().getAttribute("user")!=null){
                Company user = (Company)request.getSession().getAttribute("user");
                request.setAttribute("notiCount", cadao.getCountNotification(user.getId()));
                request.setAttribute("postCount", cadao.getCountPost(user.getId()));
            }
            request.setAttribute("search",search);
            request.setAttribute("profile",cadao.searchResult(search));
            RequestDispatcher view = request.getRequestDispatcher("home.jsp");
            view.forward(request,response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
