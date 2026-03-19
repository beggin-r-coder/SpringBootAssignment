<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;600&family=DM+Sans:wght@300;400;500&display=swap" rel="stylesheet">
<style>
  *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

  body {
    min-height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    background: #0a0a0f;
    font-family: 'DM Sans', sans-serif;
    overflow: hidden;
    position: relative;
  }

  body::before {
    content: '';
    position: fixed;
    width: 600px; height: 600px;
    background: radial-gradient(circle, rgba(99,60,180,0.18) 0%, transparent 70%);
    top: -150px; left: -150px;
    pointer-events: none;
    animation: orb1 8s ease-in-out infinite alternate;
  }
  body::after {
    content: '';
    position: fixed;
    width: 500px; height: 500px;
    background: radial-gradient(circle, rgba(30,180,140,0.13) 0%, transparent 70%);
    bottom: -100px; right: -100px;
    pointer-events: none;
    animation: orb2 10s ease-in-out infinite alternate;
  }

  @keyframes orb1 { from { transform: translate(0,0); } to { transform: translate(60px, 40px); } }
  @keyframes orb2 { from { transform: translate(0,0); } to { transform: translate(-50px, -30px); } }

  .grid-bg {
    position: fixed; inset: 0; pointer-events: none;
    background-image:
      linear-gradient(rgba(255,255,255,0.03) 1px, transparent 1px),
      linear-gradient(90deg, rgba(255,255,255,0.03) 1px, transparent 1px);
    background-size: 60px 60px;
  }

  .card {
    position: relative; z-index: 10;
    background: rgba(255,255,255,0.04);
    border: 1px solid rgba(255,255,255,0.09);
    border-radius: 24px;
    padding: 52px 48px 44px;
    width: 420px;
    backdrop-filter: blur(24px);
    box-shadow: 0 32px 80px rgba(0,0,0,0.5), inset 0 1px 0 rgba(255,255,255,0.08);
    animation: fadeUp 0.7s cubic-bezier(0.22,1,0.36,1) both;
  }

  @keyframes fadeUp {
    from { opacity: 0; transform: translateY(32px); }
    to   { opacity: 1; transform: translateY(0); }
  }

  .logo {
    width: 44px; height: 44px;
    background: linear-gradient(135deg, #7c4dff, #1eb88c);
    border-radius: 12px;
    margin: 0 auto 28px;
    display: flex; align-items: center; justify-content: center;
    font-size: 20px; color: #fff;
    animation: fadeUp 0.7s 0.1s cubic-bezier(0.22,1,0.36,1) both;
  }

  .card h1 {
    font-family: 'Playfair Display', serif;
    font-size: 26px; font-weight: 600;
    color: #f0eeff;
    text-align: center;
    margin-bottom: 6px;
    letter-spacing: -0.3px;
    animation: fadeUp 0.7s 0.15s cubic-bezier(0.22,1,0.36,1) both;
  }
  .card p.sub {
    font-size: 14px; color: rgba(255,255,255,0.38);
    text-align: center; margin-bottom: 36px;
    font-weight: 300;
    animation: fadeUp 0.7s 0.2s cubic-bezier(0.22,1,0.36,1) both;
  }

  table { width: 100%; border-collapse: separate; border-spacing: 0; }

  tr { animation: fadeUp 0.7s cubic-bezier(0.22,1,0.36,1) both; }
  tr:nth-child(1) { animation-delay: 0.25s; }
  tr:nth-child(2) { animation-delay: 0.32s; }
  tr:nth-child(3) { animation-delay: 0.39s; }

  td { padding-bottom: 18px; }
  td:first-child {
    font-size: 12px; font-weight: 500; letter-spacing: 0.06em;
    text-transform: uppercase; color: rgba(255,255,255,0.35);
    padding-bottom: 6px; display: block;
  }
  tr td:first-child { padding-top: 4px; }

  .field-wrap { position: relative; }

  input[type="text"],
  input[type="password"] {
    width: 100%;
    background: rgba(255,255,255,0.05);
    border: 1px solid rgba(255,255,255,0.1);
    border-radius: 12px;
    padding: 13px 16px;
    font-size: 15px; font-family: 'DM Sans', sans-serif;
    color: #f0eeff;
    outline: none;
    transition: border-color 0.25s, background 0.25s, box-shadow 0.25s;
    caret-color: #7c4dff;
  }
  input[type="text"]::placeholder,
  input[type="password"]::placeholder { color: rgba(255,255,255,0.2); }
  input[type="text"]:hover,
  input[type="password"]:hover {
    border-color: rgba(255,255,255,0.22);
    background: rgba(255,255,255,0.07);
  }
  input[type="text"]:focus,
  input[type="password"]:focus {
    border-color: rgba(124,77,255,0.7);
    background: rgba(124,77,255,0.07);
    box-shadow: 0 0 0 4px rgba(124,77,255,0.12);
  }

  .btn-row { display: flex; gap: 12px; padding-top: 8px; }

  input[type="submit"],
  input[type="reset"] {
    flex: 1;
    border: none; outline: none;
    border-radius: 12px;
    padding: 13px 0;
    font-size: 14px; font-weight: 500;
    font-family: 'DM Sans', sans-serif;
    cursor: pointer;
    transition: transform 0.18s, box-shadow 0.18s, opacity 0.18s;
    letter-spacing: 0.02em;
  }

  input[type="submit"] {
    background: linear-gradient(135deg, #7c4dff 0%, #5b2ee0 100%);
    color: #fff;
    box-shadow: 0 4px 20px rgba(124,77,255,0.4);
  }
  input[type="submit"]:hover {
    transform: translateY(-2px);
    box-shadow: 0 8px 28px rgba(124,77,255,0.55);
  }
  input[type="submit"]:active {
    transform: translateY(0);
    box-shadow: 0 2px 10px rgba(124,77,255,0.3);
  }

  input[type="reset"] {
    background: rgba(255,255,255,0.06);
    color: rgba(255,255,255,0.5);
    border: 1px solid rgba(255,255,255,0.1);
  }
  input[type="reset"]:hover {
    background: rgba(255,255,255,0.1);
    color: rgba(255,255,255,0.75);
    border-color: rgba(255,255,255,0.2);
  }

  .links {
    display: flex; justify-content: space-between;
    margin-top: 28px;
    animation: fadeUp 0.7s 0.45s cubic-bezier(0.22,1,0.36,1) both;
  }
  .links a {
    font-size: 13px; color: rgba(255,255,255,0.35);
    text-decoration: none;
    transition: color 0.22s;
    position: relative;
  }
  .links a::after {
    content: '';
    position: absolute; left: 0; bottom: -2px;
    width: 0; height: 1px;
    background: #7c4dff;
    transition: width 0.25s;
  }
  .links a:hover { color: #c4b5ff; }
  .links a:hover::after { width: 100%; }

  .divider {
    height: 1px; background: rgba(255,255,255,0.07);
    margin: 24px 0 20px;
    animation: fadeUp 0.7s 0.42s cubic-bezier(0.22,1,0.36,1) both;
  }

  /* Layout fix for label/input stacking */
  .field-block { margin-bottom: 18px; }
  .field-block label {
    display: block;
    font-size: 12px; font-weight: 500; letter-spacing: 0.06em;
    text-transform: uppercase; color: rgba(255,255,255,0.35);
    margin-bottom: 7px;
  }
</style>
</head>
<body>

<div class="grid-bg"></div>

<div class="card">
  <h1>Welcome back</h1>
  <p class="sub">Sign in to continue to your account</p>

  <form action="login" method="post">
    <div class="field-block" style="animation: fadeUp 0.7s 0.25s cubic-bezier(0.22,1,0.36,1) both; opacity: 0; animation-fill-mode: forwards;">
      <label for="user">User</label>
      <input type="text" name="user" id="user" placeholder="Enter your username">
    </div>

    <div class="field-block" style="animation: fadeUp 0.7s 0.32s cubic-bezier(0.22,1,0.36,1) both; opacity: 0; animation-fill-mode: forwards;">
      <label for="password">Password</label>
      <input type="password" name="password" id="password" placeholder="Enter your password">
    </div>

    <div style="animation: fadeUp 0.7s 0.39s cubic-bezier(0.22,1,0.36,1) both; opacity: 0; animation-fill-mode: forwards;">
      <table>
        <tr>
          <td colspan="2" style="padding: 0;">
            <div class="btn-row">
              <input type="submit" value="Login">
              <input type="reset" value="Reset">
            </div>
          </td>
        </tr>
      </table>
    </div>
  </form>

  <div class="divider"></div>

  <div class="links">
    <a href="register.html">Sign Up</a>
    <a href="forgotPassword.jsp">Forgot Password</a>
  </div>
</div>

</body>
</html>