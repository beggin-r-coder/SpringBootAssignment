<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee Registration</title>
<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;600&family=DM+Sans:wght@300;400;500&display=swap" rel="stylesheet">
<style>
  /* Core reset and theme shared with other pages */
  *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
  body {
    min-height: 100vh;
    display: flex; align-items: center; justify-content: center;
    background: #0a0a0f;
    font-family: 'DM Sans', sans-serif;
    color: #f0eeff;
    overflow: hidden; position: relative; padding: 36px 16px;
  }
  body::before {
    content: ''; position: fixed; width: 600px; height: 600px;
    background: radial-gradient(circle, rgba(99,60,180,0.16) 0%, transparent 70%);
    top: -180px; left: -180px; pointer-events: none; animation: orb1 9s ease-in-out infinite alternate;
  }
  body::after {
    content: ''; position: fixed; width: 480px; height: 480px;
    background: radial-gradient(circle, rgba(30,180,140,0.11) 0%, transparent 70%);
    bottom: -100px; right: -100px; pointer-events: none; animation: orb2 11s ease-in-out infinite alternate;
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
    max-width: 520px; width: 100%;
    background: rgba(255,255,255,0.04);
    border: 1px solid rgba(255,255,255,0.09);
    border-radius: 20px; padding: 36px 36px 28px;
    backdrop-filter: blur(20px);
    box-shadow: 0 32px 80px rgba(0,0,0,0.45), inset 0 1px 0 rgba(255,255,255,0.06);
    animation: fadeUp 0.7s cubic-bezier(0.22,1,0.36,1) both;
  }
  @keyframes fadeUp { from { opacity: 0; transform: translateY(24px); } to { opacity: 1; transform: translateY(0); } }

  .card h1 {
    font-family: 'Playfair Display', serif; font-size: 22px; font-weight: 600;
    color: #f0eeff; text-align: center; margin-bottom: 12px;
  }
  .card p.sub { text-align: center; color: rgba(255,255,255,0.36); margin-bottom: 18px; font-size: 13px; }

  table { width: 100%; border-collapse: separate; border-spacing: 0; }
  tr { margin-bottom: 14px; }
  td { padding-bottom: 12px; }
  td:first-child { font-size: 12px; font-weight: 500; letter-spacing: 0.06em; text-transform: uppercase; color: rgba(255,255,255,0.35); padding-bottom: 6px; }

  input[type="text"], input[type="email"], input[type="number"] {
    width: 100%;
    background: rgba(255,255,255,0.05);
    border: 1px solid rgba(255,255,255,0.1);
    border-radius: 12px; padding: 12px 14px; font-size: 15px;
    color: #f0eeff; outline: none; transition: border-color 0.25s, background 0.25s, box-shadow 0.25s;
    caret-color: #7c4dff; font-family: 'DM Sans', sans-serif;
  }
  input::placeholder { color: rgba(255,255,255,0.2); }
  input:hover { border-color: rgba(255,255,255,0.22); background: rgba(255,255,255,0.07); }
  input:focus { border-color: rgba(124,77,255,0.7); background: rgba(124,77,255,0.07); box-shadow: 0 0 0 4px rgba(124,77,255,0.10); }

  .btn-row { display: flex; gap: 12px; padding-top: 8px; }
  input[type="submit"], input[type="reset"] {
    flex: 1; border: none; outline: none; border-radius: 12px; padding: 12px 0; font-size: 14px; font-weight: 500; cursor: pointer;
  }
  input[type="submit"] {
    background: linear-gradient(135deg, #7c4dff 0%, #5b2ee0 100%); color: #fff; box-shadow: 0 6px 22px rgba(124,77,255,0.35);
  }
  input[type="submit"]:hover { transform: translateY(-2px); }
  input[type="reset"] { background: rgba(255,255,255,0.06); color: rgba(255,255,255,0.55); border: 1px solid rgba(255,255,255,0.08); }

  .links { display: flex; justify-content: space-between; margin-top: 18px; }
  .links a { color: rgba(255,255,255,0.36); text-decoration: none; font-size: 13px; }

  @media (max-width: 520px) { .card { padding: 24px; } }
</style>
</head>
<body>

<div class="grid-bg"></div>

<div class="card">
  <h1>Employee Registration</h1>
  <p class="sub">Register a new employee into the system</p>

  <form action="addemp" method="post">
    <table>
      <tr>
        <td>Emp ID</td>
        <td><input type="text" name="empId" placeholder="e.g. 1001"></td>
      </tr>
      <tr>
        <td>Name</td>
        <td><input type="text" name="empName" placeholder="Full name"></td>
      </tr>
      <tr>
        <td>Email Id</td>
        <td><input type="email" name="empEmail" placeholder="name@example.com"></td>
      </tr>
      <tr>
        <td>Contact No</td>
        <td><input type="number" name="empContactNo" placeholder="10 digit contact number"></td>
      </tr>
      <tr>
        <td>City</td>
        <td><input type="text" name="empCity" placeholder="City"></td>
      </tr>
      <tr>
        <td colspan="2" style="padding-top:8px;">
          <div class="btn-row">
            <input type="submit" value="Register Employee">
            <input type="reset" value="Reset">
          </div>
        </td>
      </tr>
    </table>
  </form>

  <div class="links">
    <a href="/allemp">Back to Home</a>
    <a href="login.jsp">Sign In</a>
  </div>
</div>

</body>
</html>