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
                <form name="loginform" method="post" action="home2?action=filter" >
                    <h2 id="filter">Filter</h2>
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
                        <h2>Internship</h2>
                        <div class="form-group"> 
                            <label class="radio-inline"><input type="checkbox" name="internship" value="true">&nbsp; Completed Internship</label>
                        </div>&nbsp;
                    </div><!--/brands_products-->
                    
                    <div class="brands_products"><!--brands_products-->
                        <h2>Project</h2>
                        <div class="form-group"> 
                            <label class="radio-inline"><input type="checkbox" name="project" value="true">&nbsp; Completed Project</label>
                        </div>&nbsp;
                    </div><!--/brands_products-->

                    <div class="brands_products">
                        <button type="submit" class="btn btn-primary">Go</button>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
