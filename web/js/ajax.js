var request;
orgNoAvail=false;
emailAvail=false;
function isOrgNoAvailable(){
    var url="checkOrgNo.jsp?orgNo="+document.companyregister.orgNo.value;

    if(window.XMLHttpRequest){
        request=new XMLHttpRequest();
    }
    else if(window.ActiveXObject){
        request=new ActiveXObject("Microsoft.XMLHTTP");
    }

    try{
        request.onreadystatechange=function(){
            if(request.readyState==4){			
//                document.getElementById("checkOrgNo").innerHTML=request.responseText;
                if(request.responseText.indexOf("false")!==-1){
                    document.getElementById("checkOrgNo").innerHTML="Organisation No. is already in use !!";
                    document.getElementById("checkOrgNo").style.color="red" ;
                    orgNoAvail=false;
                }else{
                    document.getElementById("checkOrgNo").innerHTML="Organisation No. is available !!";
                    document.getElementById("checkOrgNo").style.color="yellowgreen" ;
                    orgNoAvail=true;
                }
            }
        };
        request.open("POST",url,true);
        request.send();
    }catch(e){
        alert("Unable to connect to server !!");
    }
}

function isEmailAvailable(action){
    if(action==="seeker")
        var url="emailCheck.jsp?action=seeker&email="+document.employeeregister.email.value;
    else 
        var url="emailCheck.jsp?action=company&email="+document.companyregister.email.value;
    
    if(window.XMLHttpRequest){
        request=new XMLHttpRequest();
    }
    else if(window.ActiveXObject){
        request=new ActiveXObject("Microsoft.XMLHTTP");
    }

    try{
        request.onreadystatechange=function(){
            if(request.readyState==4){			
//                document.getElementById("checkSeekerEmail").innerHTML=request.responseText;
                if(request.responseText.indexOf("false")!=-1){
                    if(action==="seeker"){
                        document.getElementById("checkSeekerEmail").innerHTML="Email ID is already in use !!";
                        document.getElementById("checkSeekerEmail").style.color="red" ;
                    }
                    else{
                        document.getElementById("checkCompanyEmail").innerHTML="Email ID is already in use !!";
                        document.getElementById("checkCompanyEmail").style.color="red" ;
                    }
                    emailAvail=false;
                }else{
                    if(action==="seeker"){
                        document.getElementById("checkSeekerEmail").innerHTML="Email ID is available !!";
                        document.getElementById("checkSeekerEmail").style.color="yellowgreen" ;
                    }
                    else{
                        document.getElementById("checkCompanyEmail").innerHTML="Email ID is available !!";
                        document.getElementById("checkCompanyEmail").style.color="yellowgreen" ;
                    }
                    emailAvail=true;
                }
            }
        };
        request.open("POST",url,true);
        request.send();
    }catch(e){
        alert("Unable to connect to server !!");
    }
}
