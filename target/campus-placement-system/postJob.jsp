<%@ page import="com.campusplacement.dao.RecruiterDAO"%>
<%@ page import="com.campusplacement.model.Recruiter"%>

<%
Integer userId = (Integer) session.getAttribute("userId");
if (userId == null) { response.sendRedirect("login.jsp"); return; }
RecruiterDAO recruiterDAO = new RecruiterDAO();
Recruiter recruiter = recruiterDAO.getRecruiterByUserId(userId);
if (recruiter == null) { out.println("Error: Recruiter not found"); return; }
int recruiterId = recruiter.getRecruiterId();
String companyInitial = recruiter.getCompanyName().substring(0,1).toUpperCase();
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Post Job — Smart Campus Placement</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="./assets/css/portal.css">
<style>
.recruiter-sidebar-bg { background: linear-gradient(180deg, #0f2027 0%, #203a43 50%, #2c5364 100%) !important; }
.form-grid-2 { display:grid;grid-template-columns:1fr 1fr;gap:18px; }
@media(max-width:600px) { .form-grid-2 { grid-template-columns:1fr; } }
</style>
</head>
<body>
<div class="portal-wrapper">
    <aside class="sidebar recruiter-sidebar-bg">
        <div class="sidebar-brand">
            <div class="brand-icon" style="background:rgba(255,255,255,0.12);">
                <span style="font-size:1rem;font-weight:800;color:white;"><%= companyInitial %></span>
            </div>
            <div class="brand-text"><%= recruiter.getCompanyName() %><small>Recruiter Panel</small></div>
        </div>
        <nav class="sidebar-nav">
            <a href="Recruiters-Dashboard.jsp" id="nav-rdash"><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.8" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M3 13.125C3 12.504 3.504 12 4.125 12h2.25c.621 0 1.125.504 1.125 1.125v6.75C7.5 20.496 6.996 21 6.375 21h-2.25A1.125 1.125 0 0 1 3 19.875v-6.75ZM9.75 8.625c0-.621.504-1.125 1.125-1.125h2.25c.621 0 1.125.504 1.125 1.125v11.25c0 .621-.504 1.125-1.125 1.125h-2.25a1.125 1.125 0 0 1-1.125-1.125V8.625ZM16.5 4.125c0-.621.504-1.125 1.125-1.125h2.25C20.496 3 21 3.504 21 4.125v15.75c0 .621-.504 1.125-1.125 1.125h-2.25a1.125 1.125 0 0 1-1.125-1.125V4.125Z" /></svg>Dashboard</a>
            <a href="postJob.jsp" class="active" id="nav-postjob"><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.8" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M12 9v6m3-3H9m12 0a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z" /></svg>Post a Job</a>
            <a href="viewApplicants.jsp" id="nav-applicants"><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.8" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M15 19.128a9.38 9.38 0 0 0 2.625.372 9.337 9.337 0 0 0 4.121-.952 4.125 4.125 0 0 0-7.533-2.493M15 19.128v-.003c0-1.113-.285-2.16-.786-3.07M15 19.128v.106A12.318 12.318 0 0 1 8.624 21c-2.331 0-4.512-.645-6.374-1.766l-.001-.109a6.375 6.375 0 0 1 11.964-3.07M12 6.375a3.375 3.375 0 1 1-6.75 0 3.375 3.375 0 0 1 6.75 0Zm8.25 2.25a2.625 2.625 0 1 1-5.25 0 2.625 2.625 0 0 1 5.25 0Z" /></svg>Applicants</a>
            <a href="viewInterviews.jsp" id="nav-rinterviews"><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.8" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M6.75 3v2.25M17.25 3v2.25M3 18.75V7.5a2.25 2.25 0 0 1 2.25-2.25h13.5A2.25 2.25 0 0 1 21 7.5v11.25m-18 0A2.25 2.25 0 0 0 5.25 21h13.5A2.25 2.25 0 0 0 21 18.75m-18 0v-7.5A2.25 2.25 0 0 1 5.25 9h13.5A2.25 2.25 0 0 1 21 11.25v7.5" /></svg>Interviews</a>
        </nav>
        <div class="sidebar-logout">
            <a href="LogutServlet" id="nav-logout"><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.8" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M15.75 9V5.25A2.25 2.25 0 0 0 13.5 3h-6a2.25 2.25 0 0 0-2.25 2.25v13.5A2.25 2.25 0 0 0 7.5 21h6a2.25 2.25 0 0 0 2.25-2.25V15m3 0 3-3m0 0-3-3m3 3H9" /></svg>Logout</a>
        </div>
    </aside>

    <div class="main-area">
        <div class="topbar">
            <div class="topbar-left">
                <a href="Recruiters-Dashboard.jsp" style="font-size:0.83rem;color:#5EB1BF;display:flex;align-items:center;gap:5px;font-weight:600;">
                    <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M10.5 19.5 3 12m0 0 7.5-7.5M3 12h18" /></svg>
                    Back to Dashboard
                </a>
            </div>
            <div class="topbar-right">
                <div class="topbar-user">
                    <div class="topbar-user-avatar"><%= recruiter.getHrName().substring(0,1).toUpperCase() %></div>
                    <span class="topbar-user-name"><%= recruiter.getHrName() %></span>
                </div>
            </div>
        </div>

        <div class="page-content">
            <div style="max-width:700px;margin:0 auto;">
                <div class="page-header">
                    <h3>Create Job Posting</h3>
                    <p>Fill in all the details to attract the best candidates from campus.</p>
                </div>
                
                <% 
                   String successMsg = (String) session.getAttribute("successMsg");
                   String errorMsg = (String) session.getAttribute("errorMsg");
                   if (successMsg != null) { 
                %>
                <div style="background:#dcfce7;color:#15803d;padding:12px;border-radius:6px;margin-bottom:20px;border:1px solid #bbf7d0;">
                   <%= successMsg %>
                </div>
                <% session.removeAttribute("successMsg"); } 
                   if (errorMsg != null) { 
                %>
                <div style="background:#fee2e2;color:#b91c1c;padding:12px;border-radius:6px;margin-bottom:20px;border:1px solid #fecaca;">
                   <%= errorMsg %>
                </div>
                <% session.removeAttribute("errorMsg"); } %>

                <div class="content-card">
                    <div class="content-card-body">
                        <form action="postJob" method="post">
                            <input type="hidden" name="recruiterId" value="<%= recruiterId %>">

                            <div class="portal-form-group">
                                <label class="portal-label" for="job-role">Job Role / Position Title</label>
                                <input type="text" id="job-role" class="portal-input" name="role" placeholder="e.g. Software Engineer, Data Analyst" required>
                            </div>

                            <div class="portal-form-group">
                                <label class="portal-label" for="job-desc">Job Description</label>
                                <textarea id="job-desc" name="description" class="portal-textarea" rows="5" placeholder="Describe the role, responsibilities, and what you're looking for..." required></textarea>
                            </div>

                            <div class="form-grid-2" style="margin-bottom:18px;">
                                <div class="portal-form-group" style="margin-bottom:0;">
                                    <label class="portal-label" for="job-cgpa">Minimum CGPA Required</label>
                                    <input type="number" id="job-cgpa" class="portal-input" step="0.01" min="0" max="10" name="minCgpa" placeholder="e.g. 7.5" required>
                                </div>
                                <div class="portal-form-group" style="margin-bottom:0;">
                                    <label class="portal-label" for="job-lastdate">Last Date to Apply</label>
                                    <input type="date" id="job-lastdate" class="portal-input" name="lastDate" required>
                                </div>
                            </div>

                            <div class="portal-form-group">
                                <label class="portal-label" for="job-skills">Required Skills <span style="font-weight:400;color:#94a3b8;">(comma-separated)</span></label>
                                <input type="text" id="job-skills" class="portal-input" name="skills" placeholder="e.g. Java, Spring Boot, MySQL, REST APIs" required>
                            </div>

                            <div style="display:flex;gap:12px;justify-content:flex-end;margin-top:8px;">
                                <a href="Recruiters-Dashboard.jsp" class="btn-portal btn-portal-outline">Cancel</a>
                                <button type="submit" class="btn-portal btn-portal-primary" id="post-job-btn">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M6 12 3.269 3.125A59.769 59.769 0 0 1 21.485 12 59.768 59.768 0 0 1 3.27 20.875L5.999 12Zm0 0h7.5" /></svg>
                                    Publish Job
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
