<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.campusplacement.dao.JobDAO"%>
<%@ page import="com.campusplacement.dao.StudentDAO"%>
<%@ page import="com.campusplacement.model.Job"%>
<%@ page import="com.campusplacement.model.Student"%>

<%
Integer userId = (Integer) session.getAttribute("userId");
if (userId == null) { response.sendRedirect("login.jsp"); return; }
int jobId = Integer.parseInt(request.getParameter("jobId"));
StudentDAO studentDAO = new StudentDAO();
Student student = studentDAO.getStudentByUserId(userId);
JobDAO jobDAO = new JobDAO();
Job job = jobDAO.getJobById(jobId);
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Apply for Job — Smart Campus Placement</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="./assets/css/portal.css">
</head>
<body>
<div class="portal-wrapper">
    <aside class="sidebar">
        <div class="sidebar-brand">
            <div class="brand-icon">
                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="white"><path stroke-linecap="round" stroke-linejoin="round" d="M4.26 10.147a60.438 60.438 0 0 0-.491 6.347A48.62 48.62 0 0 1 12 20.904a48.62 48.62 0 0 1 8.232-4.41 60.46 60.46 0 0 0-.491-6.347m-15.482 0a50.636 50.636 0 0 0-2.658-.813A59.906 59.906 0 0 1 12 3.493a59.903 59.903 0 0 1 10.399 5.84c-.896.248-1.783.52-2.658.814m-15.482 0A50.717 50.717 0 0 1 12 13.489a50.702 50.702 0 0 1 3.741-3.342" /></svg>
            </div>
            <div class="brand-text">Campus Placement<small>Student Portal</small></div>
        </div>
        <nav class="sidebar-nav">
            <a href="./Student-Dashboard.jsp" id="nav-dashboard"><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.8" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M3 13.125C3 12.504 3.504 12 4.125 12h2.25c.621 0 1.125.504 1.125 1.125v6.75C7.5 20.496 6.996 21 6.375 21h-2.25A1.125 1.125 0 0 1 3 19.875v-6.75ZM9.75 8.625c0-.621.504-1.125 1.125-1.125h2.25c.621 0 1.125.504 1.125 1.125v11.25c0 .621-.504 1.125-1.125 1.125h-2.25a1.125 1.125 0 0 1-1.125-1.125V8.625ZM16.5 4.125c0-.621.504-1.125 1.125-1.125h2.25C20.496 3 21 3.504 21 4.125v15.75c0 .621-.504 1.125-1.125 1.125h-2.25a1.125 1.125 0 0 1-1.125-1.125V4.125Z" /></svg>Dashboard</a>
            <a href="./my-application.jsp" id="nav-applications"><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.8" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M19.5 14.25v-2.625a3.375 3.375 0 0 0-3.375-3.375h-1.5A1.125 1.125 0 0 1 13.5 7.125v-1.5a3.375 3.375 0 0 0-3.375-3.375H8.25m6.75 12H9m1.5-12H5.625c-.621 0-1.125.504-1.125 1.125v17.25c0 .621.504 1.125 1.125 1.125h12.75c.621 0 1.125-.504 1.125-1.125V11.25a9 9 0 0 0-9-9Z" /></svg>My Applications</a>
            <a href="./MyInterviews.jsp" id="nav-interviews"><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.8" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M6.75 3v2.25M17.25 3v2.25M3 18.75V7.5a2.25 2.25 0 0 1 2.25-2.25h13.5A2.25 2.25 0 0 1 21 7.5v11.25m-18 0A2.25 2.25 0 0 0 5.25 21h13.5A2.25 2.25 0 0 0 21 18.75m-18 0v-7.5A2.25 2.25 0 0 1 5.25 9h13.5A2.25 2.25 0 0 1 21 11.25v7.5" /></svg>Interviews</a>
            <a href="./Profile.jsp" id="nav-profile"><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.8" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M17.982 18.725A7.488 7.488 0 0 0 12 15.75a7.488 7.488 0 0 0-5.982 2.975m11.963 0a9 9 0 1 0-11.963 0m11.963 0A8.966 8.966 0 0 1 12 21a8.966 8.966 0 0 1-5.982-2.275M15 9.75a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z" /></svg>Profile</a>
        </nav>
        <div class="sidebar-logout">
            <a href="LogutServlet" id="nav-logout"><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.8" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M15.75 9V5.25A2.25 2.25 0 0 0 13.5 3h-6a2.25 2.25 0 0 0-2.25 2.25v13.5A2.25 2.25 0 0 0 7.5 21h6a2.25 2.25 0 0 0 2.25-2.25V15m3 0 3-3m0 0-3-3m3 3H9" /></svg>Logout</a>
        </div>
    </aside>

    <div class="main-area">
        <div class="topbar">
            <div class="topbar-left">
                <a href="Student-Dashboard.jsp" style="font-size:0.83rem;color:#5EB1BF;display:flex;align-items:center;gap:5px;font-weight:600;">
                    <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M10.5 19.5 3 12m0 0 7.5-7.5M3 12h18" /></svg>
                    Back to Jobs
                </a>
            </div>
            <div class="topbar-right">
                <div class="topbar-user">
                    <div class="topbar-user-avatar"><%= student.getFullName().substring(0,1).toUpperCase() %></div>
                    <span class="topbar-user-name"><%= student.getFullName() %></span>
                </div>
            </div>
        </div>

        <div class="page-content">
            <div style="max-width:720px;margin:0 auto;">

                <!-- Job Overview Card -->
                <div class="content-card" style="margin-bottom:20px;">
                    <div class="content-card-body">
                        <div style="display:flex;justify-content:space-between;align-items:flex-start;flex-wrap:wrap;gap:12px;padding-bottom:16px;border-bottom:1px solid var(--border);margin-bottom:16px;">
                            <div>
                                <div style="font-size:0.72rem;text-transform:uppercase;letter-spacing:0.08em;color:#94a3b8;margin-bottom:6px;">Job Opportunity</div>
                                <h2 style="font-size:1.3rem;font-weight:800;color:#042A2B;margin-bottom:6px;"><%= job.getJobRole() %></h2>
                                <div style="font-size:0.9rem;color:#5EB1BF;font-weight:600;display:flex;align-items:center;gap:5px;">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M3.75 21h16.5M4.5 3h15M5.25 3v18m13.5-18v18M9 6.75h1.5m-1.5 3h1.5m-1.5 3h1.5m3-6H15m-1.5 3H15m-1.5 3H15M9 21v-3.375c0-.621.504-1.125 1.125-1.125h3.75c.621 0 1.125.504 1.125 1.125V21" /></svg>
                                    <%= job.getCompanyName() %>
                                </div>
                            </div>
                            <div style="display:flex;flex-direction:column;gap:8px;align-items:flex-end;">
                                <span class="badge-pill badge-teal">Min CGPA: <%= job.getMinCgpa() %></span>
                                <span style="font-size:0.78rem;color:#dc2626;font-weight:600;">⏰ Deadline: <%= job.getLastDate() %></span>
                            </div>
                        </div>
                        <div style="margin-bottom:12px;">
                            <div style="font-size:0.72rem;color:#94a3b8;text-transform:uppercase;letter-spacing:0.06em;margin-bottom:6px;">Description</div>
                            <p style="font-size:0.87rem;color:#475569;line-height:1.7;margin:0;"><%= job.getDescription() %></p>
                        </div>
                        <div>
                            <div style="font-size:0.72rem;color:#94a3b8;text-transform:uppercase;letter-spacing:0.06em;margin-bottom:8px;">Required Skills</div>
                            <% if(job.getRequiredSkills() != null) {
                                   String[] skills = job.getRequiredSkills().split(",");
                                   for(String sk : skills) { %>
                            <span class="badge-pill badge-info" style="margin-right:6px;margin-bottom:4px;"><%= sk.trim() %></span>
                            <% } } %>
                        </div>
                    </div>
                </div>

                <!-- Application Form -->
                <div class="content-card">
                    <div class="content-card-header">
                        <h4>
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.8" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M6 12 3.269 3.125A59.769 59.769 0 0 1 21.485 12 59.768 59.768 0 0 1 3.27 20.875L5.999 12Zm0 0h7.5" /></svg>
                            Submit Your Application
                        </h4>
                    </div>
                    <div class="content-card-body">
                        <form action="applyJob" method="post">
                            <input type="hidden" name="jobId" value="<%= job.getJobId() %>">
                            <input type="hidden" name="studentId" value="<%= student.getStudentId() %>">

                            <div style="display:grid;grid-template-columns:1fr 1fr;gap:18px;margin-bottom:18px;">
                                <div class="portal-form-group" style="margin-bottom:0;">
                                    <label class="portal-label">Your Name</label>
                                    <input type="text" class="portal-input" value="<%= student.getFullName() %>" readonly style="background:#f8fafc;color:#64748b;">
                                </div>
                                <div class="portal-form-group" style="margin-bottom:0;">
                                    <label class="portal-label">Your CGPA</label>
                                    <input type="text" class="portal-input" value="<%= student.getCgpa() %>" readonly style="background:#f8fafc;color:#64748b;">
                                </div>
                            </div>

                            <div class="portal-form-group">
                                <label class="portal-label">Your Resume</label>
                                <% if(student.getResumePath() != null && !student.getResumePath().isEmpty()) { %>
                                <div style="display:flex;align-items:center;gap:12px;background:#f0fdf4;border:1px solid #bbf7d0;border-radius:8px;padding:12px 16px;">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="#16a34a"><path stroke-linecap="round" stroke-linejoin="round" d="M19.5 14.25v-2.625a3.375 3.375 0 0 0-3.375-3.375h-1.5A1.125 1.125 0 0 1 13.5 7.125v-1.5a3.375 3.375 0 0 0-3.375-3.375H8.25m0 12.75h7.5m-7.5 3H12M10.5 2.25H5.625c-.621 0-1.125.504-1.125 1.125v17.25c0 .621.504 1.125 1.125 1.125h12.75c.621 0 1.125-.504 1.125-1.125V11.25a9 9 0 0 0-9-9Z" /></svg>
                                    <span style="flex:1;font-size:0.85rem;color:#15803d;font-weight:500;"><%= student.getResumePath() %></span>
                                    <a href="resumes/<%= student.getResumePath() %>" class="btn-portal btn-portal-outline btn-portal-sm" target="_blank">View</a>
                                </div>
                                <% } else { %>
                                <div style="background:#fef2f2;border:1px solid #fecaca;border-radius:8px;padding:12px 16px;font-size:0.85rem;color:#dc2626;">
                                    ⚠️ No resume uploaded. <a href="Profile.jsp" style="color:#dc2626;text-decoration:underline;font-weight:600;">Upload your resume</a> before applying.
                                </div>
                                <% } %>
                            </div>

                            <div class="portal-form-group">
                                <label class="portal-label">Cover Letter <span style="font-weight:400;color:#94a3b8;">(optional)</span></label>
                                <textarea name="coverLetter" class="portal-textarea" rows="5" placeholder="Why are you the ideal candidate for this role? Highlight your relevant skills and experience..."></textarea>
                            </div>

                            <div style="display:flex;gap:12px;justify-content:flex-end;margin-top:8px;">
                                <a href="Student-Dashboard.jsp" class="btn-portal btn-portal-outline">Cancel</a>
                                <button type="submit" class="btn-portal btn-portal-primary" id="apply-job-btn">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M6 12 3.269 3.125A59.769 59.769 0 0 1 21.485 12 59.768 59.768 0 0 1 3.27 20.875L5.999 12Zm0 0h7.5" /></svg>
                                    Submit Application
                                </button>
                            </div>
                        </form>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
</body>
</html>