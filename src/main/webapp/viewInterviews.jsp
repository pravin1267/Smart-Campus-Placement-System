<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.campusplacement.dao.InterviewDAO"%>
<%@ page import="com.campusplacement.dao.RecruiterDAO"%>
<%@ page import="com.campusplacement.model.Interview"%>
<%@ page import="com.campusplacement.model.Recruiter"%>

<%
Integer userId = (Integer) session.getAttribute("userId");
if (userId == null) { response.sendRedirect("login.jsp"); return; }
RecruiterDAO recruiterDAO = new RecruiterDAO();
Recruiter recruiter = recruiterDAO.getRecruiterByUserId(userId);
InterviewDAO interviewDAO = new InterviewDAO();
List<Interview> list = interviewDAO.getInterviewByRecruiter(recruiter.getRecruiterId());
int interviewCount = list.size();
String companyInitial = recruiter.getCompanyName().substring(0,1).toUpperCase();
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Interview Schedule — Smart Campus Placement</title>
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
            <a href="viewApplicants.jsp" id="nav-applicants"><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.8" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M15 19.128a9.38 9.38 0 0 0 2.625.372 9.337 9.337 0 0 0 4.121-.952 4.125 4.125 0 0 0-7.533-2.493M15 19.128v-.003c0-1.113-.285-2.16-.786-3.07M15 19.128v.106A12.318 12.318 0 0 1 8.624 21c-2.331 0-4.512-.645-6.374-1.766l-.001-.109a6.375 6.375 0 0 1 11.964-3.07M12 6.375a3.375 3.375 0 1 1-6.75 0 3.375 3.375 0 0 1 6.75 0Zm8.25 2.25a2.625 2.625 0 1 1-5.25 0 2.625 2.625 0 0 1 5.25 0Z" /></svg>Applicants</a>
            <a href="viewInterviews.jsp" class="active" id="nav-rinterviews">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.8" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M6.75 3v2.25M17.25 3v2.25M3 18.75V7.5a2.25 2.25 0 0 1 2.25-2.25h13.5A2.25 2.25 0 0 1 21 7.5v11.25m-18 0A2.25 2.25 0 0 0 5.25 21h13.5A2.25 2.25 0 0 0 21 18.75m-18 0v-7.5A2.25 2.25 0 0 1 5.25 9h13.5A2.25 2.25 0 0 1 21 11.25v7.5" /></svg>
                Interviews
                <span style="margin-left:auto;background:rgba(255,255,255,0.2);border-radius:100px;padding:1px 7px;font-size:0.7rem;font-weight:700;"><%= interviewCount %></span>
            </a>
        </nav>
        <div class="sidebar-logout">
            <a href="LogutServlet" id="nav-logout"><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.8" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M15.75 9V5.25A2.25 2.25 0 0 0 13.5 3h-6a2.25 2.25 0 0 0-2.25 2.25v13.5A2.25 2.25 0 0 0 7.5 21h6a2.25 2.25 0 0 0 2.25-2.25V15m3 0 3-3m0 0-3-3m3 3H9" /></svg>Logout</a>
        </div>
    </aside>

    <div class="main-area">
        <div class="topbar">
            <div class="topbar-left"><div style="font-size:1rem;font-weight:700;color:#042A2B;">Interview Schedule</div></div>
            <div class="topbar-right">
                <div class="topbar-user">
                    <div class="topbar-user-avatar"><%= recruiter.getHrName().substring(0,1).toUpperCase() %></div>
                    <span class="topbar-user-name"><%= recruiter.getHrName() %></span>
                </div>
            </div>
        </div>

        <div class="page-content">
            <div class="page-header">
                <h3>Scheduled Interviews</h3>
                <p>All interview rounds associated with your job postings.</p>
            </div>

            <div class="stats-grid" style="grid-template-columns:repeat(auto-fill,minmax(180px,1fr));margin-bottom:24px;">
                <div class="stat-card">
                    <div class="stat-icon amber">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.8" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M6.75 3v2.25M17.25 3v2.25M3 18.75V7.5a2.25 2.25 0 0 1 2.25-2.25h13.5A2.25 2.25 0 0 1 21 7.5v11.25m-18 0A2.25 2.25 0 0 0 5.25 21h13.5A2.25 2.25 0 0 0 21 18.75m-18 0v-7.5A2.25 2.25 0 0 1 5.25 9h13.5A2.25 2.25 0 0 1 21 11.25v7.5" /></svg>
                    </div>
                    <div class="stat-info">
                        <div class="stat-label">Total Interviews</div>
                        <div class="stat-value"><%= interviewCount %></div>
                    </div>
                </div>
            </div>

            <div class="content-card">
                <div class="content-card-header">
                    <h4>
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.8" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M6.75 3v2.25M17.25 3v2.25M3 18.75V7.5a2.25 2.25 0 0 1 2.25-2.25h13.5A2.25 2.25 0 0 1 21 7.5v11.25m-18 0A2.25 2.25 0 0 0 5.25 21h13.5A2.25 2.25 0 0 0 21 18.75m-18 0v-7.5" /></svg>
                        All Interview Rounds
                    </h4>
                    <span class="badge-pill badge-warning"><%= interviewCount %> scheduled</span>
                </div>
                <% if(list == null || list.isEmpty()) { %>
                <div class="content-card-body">
                    <div class="empty-state">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M6.75 3v2.25M17.25 3v2.25M3 18.75V7.5a2.25 2.25 0 0 1 2.25-2.25h13.5A2.25 2.25 0 0 1 21 7.5v11.25m-18 0A2.25 2.25 0 0 0 5.25 21h13.5A2.25 2.25 0 0 0 21 18.75m-18 0v-7.5" /></svg>
                        <h5>No interviews scheduled yet</h5>
                        <p>Interview rounds will appear here once scheduled.</p>
                    </div>
                </div>
                <% } else { %>
                <div style="overflow-x:auto;">
                    <table class="portal-table">
                        <thead>
                            <tr>
                                <th>Company</th>
                                <th>Role</th>
                                <th>Date</th>
                                <th>Time</th>
                                <th>Mode</th>
                                <th>Result</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for(Interview itv : list) {
                                String result = itv.getResult() != null ? itv.getResult() : "Pending";
                                String resLower = result.toLowerCase();
                                String badgeClass = "badge-neutral";
                                if(resLower.contains("select") || resLower.contains("pass")) badgeClass = "badge-success";
                                else if(resLower.contains("reject") || resLower.contains("fail")) badgeClass = "badge-danger";
                                else if(resLower.contains("pending")) badgeClass = "badge-warning";
                            %>
                            <tr>
                                <td style="font-weight:600;"><%= itv.getCompanyName() %></td>
                                <td><%= itv.getRole() %></td>
                                <td style="color:#475569;"><%= itv.getInterviewDate() %></td>
                                <td style="color:#475569;"><%= itv.getInterviewTime() %></td>
                                <td><span class="badge-pill badge-info"><%= itv.getMode() %></span></td>
                                <td><span class="badge-pill <%= badgeClass %>"><%= result %></span></td>
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