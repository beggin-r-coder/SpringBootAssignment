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
	height: 1px; background: rgba(255,255,255,0.07);
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
	margin-bottom: 18px;
}
.table-title {
	font-family: 'Playfair Display', serif;
	font-size: 18px; font-weight: 600; color: #f0eeff;
}
.table-badge {
	font-size: 11px; font-weight: 500; letter-spacing: 0.07em;
	text-transform: uppercase; color: #1eb88c;
	background: rgba(30,184,140,0.1);
	border: 1px solid rgba(30,184,140,0.2);
	padding: 4px 12px; border-radius: 99px;
}

/* TABLE */
.table-wrapper { width: 100%; overflow-x: auto; margin-top: 0; }

.emp-table {
	width: 100%; border-collapse: collapse;
	table-layout: fixed;
	background: transparent;
	border: none; border-radius: 0;
}

.emp-table colgroup col:nth-child(1) { width: 6%; }
.emp-table colgroup col:nth-child(2) { width: 10%; }
.emp-table colgroup col:nth-child(3) { width: 20%; }
.emp-table colgroup col:nth-child(4) { width: 32%; }
.emp-table colgroup col:nth-child(5) { width: 16%; }
.emp-table colgroup col:nth-child(6) { width: 16%; }

.emp-table thead tr { border-bottom: 1px solid rgba(255,255,255,0.08); }
.emp-table th {
	padding: 10px 14px; text-align: left;
	font-size: 11px; font-weight: 500;
	letter-spacing: 0.07em; text-transform: uppercase;
	color: rgba(255,255,255,0.35);
	border-bottom: 1px solid rgba(255,255,255,0.08);
}

.emp-table tbody tr { border-bottom: 1px solid rgba(255,255,255,0.04); transition: background 0.18s; }
.emp-table tbody tr:last-child { border-bottom: none; }
.emp-table tbody tr:hover { background: rgba(124,77,255,0.06); }

.emp-table td {
	padding: 13px 14px; font-size: 13px;
	color: rgba(255,255,255,0.75); vertical-align: middle;
	overflow: hidden; text-overflow: ellipsis; white-space: nowrap;
	border-bottom: 1px solid rgba(255,255,255,0.04);
}
.emp-table td:first-child { color: rgba(255,255,255,0.3); font-size: 12px; }
.emp-table td:nth-child(2) {
	color: #c4b5ff; font-size: 12px; font-weight: 500;
}
.emp-table td:nth-child(4) { color: rgba(255,255,255,0.42); font-size: 12px; }
.emp-table td:last-child { color: #1eb88c; font-size: 12px; }

.emp-table .no-data {
	text-align: center; padding: 32px;
	color: rgba(255,255,255,0.25); font-size: 14px;
}

/* NAV LINKS */
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
								<td><%= emp.getEmpId() %></td>
								<td title="<%= emp.getEmpName() %>"><%= emp.getEmpName() %></td>
								<td title="<%= emp.getEmpEmail() %>"><%= emp.getEmpEmail() %></td>
								<td><%= emp.getEmpContactNo() %></td>
								<td><%= emp.getEmpCity() %></td>
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
