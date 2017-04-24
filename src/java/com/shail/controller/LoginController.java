/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shail.controller;

import com.shail.dao.CompanyDao;
import com.shail.dao.JobSeekerDao;
import com.shail.dao.ProfileDao;
import com.shail.model.Company;
import com.shail.model.JobSeeker;
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
@WebServlet(name = "LoginController", urlPatterns = {"/login"})
public class LoginController extends HttpServlet {
    private JobSeekerDao dao;
    private CompanyDao cdao;
    private ProfileDao pdao;
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public LoginController() {
        super();
        dao = new JobSeekerDao();
        cdao = new CompanyDao();
        pdao = new ProfileDao();
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
//        processRequest(request, response);
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
        if(action.equalsIgnoreCase("seeker")){
            JobSeeker employee = new JobSeeker();
            employee.setEmail(request.getParameter("email"));
            employee.setPassword(request.getParameter("password"));
            if(dao.authenticate(employee)){
                //Setting seekerDetails as Session
                JobSeeker new_emp = dao.getJobSeekerDetails(employee);
                request.getSession().setAttribute("user",new_emp);
                request.getSession().setAttribute("profilePercent",pdao.profilePercent(new_emp.getId()));
                //Setting seeker  as Session
                request.getSession().setAttribute("action","seeker");
                RequestDispatcher view = request.getRequestDispatcher("index.jsp");
                view.forward(request,response);
            }
            else{
                PrintWriter out = response.getWriter();
                out.println("<script type=\"text/javascript\">");
                out.println("alert('User or password incorrect');");
                out.println("location='index.jsp';");
                out.println("</script>");
            }
        }
        else if(action.equalsIgnoreCase("company")){
            Company comp = new Company();
            comp.setEmail(request.getParameter("email"));
            comp.setPassword(request.getParameter("password"));
            if(cdao.authenticate(comp)){
                //Setting companyDetails as Session
                Company new_comp = cdao.getCompanyDetails(comp);
                request.getSession().setAttribute("user",new_comp);
                //Setting company  as Session
                request.getSession().setAttribute("action","company");
                RequestDispatcher view = request.getRequestDispatcher("index.jsp");
                view.forward(request,response);
            }
            else{
                PrintWriter out = response.getWriter();
                out.println("<script type=\"text/javascript\">");
                out.println("alert('User or password incorrect');");
                out.println("location='index.jsp';");
                out.println("</script>");
            }
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
