<%@ page import="java.util.List"%>
<%@ page import="com.campusplacement.dao.JobDAO"%>
<%@ page import="com.campusplacement.dao.RecruiterDAO"%>
<%@ page import="com.campusplacement.model.Job"%>
<%@ page import="com.campusplacement.model.Recruiter"%>

<%
Integer userId = (Integer) session.getAttribute("userId");
if (userId == null) { response.sendRedirect("login.jsp"); return; }
RecruiterDAO recruiterDAO = new RecruiterDAO();
Recruiter recruiter = recruiterDAO.getRecruiterByUserId(userId);
if (recruiter == null) { out.println("Error: Recruiter not found"); return; }
JobDAO jobDAO = new JobDAO();
List<Job> jobs = jobDAO.getJobsByRecruiter(recruiter.getRecruiterId());
if (jobs == null) jobs = jobDAO.getAllJobs();
String companyInitial = recruiter.getCompanyName().substring(0,1).toUpperCase();
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Recruiter Dashboard — Smart Campus Placement</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="./assets/css/portal.css">
<style>.recruiter-sidebar-bg { background: linear-gradient(180deg, #0f2027 0%, #203a43 50%, #2c5364 100%) !important; }</style>
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
            <a href="Recruiters-Dashboard.jsp" class="active" id="nav-rdash"><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.8" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M3 13.125C3 12.504 3.504 12 4.125 12h2.25c.621 0 1.125.504 1.125 1.125v6.75C7.5 20.496 6.996 21 6.375 21h-2.25A1.125 1.125 0 0 1 3 19.875v-6.75ZM9.75 8.625c0-.621.504-1.125 1.125-1.125h2.25c.621 0 1.125.504 1.125 1.125v11.25c0 .621-.504 1.125-1.125 1.125h-2.25a1.125 1.125 0 0 1-1.125-1.125V8.625ZM16.5 4.125c0-.621.504-1.125 1.125-1.125h2.25C20.496 3 21 3.504 21 4.125v15.75c0 .621-.504 1.125-1.125 1.125h-2.25a1.125 1.125 0 0 1-1.125-1.125V4.125Z" /></svg>Dashboard</a>
            <a href="postJob.jsp" id="nav-postjob"><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.8" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M12 9v6m3-3H9m12 0a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z" /></svg>Post a Job</a>
            <a href="viewApplicants.jsp" id="nav-applicants"><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.8" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M15 19.128a9.38 9.38 0 0 0 2.625.372 9.337 9.337 0 0 0 4.121-.952 4.125 4.125 0 0 0-7.533-2.493M15 19.128v-.003c0-1.113-.285-2.16-.786-3.07M15 19.128v.106A12.318 12.318 0 0 1 8.624 21c-2.331 0-4.512-.645-6.374-1.766l-.001-.109a6.375 6.375 0 0 1 11.964-3.07M12 6.375a3.375 3.375 0 1 1-6.75 0 3.375 3.375 0 0 1 6.75 0Zm8.25 2.25a2.625 2.625 0 1 1-5.25 0 2.625 2.625 0 0 1 5.25 0Z" /></svg>Applicants</a>
            <a href="viewInterviews.jsp" id="nav-rinterviews"><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.8" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M6.75 3v2.25M17.25 3v2.25M3 18.75V7.5a2.25 2.25 0 0 1 2.25-2.25h13.5A2.25 2.25 0 0 1 21 7.5v11.25m-18 0A2.25 2.25 0 0 0 5.25 21h13.5A2.25 2.25 0 0 0 21 18.75m-18 0v-7.5A2.25 2.25 0 0 1 5.25 9h13.5A2.25 2.25 0 0 1 21 11.25v7.5" /></svg>Interviews</a>
        </nav>
        <div class="sidebar-logout">
            <a href="LogutServlet" id="nav-logout"><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.8" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M15.75 9V5.25A2.25 2.25 0 0 0 13.5 3h-6a2.25 2.25 0 0 0-2.25 2.25v13.5A2.25 2.25 0 0 0 7.5 21h6a2.25 2.25 0 0 0 2.25-2.25V15m3 0 3-3m0 0-3-3m3 3H9" /></svg>Logout</a>
        </div>
    </aside>

    <div class="main-area">
        <div class="topbar">
            <div class="topbar-left"><div style="font-size:1rem;font-weight:700;color:#042A2B;">Recruiter Dashboard</div></div>
            <div class="topbar-right">
                <a href="postJob.jsp" class="btn-portal btn-portal-primary btn-portal-sm">
                    <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M12 9v6m3-3H9m12 0a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z" /></svg>
                    Post New Job
                </a>
                <div class="topbar-user">
                    <div class="topbar-user-avatar"><%= recruiter.getHrName().substring(0,1).toUpperCase() %></div>
                    <span class="topbar-user-name"><%= recruiter.getHrName() %></span>
                </div>
            </div>
        </div>

        <div class="page-content">
            <div class="page-header">
                <h3>Welcome, <%= recruiter.getHrName() %> 👋</h3>
                <p>Manage your job postings and track applicants from <%= recruiter.getCompanyName() %>.</p>
            </div>

            <!-- Stats -->
            <div class="stats-grid" style="grid-template-columns:repeat(auto-fill,minmax(200px,1fr));">
                <div class="stat-card">
                    <div class="stat-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.8" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M3.75 21h16.5M4.5 3h15M5.25 3v18m13.5-18v18M9 6.75h1.5m-1.5 3h1.5m-1.5 3h1.5m3-6H15m-1.5 3H15m-1.5 3H15M9 21v-3.375c0-.621.504-1.125 1.125-1.125h3.75c.621 0 1.125.504 1.125 1.125V21" /></svg>
                    </div>
                    <div class="stat-info">
                        <div class="stat-label">Company</div>
                        <div class="stat-value" style="font-size:1rem;line-height:1.3;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;"><%= recruiter.getCompanyName() %></div>
                    </div>
                </div>
                <div class="stat-card">
                    <div class="stat-icon blue">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.8" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M21.75 6.75v10.5a2.25 2.25 0 0 1-2.25 2.25h-15a2.25 2.25 0 0 1-2.25-2.25V6.75m19.5 0A2.25 2.25 0 0 0 19.5 4.5h-15a2.25 2.25 0 0 0-2.25 2.25m19.5 0v.243a2.25 2.25 0 0 1-1.07 1.916l-7.5 4.615a2.25 2.25 0 0 1-2.36 0L3.32 8.91a2.25 2.25 0 0 1-1.07-1.916V6.75" /></svg>
                    </div>
                    <div class="stat-info">
                        <div class="stat-label">Email</div>
                        <div class="stat-value" style="font-size:0.82rem;"><%= recruiter.getEmail() %></div>
                    </div>
                </div>
                <div class="stat-card">
                    <div class="stat-icon green">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.8" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M20.25 14.15v4.25c0 1.094-.787 2.036-1.872 2.18-2.087.277-4.216.42-6.378.42s-4.291-.143-6.378-.42c-1.085-.144-1.872-1.086-1.872-2.18v-4.25m16.5 0a2.18 2.18 0 0 0 .75-1.661V8.706c0-1.081-.768-2.015-1.837-2.175a48.114 48.114 0 0 0-3.413-.387m4.5 8.006-3.75 3.75-3.75-3.75" /></svg>
                    </div>
                    <div class="stat-info">
                        <div class="stat-label">Total Job Listings</div>
                        <div class="stat-value"><%= jobs.size() %></div>
                    </div>
                </div>
            </div>

            <!-- Jobs -->
            <div class="content-card">
                <div class="content-card-header">
                    <h4>
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.8" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M8.25 6.75h12M8.25 12h12m-12 5.25h12M3.75 6.75h.007v.008H3.75V6.75Zm.375 0a.375.375 0 1 1-.75 0 .375.375 0 0 1 .75 0ZM3.75 12h.007v.008H3.75V12Zm.375 0a.375.375 0 1 1-.75 0 .375.375 0 0 1 .75 0Zm-.375 5.25h.007v.008H3.75v-.008Zm.375 0a.375.375 0 1 1-.75 0 .375.375 0 0 1 .75 0Z" /></svg>
                        Your Active Job Listings
                    </h4>
                    <a href="postJob.jsp" class="btn-portal btn-portal-primary btn-portal-sm">
                        <svg xmlns="http://www.w3.org/2000/svg" width="13" height="13" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M12 9v6m3-3H9m12 0a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z" /></svg>
                        Post New Job
                    </a>
                </div>
                <% if(jobs == null || jobs.isEmpty()) { %>
                <div class="content-card-body">
                    <div class="empty-state">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M20.25 14.15v4.25c0 1.094-.787 2.036-1.872 2.18-2.087.277-4.216.42-6.378.42s-4.291-.143-6.378-.42c-1.085-.144-1.872-1.086-1.872-2.18v-4.25m16.5 0a2.18 2.18 0 0 0 .75-1.661V8.706c0-1.081-.768-2.015-1.837-2.175a48.114 48.114 0 0 0-3.413-.387m4.5 8.006-3.75 3.75-3.75-3.75" /></svg>
                        <h5>No job listings yet</h5>
                        <p>Post your first job to find top talent from campus!</p>
                        <a href="postJob.jsp" class="btn-portal btn-portal-primary" style="margin-top:16px;display:inline-flex;">Post a Job</a>
                    </div>
                </div>
                <% } else { %>
                <div class="content-card-body">
                    <div class="items-grid">
                        <% for(Job job : jobs) { %>
                        <div class="item-card">
                            <form action="deleteJobs" method="post">
                                <input type="hidden" name="jobId" value="<%= job.getJobId() %>">
                                <div style="display:flex;justify-content:space-between;align-items:flex-start;gap:12px;flex-wrap:wrap;margin-bottom:8px;">
                                    <div>
                                        <div class="item-title"><%= job.getDescription() %></div>
                                        <div class="item-company">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="13" height="13" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M3.75 21h16.5M4.5 3h15M5.25 3v18m13.5-18v18M9 6.75h1.5m-1.5 3h1.5m-1.5 3h1.5m3-6H15" /></svg>
                                            <%= recruiter.getCompanyName() %>
                                        </div>
                                    </div>
                                    <span class="badge-pill badge-teal">Min CGPA: <%= job.getMinCgpa() %></span>
                                </div>
                                <div style="margin-bottom:10px;">
                                    <% if(job.getRequiredSkills() != null) {
                                           String[] skills = job.getRequiredSkills().split(",");
                                           for(String sk : skills) { %>
                                    <span class="badge-pill badge-info" style="margin-right:4px;margin-bottom:3px;font-size:0.7rem;"><%= sk.trim() %></span>
                                    <% } } %>
                                </div>
                                <div class="item-meta">
                                    <span style="color:#dc2626;font-size:0.78rem;">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M12 6v6h4.5m4.5 0a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z" /></svg>
                                        Deadline: <%= job.getLastDate() %>
                                    </span>
                                    <button type="submit" class="btn-portal btn-portal-danger btn-portal-sm" style="margin-left:auto;"
                                            onclick="return confirm('Delete this job posting?')">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="13" height="13" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="m14.74 9-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107 1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 0 1-2.244 2.077H8.084a2.25 2.25 0 0 1-2.244-2.077L4.772 5.79m14.456 0a48.108 48.108 0 0 0-3.478-.397m-12 .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0 0 1 3.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964 51.964 0 0 0-3.32 0c-1.18.037-2.09 1.022-2.09 2.201v.916m7.5 0a48.667 48.667 0 0 0-7.5 0" /></svg>
                                        Delete
                                    </button>
                                </div>
                            </form>
                        </div>
                        <% } %>
                    </div>
                </div>
                <% } %>
            </div>
        </div>
    </div>
</div>
</body>
</html>