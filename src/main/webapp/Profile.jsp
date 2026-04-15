<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.campusplacement.dao.StudentDAO"%>
<%@ page import="com.campusplacement.model.Student"%>

<%
Integer userId = (Integer) session.getAttribute("userId");
if (userId == null) { response.sendRedirect("login.jsp"); return; }
StudentDAO studentDAO = new StudentDAO();
Student student = studentDAO.getStudentByUserId(userId);
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>My Profile — Smart Campus Placement</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="./assets/css/portal.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
            <a href="./my-application.jsp" id="nav-applications"><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.8" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M19.5 14.25v-2.625a3.375 3.375 0 0 0-3.375-3.375h-1.5A1.125 1.125 0 0 1 13.5 7.125v-1.5a3.375 3.375 0 0 0-3.375-3.375H8.25m0 12.75h7.5m-7.5 3H12M10.5 2.25H5.625c-.621 0-1.125.504-1.125 1.125v17.25c0 .621.504 1.125 1.125 1.125h12.75c.621 0 1.125-.504 1.125-1.125V11.25a9 9 0 0 0-9-9Z" /></svg>My Applications</a>
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
                <div style="font-size:1rem;font-weight:700;color:#042A2B;">My Profile</div>
            </div>
            <div class="topbar-right">
                <a href="edit-profile.jsp" class="btn-portal btn-portal-primary btn-portal-sm">
                    <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="m16.862 4.487 1.687-1.688a1.875 1.875 0 1 1 2.652 2.652L10.582 16.07a4.5 4.5 0 0 1-1.897 1.13L6 18l.8-2.685a4.5 4.5 0 0 1 1.13-1.897l8.932-8.931Zm0 0L19.5 7.125" /></svg>
                    Edit Profile
                </a>
                <div class="topbar-user">
                    <div class="topbar-user-avatar"><%= student.getFullName().substring(0,1).toUpperCase() %></div>
                    <span class="topbar-user-name"><%= student.getFullName() %></span>
                </div>
            </div>
        </div>

        <div class="page-content">
            <div style="max-width:760px;margin:0 auto;">

                <!-- Profile Header Card -->
                <div class="content-card" style="margin-bottom:20px;">
                    <div class="content-card-body">
                        <div style="display:flex;align-items:center;gap:24px;flex-wrap:wrap;padding-bottom:24px;border-bottom:1px solid var(--border);margin-bottom:24px;">
                            <% if(student.getProfileImage() != null && !student.getProfileImage().isEmpty()) { %>
                            <img src="profileImages/<%= student.getProfileImage() %>" class="profile-avatar" alt="Profile Photo" style="width:96px;height:96px;">
                            <% } else { %>
                            <div class="profile-avatar-placeholder"><%= student.getFullName().substring(0,1).toUpperCase() %></div>
                            <% } %>
                            <div>
                                <h2 style="font-size:1.4rem;font-weight:800;color:#042A2B;margin-bottom:8px;"><%= student.getFullName() %></h2>
                                <div style="display:flex;gap:10px;flex-wrap:wrap;">
                                    <span class="badge-pill badge-teal">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M12 6.042A8.967 8.967 0 0 0 6 3.75c-1.052 0-2.062.18-3 .512v14.25A8.987 8.987 0 0 1 6 18c2.305 0 4.408.867 6 2.292m0-14.25a8.966 8.966 0 0 1 6-2.292c1.052 0 2.062.18 3 .512v14.25A8.987 8.987 0 0 0 18 18a8.967 8.967 0 0 0-6 2.292m0-14.25v14.25" /></svg>
                                        <%= student.getBranch() %>
                                    </span>
                                    <span class="badge-pill badge-warning">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M11.48 3.499a.562.562 0 0 1 1.04 0l2.125 5.111a.563.563 0 0 0 .475.345l5.518.442c.499.04.701.663.321.988l-4.204 3.602a.563.563 0 0 0-.182.557l1.285 5.385a.562.562 0 0 1-.84.61l-4.725-2.885a.562.562 0 0 0-.586 0L6.982 20.54a.562.562 0 0 1-.84-.61l1.285-5.386a.562.562 0 0 0-.182-.557l-4.204-3.602a.562.562 0 0 1 .321-.988l5.518-.442a.563.563 0 0 0 .475-.345L11.48 3.5Z" /></svg>
                                        CGPA <%= student.getCgpa() %>
                                    </span>
                                </div>
                            </div>
                        </div>

                        <div class="info-row">
                            <div class="info-label">Email</div>
                            <div class="info-value"><%= student.getEmail() %></div>
                        </div>
                        <div class="info-row">
                            <div class="info-label">Phone</div>
                            <div class="info-value"><%= student.getPhone() %></div>
                        </div>
                        <div class="info-row">
                            <div class="info-label">Skills</div>
                            <div class="info-value">
                                <% if(student.getSkills() != null && !student.getSkills().isEmpty()) {
                                       String[] skills = student.getSkills().split(",");
                                       for(String skill : skills) { %>
                                <span class="badge-pill badge-teal" style="margin-right:6px;margin-bottom:4px;"><%= skill.trim() %></span>
                                <% } } else { %><span style="color:#94a3b8;">Not specified</span><% } %>
                            </div>
                        </div>
                        <div class="info-row">
                            <div class="info-label">Resume</div>
                            <div class="info-value">
                                <% if(student.getResumePath() != null && !student.getResumePath().isEmpty()) { %>
                                <a href="resumes/<%= student.getResumePath() %>" class="btn-portal btn-portal-outline btn-portal-sm" target="_blank">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M3 16.5v2.25A2.25 2.25 0 0 0 5.25 21h13.5A2.25 2.25 0 0 0 21 18.75V16.5M16.5 12 12 16.5m0 0L7.5 12m4.5 4.5V3" /></svg>
                                    Download Resume
                                </a>
                                <% } else { %><span style="color:#94a3b8;">No resume uploaded</span><% } %>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Upload Resume -->
                <div class="content-card">
                    <div class="content-card-header">
                        <h4>
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.8" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M3 16.5v2.25A2.25 2.25 0 0 0 5.25 21h13.5A2.25 2.25 0 0 0 21 18.75V16.5m-13.5-9L12 3m0 0 4.5 4.5M12 3v13.5" /></svg>
                            Upload / Update Resume
                        </h4>
                    </div>
                    <div class="content-card-body">
                        <form action="UpdateProfileServlet" method="post" enctype="multipart/form-data">
                            <!-- Required hidden fields for UpdateProfileServlet -->
                            <input type="hidden" name="studentId" value="<%= student.getStudentId() %>">
                            <input type="hidden" name="branch"    value="<%= student.getBranch() %>">
                            <input type="hidden" name="cgpa"      value="<%= student.getCgpa() %>">
                            <input type="hidden" name="skills"    value="<%= student.getSkills() != null ? student.getSkills() : "" %>">
                            <input type="hidden" name="email"     value="<%= student.getEmail() %>">
                            <input type="hidden" name="phone"     value="<%= student.getPhone() %>">
                            <input type="hidden" name="oldResume" value="<%= student.getResumePath() != null ? student.getResumePath() : "" %>">
                            <input type="hidden" name="oldPhoto"  value="<%= student.getProfileImage() != null ? student.getProfileImage() : "" %>">
                            <div style="display:flex;align-items:center;gap:14px;flex-wrap:wrap;">
                                <input type="file" name="resume" class="portal-input" style="flex:1;min-width:200px;" accept=".pdf,.doc,.docx" required>
                                <button type="submit" class="btn-portal btn-portal-primary" id="upload-resume-btn">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M3 16.5v2.25A2.25 2.25 0 0 0 5.25 21h13.5A2.25 2.25 0 0 0 21 18.75V16.5m-13.5-9L12 3m0 0 4.5 4.5M12 3v13.5" /></svg>
                                    Upload Resume
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

<%
String success = request.getParameter("success");
if ("true".equals(success)) {
%>
<script>
window.addEventListener('load', function() {
    Swal.fire({
        icon: 'success',
        title: 'Profile Updated!',
        text: 'Your profile has been updated successfully.',
        confirmButtonText: 'Great!',
        confirmButtonColor: '#5EB1BF',
        timer: 4000,
        timerProgressBar: true
    });
});
</script>
<% } %>

</html>