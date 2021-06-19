//Below function executes on form submit 
function ValidationEvent() {
//Storing Field Values in variables
        var name = document.getElementById("name").value;
	var email = document.getElementById("email").value;
	var pwd = document.getElementById("password").value;
        var rpwd = document.getElementById("cpassword").value;
	var contact = document.getElementById("contact").value;
	//Regular Expression For Email 
	var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
	var numbers = /^[-+]?[0-9]+$/;
	//Conditions
	if (name != '' && email != '' && pwd != '' && rpwd != '' && contact != '') {
            if(!name.match(numbers)){
		if(email.match(emailReg)){
                    if(pwd.length > 5){
                        if(pwd == rpwd){
                            if(contact.length == 10 && contact.match(numbers)){
                                return true;
                            }else{
                                alert ("Enter valid mobile number...!!!");
                                return false;
                            } 
                        }else{
                            alert ("password mismatch...!!!");
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
                alert ("Name should be albhabetic...!!!");
                return false;
            }  
        }else{
            alert ("All fields are required.....!");
            return false;
	} 
}