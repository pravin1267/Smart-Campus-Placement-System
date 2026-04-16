<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Student Registration — Smart Campus Placement</title>
<meta name="description" content="Register as a student to access placement opportunities at Smart Campus.">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="./assets/css/portal.css">
<style>
.auth-bg-decoration { position:fixed;inset:0;z-index:0;overflow:hidden;pointer-events:none; }
.blob { position:absolute;border-radius:50%;filter:blur(70px);opacity:0.3; }
.blob-1 { width:500px;height:500px;background:#5EB1BF;top:-150px;left:-100px; }
.blob-2 { width:300px;height:300px;background:#CDEDF6;bottom:-80px;right:-60px; }
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
            <div class="auth-logo-icon">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.8" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M4.26 10.147a60.438 60.438 0 0 0-.491 6.347A48.62 48.62 0 0 1 12 20.904a48.62 48.62 0 0 1 8.232-4.41 60.46 60.46 0 0 0-.491-6.347m-15.482 0a50.636 50.636 0 0 0-2.658-.813A59.906 59.906 0 0 1 12 3.493a59.903 59.903 0 0 1 10.399 5.84c-.896.248-1.783.52-2.658.814m-15.482 0A50.717 50.717 0 0 1 12 13.489a50.702 50.702 0 0 1 3.741-3.342M6.75 15a.75.75 0 1 0 0-1.5.75.75 0 0 0 0 1.5Z" />
                </svg>
            </div>
            <h1 class="auth-title">Student Registration</h1>
            <p class="auth-subtitle">Fill in your details to create your student account</p>
        </div>

        <% if(request.getAttribute("messege") != null) { %>
        <div class="error-msg">${messege}</div>
        <% } %>

        <form action="RegisterServlet" method="post">
            <input type="hidden" name="role" value="STUDENT">

            <div class="form-grid-2" style="margin-bottom:16px;">
                <div class="portal-form-group" style="margin-bottom:0;">
                    <label class="portal-label" for="s-username">Username</label>
                    <input type="email" id="s-username" class="portal-input" name="username" placeholder="Rahul@gmail.com" required>
                </div>
                <div class="portal-form-group" style="margin-bottom:0;">
                    <label class="portal-label" for="s-password">Password</label>
                    <input type="password" id="s-password" class="portal-input" name="password" placeholder="••••••••" required>
                </div>
            </div>

            <div class="portal-form-group">
                <label class="portal-label" for="s-fullname">Full Name</label>
                <input type="text" id="s-fullname" class="portal-input" name="fullName" placeholder="John Doe" required>
            </div>

            <div class="form-grid-2" style="margin-bottom:16px;">
                <div class="portal-form-group" style="margin-bottom:0;">
                    <label class="portal-label" for="s-branch">Branch / Department</label>
                    <input type="text" id="s-branch" class="portal-input" name="branch" placeholder="Computer Science" required>
                </div>
                <div class="portal-form-group" style="margin-bottom:0;">
                    <label class="portal-label" for="s-cgpa">CGPA</label>
                    <input type="text" id="s-cgpa" class="portal-input" name="cgpa" placeholder="e.g. 8.5" required>
                </div>
            </div>

            <div class="form-grid-2" style="margin-bottom:16px;">
                <div class="portal-form-group" style="margin-bottom:0;">
                    <label class="portal-label" for="s-email">Email Address</label>
                    <input type="email" id="s-email" class="portal-input" name="email" placeholder="you@college.edu" required>
                </div>
                <div class="portal-form-group" style="margin-bottom:0;">
                    <label class="portal-label" for="s-phone">Phone Number</label>
                    <input type="text" id="s-phone" class="portal-input" name="phone" placeholder="+91 9876543210" required>
                </div>
            </div>

            <button type="submit" class="auth-submit" id="student-register-btn">Create Student Account</button>
        </form>

        <div style="text-align:center;margin-top:16px;font-size:0.84rem;color:#64748b;">
            Already registered? <a href="login.jsp" style="font-weight:700;color:#042A2B;margin-left:4px;">Sign In</a>
        </div>
    </div>
</div>
<div class="auth-footer">
    &copy; 2026 Smart Campus Placement System. All rights reserved.
</div>
</body>
</html>