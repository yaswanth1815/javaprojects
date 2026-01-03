<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Farming Project - Login</title>

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

<style>
    body {
        margin: 0;
        padding: 0;
        font-family: 'Poppins', sans-serif;
        background-color:  #8f9f99; /* Solid light greenish background */
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    /* Removed overlay because we no longer have an image */
    
    .login-wrapper {
        display: flex;
        max-width: 900px;
        width: 100%;
        border-radius: 15px;
        overflow: hidden;
        box-shadow: 0 10px 30px rgba(0,0,0,0.3);
        background: white; /* Fully opaque background */
        position: relative;
        z-index: 1;
        animation: fadeIn 0.8s ease-in-out;
    }

    @keyframes fadeIn {
        from {opacity: 0; transform: scale(0.95);}
        to {opacity: 1; transform: scale(1);}
    }

    .left-panel {
        flex: 1;
        background: linear-gradient(135deg, rgba(11,132,87,1), rgba(15,157,88,1));
        color: white;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        padding: 40px;
        text-align: center;
    }
    .left-panel h1 {
        margin-bottom: 15px;
        font-size: 26px;
        font-weight: 600;
    }
    .left-panel p {
        font-size: 14px;
        margin-bottom: 25px;
    }
    .left-panel .sign-btn {
        background: transparent;
        border: 2px solid white;
        color: white;
        padding: 10px 25px;
        border-radius: 25px;
        cursor: pointer;
        font-size: 14px;
        transition: 0.3s ease;
    }
    .left-panel .sign-btn:hover {
        background: white;
        color: #0b8457;
    }

    .right-panel {
        flex: 1.2;
        padding: 50px;
        display: flex;
        flex-direction: column;
        justify-content: center;
        background: white;
    }
    .right-panel h2 {
        color: #0b8457;
        margin-bottom: 10px;
        font-weight: 600;
    }
    .right-panel p {
        font-size: 14px;
        margin-bottom: 20px;
        color: #555;
    }
    .radio-group {
        display: flex;
        flex-wrap: wrap;
        gap: 15px;
        margin-bottom: 20px;
    }
    .radio-group label {
        font-size: 14px;
        color: #333;
    }
    input[type="radio"] {
        margin-right: 5px;
    }
    input[type="text"], input[type="password"] {
        width: 100%;
        padding: 12px;
        margin-bottom: 15px;
        border-radius: 25px;
        border: 1px solid #ccc;
        background-color: #f4f4f4;
        font-size: 14px;
        transition: 0.3s ease;
    }
    input[type="text"]:focus, input[type="password"]:focus {
        border-color: #0b8457;
        background-color: #fff;
        outline: none;
    }
    .forgot-password {
        text-align: right;
        font-size: 12px;
        margin-bottom: 15px;
    }
    .forgot-password a {
        color: #0b8457;
        text-decoration: none;
    }
    .forgot-password a:hover {
        text-decoration: underline;
    }
    .login-btn {
        width: 100%;
        background-color: #0b8457;
        color: white;
        padding: 12px;
        border: none;
        border-radius: 25px;
        font-size: 14px;
        font-weight: bold;
        cursor: pointer;
        transition: 0.3s ease;
    }
    .login-btn:hover {
        background-color: #096c43;
    }
    .register-link {
        margin-top: 20px;
        text-align: center;
        font-size: 13px;
    }
    .register-link a {
        color: #0b8457;
        text-decoration: none;
        font-weight: bold;
    }
    .register-link a:hover {
        text-decoration: underline;
    }
    .message-display {
        color: red;
        font-size: 13px;
        margin-bottom: 10px;
        text-align: center;
    }
    .sign-btn {
  background: linear-gradient(135deg, #00695c, #26a69a);
  border: none;
  border-radius: 8px;
  padding: 10px 24px;
  cursor: pointer;
  transition: all 0.3s ease;
}

.sign-btn a {
  color: white;
  font-size: 16px;
  font-weight: bold;
  text-decoration: none; /* removes underline */
  text-transform: uppercase;
  letter-spacing: 1px;
  display: block; /* makes link fill the button */
}

.sign-btn:hover {
  background: linear-gradient(135deg, #26a69a, #00695c);
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
  transform: translateY(-2px);
}

.sign-btn:hover a {
  color: black; /* text turns black on hover */
}

.sign-btn:active {
  transform: translateY(0);
  box-shadow: none;
}
    

    /* Mobile responsive */
    @media(max-width: 768px) {
        .login-wrapper {
            flex-direction: column;
        }
        .left-panel {
            padding: 20px;
        }
        .right-panel {
            padding: 30px;
        }
    }
</style>
</head>
<body>

<div class="login-wrapper">
    <!-- Left side -->
    <div class="left-panel">
        <h1>Welcome Back!</h1>
        <p>To stay connected with us please login with your personal info</p>
        <button class="sign-btn"><a href="#" onclick="openRegistrationForm()">SIGN IN </a></button>
    </div>

    <!-- Right side -->
    <div class="right-panel">
        <h2>Welcome</h2>
        <p>Login to your account to continue</p>

        <form action="<%=request.getContextPath()%>/loginservlet"  method="POST">
            <div class="radio-group">
                <label><input type="radio" name="role" value="admin" required> Admin</label>
                <label><input type="radio" name="role" value="seller"> Seller</label>
                <label><input type="radio" name="role" value="transport"> Transport</label>
                <label><input type="radio" name="role" value="agent"> Agent</label>
            </div>

            <input type="text" name="username" placeholder="Email or Username" required>
            <input type="password" name="password" placeholder="Password" required>

            <div class="forgot-password">
                <a href="#" onclick="forgotpasswordpage()">Forgot your password?</a>
            </div>

            <%
            String message = (String) request.getAttribute("message");
            if (message == null) { 
            	message = "";
            	}
            %>
           <%
			String msg = (String) session.getAttribute("message");
			if (msg != null) {
			    out.println("<p style='color:red; font-weight:bold;'>" + msg + "</p>");
			    session.removeAttribute("message"); // clear it after showing
			}
			%>
           
            <p class="message-display"><%= message %></p>

            <button type="submit" class="login-btn">LOG IN</button>

            <div class="register-link">
                Don't have an account? <a href="#" onclick="openRegistrationForm()">Sign up</a>
            </div>
        </form>
    </div>
</div>

<script>
function openRegistrationForm(){
    let role = document.querySelector('input[name="role"]:checked');
    if (!role) {
        alert("First Select Role to PROCEED!");
        return;
    }
    switch(role.value){
        case "agent":
            window.location.href='agentregistration.jsp';
            break;
        case "seller":
            window.location.href='sellerregistration.jsp';
            break;
        case "transport":
            window.location.href='vehicleregistration.jsp';
            break;
    }
}

function forgotpasswordpage(){
    let mainvalue = document.querySelector('input[name="role"]:checked');
    if(!mainvalue){
        alert("First Select Role to PROCEED!");
        return;
    }
    switch(mainvalue.value){
        case "agent":
            window.location.href='agentforgotpage.jsp';
            break;
        case "seller":
            window.location.href='sellerforgotpage.jsp';
            break;
        case "transport":
            window.location.href='vehicleforgotpage.jsp';
            break;
        case "admin":
            alert("Please contact admin support directly.");
            break;
    }
}
</script>

</body>
</html>
