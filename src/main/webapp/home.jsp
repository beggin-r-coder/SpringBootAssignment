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
	padding: 48px 24px 64px;
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
	max-width: 1100px;
	margin: 0 auto;
	width: 100%;
	background: rgba(255,255,255,0.04);
	border: 1px solid rgba(255,255,255,0.09);
	border-radius: 24px;
	padding: 44px 48px 40px;
	backdrop-filter: blur(24px);
	box-shadow: 0 32px 80px rgba(0,0,0,0.5), inset 0 1px 0 rgba(255,255,255,0.07);
	animation: fadeUp 0.7s cubic-bezier(0.22,1,0.36,1) both;
	text-align: center;
}

.greeting {
	font-size: 12px; font-weight: 500; letter-spacing: 0.1em;
	text-transform: uppercase; color: #1eb88c; margin-bottom: 10px;
	animation: fadeUp 0.7s 0.1s cubic-bezier(0.22,1,0.36,1) both;
	opacity: 0; animation-fill-mode: forwards;
}

h1 {
	font-family: 'Playfair Display', serif;
	font-size: 30px; font-weight: 600;
	color: #f0eeff; line-height: 1.2;
	letter-spacing: -0.3px; margin-bottom: 8px;
	animation: fadeUp 0.7s 0.16s cubic-bezier(0.22,1,0.36,1) both;
	opacity: 0; animation-fill-mode: forwards;
}
h1 span { color: #7c4dff; }

.sub {
	font-size: 14px; color: rgba(255,255,255,0.32);
	font-weight: 300; margin-bottom: 0;
	animation: fadeUp 0.7s 0.22s cubic-bezier(0.22,1,0.36,1) both;
	opacity: 0; animation-fill-mode: forwards;
}

.divider {
	height: 1px;
	background: linear-gradient(90deg, transparent, rgba(255,255,255,0.1), transparent);
	margin: 32px 0;
	animation: fadeUp 0.7s 0.28s cubic-bezier(0.22,1,0.36,1) both;
	opacity: 0; animation-fill-mode: forwards;
}

/* TABLE SECTION */
.table-section {
	text-align: left;
	animation: fadeUp 0.7s 0.34s cubic-bezier(0.22,1,0.36,1) both;
	opacity: 0; animation-fill-mode: forwards;
}

.table-top {
	display: flex; align-items: center; justify-content: space-between;
	margin-bottom: 20px;
}
.table-title {
	font-family: 'Playfair Display', serif;
	font-size: 20px; font-weight: 600; color: #f0eeff;
	letter-spacing: -0.2px;
}
.table-badge {
	font-size: 11px; font-weight: 500; letter-spacing: 0.08em;
	text-transform: uppercase; color: #1eb88c;
	background: rgba(30,184,140,0.08);
	border: 1px solid rgba(30,184,140,0.18);
	padding: 5px 14px; border-radius: 99px;
	display: inline-flex; align-items: center; gap: 6px;
}
.table-badge::before {
	content: '';
	display: inline-block; width: 6px; height: 6px;
	border-radius: 50%; background: #1eb88c;
	animation: pulse 2s ease-in-out infinite;
}
@keyframes pulse {
	0%, 100% { opacity: 1; transform: scale(1); }
	50% { opacity: 0.4; transform: scale(0.8); }
}

/* TABLE SHELL */
.table-wrapper {
	width: 100%; overflow-x: auto;
	border-radius: 16px;
	border: 1px solid rgba(255,255,255,0.07);
	background: rgba(255,255,255,0.02);
}

.emp-table {
	width: 100%; border-collapse: collapse;
	table-layout: fixed;
}

.emp-table colgroup col:nth-child(1) { width: 6%; }
.emp-table colgroup col:nth-child(2) { width: 10%; }
.emp-table colgroup col:nth-child(3) { width: 20%; }
.emp-table colgroup col:nth-child(4) { width: 32%; }
.emp-table colgroup col:nth-child(5) { width: 16%; }
.emp-table colgroup col:nth-child(6) { width: 16%; }

/* HEADER */
.emp-table thead {
	background: linear-gradient(90deg,
		rgba(124,77,255,0.12) 0%,
		rgba(30,184,140,0.06) 50%,
		rgba(124,77,255,0.08) 100%);
}
.emp-table th {
	padding: 14px 18px; text-align: left;
	font-size: 10px; font-weight: 600;
	letter-spacing: 0.1em; text-transform: uppercase;
	color: rgba(255,255,255,0.38);
	border-bottom: 1px solid rgba(255,255,255,0.07);
	position: relative;
}
.emp-table th:not(:last-child)::after {
	content: '';
	position: absolute; right: 0; top: 25%; bottom: 25%;
	width: 1px; background: rgba(255,255,255,0.06);
}

/* ROWS */
.emp-table tbody tr {
	border-bottom: 1px solid rgba(255,255,255,0.04);
	transition: background 0.2s;
}
.emp-table tbody tr:last-child { border-bottom: none; }
.emp-table tbody tr:hover { background: rgba(124,77,255,0.07); }
.emp-table tbody tr:hover td:first-child {
	border-left: 2px solid #7c4dff;
	padding-left: 16px;
}

/* CELLS */
.emp-table td {
	padding: 15px 18px; font-size: 13px;
	color: rgba(255,255,255,0.7); vertical-align: middle;
	overflow: hidden; text-overflow: ellipsis; white-space: nowrap;
	transition: color 0.2s;
}

/* ID */
.emp-table td:first-child {
	color: rgba(255,255,255,0.22); font-size: 11px; font-weight: 500;
	border-left: 2px solid transparent;
	transition: border-color 0.2s, padding 0.2s;
}

/* EmpId pill */
.empid-pill {
	display: inline-block;
	background: rgba(124,77,255,0.15); color: #c4b5ff;
	border: 1px solid rgba(124,77,255,0.25);
	border-radius: 8px; padding: 3px 10px;
	font-size: 11px; font-weight: 600; letter-spacing: 0.04em;
}

/* Name with avatar initial */
.emp-table td:nth-child(3) { color: #f0eeff; font-weight: 500; }
.name-wrap { display: flex; align-items: center; gap: 10px; }
.avatar-dot {
	width: 28px; height: 28px; border-radius: 50%; flex-shrink: 0;
	display: flex; align-items: center; justify-content: center;
	font-size: 11px; font-weight: 600; color: #fff; text-transform: uppercase;
	background: linear-gradient(135deg, #7c4dff, #1eb88c);
}
.name-text { overflow: hidden; text-overflow: ellipsis; white-space: nowrap; }

/* Email */
.emp-table td:nth-child(4) { color: rgba(255,255,255,0.36); font-size: 12px; }

/* Contact */
.emp-table td:nth-child(5) { color: rgba(255,255,255,0.52); font-size: 12px; }

/* City chip */
.emp-table td:nth-child(6) { font-size: 12px; }
.city-chip {
	display: inline-flex; align-items: center; gap: 5px;
	background: rgba(30,184,140,0.09); color: #1eb88c;
	border: 1px solid rgba(30,184,140,0.18);
	border-radius: 8px; padding: 3px 10px;
	font-size: 11px; font-weight: 500;
}
.city-chip::before {
	content: ''; width: 5px; height: 5px;
	border-radius: 50%; background: #1eb88c; flex-shrink: 0;
}

.emp-table .no-data {
	text-align: center; padding: 40px;
	color: rgba(255,255,255,0.2); font-size: 14px;
}

/* NAV */
.nav-links {
	display: flex; justify-content: center; gap: 10px;
	animation: fadeUp 0.7s 0.44s cubic-bezier(0.22,1,0.36,1) both;
	opacity: 0; animation-fill-mode: forwards;
}
.nav-links a {
	padding: 9px 20px; border-radius: 10px;
	font-size: 13px; text-decoration: none;
	border: 1px solid rgba(255,255,255,0.09);
	color: rgba(255,255,255,0.45);
	background: rgba(255,255,255,0.04);
	transition: background 0.22s, color 0.22s, border-color 0.22s, transform 0.18s;
}
.nav-links a:hover {
	background: rgba(124,77,255,0.1);
	border-color: rgba(124,77,255,0.3);
	color: #c4b5ff; transform: translateY(-2px);
}
.nav-links a.logout:hover {
	background: rgba(255,80,80,0.1);
	border-color: rgba(255,80,80,0.25);
	color: rgba(255,160,160,0.85);
}

@keyframes fadeUp {
	from { opacity: 0; transform: translateY(22px); }
	to   { opacity: 1; transform: translateY(0); }
}

@media (max-width: 900px) {
	.card { padding: 28px 24px; }
	.emp-table colgroup col:nth-child(3) { width: 28%; }
	.emp-table colgroup col:nth-child(4) { width: 36%; }
}
@media (max-width: 600px) {
	.card { padding: 20px 16px; }
	.emp-table th, .emp-table td { padding: 10px 10px; font-size: 12px; }
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
					</colgroup>
					<thead>
						<tr>
							<th>Id</th>
							<th>EmpId</th>
							<th>Name</th>
							<th>Email</th>
							<th>Contact No</th>
							<th>City</th>
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
								<td><span class="city-chip"><%= emp.getEmpCity() %></span></td>
							</tr>
							<% }
						} else { %>
							<tr>
								<td class="no-data" colspan="6">No employees found.</td>
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
