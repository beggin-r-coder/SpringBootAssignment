<%@ page language="java"
	import="java.util.List,com.capgemini.training.entity.Employee"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;600&family=DM+Sans:wght@300;400;500&display=swap" rel="stylesheet">
<style>
*, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

body {
	min-height: 100vh;
	background: #0a0a0f;
	font-family: 'DM Sans', sans-serif;
	color: #f0eeff;
	position: relative;
	padding: 40px 20px 56px;
}

body::before {
	content: '';
	position: fixed; width: 600px; height: 600px;
	background: radial-gradient(circle, rgba(99,60,180,0.16) 0%, transparent 70%);
	top: -180px; left: -180px; pointer-events: none;
	animation: orb1 9s ease-in-out infinite alternate;
}
body::after {
	content: '';
	position: fixed; width: 480px; height: 480px;
	background: radial-gradient(circle, rgba(30,180,140,0.11) 0%, transparent 70%);
	bottom: -100px; right: -100px; pointer-events: none;
	animation: orb2 11s ease-in-out infinite alternate;
}
@keyframes orb1 { from { transform: translate(0,0); } to { transform: translate(60px,40px); } }
@keyframes orb2 { from { transform: translate(0,0); } to { transform: translate(-50px,-30px); } }

.grid-bg {
	position: fixed; inset: 0; pointer-events: none;
	background-image:
		linear-gradient(rgba(255,255,255,0.025) 1px, transparent 1px),
		linear-gradient(90deg, rgba(255,255,255,0.025) 1px, transparent 1px);
	background-size: 60px 60px;
}

.card {
	position: relative; z-index: 10;
	max-width: 1080px; margin: 0 auto; width: 100%;
	background: rgba(255,255,255,0.04);
	border: 1px solid rgba(255,255,255,0.09);
	border-radius: 22px; padding: 40px 44px 36px;
	backdrop-filter: blur(24px);
	box-shadow: 0 32px 80px rgba(0,0,0,0.5), inset 0 1px 0 rgba(255,255,255,0.07);
	animation: fadeUp 0.7s cubic-bezier(0.22,1,0.36,1) both;
	text-align: center;
}

