    function ValidationEvent() {
        var name = document.getElementById("fname").value;
	var gender = document.getElementById("gender").value;
   	var clg = document.getElementById("clg").value;
	var mobile = document.getElementById("mobile").value;
	var email = document.getElementById("email").value;
	var pwd = document.getElementById("password").value;
	var rpwd = document.getElementById("cpassword").value;
	//Regular Expression For Email 
	var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
	var numbers = /^[-+]?[0-9]+$/;
	//Conditions
	if (name != '' && gender != '' && mobile != '' && email != '' && pwd != '' && rpwd != '') {
            if(!name.match(numbers)){
                if(mobile.length == 10 && mobile.match(numbers)){
                    if(email.match(emailReg)){
                        if(pwd.length > 5){
                            if(pwd == rpwd){
				return true;
                            }else{
				alert ("Password is not matching...!!!");
				return false;
                            }  
			}else{
                            alert ("Password Should Contain Min. 6 Characters.....!");
                            return false;
			}
                    }else{
			alert ("Enter valid E-mail.....!");
			return false;
                    } 
		}else{
                    alert ("Enter valid mobile number...!!!");
                    return false;
		}  
            }else{
                alert ("Name should be alphabetic...!!!");
                return false;
            }
        }else{
            alert ("All fields are required.....!");
            return false;
	} 
    }