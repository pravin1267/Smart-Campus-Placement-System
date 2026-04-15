<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Recruiter Registration — Smart Campus Placement</title>
<meta name="description" content="Register your company as a recruiter on the Smart Campus Placement System.">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="./assets/css/portal.css">
<style>
.auth-bg-decoration { position:fixed;inset:0;z-index:0;overflow:hidden;pointer-events:none; }
.blob { position:absolute;border-radius:50%;filter:blur(70px);opacity:0.3; }
.blob-1 { width:400px;height:400px;background:#2563eb;top:-100px;right:-80px; }
.blob-2 { width:300px;height:300px;background:#CDEDF6;bottom:-60px;left:-60px; }
.auth-page { position:relative;z-index:1; }
.reg-wide { max-width: 520px; }
.form-grid-2 { display:grid;grid-template-columns:1fr 1fr;gap:16px; }
@media(max-width:540px) { .form-grid-2 { grid-template-columns:1fr; } }
</style>
</head>
<body>
<div class="auth-bg-decoration"><div class="blob blob-1"></div><div class="blob blob-2"></div></div>
<div class="auth-page">
    <div class="auth-card reg-wide">
        <div class="auth-logo">
            <div class="auth-logo-icon" style="background:#1e3a8a;">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.8" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M3.75 21h16.5M4.5 3h15M5.25 3v18m13.5-18v18M9 6.75h1.5m-1.5 3h1.5m-1.5 3h1.5m3-6H15m-1.5 3H15m-1.5 3H15M9 21v-3.375c0-.621.504-1.125 1.125-1.125h3.75c.621 0 1.125.504 1.125 1.125V21" />
                </svg>
            </div>
            <h1 class="auth-title">Recruiter Registration</h1>
            <p class="auth-subtitle">Tell us about your company and create your recruiter account</p>
        </div>

        <% if(request.getAttribute("messege") != null) { %>
        <div class="error-msg">${messege}</div>
        <% } %>

        <form action="RegisterServlet" method="post">
            <input type="hidden" name="role" value="RECRUITER">

            <div class="form-grid-2" style="margin-bottom:16px;">
                <div class="portal-form-group" style="margin-bottom:0;">
                    <label class="portal-label" for="r-username">Username</label>
                    <input type="email" id="r-username" class="portal-input" name="username" placeholder="Recruiter@gmail.com" required>
                </div>
                <div class="portal-form-group" style="margin-bottom:0;">
                    <label class="portal-label" for="r-password">Password</label>
                    <input type="password" id="r-password" class="portal-input" name="password" placeholder="••••••••" required>
                </div>
            </div>

            <div class="portal-form-group">
                <label class="portal-label" for="r-company">Company Name</label>
                <input type="text" id="r-company" class="portal-input" name="companyName" placeholder="Acme Technologies Ltd." required>
            </div>

            <div class="portal-form-group">
                <label class="portal-label" for="r-hrname">HR Representative Name</label>
                <input type="text" id="r-hrname" class="portal-input" name="hrName" placeholder="Jane Smith" required>
            </div>

            <div class="form-grid-2" style="margin-bottom:16px;">
                <div class="portal-form-group" style="margin-bottom:0;">
                    <label class="portal-label" for="r-email">Official Email</label>
                    <input type="email" id="r-email" class="portal-input" name="email" placeholder="hr@company.com" required>
                </div>
                <div class="portal-form-group" style="margin-bottom:0;">
                    <label class="portal-label" for="r-phone">Phone Number</label>
                    <input type="text" id="r-phone" class="portal-input" name="phone" placeholder="+91 9876543210" required>
                </div>
            </div>

            <button type="submit" class="auth-submit" id="recruiter-register-btn" style="background:#1e3a8a;">
                Register Company Account
            </button>
        </form>

        <div style="text-align:center;margin-top:16px;font-size:0.84rem;color:#64748b;">
            Already registered? <a href="login.jsp" style="font-weight:700;color:#1e3a8a;margin-left:4px;">Sign In</a>
        </div>
    </div>
</div>
</body>
</html>