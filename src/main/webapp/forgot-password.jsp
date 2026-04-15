<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Forgot Password — Smart Campus Placement</title>
<meta name="description" content="Reset your Smart Campus Placement portal password via OTP.">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="./assets/css/portal.css">
<style>
.auth-bg-decoration { position:fixed;inset:0;z-index:0;overflow:hidden;pointer-events:none; }
.auth-bg-decoration .blob { position:absolute;border-radius:50%;filter:blur(70px);opacity:0.35; }
.blob-1 { width:400px;height:400px;background:#5EB1BF;top:-120px;left:-100px; }
.blob-2 { width:300px;height:300px;background:#CDEDF6;bottom:-80px;right:-60px; }
.auth-page { position:relative;z-index:1; }
</style>
</head>
<body>
<div class="auth-bg-decoration"><div class="blob blob-1"></div><div class="blob blob-2"></div></div>
<div class="auth-page">
    <div class="auth-card">
        <div class="auth-logo">
            <div class="auth-logo-icon">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.8" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M16.5 10.5V6.75a4.5 4.5 0 1 0-9 0v3.75m-.75 11.25h10.5a2.25 2.25 0 0 0 2.25-2.25v-6.75a2.25 2.25 0 0 0-2.25-2.25H6.75a2.25 2.25 0 0 0-2.25 2.25v6.75a2.25 2.25 0 0 0 2.25 2.25Z" />
                </svg>
            </div>
            <h1 class="auth-title">Account Recovery</h1>
            <p class="auth-subtitle">Enter your email to receive a one-time password (OTP).</p>
        </div>

        <% if(request.getAttribute("messege") != null) { %>
        <div class="error-msg">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" d="M12 9v3.75m9.303 3.376c.866 1.5-.217 3.374-1.948 3.374H4.645c-1.73 0-2.813-1.874-1.948-3.374L10.05 3.378c.866-1.5 3.032-1.5 3.898 0L21.303 16.126Z" />
            </svg>
            ${messege}
        </div>
        <% } %>

        <form action="./forgot_password" method="post">
            <div class="portal-form-group">
                <label class="portal-label" for="forgot-email">Email Address</label>
                <input type="email" id="forgot-email" class="portal-input" name="name" placeholder="you@example.com" required autocomplete="email">
            </div>
            <button type="submit" class="auth-submit" id="send-otp-btn">Send OTP</button>
        </form>

        <div style="text-align:center;margin-top:20px;">
            <a href="login.jsp" style="font-size:0.84rem;color:#5EB1BF;font-weight:600;">
                ← Back to Sign In
            </a>
        </div>
    </div>
</div>
</body>
</html>