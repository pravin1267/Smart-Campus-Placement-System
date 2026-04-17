<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Interview - Smart Campus</title>
    <!-- Assuming decoupled structure is using simple relative paths to CSS -->
    <link rel="stylesheet" href="../css/global.css">
    <link rel="stylesheet" href="../css/animations.css">
    <link rel="stylesheet" href="../css/dashboard.css">
</head>
<body>
    <div class="dashboard-layout">
        
        <aside class="sidebar" id="sidebar">
            <div class="sidebar-header">
                <div class="brand">
                    <span class="brand-icon">🎓</span>
                    <span>Smart Campus</span>
                </div>
            </div>
            
            <nav class="sidebar-nav">
                <a href="dashboard.html" class="nav-item animate-slide-in stagger-1">
                    <span class="nav-icon">📊</span>
                    <span>Dashboard</span>
                </a>
                <a href="jobs.html" class="nav-item animate-slide-in stagger-2">
                    <span class="nav-icon">💼</span>
                    <span>Browse Jobs</span>
                </a>
                <a href="applications.html" class="nav-item animate-slide-in stagger-3">
                    <span class="nav-icon">📄</span>
                    <span>My Applications</span>
                </a>
                <a href="interviews.html" class="nav-item active animate-slide-in stagger-4">
                    <span class="nav-icon">📅</span>
                    <span>Interviews</span>
                </a>
                <a href="profile.html" class="nav-item animate-slide-in stagger-4">
                    <span class="nav-icon">👤</span>
                    <span>Profile</span>
                </a>
            </nav>
            
            <div class="sidebar-footer">
                <a href="#" id="logout-btn" class="nav-item text-error">
                    <span class="nav-icon">🚪</span>
                    <span>Logout</span>
                </a>
            </div>
        </aside>

        <div class="main-content">
            
            <header class="topbar">
                <div class="topbar-left">
                    <button class="mobile-toggle" id="mobile-toggle">☰</button>
                    <h2 class="page-title">Interview Details</h2>
                </div>
                
                <div class="topbar-right">
                    <div class="user-profile">
                        <div class="user-info" style="text-align: right;">
                            <span class="user-name" id="user-name">Loading...</span>
                            <span class="user-role text-cyan" id="user-role">Student</span>
                        </div>
                        <div class="avatar" id="user-initial">?</div>
                    </div>
                </div>
            </header>

            <main class="content-area">
                
                <div class="card animate-fade-in stagger-1 mb-4" id="interview-details">
                    <div class="flex justify-between items-start mb-6 border-b border-[var(--border-color)] pb-4">
                        <div>
                            <h3 class="text-2xl font-bold text-primary mb-1">TechCorp Solutions</h3>
                            <p class="text-gold font-semibold mb-2">Software Engineer Entry Level</p>
                            <span class="badge warning">Status: Scheduled</span>
                        </div>
                        <a href="interviews.html" class="btn btn-outline" style="text-decoration: none;">Back to List</a>
                    </div>
                    
                    <div class="grid grid-cols-2 gap-4 mb-6" style="display: grid; grid-template-columns: repeat(2, minmax(0, 1fr)); gap: 1rem;">
                        <div class="bg-[var(--bg-surface-light)] p-4 rounded-lg border border-[var(--border-color)]">
                            <h4 class="text-sm text-secondary uppercase tracking-wider mb-2">Date & Time</h4>
                            <p class="font-bold">📝 April 15, 2026</p>
                            <p class="text-cyan text-lg font-bold">⏰ 10:00 AM - 11:00 AM</p>
                        </div>
                        <div class="bg-[var(--bg-surface-light)] p-4 rounded-lg border border-[var(--border-color)]">
                            <h4 class="text-sm text-secondary uppercase tracking-wider mb-2">Location / Mode</h4>
                            <p class="font-bold">🌐 Online Mode</p>
                            <p class="text-cyan text-lg break-words">🔗 <a href="#" class="text-cyan hover:underline" style="text-decoration: none;">meet.google.com/abc-xyz-pqr</a></p>
                        </div>
                        <div class="bg-[var(--bg-surface-light)] p-4 rounded-lg border border-[var(--border-color)]">
                            <h4 class="text-sm text-secondary uppercase tracking-wider mb-2">Interviewer Name</h4>
                            <p class="font-bold">👤 Mr. John Doe</p>
                            <p class="text-muted text-sm mt-1">Senior Technical Lead</p>
                        </div>
                        <div class="bg-[var(--bg-surface-light)] p-4 rounded-lg border border-[var(--border-color)]">
                            <h4 class="text-sm text-secondary uppercase tracking-wider mb-2">Interview Round</h4>
                            <p class="font-bold">🎯 Technical Round 1</p>
                            <p class="text-muted text-sm mt-1">DSA & System Design</p>
                        </div>
                    </div>
                    
                    <div class="mb-6">
                        <h4 class="text-lg font-bold text-primary mb-3">Interview Instructions</h4>
                        <div class="bg-[var(--bg-surface-light)] p-4 rounded-lg border border-[var(--border-color)] text-sm text-secondary">
                            <ul style="list-style-type: disc; padding-left: 1.25rem; display: flex; flex-direction: column; gap: 0.5rem; margin: 0;">
                                <li>Please join the meeting 5 minutes prior to the scheduled time.</li>
                                <li>Ensure you have a stable internet connection and a working webcam.</li>
                                <li>Keep a valid ID proof handy for verification against your profile.</li>
                                <li>The interview will involve live coding; be prepared to share your screen.</li>
                                <li>Dress code is smart casual.</li>
                            </ul>
                        </div>
                    </div>
                    
                    <div class="flex gap-4 mt-6 pt-4 border-t border-[var(--border-color)]">
                        <button class="btn btn-primary" onclick="alert('Redirecting to meeting link...')">Join Meeting</button>
                        <button class="btn btn-outline" onclick="alert('Interview request acknowledged.')">Acknowledge</button>
                        <a href="mailto:hr@techcorp.com?subject=Reschedule Request" class="btn btn-outline" style="text-decoration: none;">Request Reschedule</a>
                    </div>
                </div>

            </main>
        </div>
    </div>

    <script src="../js/utils.js"></script>
    <script src="../js/api.js"></script>
    <script src="../js/student.js"></script>
</body>
</html>
