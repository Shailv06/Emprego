<%-- 
    Document   : category
    Created on : Mar 19, 2017, 9:43:54 AM
    Author     : SHAIL-PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="col-sm-3 ">
            <div class="left-sidebar">
                <form name="loginform" method="post" action="home?action=filter" >
                    <h2 id="filter">Filter</h2>
                    <h2>Category</h2>
                    <select name="category">
                        <option value="" selected="selected"> Choose Category </option>
                        <option value="Web Designer">Web Designer</option>
                        <option value="Data Mining Analyst">Data Mining Analyst</option>
                        <option value="Networking">Networking</option>
                        <option value="Software Engineer">Software Engineer</option>
                        <option value="Data Scientist">Data Scientist</option>
                    </select>&nbsp;
                    
                    <h2>Skills</h2>
                    <select name="skills">
                        <option value="" selected="selected"> Choose Skills </option>
                        <option value="HTML">HTML</option>
                        <option value="HTML5">HTML5</option>
                        <option value="CSS">CSS</option>
                        <option value="Javascript">Javascript</option>
                        <option value="Java">Java</option>
                        <option value="Networks">Networks</option>
                        <option value="Data Mining">Data Mining</option>
                        <option value="Pattern Recognition">Pattern Recognition</option>
                    </select>&nbsp;
                    
                    <div class="brands_products"><!--brands_products-->
                        <h2>Location</h2>
                        <select name="location">
                            <option value="" selected="selected"> Choose Location </option>
                            <option value="Delhi" >Delhi</option>
                            <option value="Noida">Noida</option>
                            <option value="Gurgaon">Gurgaon</option>
                            <option value="Chennai">Chennai</option>
                            <option value="Ahmedabad">Ahmedabad</option>
                            <option value="Bengaluru">Bengaluru</option>
                            <option value="Mumbai">Mumbai</option>
                            <option value="Bubneshwar">Bubneshwar</option>
                        </select>&nbsp;
                    </div><!--/brands_products-->

                    <div class="brands_products"><!--brands_products-->
                        <h2>Salary</h2>
                        <select name="salary">
                            <option value="" selected="selected"> Choose Salary </option>
                            <option value="Rs 2.00 Lacs p.a.">Rs 2.00 Lacs p.a.</option>
                            <option value="Rs 2.00 - 4.00 Lacs p.a.">Rs 2.00 - 4.00 Lacs p.a.</option>
                            <option value="Rs 4.00 - 6.00 Lacs p.a.">Rs 4.00 - 6.00 Lacs p.a.</option>
                            <option value="Rs 6.00 - 9.00 Lacs p.a.">Rs 6.00 - 9.00 Lacs p.a.</option>
                            <option value="Rs 9.00 - 15.00 Lacs p.a." >Rs 9.00 - 15.00 Lacs p.a.</option>
                            <option value="As per Industry Standards">As per Industry Standards</option>
                        </select>&nbsp;
                    </div><!--/brands_products-->

                    <div class="brands_products"><!--brands_products-->
                        <h2>Experience</h2>
                        <select name="experience">
                            <option value="" selected="selected"> Choose Experience </option>
                            <option value="0 Year">0 Year</option>
                            <option value="1 Year">1 Year</option>
                            <option value="1 - 2 Year">1 - 2 Year</option>
                            <option value="2 - 5 Year">2 - 5 Year</option>
                        </select>&nbsp;
                    </div><!--/brands_products-->
                    <div class="brands_products">
                        <button type="submit" class="btn btn-primary">Go</button>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
