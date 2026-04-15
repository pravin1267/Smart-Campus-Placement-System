<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Login — Smart Campus Placement</title>
<meta name="description" content="Sign in to the Smart Campus Placement Portal to access jobs, applications, and interview schedules.">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="./assets/css/portal.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<style>
.auth-bg-decoration {
    position: fixed;
    inset: 0;
    z-index: 0;
    overflow: hidden;
    pointer-events: none;
}
.auth-bg-decoration .blob {
    position: absolute;
    border-radius: 50%;
    filter: blur(70px);
    opacity: 0.35;
}
.blob-1 { width: 400px; height: 400px; background: #5EB1BF; top: -120px; left: -100px; }
.blob-2 { width: 300px; height: 300px; background: #CDEDF6; bottom: -80px; right: -60px; }
.blob-3 { width: 200px; height: 200px; background: #042A2B; top: 50%; right: 15%; }

.auth-page { position: relative; z-index: 1; }
</style>
</head>
<body>

<div class="auth-bg-decoration">
    <div class="blob blob-1"></div>
    <div class="blob blob-2"></div>
    <div class="blob blob-3"></div>
</div>

<div class="auth-page">
    <div class="auth-card">

        <div class="auth-logo">
            <div class="auth-logo-icon">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.8" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M4.26 10.147a60.438 60.438 0 0 0-.491 6.347A48.62 48.62 0 0 1 12 20.904a48.62 48.62 0 0 1 8.232-4.41 60.46 60.46 0 0 0-.491-6.347m-15.482 0a50.636 50.636 0 0 0-2.658-.813A59.906 59.906 0 0 1 12 3.493a59.903 59.903 0 0 1 10.399 5.84c-.896.248-1.783.52-2.658.814m-15.482 0A50.717 50.717 0 0 1 12 13.489a50.702 50.702 0 0 1 3.741-3.342M6.75 15a.75.75 0 1 0 0-1.5.75.75 0 0 0 0 1.5Zm0 0v-3.675A55.378 55.378 0 0 1 12 8.443m-7.007 11.55A5.981 5.981 0 0 0 6.75 15.75v-1.5" />
                </svg>
            </div>
            <h1 class="auth-title">Welcome Back</h1>
            <p class="auth-subtitle">Smart Campus Placement System</p>
        </div>

        <%
        String error = (String) request.getAttribute("messege");
        if (error != null && !error.isEmpty()) {
        %>
        <div class="error-msg">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" d="M12 9v3.75m-9.303 3.376c-.866 1.5.217 3.374 1.948 3.374h14.71c1.73 0 2.813-1.874 1.948-3.374L13.949 3.378c-.866-1.5-3.032-1.5-3.898 0L2.697 16.126ZM12 15.75h.007v.008H12v-.008Z" />
            </svg>
            <%= error %>
        </div>
        <%
        }
        String el = (String) session.getAttribute("messege");
        if (el != null && !el.isEmpty()) {
        %>
        <div class="error-msg">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" d="M12 9v3.75m-9.303 3.376c-.866 1.5.217 3.374 1.948 3.374h14.71c1.73 0 2.813-1.874 1.948-3.374L13.949 3.378c-.866-1.5-3.032-1.5-3.898 0L2.697 16.126ZM12 15.75h.007v.008H12v-.008Z" />
            </svg>
            <%= el %>
        </div>
        <%
        }
        %>

        <!-- EL fallback for JSTL error -->
        <p style="color:#b91c1c;font-size:0.82rem;text-align:center;margin-bottom:12px;">${messege}</p>

        <form action="./LoginServlet" method="post">

            <div class="portal-form-group">
                <label class="portal-label" for="login-email">Email Address</label>
                <input type="email" id="login-email" class="portal-input" name="name" placeholder="you@example.com" required autocomplete="email">
            </div>

            <div class="portal-form-group">
                <label class="portal-label" for="login-password">Password</label>
                <input type="password" id="login-password" class="portal-input" name="password" placeholder="••••••••" required autocomplete="current-password">
            </div>

            <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:22px;">
                <label style="display:flex;align-items:center;gap:7px;font-size:0.83rem;color:#64748b;cursor:pointer;">
                    <input type="checkbox" style="width:15px;height:15px;accent-color:#5EB1BF;">
                    Remember me
                </label>
                <a href="forgot-password.jsp" style="font-size:0.83rem;font-weight:600;color:#5EB1BF;">Forgot password?</a>
            </div>

            <button type="submit" class="auth-submit" id="login-btn">Sign In</button>

        </form>

        <div class="auth-divider">or</div>

        <div style="text-align:center;font-size:0.84rem;color:#64748b;">
            Don't have an account?
            <a href="register.jsp" style="font-weight:700;color:#042A2B;margin-left:4px;">Register here</a>
        </div>

    </div>
</div>

<%
String msg = request.getParameter("msg");
if ("success".equals(msg)) {
%>
<script>
window.onload = function() {
    Swal.fire({
        icon: 'success',
        title: 'Password Updated!',
        text: 'Your password has been updated successfully.',
        confirmButtonText: 'OK',
        confirmButtonColor: '#5EB1BF'
    });
};
</script>
<%
}
%>

</body>
</html>