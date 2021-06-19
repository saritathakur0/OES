//Below function executes on form submit 
function ValidationEvent() {
//Storing Field Values in variables
    var fname = document.getElementById("fname").value;
	var email = document.getElementById("email").value;
	var pwd = document.getElementById("password").value;
	var rpwd = document.getElementById("cpassword").value;
	//Regular Expression For Email 
	var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
	var numbers = /^[-+]?[0-9]+$/;
	//Conditions
	if (fname != '' && email != '' && pwd != '' && rpwd != '') {
            if(!fname.match(numbers)){
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
                    alert ("Enter valid Email-Id.....!");
                    return false;
		} 
            }else{
                alert ("Name should be albhabetic...!!!");
                return false;
            }  
        }else{
            alert ("All fields are required.....!");
            return false;
	} 
}