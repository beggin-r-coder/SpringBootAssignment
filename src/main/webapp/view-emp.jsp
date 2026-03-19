<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Employee</title>
<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;600&family=DM+Sans:wght@300;400;500&display=swap" rel="stylesheet">
<style>
*, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

body {
	min-height: 100vh;
	display: flex; align-items: center; justify-content: center;
	background: #0a0a0f;
	font-family: 'DM Sans', sans-serif;
	color: #f0eeff;
	position: relative;
	padding: 48px 24px;
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
	width: 100%; max-width: 520px;
	background: rgba(255,255,255,0.04);
	border: 1px solid rgba(255,255,255,0.09);
	border-radius: 24px; padding: 44px 44px 36px;
	backdrop-filter: blur(24px);
	box-shadow: 0 32px 80px rgba(0,0,0,0.5), inset 0 1px 0 rgba(255,255,255,0.07);
	animation: fadeUp 0.7s cubic-bezier(0.22,1,0.36,1) both;
}

/* Avatar initial from emp name */
.emp-avatar {
	width: 56px; height: 56px; border-radius: 50%;
	background: linear-gradient(135deg, #7c4dff, #1eb88c);
	display: flex; align-items: center; justify-content: center;
	font-size: 22px; font-weight: 700; color: #fff; text-transform: uppercase;
	margin: 0 auto 20px;
	animation: fadeUp 0.7s 0.08s cubic-bezier(0.22,1,0.36,1) both;
	opacity: 0; animation-fill-mode: forwards;
}

.tag {
	text-align: center; font-size: 11px; font-weight: 500;
	letter-spacing: 0.1em; text-transform: uppercase; color: #1eb88c;
	margin-bottom: 8px;
	animation: fadeUp 0.7s 0.14s cubic-bezier(0.22,1,0.36,1) both;
	opacity: 0; animation-fill-mode: forwards;
}

h1 {
	font-family: 'Playfair Display', serif;
	font-size: 24px; font-weight: 600; color: #f0eeff;
	text-align: center; letter-spacing: -0.3px; margin-bottom: 4px;
	animation: fadeUp 0.7s 0.19s cubic-bezier(0.22,1,0.36,1) both;
	opacity: 0; animation-fill-mode: forwards;
}

.divider {
	height: 1px;
	background: linear-gradient(90deg, transparent, rgba(255,255,255,0.09), transparent);
	margin: 28px 0;
	animation: fadeUp 0.7s 0.24s cubic-bezier(0.22,1,0.36,1) both;
	opacity: 0; animation-fill-mode: forwards;
}

/* Detail table */
table {
	width: 100%; border-collapse: collapse;
	animation: fadeUp 0.7s 0.3s cubic-bezier(0.22,1,0.36,1) both;
	opacity: 0; animation-fill-mode: forwards;
}

table tr {
	border-bottom: 1px solid rgba(255,255,255,0.05);
	transition: background 0.18s;
}
table tr:last-child { border-bottom: none; }
table tr:hover { background: rgba(124,77,255,0.05); }

table th {
	padding: 14px 4px; text-align: left;
	font-size: 10px; font-weight: 700;
	letter-spacing: 0.1em; text-transform: uppercase;
	color: rgba(255,255,255,0.28);
	width: 38%; vertical-align: middle;
	border: none;
}

table td {
	padding: 14px 4px; font-size: 13px;
	color: rgba(255,255,255,0.75); vertical-align: middle;
	border: none;
}

/* EmpId pill */
.val-empid {
	display: inline-block;
	background: rgba(124,77,255,0.14); color: #c4b5ff;
	border: 1px solid rgba(124,77,255,0.22);
	border-radius: 6px; padding: 3px 10px;
	font-size: 12px; font-weight: 700; letter-spacing: 0.04em;
}

/* Name */
.val-name { color: #f0eeff; font-weight: 500; font-size: 14px; }

/* Contact */
.val-contact { color: rgba(255,255,255,0.55); font-size: 12px; }

/* City chip */
.val-city {
	display: inline-flex; align-items: center; gap: 5px;
	background: rgba(30,184,140,0.08); color: #1eb88c;
	border: 1px solid rgba(30,184,140,0.16);
	border-radius: 6px; padding: 3px 10px;
	font-size: 11px; font-weight: 600;
}
.val-city::before {
	content: ''; width: 5px; height: 5px;
	border-radius: 50%; background: #1eb88c; flex-shrink: 0;
}

/* Back link */
.back-link {
	display: block; text-align: center; margin-top: 28px;
	font-size: 12px; color: rgba(255,255,255,0.22);
	text-decoration: none; transition: color 0.22s;
	position: relative;
	animation: fadeUp 0.7s 0.4s cubic-bezier(0.22,1,0.36,1) both;
	opacity: 0; animation-fill-mode: forwards;
}
.back-link::after {
	content: ''; position: absolute; left: 50%; transform: translateX(-50%);
	bottom: -2px; width: 0; height: 1px;
	background: #7c4dff; transition: width 0.25s;
}
.back-link:hover { color: #c4b5ff; }
.back-link:hover::after { width: 60px; }

@keyframes fadeUp {
	from { opacity: 0; transform: translateY(20px); }
	to   { opacity: 1; transform: translateY(0); }
}
</style>
</head>
<body>

	<div class="grid-bg"></div>

	<div class="card">
		<div class="emp-avatar">${emp.empName.substring(0,1)}</div>
		<p class="tag">Employee Profile</p>
		<h1>Employee Details</h1>

		<div class="divider"></div>

		<table>
			<tr>
				<th>Emp ID</th>
				<td><span class="val-empid">${emp.empId}</span></td>
			</tr>
			<tr>
				<th>Name</th>
				<td><span class="val-name">${emp.empName}</span></td>
			</tr>
			<tr>
				<th>Contact No</th>
				<td><span class="val-contact">${emp.empContactNo}</span></td>
			</tr>
			<tr>
				<th>City</th>
				<td><span class="val-city">${emp.empCity}</span></td>
			</tr>
		</table>

		<a href="/allemp" class="back-link">← Back to Dashboard</a>
	</div>

</body>
</html>
