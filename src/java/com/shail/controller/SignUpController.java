package com.shail.controller;

import com.shail.dao.CompanyDao;
import com.shail.dao.JobSeekerDao;
import com.shail.model.Company;
import com.shail.model.JobSeeker;
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
@WebServlet(name = "SignUpController", urlPatterns = {"/signup"})
public class SignUpController extends HttpServlet {
    private JobSeekerDao dao;
    private CompanyDao cdao;
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public SignUpController() {
        super();
        dao = new JobSeekerDao();
        cdao = new CompanyDao();
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
            employee.setName(request.getParameter("name"));
            employee.setEmail(request.getParameter("email"));
            employee.setGender(request.getParameter("gender"));
            employee.setPassword(request.getParameter("password"));
            dao.addJobSeeker(employee);
            //Setting seekerDetails as Session
            JobSeeker new_emp = dao.getJobSeekerDetails(employee);
            request.getSession().setAttribute("user",new_emp);
            //Setting seeker  as Session
            request.getSession().setAttribute("action","seeker");
            RequestDispatcher view = request.getRequestDispatcher("index.jsp");
            view.forward(request,response);
        } 
        else if(action.equalsIgnoreCase("company")){
            //company signup
            Company comp = new Company();
            comp.setOrgNo(Integer.parseInt(request.getParameter("orgNo")));
            comp.setName(request.getParameter("name"));
            comp.setEmail(request.getParameter("email"));
            comp.setPassword(request.getParameter("password"));
            cdao.addCompany(comp);
            //Setting companyDetails as Session
            Company new_comp = cdao.getCompanyDetails(comp);
            request.getSession().setAttribute("user",new_comp);
            //Setting company  as Session
            request.getSession().setAttribute("action","company");
            RequestDispatcher view = request.getRequestDispatcher("index.jsp");
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
