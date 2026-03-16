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
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    background: #0a0a0f;
    font-family: 'DM Sans', sans-serif;
    color: #f0eeff;
    position: relative;
    overflow: hidden;
  }

  body::before {
    content: '';
    position: fixed;
    width: 600px; height: 600px;
    background: radial-gradient(circle, rgba(99,60,180,0.16) 0%, transparent 70%);
    top: -180px; left: -180px;
    pointer-events: none;
    animation: orb1 9s ease-in-out infinite alternate;
  }
  body::after {
    content: '';
    position: fixed;
    width: 480px; height: 480px;
    background: radial-gradient(circle, rgba(30,180,140,0.11) 0%, transparent 70%);
    bottom: -100px; right: -100px;
    pointer-events: none;
    animation: orb2 11s ease-in-out infinite alternate;
  }

  @keyframes orb1 { from { transform: translate(0,0); } to { transform: translate(60px, 40px); } }
  @keyframes orb2 { from { transform: translate(0,0); } to { transform: translate(-50px, -30px); } }

  .grid-bg {
    position: fixed; inset: 0; pointer-events: none;
    background-image:
      linear-gradient(rgba(255,255,255,0.025) 1px, transparent 1px),
      linear-gradient(90deg, rgba(255,255,255,0.025) 1px, transparent 1px);
    background-size: 60px 60px;
  }

  .card {
    position: relative; z-index: 10;
    background: rgba(255,255,255,0.04);
    border: 1px solid rgba(255,255,255,0.09);
    border-radius: 24px;
    padding: 52px 52px 44px;
    width: 460px;
    text-align: center;
    backdrop-filter: blur(24px);
    box-shadow: 0 32px 80px rgba(0,0,0,0.5), inset 0 1px 0 rgba(255,255,255,0.07);
    animation: fadeUp 0.7s cubic-bezier(0.22,1,0.36,1) both;
  }

  .logo {
    width: 46px; height: 46px;
    background: linear-gradient(135deg, #7c4dff, #1eb88c);
    border-radius: 13px;
    margin: 0 auto 28px;
    display: flex; align-items: center; justify-content: center;
    font-size: 20px;
    animation: fadeUp 0.7s 0.1s cubic-bezier(0.22,1,0.36,1) both;
    opacity: 0; animation-fill-mode: forwards;
  }

  .greeting {
    font-size: 12px; font-weight: 500; letter-spacing: 0.1em;
    text-transform: uppercase; color: #1eb88c;
    margin-bottom: 12px;
    animation: fadeUp 0.7s 0.17s cubic-bezier(0.22,1,0.36,1) both;
    opacity: 0; animation-fill-mode: forwards;
  }

  h1 {
    font-family: 'Playfair Display', serif;
    font-size: 32px; font-weight: 600;
    color: #f0eeff; line-height: 1.2;
    letter-spacing: -0.3px;
    margin-bottom: 12px;
    animation: fadeUp 0.7s 0.22s cubic-bezier(0.22,1,0.36,1) both;
    opacity: 0; animation-fill-mode: forwards;
  }
  h1 span { color: #7c4dff; }

  .sub {
    font-size: 14px; color: rgba(255,255,255,0.35);
    font-weight: 300; line-height: 1.6;
    margin-bottom: 36px;
    animation: fadeUp 0.7s 0.27s cubic-bezier(0.22,1,0.36,1) both;
    opacity: 0; animation-fill-mode: forwards;
  }

  .divider {
    height: 1px; background: rgba(255,255,255,0.07);
    margin-bottom: 28px;
    animation: fadeUp 0.7s 0.32s cubic-bezier(0.22,1,0.36,1) both;
    opacity: 0; animation-fill-mode: forwards;
  }

  .nav-links {
    display: flex; justify-content: center; gap: 10px;
    animation: fadeUp 0.7s 0.37s cubic-bezier(0.22,1,0.36,1) both;
    opacity: 0; animation-fill-mode: forwards;
  }
  .nav-links a {
    padding: 9px 18px;
    border-radius: 10px;
    font-size: 13px; font-weight: 400;
    text-decoration: none;
    border: 1px solid rgba(255,255,255,0.09);
    color: rgba(255,255,255,0.45);
    background: rgba(255,255,255,0.04);
    transition: background 0.22s, color 0.22s, border-color 0.22s, transform 0.18s;
  }
  .nav-links a:hover {
    background: rgba(124,77,255,0.1);
    border-color: rgba(124,77,255,0.3);
    color: #c4b5ff;
    transform: translateY(-2px);
  }
  .nav-links a.logout:hover {
    background: rgba(255,80,80,0.1);
    border-color: rgba(255,80,80,0.25);
    color: rgba(255,160,160,0.85);
  }

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
  <h1>Welcome to <span>Home</span> Page!</h1>
  <p class="sub">You're logged in. What would you like to do next?</p>

  <div class="divider"></div>

  <div class="nav-links">
    <a href="#">Profile</a>
    <a href="#">Settings</a>
    <a href="login.jsp" class="logout">Logout</a>
  </div>
</div>

</body>
</html>
