<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Reset Password — Smart Campus Placement</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="./assets/css/portal.css">
<style>
.auth-bg-decoration { position:fixed;inset:0;z-index:0;overflow:hidden;pointer-events:none; }
.blob { position:absolute;border-radius:50%;filter:blur(70px);opacity:0.35; }
.blob-1 { width:350px;height:350px;background:#5EB1BF;top:-80px;right:-60px; }
.auth-page { position:relative;z-index:1; }
</style>
</head>
<body>
<div class="auth-bg-decoration"><div class="blob blob-1"></div></div>
<div class="auth-page">
    <div class="auth-card">
        <div class="auth-logo">
            <div class="auth-logo-icon">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.8" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 5.25a3 3 0 0 1 3 3m3 0a6 6 0 0 1-7.029 5.912c-.563-.097-1.159.026-1.563.43L10.5 17.25H8.25v2.25H6v2.25H2.25v-2.818c0-.597.237-1.17.659-1.591l6.499-6.499c.404-.404.527-1 .43-1.563A6 6 0 0 1 21.75 8.25Z" />
                </svg>
            </div>
            <h1 class="auth-title">Set New Password</h1>
            <p class="auth-subtitle">Create a strong and secure password for your account.</p>
        </div>

        <% if(request.getAttribute("messege") != null) { %>
        <div class="error-msg">${messege}</div>
        <% } %>

        <form action="./resetPassword" method="post">
            <div class="portal-form-group">
                <label class="portal-label" for="new-pass">New Password</label>
                <input type="password" id="new-pass" class="portal-input" name="password" placeholder="Enter new password" required autocomplete="new-password">
            </div>
            <div class="portal-form-group">
                <label class="portal-label" for="conf-pass">Confirm Password</label>
                <input type="password" id="conf-pass" class="portal-input" name="confPassword" placeholder="Re-enter your password" required autocomplete="new-password">
            </div>
            <button type="submit" class="auth-submit" id="reset-pass-btn">Reset Password</button>
        </form>
    </div>
</div>
<div class="auth-footer">
    &copy; 2026 Smart Campus Placement System. All rights reserved.
</div>
</body>
</html>