.greeting {
	font-size: 11px; font-weight: 500; letter-spacing: 0.1em;
	text-transform: uppercase; color: #1eb88c; margin-bottom: 8px;
	animation: fadeUp 0.7s 0.1s cubic-bezier(0.22,1,0.36,1) both;
	opacity: 0; animation-fill-mode: forwards;
}
h1 {
	font-family: 'Playfair Display', serif;
	font-size: 28px; font-weight: 600; color: #f0eeff;
	line-height: 1.2; letter-spacing: -0.3px; margin-bottom: 6px;
	animation: fadeUp 0.7s 0.16s cubic-bezier(0.22,1,0.36,1) both;
	opacity: 0; animation-fill-mode: forwards;
}
h1 span { color: #7c4dff; }
.sub {
	font-size: 13px; color: rgba(255,255,255,0.28); font-weight: 300;
	animation: fadeUp 0.7s 0.22s cubic-bezier(0.22,1,0.36,1) both;
	opacity: 0; animation-fill-mode: forwards;
}

.divider {
	height: 1px;
	background: linear-gradient(90deg, transparent, rgba(255,255,255,0.09), transparent);
	margin: 26px 0;
	animation: fadeUp 0.7s 0.28s cubic-bezier(0.22,1,0.36,1) both;
	opacity: 0; animation-fill-mode: forwards;
}

/* ADD BUTTON */
.add-emp-btn {
	display: inline-flex; align-items: center; gap: 6px;
	margin: 0 auto 22px;
	padding: 8px 18px; border-radius: 10px;
	background: linear-gradient(135deg, #1eb88c 0%, #0e9070 100%);
	color: #fff; text-decoration: none; font-size: 12px; font-weight: 600;
	letter-spacing: 0.02em;
	border: 1px solid rgba(30,184,140,0.15);
	box-shadow: 0 4px 16px rgba(30,184,140,0.2);
	transition: transform 0.18s, box-shadow 0.18s;
}
.add-emp-btn:hover { transform: translateY(-2px); box-shadow: 0 8px 24px rgba(30,184,140,0.3); }
.add-emp-btn:active { transform: translateY(0); }

/* TABLE SECTION */
.table-section {
	text-align: left;
	animation: fadeUp 0.7s 0.34s cubic-bezier(0.22,1,0.36,1) both;
	opacity: 0; animation-fill-mode: forwards;
}
.table-top {
	display: flex; align-items: center; justify-content: space-between;
	margin-bottom: 14px;
}
.table-title {
	font-family: 'Playfair Display', serif;
	font-size: 18px; font-weight: 600; color: #f0eeff;
}
.table-badge {
	font-size: 10px; font-weight: 600; letter-spacing: 0.08em;
	text-transform: uppercase; color: #1eb88c;
	background: rgba(30,184,140,0.08); border: 1px solid rgba(30,184,140,0.16);
	padding: 4px 12px; border-radius: 99px;
	display: inline-flex; align-items: center; gap: 5px;
}
.table-badge::before {
	content: ''; width: 5px; height: 5px; border-radius: 50%;
	background: #1eb88c; flex-shrink: 0;
	animation: pulse 2s ease-in-out infinite;
}
@keyframes pulse { 0%,100%{opacity:1;transform:scale(1)} 50%{opacity:0.35;transform:scale(0.75)} }

/* TABLE */
.table-wrapper {
	width: 100%; border-radius: 14px;
	border: 1px solid rgba(255,255,255,0.07);
	background: rgba(255,255,255,0.015);
	overflow: hidden;
}
.emp-table { width: 100%; border-collapse: collapse; table-layout: fixed; }

/* Column widths — total 100%
   Id:4  EmpId:8  Name:15  Email:22  Contact:13  City:17  Actions:21  */
.emp-table colgroup col:nth-child(1) { width: 4%; }
.emp-table colgroup col:nth-child(2) { width: 8%; }
.emp-table colgroup col:nth-child(3) { width: 15%; }
.emp-table colgroup col:nth-child(4) { width: 22%; }
.emp-table colgroup col:nth-child(5) { width: 13%; }
.emp-table colgroup col:nth-child(6) { width: 17%; }
.emp-table colgroup col:nth-child(7) { width: 21%; }

/* HEADER */
.emp-table thead {
	background: linear-gradient(90deg,
		rgba(124,77,255,0.1) 0%,
		rgba(30,184,140,0.05) 60%,
		rgba(124,77,255,0.07) 100%);
}
.emp-table th {
	padding: 11px 12px; text-align: left;
	font-size: 9px; font-weight: 700;
	letter-spacing: 0.1em; text-transform: uppercase;
	color: rgba(255,255,255,0.32);
	border-bottom: 1px solid rgba(255,255,255,0.06);
	white-space: nowrap; overflow: hidden;
}

/* ROWS */
.emp-table tbody tr {
	border-bottom: 1px solid rgba(255,255,255,0.035);
	transition: background 0.18s;
}
.emp-table tbody tr:last-child { border-bottom: none; }
.emp-table tbody tr:hover { background: rgba(124,77,255,0.06); }
.emp-table tbody tr:hover td:first-child {
	border-left: 2px solid #7c4dff; padding-left: 10px;
}

/* CELLS */
.emp-table td {
	padding: 11px 12px; font-size: 12px;
	color: rgba(255,255,255,0.65); vertical-align: middle;
	overflow: hidden; text-overflow: ellipsis; white-space: nowrap;
}

/* Id */
.emp-table td:first-child {
	color: rgba(255,255,255,0.2); font-size: 10px; font-weight: 500;
	border-left: 2px solid transparent;
	transition: border-color 0.18s, padding 0.18s;
}

/* EmpId pill */
.empid-pill {
	display: inline-block;
	background: rgba(124,77,255,0.14); color: #c4b5ff;
	border: 1px solid rgba(124,77,255,0.22);
	border-radius: 6px; padding: 2px 8px;
	font-size: 10px; font-weight: 700; letter-spacing: 0.04em;
}

/* Name */
.emp-table td:nth-child(3) { color: #f0eeff; font-weight: 500; font-size: 12px; }
.name-wrap { display: flex; align-items: center; gap: 8px; }
.avatar-dot {
	width: 24px; height: 24px; border-radius: 50%; flex-shrink: 0;
	display: flex; align-items: center; justify-content: center;
	font-size: 10px; font-weight: 700; color: #fff; text-transform: uppercase;
	background: linear-gradient(135deg, #7c4dff, #1eb88c);
}
.name-text { overflow: hidden; text-overflow: ellipsis; white-space: nowrap; }

/* Email */
.emp-table td:nth-child(4) { color: rgba(255,255,255,0.32); font-size: 11px; }

/* Contact */
.emp-table td:nth-child(5) { color: rgba(255,255,255,0.45); font-size: 11px; }

/* City — allow chip to wrap text if long, no clipping */
.emp-table td:nth-child(6) {
	font-size: 11px;
	overflow: visible;
	white-space: normal;
}
.city-chip {
	display: inline-flex; align-items: center; gap: 4px;
	background: rgba(30,184,140,0.08); color: #1eb88c;
	border: 1px solid rgba(30,184,140,0.16);
	border-radius: 6px; padding: 2px 8px;
	font-size: 10px; font-weight: 600;
	white-space: nowrap;
	max-width: 100%;
	overflow: hidden; text-overflow: ellipsis;
}
.city-chip::before {
	content: ''; width: 4px; height: 4px;
	border-radius: 50%; background: #1eb88c; flex-shrink: 0;
}

/* Actions */
.emp-table td:nth-child(7) { overflow: visible; white-space: nowrap; }
.action-group { display: flex; align-items: center; gap: 4px; }
.action-link {
	display: inline-flex; align-items: center;
	padding: 3px 9px; border-radius: 6px;
	font-size: 10px; font-weight: 700; letter-spacing: 0.03em;
	text-decoration: none; white-space: nowrap;
	transition: transform 0.15s, box-shadow 0.15s, background 0.15s;
}
.action-link:hover { transform: translateY(-1px); }
.action-link:active { transform: translateY(0); }
.action-link.view {
	background: rgba(124,77,255,0.13); color: #c4b5ff;
	border: 1px solid rgba(124,77,255,0.24);
}
.action-link.view:hover { background: rgba(124,77,255,0.22); box-shadow: 0 3px 10px rgba(124,77,255,0.18); }
.action-link.edit {
	background: rgba(232,168,56,0.11); color: #f0c060;
	border: 1px solid rgba(232,168,56,0.22);
}
.action-link.edit:hover { background: rgba(232,168,56,0.2); box-shadow: 0 3px 10px rgba(232,168,56,0.14); }
.action-link.delete {
	background: rgba(232,60,60,0.1); color: #ff8080;
	border: 1px solid rgba(232,60,60,0.2);
}
.action-link.delete:hover { background: rgba(232,60,60,0.2); box-shadow: 0 3px 10px rgba(232,60,60,0.16); }

.emp-table .no-data {
	text-align: center; padding: 36px;
	color: rgba(255,255,255,0.2); font-size: 13px;
}

/* NAV */
.nav-links {
	display: flex; justify-content: center; gap: 10px;
	animation: fadeUp 0.7s 0.44s cubic-bezier(0.22,1,0.36,1) both;
	opacity: 0; animation-fill-mode: forwards;
}
.nav-links a {
	padding: 8px 18px; border-radius: 10px; font-size: 12px;
	text-decoration: none; border: 1px solid rgba(255,255,255,0.09);
	color: rgba(255,255,255,0.4); background: rgba(255,255,255,0.04);
	transition: background 0.22s, color 0.22s, border-color 0.22s, transform 0.18s;
}
.nav-links a:hover { background: rgba(124,77,255,0.1); border-color: rgba(124,77,255,0.3); color: #c4b5ff; transform: translateY(-2px); }
.nav-links a.logout:hover { background: rgba(255,80,80,0.1); border-color: rgba(255,80,80,0.25); color: rgba(255,160,160,0.85); }

@keyframes fadeUp {
	from { opacity: 0; transform: translateY(20px); }
	to   { opacity: 1; transform: translateY(0); }
}
</style>
</head>
<body>

	<div class="grid-bg"></div>

	<div class="card">
		<p class="greeting">Dashboard</p>
		<h1>
			Welcome to <span>Home</span> Page!
		</h1>
		<p class="sub">You're logged in. What would you like to do next?</p>

		<div class="divider"></div>

		<a href="addemp" class="add-emp-btn">+ Add a new Employee</a>

		<div class="table-section">
			<div class="table-top">
				<span class="table-title">All Employees</span>
				<span class="table-badge">Directory</span>
			</div>

			<%
			List<Employee> employees = (List<Employee>) request.getAttribute("emplist");
			%>
			<div class="table-wrapper">
				<table class="emp-table">
					<colgroup>
						<col />
						<col />
						<col />
						<col />
						<col />
						<col />
						<col />
					</colgroup>
					<thead>
						<tr>
							<th>Id</th>
							<th>EmpId</th>
							<th>Name</th>
							<th>Email</th>
							<th>Contact No</th>
							<th>City</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
						<% if (employees != null && !employees.isEmpty()) {
							for (Employee emp : employees) { %>
							<tr>
								<td><%= emp.getId() %></td>
								<td><span class="empid-pill"><%= emp.getEmpId() %></span></td>
								<td title="<%= emp.getEmpName() %>">
									<div class="name-wrap">
										<div class="avatar-dot"><%= emp.getEmpName().substring(0,1) %></div>
										<span class="name-text"><%= emp.getEmpName() %></span>
									</div>
								</td>
								<td title="<%= emp.getEmpEmail() %>"><%= emp.getEmpEmail() %></td>
								<td><%= emp.getEmpContactNo() %></td>
								<td title="<%= emp.getEmpCity() %>"><span class="city-chip"><%= emp.getEmpCity() %></span></td>
								<td>
									<div class="action-group">
										<a href="view-emp?empid=<%=emp.getId()%>" class="action-link view">View</a>
										<a href="edit?empid=<%=emp.getId()%>" class="action-link edit">Edit</a>
										<a href="delete?empid=<%=emp.getId()%>" class="action-link delete">Delete</a>
									</div>
								</td>
							</tr>
							<% }
						} else { %>
							<tr>
								<td class="no-data" colspan="7">No employees found.</td>
							</tr>
						<% } %>
					</tbody>
				</table>
			</div>
		</div>

		<div class="divider"></div>

		<div class="nav-links">
			<a href="#">Profile</a> <a href="#">Settings</a> <a href="login.jsp"
				class="logout">Logout</a>
		</div>
	</div>

</body>
</html>
