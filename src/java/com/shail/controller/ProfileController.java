/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shail.controller;

import com.shail.dao.ProfileDao;
import com.shail.model.JobSeeker;
import com.shail.model.Profile;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
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
@WebServlet(name = "ProfileController", urlPatterns = {"/profile"})
public class ProfileController extends HttpServlet {

    private ProfileDao pdao;

    public ProfileController() {
        super();
        pdao = new ProfileDao();
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
        response.setContentType("text/html;charset=UTF-8");
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
        processRequest(request, response);
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
        String action = request.getParameter("action");
        if(action.equals("details10")){
            String year = request.getParameter("year");
            String board = request.getParameter("board");
            String percent = request.getParameter("percent");
            String school = request.getParameter("school");
            String details10 = year+","+board+","+percent+","+school;
            Profile prof = new Profile();
            JobSeeker user = (JobSeeker)request.getSession().getAttribute("user");
            prof.setSeekerId(user.getId());
            prof.setDetails_10(details10);
            pdao.updateDetails_10(prof);
        }
        else if(action.equals("details12")){
            String year = request.getParameter("year");
            String board = request.getParameter("board");
            String percent = request.getParameter("percent");
            String school = request.getParameter("school");
            String details12 = year+","+board+","+percent+","+school;
            Profile prof = new Profile();
            JobSeeker user = (JobSeeker)request.getSession().getAttribute("user");
            prof.setSeekerId(user.getId());
            prof.setDetails_12(details12);
            pdao.updateDetails_12(prof);
        }
        else if(action.equals("detailsGrad")){
            String year = request.getParameter("college");
            String degree = request.getParameter("degree");
            String stream = request.getParameter("stream");
            String percent = request.getParameter("percent");
            String detailsGrad = year+","+degree+","+stream+","+percent;
            Profile prof = new Profile();
            JobSeeker user = (JobSeeker)request.getSession().getAttribute("user");
            prof.setSeekerId(user.getId());
            prof.setDetails_graduation(detailsGrad);
            pdao.updateDetails_graduation(prof);
        }
        else if(action.equals("otherEdu1")){
            String edu = request.getParameter("edu");
            String year = request.getParameter("college");
            String degree = request.getParameter("degree");
            String percent = request.getParameter("percent");
            String stream = request.getParameter("stream");
            String otherEdu1 = edu+","+year+","+degree+","+stream+","+percent;
            Profile prof = new Profile();
            JobSeeker user = (JobSeeker)request.getSession().getAttribute("user");
            prof.setSeekerId(user.getId());
            prof.setOther_education1(otherEdu1);
            pdao.updateOther_edu1(prof);
        }
        else if(action.equals("otherEdu2")){
            String edu = request.getParameter("edu");
            String year = request.getParameter("college");
            String degree = request.getParameter("degree");
            String percent = request.getParameter("percent");
            String stream = request.getParameter("stream");
            String otherEdu2 = edu+","+year+","+degree+","+stream+","+percent;
            Profile prof = new Profile();
            JobSeeker user = (JobSeeker)request.getSession().getAttribute("user");
            prof.setSeekerId(user.getId());
            prof.setOther_education2(otherEdu2);
            pdao.updateOther_edu2(prof);
        }
        else if(action.equals("otherEdu")){
            String edu = request.getParameter("edu");
            String year = request.getParameter("college");
            String degree = request.getParameter("degree");
            String percent = request.getParameter("percent");
            String stream = request.getParameter("stream");
            String otherEdu = edu+","+year+","+degree+","+stream+","+percent;
            Profile prof = new Profile();
            JobSeeker user = (JobSeeker)request.getSession().getAttribute("user");
            prof.setSeekerId(user.getId());
            prof = pdao.getProfileDetails(user.getId());
            if(prof.getOther_education1() == null){
                prof.setOther_education1(otherEdu);
                pdao.updateOther_edu1(prof);
            }
            else if(prof.getOther_education2() == null){
                prof.setOther_education2(otherEdu);
                pdao.updateOther_edu2(prof);
            }
        }
        else if(action.equals("job1")){
            String designation = request.getParameter("designation");
            String organisation = request.getParameter("organisation");
            String sDate = request.getParameter("sDate");
            String eDate = request.getParameter("eDate");
            String description = request.getParameter("description");
            String job1 = designation+","+organisation+","+sDate+","+eDate;
            Profile prof = new Profile();
            JobSeeker user = (JobSeeker)request.getSession().getAttribute("user");
            prof.setSeekerId(user.getId());
            prof.setJob_features1(job1);
            prof.setJob_details1(description);
            pdao.updateJob1(prof);
        }
        else if(action.equals("job2")){
            String designation = request.getParameter("designation");
            String organisation = request.getParameter("organisation");
            String sDate = request.getParameter("sDate");
            String eDate = request.getParameter("eDate");
            String description = request.getParameter("description");
            String job2 = designation+","+organisation+","+sDate+","+eDate;
            Profile prof = new Profile();
            JobSeeker user = (JobSeeker)request.getSession().getAttribute("user");
            prof.setSeekerId(user.getId());
            prof.setIntern_features2(job2);
            prof.setJob_details2(description);
            pdao.updateJob2(prof);
        }
        else if(action.equals("job")){
            String designation = request.getParameter("designation");
            String organisation = request.getParameter("organisation");
            String sDate = request.getParameter("sDate");
            String eDate = request.getParameter("eDate");
            String description = request.getParameter("description");
            String job = designation+","+organisation+","+sDate+","+eDate;
            Profile prof = new Profile();
            JobSeeker user = (JobSeeker)request.getSession().getAttribute("user");
            prof = pdao.getProfileDetails(user.getId());
            if(prof.getJob_features1() == null){
                prof.setJob_features1(job);
                prof.setJob_details1(designation);
                pdao.updateJob1(prof);
            }
            else if(prof.getJob_features2() == null){
                prof.setJob_features2(job);
                prof.setJob_details2(designation);
                pdao.updateJob2(prof);
            }
        }
        else if(action.equals("skills")){
            String []skill = request.getParameterValues("skill");
            StringBuffer skills = new StringBuffer();
            for(int i=0;i<skill.length;i++)
            {
                if(i==skill.length-1){
                   skills.append(skill[i]);  
                }
                else
                {
                   skills.append(skill[i]+",");  
                }
            }
            Profile prof = new Profile();
            JobSeeker user = (JobSeeker)request.getSession().getAttribute("user");
            prof.setSeekerId(user.getId());
            prof.setSkills(skills.toString());
            pdao.updateSkills(prof);
        }
        else if(action.equals("newskill")){
            String skills = "";
            String skill = request.getParameter("skill");
            Profile prof = new Profile();
            JobSeeker user = (JobSeeker)request.getSession().getAttribute("user");
            prof = pdao.getProfileDetails(user.getId());
            if(prof.getSkills() == null){
                skills = skill;
            }
            else{
                skills = "," + skill;
            }
            String newskill = prof.getSkills() + skills;
            prof.setSeekerId(user.getId());
            prof.setSkills(newskill);
            pdao.updateSkills(prof);
        }
        else if(action.equals("intern1")){
            String profile = request.getParameter("profile");
            String organisation = request.getParameter("organisation");
            String sDate = request.getParameter("sDate");
            String eDate = request.getParameter("eDate");
            String details = request.getParameter("description");
            String intern1 = profile+","+organisation+","+sDate+","+eDate;
            Profile prof = new Profile();
            JobSeeker user = (JobSeeker)request.getSession().getAttribute("user");
            prof.setSeekerId(user.getId());
            prof.setIntern_features1(intern1);
            prof.setIntern_details1(details);
            pdao.updateIntern1(prof);
        }   
        else if(action.equals("intern2")){
            String profile = request.getParameter("profile");
            String organisation = request.getParameter("organisation");
            String sDate = request.getParameter("sDate");
            String eDate = request.getParameter("eDate");
            String details = request.getParameter("description");
            String intern2 = profile+","+organisation+","+sDate+","+eDate;
            Profile prof = new Profile();
            JobSeeker user = (JobSeeker)request.getSession().getAttribute("user");
            prof.setSeekerId(user.getId());
            prof.setIntern_features2(intern2);
            prof.setIntern_details2(details);
            pdao.updateIntern2(prof);
        }
        else if(action.equals("intern")){
            String profile = request.getParameter("profile");
            String organisation = request.getParameter("organisation");
            String sDate = request.getParameter("sDate");
            String eDate = request.getParameter("eDate");
            String details = request.getParameter("description");
            String intern = profile+","+organisation+","+sDate+","+eDate;
            Profile prof = new Profile();
            JobSeeker user = (JobSeeker)request.getSession().getAttribute("user");
            prof = pdao.getProfileDetails(user.getId());
            if(prof.getIntern_features1()==null){
                prof.setSeekerId(user.getId());
                prof.setIntern_features1(intern);
                prof.setIntern_details1(details);
                pdao.updateIntern1(prof);
            }
            else if(prof.getIntern_features2() == null){
                prof.setSeekerId(user.getId());
                prof.setIntern_features2(intern);
                prof.setIntern_details2(details);
                pdao.updateIntern2(prof);
            }
        }
        else if(action.equals("proj1")){
            String title = request.getParameter("title");
            String sDate = request.getParameter("sDate");
            String eDate = request.getParameter("eDate");
            String details = request.getParameter("description");
            String proj1 = title+","+sDate+","+eDate;
            Profile prof = new Profile();
            JobSeeker user = (JobSeeker)request.getSession().getAttribute("user");
            prof.setSeekerId(user.getId());
            prof.setProj_features1(proj1);
            prof.setProj_details1(details);
            pdao.updateProj1(prof);
        }
        else if(action.equals("proj2")){
            String title = request.getParameter("title");
            String sDate = request.getParameter("sDate");
            String eDate = request.getParameter("eDate");
            String details = request.getParameter("description");
            String proj2 = title+","+sDate+","+eDate;
            Profile prof = new Profile();
            JobSeeker user = (JobSeeker)request.getSession().getAttribute("user");
            prof.setSeekerId(user.getId());
            prof.setProj_features2(proj2);
            prof.setProj_details2(details);
            pdao.updateProj2(prof);
        }
        else if(action.equals("proj3")){
            String title = request.getParameter("title");
            String sDate = request.getParameter("sDate");
            String eDate = request.getParameter("eDate");
            String details = request.getParameter("description");
            String proj3 = title+","+sDate+","+eDate;
            Profile prof = new Profile();
            JobSeeker user = (JobSeeker)request.getSession().getAttribute("user");
            prof.setSeekerId(user.getId());
            prof.setProj_features3(proj3);
            prof.setProj_details3(details);
            pdao.updateProj3(prof);
        }
        else if(action.equals("proj4")){
            String title = request.getParameter("title");
            String sDate = request.getParameter("sDate");
            String eDate = request.getParameter("eDate");
            String details = request.getParameter("description");
            String proj4 = title+","+sDate+","+eDate;
            Profile prof = new Profile();
            JobSeeker user = (JobSeeker)request.getSession().getAttribute("user");
            prof.setSeekerId(user.getId());
            prof.setProj_features4(proj4);
            prof.setProj_details4(details);
            pdao.updateProj4(prof);
        }
        else if(action.equals("proj")){
            String title = request.getParameter("title");
            String sDate = request.getParameter("sDate");
            String eDate = request.getParameter("eDate");
            String details = request.getParameter("description");
            String proj = title+","+sDate+","+eDate;
            Profile prof = new Profile();
            JobSeeker user = (JobSeeker)request.getSession().getAttribute("user");
            prof = pdao.getProfileDetails(user.getId());
            if(prof.getProj_features1() == null){
                prof.setSeekerId(user.getId());
                prof.setProj_features1(proj);
                prof.setProj_details1(details);
                pdao.updateProj1(prof);
            }
            else if(prof.getProj_features2() == null){
                prof.setSeekerId(user.getId());
                prof.setProj_features2(proj);
                prof.setProj_details2(details);
                pdao.updateProj2(prof);
            }
            else if(prof.getProj_features3() == null){
                prof.setSeekerId(user.getId());
                prof.setProj_features3(proj);
                prof.setProj_details3(details);
                pdao.updateProj3(prof);
            }
            else if(prof.getProj_features3() == null){
                prof.setSeekerId(user.getId());
                prof.setProj_features3(proj);
                prof.setProj_details3(details);
                pdao.updateProj3(prof);
            }
        }
        else if(action.equals("worklink")){
            String []work = request.getParameterValues("worklink");
            StringBuffer works = new StringBuffer();
            for(int i=0;i<work.length;i++)
            {
                if(i==work.length-1){
                   works.append(work[i]);  
                }
                else
                {
                   works.append(work[i]+",");  
                }
            }
            Profile prof = new Profile();
            JobSeeker user = (JobSeeker)request.getSession().getAttribute("user");
            prof.setSeekerId(user.getId());
            prof.setWork_link(works.toString());
            pdao.updateWork_link(prof);
        }
        else if(action.equals("newworklink")){
            String works = "";
            String work = request.getParameter("worklink");
            Profile prof = new Profile();
            JobSeeker user = (JobSeeker)request.getSession().getAttribute("user");
            prof = pdao.getProfileDetails(user.getId());
            if(prof.getWork_link() == null){
                works = work;
            }
            else{
                works = "," + work;
            }
            String newwork = prof.getWork_link() + works;
            prof.setSeekerId(user.getId());
            prof.setWork_link(newwork);
            pdao.updateWork_link(prof);
        }
        JobSeeker user = (JobSeeker)request.getSession().getAttribute("user");
        request.getSession().setAttribute("profilePercent",pdao.profilePercent(user.getId()));
        request.setAttribute("profile", pdao.getProfileDetails(user.getId()));
        RequestDispatcher view = request.getRequestDispatcher("profile.jsp");
        view.forward(request,response);
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
