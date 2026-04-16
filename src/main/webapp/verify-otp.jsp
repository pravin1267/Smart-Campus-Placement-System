<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Verify OTP — Smart Campus Placement</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="./assets/css/portal.css">
<style>
.auth-bg-decoration { position:fixed;inset:0;z-index:0;overflow:hidden;pointer-events:none; }
.blob { position:absolute;border-radius:50%;filter:blur(70px);opacity:0.35; }
.blob-1 { width:400px;height:400px;background:#5EB1BF;bottom:-100px;right:-80px; }
.auth-page { position:relative;z-index:1; }
.otp-input {
    text-align:center;
    font-size:2rem;
    letter-spacing:16px;
    font-weight:800;
    color:#042A2B;
    padding:14px 20px;
}
</style>
</head>
<body>
<div class="auth-bg-decoration"><div class="blob blob-1"></div></div>
<div class="auth-page">
    <div class="auth-card">
        <div class="auth-logo">
            <div class="auth-logo-icon">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.8" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M9 12.75 11.25 15 15 9.75m-3-7.036A11.959 11.959 0 0 1 3.598 6 11.99 11.99 0 0 0 3 9.749c0 5.592 3.824 10.29 9 11.623 5.176-1.332 9-6.03 9-11.622 0-1.31-.21-2.571-.598-3.751h-.152c-3.196 0-6.1-1.248-8.25-3.285Z" />
                </svg>
            </div>
            <h1 class="auth-title">Verify OTP</h1>
            <p class="auth-subtitle">Enter the 6-digit code sent to your registered email address.</p>
        </div>

        <% if(request.getAttribute("messege") != null) { %>
        <div class="error-msg">${messege}</div>
        <% } %>

        <form action="./verify" method="post">
            <div class="portal-form-group">
                <label class="portal-label" style="text-align:center;display:block;">6-Digit OTP Code</label>
                <input type="text" id="otp-input" name="otp" class="portal-input otp-input" maxlength="6" placeholder="••••••" required autocomplete="one-time-code">
            </div>
            <button type="submit" class="auth-submit" id="verify-otp-btn">Verify Code</button>
        </form>

        <div style="text-align:center;margin-top:20px;font-size:0.83rem;color:#64748b;">
            Didn't receive the code?
            <a href="forgot-password.jsp" style="font-weight:600;color:#5EB1BF;margin-left:4px;">Resend OTP</a>
        </div>
    </div>
</div>
<div class="auth-footer">
    &copy; 2026 Smart Campus Placement System. All rights reserved.
</div>
</body>
</html>