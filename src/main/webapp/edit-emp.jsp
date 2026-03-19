<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	display: flex; align-items: center; justify-content: center;
	background: #0a0a0f;
	font-family: 'DM Sans', sans-serif;
	color: #f0eeff;
	position: relative;
	padding: 48px 24px;
	overflow: hidden;
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
	width: 100%; max-width: 460px;
	background: rgba(255,255,255,0.04);
	border: 1px solid rgba(255,255,255,0.09);
	border-radius: 24px; padding: 48px 44px 40px;
	backdrop-filter: blur(24px);
	box-shadow: 0 32px 80px rgba(0,0,0,0.5), inset 0 1px 0 rgba(255,255,255,0.07);
	animation: fadeUp 0.7s cubic-bezier(0.22,1,0.36,1) both;
}

.logo {
	width: 46px; height: 46px;
	background: linear-gradient(135deg, #f0c060, #7c4dff);
	border-radius: 13px;
	margin: 0 auto 22px;
	display: flex; align-items: center; justify-content: center;
	font-size: 20px;
	animation: fadeUp 0.7s 0.08s cubic-bezier(0.22,1,0.36,1) both;
	opacity: 0; animation-fill-mode: forwards;
}

.tag {
	text-align: center; font-size: 11px; font-weight: 500;
	letter-spacing: 0.1em; text-transform: uppercase; color: #f0c060;
	margin-bottom: 8px;
	animation: fadeUp 0.7s 0.13s cubic-bezier(0.22,1,0.36,1) both;
	opacity: 0; animation-fill-mode: forwards;
}

h1 {
	font-family: 'Playfair Display', serif;
	font-size: 24px; font-weight: 600; color: #f0eeff;
	text-align: center; letter-spacing: -0.3px; margin-bottom: 6px;
	animation: fadeUp 0.7s 0.18s cubic-bezier(0.22,1,0.36,1) both;
	opacity: 0; animation-fill-mode: forwards;
}

.sub {
	font-size: 13px; color: rgba(255,255,255,0.28);
	text-align: center; font-weight: 300;
	animation: fadeUp 0.7s 0.23s cubic-bezier(0.22,1,0.36,1) both;
	opacity: 0; animation-fill-mode: forwards;
}

.divider {
	height: 1px;
	background: linear-gradient(90deg, transparent, rgba(255,255,255,0.09), transparent);
	margin: 28px 0;
	animation: fadeUp 0.7s 0.27s cubic-bezier(0.22,1,0.36,1) both;
	opacity: 0; animation-fill-mode: forwards;
}

/* Field blocks */
.field-block { margin-bottom: 18px; }
.field-block:nth-child(1) { animation: fadeUp 0.7s 0.30s cubic-bezier(0.22,1,0.36,1) both; opacity: 0; animation-fill-mode: forwards; }
.field-block:nth-child(2) { animation: fadeUp 0.7s 0.35s cubic-bezier(0.22,1,0.36,1) both; opacity: 0; animation-fill-mode: forwards; }
.field-block:nth-child(3) { animation: fadeUp 0.7s 0.38s cubic-bezier(0.22,1,0.36,1) both; opacity: 0; animation-fill-mode: forwards; }
.field-block:nth-child(4) { animation: fadeUp 0.7s 0.41s cubic-bezier(0.22,1,0.36,1) both; opacity: 0; animation-fill-mode: forwards; }
.field-block:nth-child(5) { animation: fadeUp 0.7s 0.44s cubic-bezier(0.22,1,0.36,1) both; opacity: 0; animation-fill-mode: forwards; }

.field-block label {
	display: block; font-size: 10px; font-weight: 700;
	letter-spacing: 0.1em; text-transform: uppercase;
	color: rgba(255,255,255,0.3); margin-bottom: 7px;
}

/* Editable inputs */
.field-block input[type="text"] {
	width: 100%;
	background: rgba(255,255,255,0.05);
	border: 1px solid rgba(255,255,255,0.1);
	border-radius: 12px; padding: 12px 14px;
	font-size: 14px; font-family: 'DM Sans', sans-serif;
	color: #f0eeff; outline: none;
	transition: border-color 0.25s, background 0.25s, box-shadow 0.25s;
	caret-color: #f0c060;
}
.field-block input[type="text"]:hover {
	border-color: rgba(255,255,255,0.2);
	background: rgba(255,255,255,0.07);
}
.field-block input[type="text"]:focus {
	border-color: rgba(240,192,96,0.6);
	background: rgba(240,192,96,0.06);
	box-shadow: 0 0 0 4px rgba(240,192,96,0.1);
}

/* Readonly EmpId — distinct locked style */
.field-block input[readonly] {
	background: rgba(124,77,255,0.08);
	border: 1px solid rgba(124,77,255,0.18);
	color: #c4b5ff;
	cursor: not-allowed;
}
.field-block input[readonly]:hover {
	background: rgba(124,77,255,0.08);
	border-color: rgba(124,77,255,0.18);
}
.readonly-note {
	font-size: 10px; color: rgba(255,255,255,0.2);
	margin-top: 5px; letter-spacing: 0.02em;
}

/* Update button */
button[type="submit"] {
	width: 100%;
	background: linear-gradient(135deg, #f0c060 0%, #c8922a 100%);
	color: #0a0a0f; border: none; outline: none;
	border-radius: 12px; padding: 13px 0;
	font-size: 14px; font-weight: 700;
	font-family: 'DM Sans', sans-serif;
	cursor: pointer; letter-spacing: 0.03em;
	box-shadow: 0 4px 20px rgba(240,192,96,0.3);
	transition: transform 0.18s, box-shadow 0.18s;
	margin-top: 6px;
	animation: fadeUp 0.7s 0.52s cubic-bezier(0.22,1,0.36,1) both;
	opacity: 0; animation-fill-mode: forwards;
}
button[type="submit"]:hover { transform: translateY(-2px); box-shadow: 0 8px 28px rgba(240,192,96,0.42); }
button[type="submit"]:active { transform: translateY(0); box-shadow: 0 2px 10px rgba(240,192,96,0.25); }

.back-link {
	display: block; text-align: center; margin-top: 22px;
	font-size: 12px; color: rgba(255,255,255,0.22);
	text-decoration: none; transition: color 0.22s; position: relative;
	animation: fadeUp 0.7s 0.57s cubic-bezier(0.22,1,0.36,1) both;
	opacity: 0; animation-fill-mode: forwards;
}
.back-link::after { content: ''; position: absolute; left: 50%; transform: translateX(-50%); bottom: -2px; width: 0; height: 1px; background: #f0c060; transition: width 0.25s; }
.back-link:hover { color: #f0c060; }
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
		<div class="logo">✎</div>
		<p class="tag">Employee</p>
		<h1>Edit Details</h1>
		<p class="sub">Update the information below and save.</p>

		<div class="divider"></div>

		<form action="update" method="post">

			<input type="hidden" name="id" value="${emp.id}">

			<div class="field-block">
				<label for="empId">Emp ID</label>
				<input type="text" id="empId" name="empId" value="${emp.empId}" readonly>
				<p class="readonly-note">This field cannot be changed.</p>
			</div>

			<div class="field-block">
				<label for="empName">Name</label>
				<input type="text" id="empName" name="empName" value="${emp.empName}">
			</div>

			<div class="field-block">
				<label for="empEmail">Email</label>
				<input type="text" id="empEmail" name="empEmail" value="${emp.empEmail}">
			</div>

			<div class="field-block">
				<label for="empContactNo">Contact</label>
				<input type="text" id="empContactNo" name="empContactNo" value="${emp.empContactNo}">
			</div>

			<div class="field-block">
				<label for="empCity">City</label>
				<input type="text" id="empCity" name="empCity" value="${emp.empCity}">
			</div>

			<button type="submit">Update Employee</button>

		</form>

		<a href="/allemp" class="back-link">← Back to Dashboard</a>
	</div>

</body>
</html>
