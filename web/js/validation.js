/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
orgNoAvail=false;
emailAvail=false;

function checkEmployeeSigUpForm(action){
    isEmailAvailable(action);
    if(!emailAvail){
        alert("Email ID already register !!");
        return false;
    }
    if(document.employeeregister.password.value!=document.employeeregister.cpassword.value){
        alert("Password Mismatch");
        return false;
    }
    return true;
}

function checkCompanySignUpForm(action){
    isOrgNoAvailable();
    isEmailAvaiable(action);
    if(!orgNoAvail){
        alert("Please input correct Organisation ID");
        return false;
    }
    if(!emailAvail){
        alert("Email ID already register !!");
        return false;
    }
    if(document.companyregister.password.value!=document.companyregister.cpassword.value){
        alert("Password Mismatch");
        return false;
    }
    return true;
}
