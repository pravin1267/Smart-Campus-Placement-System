<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Create Account — Smart Campus Placement</title>
<meta name="description" content="Register as a student or recruiter for the Smart Campus Placement System.">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="./assets/css/portal.css">
<style>
.auth-bg-decoration { position:fixed;inset:0;z-index:0;overflow:hidden;pointer-events:none; }
.blob { position:absolute;border-radius:50%;filter:blur(70px);opacity:0.35; }
.blob-1 { width:400px;height:400px;background:#5EB1BF;top:-120px;right:-100px; }
.blob-2 { width:250px;height:250px;background:#CDEDF6;bottom:-60px;left:-60px; }
.auth-page { position:relative;z-index:1; }
.reg-card { max-width: 480px; }
</style>
</head>
<body>
<div class="auth-bg-decoration"><div class="blob blob-1"></div><div class="blob blob-2"></div></div>
<div class="auth-page">
    <div class="auth-card reg-card">
        <div class="auth-logo">
            <div class="auth-logo-icon">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.8" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M18 7.5v3m0 0v3m0-3h3m-3 0h-3m-2.25-4.125a3.375 3.375 0 1 1-6.75 0 3.375 3.375 0 0 1 6.75 0ZM3 19.235v-.11a6.375 6.375 0 0 1 12.75 0v.109A12.318 12.318 0 0 1 9.374 21c-2.331 0-4.512-.645-6.374-1.766Z" />
                </svg>
            </div>
            <h1 class="auth-title">Create Account</h1>
            <p class="auth-subtitle">Choose your registration type to get started on the platform.</p>
        </div>

        <div style="display:flex;flex-direction:column;gap:14px;margin-bottom:24px;">

            <a href="student-register.jsp" class="register-option-card">
                <div class="register-option-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.8" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M4.26 10.147a60.438 60.438 0 0 0-.491 6.347A48.62 48.62 0 0 1 12 20.904a48.62 48.62 0 0 1 8.232-4.41 60.46 60.46 0 0 0-.491-6.347m-15.482 0a50.636 50.636 0 0 0-2.658-.813A59.906 59.906 0 0 1 12 3.493a59.903 59.903 0 0 1 10.399 5.84c-.896.248-1.783.52-2.658.814m-15.482 0A50.717 50.717 0 0 1 12 13.489a50.702 50.702 0 0 1 3.741-3.342M6.75 15a.75.75 0 1 0 0-1.5.75.75 0 0 0 0 1.5Z" />
                    </svg>
                </div>
                <h5>Student Registration</h5>
                <p>Browse jobs, apply & track your interview progress</p>
            </a>

            <a href="recruiter-register.jsp" class="register-option-card">
                <div class="register-option-icon" style="background:#dbeafe;color:#2563eb;">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.8" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M3.75 21h16.5M4.5 3h15M5.25 3v18m13.5-18v18M9 6.75h1.5m-1.5 3h1.5m-1.5 3h1.5m3-6H15m-1.5 3H15m-1.5 3H15M9 21v-3.375c0-.621.504-1.125 1.125-1.125h3.75c.621 0 1.125.504 1.125 1.125V21" />
                    </svg>
                </div>
                <h5>Recruiter Registration</h5>
                <p>Post jobs, review applicants & schedule interviews</p>
            </a>
        </div>

        <div class="auth-divider">already have an account?</div>
        <div style="text-align:center;margin-top:14px;">
            <a href="login.jsp" style="font-size:0.84rem;font-weight:700;color:#042A2B;">← Back to Sign In</a>
        </div>
    </div>
</div>

<div class="auth-footer">
    &copy; 2026 Smart Campus Placement System. All rights reserved.
</div>

</body>
</html>