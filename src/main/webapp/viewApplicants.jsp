<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.campusplacement.dao.ApplicationDAO"%>
<%@ page import="com.campusplacement.dao.RecruiterDAO"%>
<%@ page import="com.campusplacement.model.Application"%>
<%@ page import="com.campusplacement.model.Recruiter"%>

<%
Integer userId = (Integer) session.getAttribute("userId");
if (userId == null) { response.sendRedirect("login.jsp"); return; }
RecruiterDAO recruiterDAO = new RecruiterDAO();
Recruiter recruiter = recruiterDAO.getRecruiterByUserId(userId);
ApplicationDAO applicationDAO = new ApplicationDAO();
List<Application> apps = applicationDAO.getApplicantsByRecruiter(recruiter.getRecruiterId());
int applicantCount = apps.size();
String companyInitial = recruiter.getCompanyName().substring(0,1).toUpperCase();
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Applicants — Smart Campus Placement</title>
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
            <a href="Recruiters-Dashboard.jsp" id="nav-rdash"><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.8" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M3 13.125C3 12.504 3.504 12 4.125 12h2.25c.621 0 1.125.504 1.125 1.125v6.75C7.5 20.496 6.996 21 6.375 21h-2.25A1.125 1.125 0 0 1 3 19.875v-6.75ZM9.75 8.625c0-.621.504-1.125 1.125-1.125h2.25c.621 0 1.125.504 1.125 1.125v11.25c0 .621-.504 1.125-1.125 1.125h-2.25a1.125 1.125 0 0 1-1.125-1.125V8.625ZM16.5 4.125c0-.621.504-1.125 1.125-1.125h2.25C20.496 3 21 3.504 21 4.125v15.75c0 .621-.504 1.125-1.125 1.125h-2.25a1.125 1.125 0 0 1-1.125-1.125V4.125Z" /></svg>Dashboard</a>
            <a href="postJob.jsp" id="nav-postjob"><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.8" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M12 9v6m3-3H9m12 0a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z" /></svg>Post a Job</a>
            <a href="viewApplicants.jsp" class="active" id="nav-applicants">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.8" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M15 19.128a9.38 9.38 0 0 0 2.625.372 9.337 9.337 0 0 0 4.121-.952 4.125 4.125 0 0 0-7.533-2.493M15 19.128v-.003c0-1.113-.285-2.16-.786-3.07M15 19.128v.106A12.318 12.318 0 0 1 8.624 21c-2.331 0-4.512-.645-6.374-1.766l-.001-.109a6.375 6.375 0 0 1 11.964-3.07M12 6.375a3.375 3.375 0 1 1-6.75 0 3.375 3.375 0 0 1 6.75 0Zm8.25 2.25a2.625 2.625 0 1 1-5.25 0 2.625 2.625 0 0 1 5.25 0Z" /></svg>
                Applicants
                <span style="margin-left:auto;background:rgba(255,255,255,0.2);border-radius:100px;padding:1px 7px;font-size:0.7rem;font-weight:700;"><%= applicantCount %></span>
            </a>
            <a href="viewInterviews.jsp" id="nav-rinterviews"><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.8" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M6.75 3v2.25M17.25 3v2.25M3 18.75V7.5a2.25 2.25 0 0 1 2.25-2.25h13.5A2.25 2.25 0 0 1 21 7.5v11.25m-18 0A2.25 2.25 0 0 0 5.25 21h13.5A2.25 2.25 0 0 0 21 18.75m-18 0v-7.5A2.25 2.25 0 0 1 5.25 9h13.5A2.25 2.25 0 0 1 21 11.25v7.5" /></svg>Interviews</a>
        </nav>
        <div class="sidebar-logout">
            <a href="LogutServlet" id="nav-logout"><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.8" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M15.75 9V5.25A2.25 2.25 0 0 0 13.5 3h-6a2.25 2.25 0 0 0-2.25 2.25v13.5A2.25 2.25 0 0 0 7.5 21h6a2.25 2.25 0 0 0 2.25-2.25V15m3 0 3-3m0 0-3-3m3 3H9" /></svg>Logout</a>
        </div>
    </aside>

    <div class="main-area">
        <div class="topbar">
            <div class="topbar-left"><div style="font-size:1rem;font-weight:700;color:#042A2B;">Applicants</div></div>
            <div class="topbar-right">
                <div class="topbar-user">
                    <div class="topbar-user-avatar"><%= recruiter.getHrName().substring(0,1).toUpperCase() %></div>
                    <span class="topbar-user-name"><%= recruiter.getHrName() %></span>
                </div>
            </div>
        </div>

        <div class="page-content">
            <div class="page-header">
                <h3>Applicant Review</h3>
                <p>Review applications to your job postings and take action.</p>
            </div>

            <!-- Stat -->
            <div class="stats-grid" style="grid-template-columns:repeat(auto-fill, minmax(180px, 1fr));margin-bottom:24px;">
                <div class="stat-card">
                    <div class="stat-icon blue">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.8" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M15 19.128a9.38 9.38 0 0 0 2.625.372 9.337 9.337 0 0 0 4.121-.952 4.125 4.125 0 0 0-7.533-2.493M15 19.128v-.003c0-1.113-.285-2.16-.786-3.07M15 19.128v.106A12.318 12.318 0 0 1 8.624 21c-2.331 0-4.512-.645-6.374-1.766l-.001-.109a6.375 6.375 0 0 1 11.964-3.07M12 6.375a3.375 3.375 0 1 1-6.75 0 3.375 3.375 0 0 1 6.75 0Zm8.25 2.25a2.625 2.625 0 1 1-5.25 0 2.625 2.625 0 0 1 5.25 0Z" /></svg>
                    </div>
                    <div class="stat-info">
                        <div class="stat-label">Total Applicants</div>
                        <div class="stat-value"><%= applicantCount %></div>
                    </div>
                </div>
            </div>

            <div class="content-card">
                <div class="content-card-header">
                    <h4>
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.8" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M9 12h3.75M9 15h3.75M9 18h3.75m3 .75H18a2.25 2.25 0 0 0 2.25-2.25V6.108c0-1.135-.845-2.098-1.976-2.192a48.424 48.424 0 0 0-1.123-.08m-5.801 0c-.065.21-.1.433-.1.664 0 .414.336.75.75.75h4.5a.75.75 0 0 0 .75-.75 2.25 2.25 0 0 0-.1-.664m-5.8 0A2.251 2.251 0 0 1 13.5 2.25H15c1.012 0 1.867.668 2.15 1.586m-5.8 0c-.376.023-.75.05-1.124.08C9.095 4.01 8.25 4.973 8.25 6.108V8.25m0 0H4.875c-.621 0-1.125.504-1.125 1.125v11.25c0 .621.504 1.125 1.125 1.125h9.75c.621 0 1.125-.504 1.125-1.125V9.375c0-.621-.504-1.125-1.125-1.125H8.25ZM6.75 12h.008v.008H6.75V12Zm0 3h.008v.008H6.75V15Zm0 3h.008v.008H6.75V18Z" /></svg>
                        All Applications
                    </h4>
                    <span class="badge-pill badge-teal"><%= applicantCount %> total</span>
                </div>
                <% if(apps == null || apps.isEmpty()) { %>
                <div class="content-card-body">
                    <div class="empty-state">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M15 19.128a9.38 9.38 0 0 0 2.625.372 9.337 9.337 0 0 0 4.121-.952 4.125 4.125 0 0 0-7.533-2.493M15 19.128v-.003c0-1.113-.285-2.16-.786-3.07M15 19.128v.106A12.318 12.318 0 0 1 8.624 21c-2.331 0-4.512-.645-6.374-1.766l-.001-.109a6.375 6.375 0 0 1 11.964-3.07M12 6.375a3.375 3.375 0 1 1-6.75 0 3.375 3.375 0 0 1 6.75 0Zm8.25 2.25a2.625 2.625 0 1 1-5.25 0 2.625 2.625 0 0 1 5.25 0Z" /></svg>
                        <h5>No applicants yet</h5>
                        <p>Post a job to start receiving applications from students.</p>
                    </div>
                </div>
                <% } else { %>
                <div style="overflow-x:auto;">
                    <table class="portal-table">
                        <thead>
                            <tr>
                                <th>Application ID</th>
                                <th>Role Applied</th>
                                <th>Company</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for(Application app : apps) {
                                String st = app.getStatus() != null ? app.getStatus() : "PENDING";
                                String stLower = st.toLowerCase();
                                String badgeClass = "badge-neutral";
                                if(stLower.contains("shortlist") || stLower.contains("select")) badgeClass = "badge-success";
                                else if(stLower.contains("reject")) badgeClass = "badge-danger";
                                else if(stLower.contains("pending")) badgeClass = "badge-warning";
                            %>
                            <tr>
                                <td>
                                    <div style="display:flex;align-items:center;gap:10px;">
                                        <div style="width:32px;height:32px;border-radius:50%;background:var(--accent-light);display:flex;align-items:center;justify-content:center;font-size:0.75rem;font-weight:700;color:var(--primary);">
                                            #<%= app.getAppId() %>
                                        </div>
                                        <span style="font-weight:600;">App #<%= app.getAppId() %></span>
                                    </div>
                                </td>
                                <td><%= app.getJobDescription() %></td>
                                <td><%= app.getCompanyName() %></td>
                                <td><span class="badge-pill <%= badgeClass %>"><%= st %></span></td>
                                <td>
                                    <div style="display:flex;gap:8px;">
                                        <a href="UpdateStatusServlet?appId=<%= app.getAppId() %>&status=SHORTLISTED" class="btn-portal btn-portal-primary btn-portal-sm">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="13" height="13" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="m4.5 12.75 6 6 9-13.5" /></svg>
                                            Shortlist
                                        </a>
                                        <a href="UpdateStatusServlet?appId=<%= app.getAppId() %>&status=REJECTED" class="btn-portal btn-portal-danger btn-portal-sm">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="13" height="13" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M6 18 18 6M6 6l12 12" /></svg>
                                            Reject
                                        </a>
                                    </div>
                                </td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
                <% } %>
            </div>
        </div>
    </div>
</div>
</body>
</html>