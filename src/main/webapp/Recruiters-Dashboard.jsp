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

            <!-- Recruiter Profile Section -->
            <div class="content-card" style="margin-bottom: 28px;">
                <div class="content-card-header">
                    <h4>
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.8" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M15.75 6a3.75 3.75 0 1 1-7.5 0 3.75 3.75 0 0 1 7.5 0ZM4.501 20.118a7.5 7.5 0 0 1 14.998 0A17.933 17.933 0 0 1 12 21.75c-2.676 0-5.216-.584-7.499-1.632Z" /></svg>
                        Recruiter Profile
                    </h4>
                    <button class="btn-portal btn-portal-outline btn-portal-sm" onclick="document.getElementById('editProfileModal').style.display='flex'">
                        <svg xmlns="http://www.w3.org/2000/svg" width="13" height="13" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="m16.862 4.487 1.687-1.688a1.875 1.875 0 1 1 2.652 2.652L10.582 16.07a4.5 4.5 0 0 1-1.897 1.13L6 18l.8-2.685a4.5 4.5 0 0 1 1.13-1.897l8.932-8.931Zm0 0L19.5 7.125M18 14v4.75A2.25 2.25 0 0 1 15.75 21H5.25A2.25 2.25 0 0 1 3 18.75V8.25A2.25 2.25 0 0 1 5.25 6H10" /></svg>
                        Edit Profile
                    </button>
                </div>
                <div class="content-card-body">
                    <div style="display:flex;align-items:center;gap:24px;flex-wrap:wrap;">
                        <div class="profile-avatar-placeholder" style="width:72px;height:72px;font-size:1.6rem;">
                            <%= companyInitial %>
                        </div>
                        <div style="flex:1;min-width:260px;">
                            <div class="info-row" style="padding: 8px 0;">
                                <div class="info-label" style="min-width:100px;">HR Name</div>
                                <div class="info-value"><%= recruiter.getHrName() %></div>
                            </div>
                            <div class="info-row" style="padding: 8px 0;">
                                <div class="info-label" style="min-width:100px;">Company</div>
                                <div class="info-value"><%= recruiter.getCompanyName() %></div>
                            </div>
                        </div>
                        <div style="flex:1;min-width:260px;">
                            <div class="info-row" style="padding: 8px 0;">
                                <div class="info-label" style="min-width:100px;">Email</div>
                                <div class="info-value"><%= recruiter.getEmail() %></div>
                            </div>
                            <div class="info-row" style="padding: 8px 0;">
                                <div class="info-label" style="min-width:100px;">Contact</div>
                                <div class="info-value"><%= recruiter.getPhone() != null ? recruiter.getPhone() : "Not Provided" %></div>
                            </div>
                        </div>
                    </div>
                </div>
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
                    <div style="display:flex;flex-direction:column;gap:12px;">
                        <% for(Job job : jobs) { %>
                        <div class="item-card" style="padding: 16px 22px;">
                            <form action="deleteJobs" method="post" style="display:flex;align-items:center;justify-content:space-between;gap:20px;flex-wrap:wrap;">
                                <input type="hidden" name="jobId" value="<%= job.getJobId() %>">
                                
                                <div style="flex:1;min-width:250px;">
                                    <div class="item-title" style="margin-bottom:4px;font-size:1.1rem;"><%= job.getDescription() %></div>
                                    <div class="item-company" style="margin-bottom:8px;font-size:0.9rem;">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M3.75 21h16.5M4.5 3h15M5.25 3v18m13.5-18v18M9 6.75h1.5m-1.5 3h1.5m-1.5 3h1.5m3-6H15" /></svg>
                                        <%= recruiter.getCompanyName() %>
                                    </div>
                                    <div style="display:flex;gap:6px;flex-wrap:wrap;">
                                        <% if(job.getRequiredSkills() != null) {
                                               String[] skills = job.getRequiredSkills().split(",");
                                               for(String sk : skills) { %>
                                        <span class="badge-pill badge-info" style="font-size:0.7rem;"><%= sk.trim() %></span>
                                        <% } } %>
                                    </div>
                                </div>
                                
                                <div style="display:flex;flex-direction:column;align-items:flex-end;gap:10px;min-width:140px;">
                                    <span class="badge-pill badge-teal" style="background:#e0f2fe;color:#0369a1;padding:6px 14px;">Min CGPA: <%= job.getMinCgpa() %></span>
                                    <span style="color:#dc2626;font-size:0.82rem;font-weight:600;display:flex;align-items:center;gap:4px;">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M12 6v6h4.5m4.5 0a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z" /></svg>
                                        <%= job.getLastDate() %>
                                    </span>
                                    <button type="submit" class="btn-portal btn-portal-danger btn-portal-sm" onclick="return confirm('Delete this job posting?')" style="margin-top:4px;">
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
        <footer class="portal-footer">
            &copy; 2026 Smart Campus Placement System. All rights reserved.
        </footer>
    </div>
</div>

<!-- Edit Profile Modal -->
<div id="editProfileModal" style="display:none;position:fixed;top:0;left:0;width:100%;height:100%;background:rgba(4,42,43,0.5);z-index:9999;align-items:center;justify-content:center;padding:20px;">
    <div class="auth-card" style="max-width:500px;width:100%;position:relative;padding:32px;">
        <button onclick="document.getElementById('editProfileModal').style.display='none'" style="position:absolute;top:16px;right:16px;background:none;border:none;cursor:pointer;color:var(--text-muted);">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M6 18 18 6M6 6l12 12" /></svg>
        </button>
        <h3 style="margin-bottom:20px;font-size:1.3rem;">Edit Recruiter Profile</h3>
        <form action="UpdateRecruiterProfileServlet" method="post">
            <input type="hidden" name="recruiterId" value="<%= recruiter.getRecruiterId() %>">
            <div class="portal-form-group">
                <label class="portal-label">HR Name</label>
                <input type="text" name="hrName" class="portal-input" value="<%= recruiter.getHrName() %>" required>
            </div>
            <div class="portal-form-group">
                <label class="portal-label">Company Name</label>
                <input type="text" name="companyName" class="portal-input" value="<%= recruiter.getCompanyName() %>" required>
            </div>
            <div class="portal-form-group">
                <label class="portal-label">Email</label>
                <input type="email" name="email" class="portal-input" value="<%= recruiter.getEmail() %>" required>
            </div>
            <div class="portal-form-group">
                <label class="portal-label">Contact Number</label>
                <input type="text" name="phone" class="portal-input" value="<%= recruiter.getPhone() != null ? recruiter.getPhone() : "" %>" required>
            </div>
            <button type="submit" class="btn-portal btn-portal-primary" style="width:100%;justify-content:center;margin-top:10px;">Save Changes</button>
        </form>
    </div>
</div>

</body>
</html>