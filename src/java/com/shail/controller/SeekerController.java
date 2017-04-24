/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shail.controller;

import com.shail.dao.CompanyAlertDao;
import com.shail.dao.CompanyDao;
import com.shail.dao.JobSeekerDao;
import com.shail.dao.ProfileDao;
import com.shail.dao.SeekerAlertDao;
import com.shail.model.Company;
import com.shail.model.JobSeeker;
import com.shail.model.Profile;
import java.io.IOException;
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
@WebServlet(name = "SeekerController", urlPatterns = {"/home"})
public class SeekerController extends HttpServlet {
    
    private CompanyDao cdao;
    private JobSeekerDao jsdao;
    private ProfileDao pdao;
    private SeekerAlertDao sdao;
    private CompanyAlertDao cadao;
    
    public SeekerController() {
        super();
        cdao = new CompanyDao();
        jsdao = new JobSeekerDao();
        pdao = new ProfileDao();
        sdao = new SeekerAlertDao();
        cadao = new CompanyAlertDao();
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
        //for home options
        if(request.getParameter("action")!=null){
            if(request.getParameter("action").equalsIgnoreCase("logout")){
                request.getSession().invalidate();
                request.setAttribute("posts",cdao.getAllJobPost(0,10,0));
                RequestDispatcher view = request.getRequestDispatcher("home.jsp");
                view.forward(request,response);
            }
            else if(request.getParameter("action").equalsIgnoreCase("profile")){
                if(request.getSession().getAttribute("action")=="seeker"){
                    JobSeeker user = (JobSeeker)request.getSession().getAttribute("user");
                    request.setAttribute("profile", pdao.getProfileDetails(user.getId()));
                    request.setAttribute("profilePercent", pdao.profilePercent(user.getId()));
                    request.setAttribute("notiCount", sdao.getCountNotification(user.getId()));
                    request.setAttribute("shortCount", sdao.getCountShortlisted(user.getId()));
                    RequestDispatcher view = request.getRequestDispatcher("profile.jsp");
                    view.forward(request,response);
                }
            }
            else if(request.getParameter("action").equalsIgnoreCase("jobNotification")){
                JobSeeker user = (JobSeeker)request.getSession().getAttribute("user");
                request.setAttribute("notification",sdao.getAllNotification(user.getId()));
                sdao.seenAllNotification(user.getId());
                request.setAttribute("notiCount", sdao.getCountNotification(user.getId()));
                request.setAttribute("shortCount", sdao.getCountShortlisted(user.getId()));
                RequestDispatcher view = request.getRequestDispatcher("notification.jsp");
                view.forward(request,response);
            }
            else if(request.getParameter("action").equalsIgnoreCase("jobShortlisted")){
                JobSeeker user = (JobSeeker)request.getSession().getAttribute("user");
                request.setAttribute("spost",sdao.getAllShortlistedJob(user.getId()));
                request.setAttribute("notiCount", sdao.getCountNotification(user.getId()));
                request.setAttribute("shortCount", sdao.getCountShortlisted(user.getId()));
                RequestDispatcher view = request.getRequestDispatcher("job-shortlisted.jsp");
                view.forward(request,response);
            }
            else if(request.getParameter("action").equalsIgnoreCase("jobApplied")){
                JobSeeker user = (JobSeeker)request.getSession().getAttribute("user");
                request.setAttribute("applied",sdao.getAllAppliedJob(user.getId()));
                RequestDispatcher view = request.getRequestDispatcher("job-applied.jsp");
                request.setAttribute("notiCount", sdao.getCountNotification(user.getId()));
                request.setAttribute("shortCount", sdao.getCountShortlisted(user.getId()));
                view.forward(request,response);
            }
            else if(request.getParameter("action").equalsIgnoreCase("jobDetail")){
                if(request.getSession().getAttribute("user")==null){
                    int jobid = Integer.parseInt(request.getParameter("jobId"));
                    request.setAttribute("post",cdao.getJobPostById(0,jobid));
                    RequestDispatcher view = request.getRequestDispatcher("job-details.jsp");
                    view.forward(request,response);
                }
                else{
                    int jobid = Integer.parseInt(request.getParameter("jobId"));
                    JobSeeker user = (JobSeeker)request.getSession().getAttribute("user");
                    request.setAttribute("post",cdao.getJobPostById(user.getId(),jobid));
                    RequestDispatcher view = request.getRequestDispatcher("job-details.jsp");
                    request.setAttribute("notiCount", sdao.getCountNotification(user.getId()));
                    request.setAttribute("shortCount", sdao.getCountShortlisted(user.getId()));
                    view.forward(request,response);
                }
            }
            else if(request.getParameter("action").equalsIgnoreCase("jobApply")){
                int jobid = Integer.parseInt(request.getParameter("jobId"));
                JobSeeker user = (JobSeeker)request.getSession().getAttribute("user");
                sdao.setApplied(user.getId(),jobid);
                RequestDispatcher view = request.getRequestDispatcher("home?action=jobDetail&jobId="+jobid);
                request.setAttribute("notiCount", sdao.getCountNotification(user.getId()));
                request.setAttribute("shortCount", sdao.getCountShortlisted(user.getId()));
                view.forward(request,response);
            }
            else if(request.getParameter("action").equalsIgnoreCase("shortlist")){
                RequestDispatcher view = null;
                int jobid = Integer.parseInt(request.getParameter("jobId"));
                JobSeeker user = (JobSeeker)request.getSession().getAttribute("user");
                sdao.setShortlisted(user.getId(),jobid);
                if(request.getParameter("action2")==null){
                    view = request.getRequestDispatcher("index.jsp");
                }
                else if(request.getParameter("action2").equals("detail"))
                    view = request.getRequestDispatcher("home?action=jobDetail&jobId="+jobid);
                request.setAttribute("notiCount", sdao.getCountNotification(user.getId()));
                request.setAttribute("shortCount", sdao.getCountShortlisted(user.getId()));
                view.forward(request,response);
                return;
            }
            else if(request.getParameter("action").equalsIgnoreCase("unshortlist")){
                RequestDispatcher view = null;
                int jobid = Integer.parseInt(request.getParameter("jobId"));
                JobSeeker user = (JobSeeker)request.getSession().getAttribute("user");
                sdao.removeShortlisted(user.getId(),jobid);
                if(request.getParameter("action2")==null){
                    view = request.getRequestDispatcher("index.jsp");
                }
                else if(request.getParameter("action2").equalsIgnoreCase("detail"))
                    view = request.getRequestDispatcher("home?action=jobDetail&jobId="+jobid);
                request.setAttribute("notiCount", sdao.getCountNotification(user.getId()));
                request.setAttribute("shortCount", sdao.getCountShortlisted(user.getId()));
                view.forward(request,response);
                return;
            }
        }
        //When someone is logined
        if(request.getSession().getAttribute("user") != null){
            //When seeker is login then show job post
            if(request.getSession().getAttribute("action")=="seeker"){
                JobSeeker user = (JobSeeker)request.getSession().getAttribute("user");
                request.setAttribute("posts",cdao.getAllJobPost(0,10,user.getId()));
                request.setAttribute("notiCount", sdao.getCountNotification(user.getId()));
                request.setAttribute("shortCount", sdao.getCountShortlisted(user.getId()));
                RequestDispatcher view = request.getRequestDispatcher("home.jsp");
                view.forward(request,response);
            }
        }
        
        //When no one is login then job post will show
        else if(request.getSession().getAttribute("user") == null){
            request.setAttribute("posts",cdao.getAllJobPost(0,10,0));
            RequestDispatcher view = request.getRequestDispatcher("home.jsp");
            view.forward(request,response);
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
            String mobile = request.getParameter("mobile");
            String gender = request.getParameter("gender");
            String password = request.getParameter("password");
            JobSeeker user = new JobSeeker();
            user.setName(name);
            user.setMobile(mobile);
            user.setEmail(email);
            user.setGender(gender);
            user.setPassword(password);
            jsdao.addJobSeeker(user);
            JobSeeker emp = jsdao.getJobSeekerDetails(user);
            request.getSession().setAttribute("user",emp);
            pdao.setProfile(emp.getId());
            request.getSession().setAttribute("profilePercent",pdao.profilePercent(user.getId()));
            //Setting seeker  as Session
            request.getSession().setAttribute("action","seeker");
            RequestDispatcher view = request.getRequestDispatcher("index.jsp");
            view.forward(request,response);
        }
        //Filter Section 
        else if(request.getParameter("action").equalsIgnoreCase("filter")){
            String category = request.getParameter("category");
            String skill = request.getParameter("skills");
            String location = request.getParameter("location");
            String salary = request.getParameter("salary");
            String experience = request.getParameter("experience");
            if(request.getSession().getAttribute("user")!=null){
                JobSeeker user = (JobSeeker)request.getSession().getAttribute("user");
                request.setAttribute("notiCount", sdao.getCountNotification(user.getId()));
                request.setAttribute("shortCount", sdao.getCountShortlisted(user.getId()));
                request.setAttribute("posts",sdao.filter(user.getId(),category,skill,location,salary,experience));
            }
            else{
                request.setAttribute("posts",sdao.filter(0,category,skill,location,salary,experience));
            }
            RequestDispatcher view = request.getRequestDispatcher("home.jsp");
            view.forward(request,response);
        }
        //Search Section 
        else if(request.getParameter("action").equalsIgnoreCase("search")){
            String search = request.getParameter("search");
            if(request.getSession().getAttribute("user")!=null){
                JobSeeker user = (JobSeeker)request.getSession().getAttribute("user");
                request.setAttribute("notiCount", sdao.getCountNotification(user.getId()));
                request.setAttribute("shortCount", sdao.getCountShortlisted(user.getId()));
                request.setAttribute("posts",sdao.searchResult(user.getId(),search));
            }
            else{
                request.setAttribute("posts",sdao.searchResult(0,search));
            }
            request.setAttribute("search",search);
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