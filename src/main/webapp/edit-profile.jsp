<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.campusplacement.model.Student"%>
<%@ page import="com.campusplacement.dao.StudentDAO"%>

<%
Integer userId = (Integer) session.getAttribute("userId");
if (userId == null) { response.sendRedirect("login.jsp"); return; }
StudentDAO studentDAO = new StudentDAO();
Student student = studentDAO.getStudentByUserId(userId);
String skills = student.getSkills() != null ? student.getSkills() : "";
String resumePath = student.getResumePath() != null ? student.getResumePath() : "";
String profileImage = student.getProfileImage() != null ? student.getProfileImage() : "";
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Edit Profile — Smart Campus Placement</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="./assets/css/portal.css">
<style>
.form-grid-2 { display:grid;grid-template-columns:1fr 1fr;gap:18px; }
@media(max-width:600px) { .form-grid-2 { grid-template-columns:1fr; } }
</style>
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
            <a href="./Profile.jsp" class="active" id="nav-profile"><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.8" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M17.982 18.725A7.488 7.488 0 0 0 12 15.75a7.488 7.488 0 0 0-5.982 2.975m11.963 0a9 9 0 1 0-11.963 0m11.963 0A8.966 8.966 0 0 1 12 21a8.966 8.966 0 0 1-5.982-2.275M15 9.75a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z" /></svg>Profile</a>
        </nav>
        <div class="sidebar-logout">
            <a href="LogutServlet" id="nav-logout"><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.8" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M15.75 9V5.25A2.25 2.25 0 0 0 13.5 3h-6a2.25 2.25 0 0 0-2.25 2.25v13.5A2.25 2.25 0 0 0 7.5 21h6a2.25 2.25 0 0 0 2.25-2.25V15m3 0 3-3m0 0-3-3m3 3H9" /></svg>Logout</a>
        </div>
    </aside>

    <div class="main-area">
        <div class="topbar">
            <div class="topbar-left">
                <a href="Profile.jsp" style="font-size:0.83rem;color:#5EB1BF;display:flex;align-items:center;gap:5px;font-weight:600;">
                    <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M10.5 19.5 3 12m0 0 7.5-7.5M3 12h18" /></svg>
                    Back to Profile
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
            <div style="max-width:700px;margin:0 auto;">
                <div class="page-header">
                    <h3>Edit Profile</h3>
                    <p>Update your academic and personal information.</p>
                </div>

                <div class="content-card">
                    <div class="content-card-body">
                        <form action="UpdateProfileServlet" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="studentId" value="<%= student.getStudentId() %>">

                            <div class="form-grid-2" style="margin-bottom:18px;">
                                <div class="portal-form-group" style="margin-bottom:0;">
                                    <label class="portal-label" for="ep-branch">Branch / Department</label>
                                    <input type="text" id="ep-branch" class="portal-input" name="branch" value="<%= student.getBranch() %>">
                                </div>
                                <div class="portal-form-group" style="margin-bottom:0;">
                                    <label class="portal-label" for="ep-cgpa">CGPA</label>
                                    <input type="text" id="ep-cgpa" class="portal-input" name="cgpa" value="<%= student.getCgpa() %>">
                                </div>
                            </div>

                            <div class="portal-form-group">
                                <label class="portal-label" for="ep-skills">Skills <span style="font-weight:400;color:#94a3b8;">(comma-separated)</span></label>
                                <input type="text" id="ep-skills" class="portal-input" name="skills" value="<%= skills %>" placeholder="Java, Python, React, SQL...">
                            </div>

                            <div class="form-grid-2" style="margin-bottom:18px;">
                                <div class="portal-form-group" style="margin-bottom:0;">
                                    <label class="portal-label" for="ep-email">Email Address</label>
                                    <input type="email" id="ep-email" class="portal-input" name="email" value="<%= student.getEmail() %>">
                                </div>
                                <div class="portal-form-group" style="margin-bottom:0;">
                                    <label class="portal-label" for="ep-phone">Phone Number</label>
                                    <input type="text" id="ep-phone" class="portal-input" name="phone" value="<%= student.getPhone() %>">
                                </div>
                            </div>

                            <div style="padding-top:16px;border-top:1px solid var(--border);margin-bottom:18px;">
                                <div style="font-size:0.85rem;font-weight:700;color:#042A2B;margin-bottom:16px;">Upload Files</div>
                                <div class="form-grid-2">
                                    <div class="portal-form-group" style="margin-bottom:0;">
                                        <label class="portal-label">Resume (PDF/DOC)</label>
                                        <input type="hidden" name="oldResume" value="<%= resumePath %>">
                                        <input type="file" name="resume" class="portal-input" accept=".pdf,.doc,.docx">
                                    </div>
                                    <div class="portal-form-group" style="margin-bottom:0;">
                                        <label class="portal-label">Profile Photo</label>
                                        <input type="hidden" name="oldPhoto" value="<%= profileImage %>">
                                        <input type="file" name="proPhoto" class="portal-input" accept="image/*">
                                    </div>
                                </div>
                            </div>

                            <div style="display:flex;justify-content:flex-end;gap:12px;margin-top:8px;">
                                <a href="Profile.jsp" class="btn-portal btn-portal-outline">Cancel</a>
                                <button type="submit" class="btn-portal btn-portal-primary" id="save-profile-btn">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="m4.5 12.75 6 6 9-13.5" /></svg>
                                    Save Changes
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