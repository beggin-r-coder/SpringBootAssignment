<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;600&family=DM+Sans:wght@300;400;500&display=swap" rel="stylesheet">
<style>
  *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

  body {
    min-height: 100vh;
    display: flex; align-items: center; justify-content: center;
    background: #0a0a0f;
    font-family: 'DM Sans', sans-serif;
    color: #f0eeff;
    position: relative; overflow: hidden;
    padding: 40px 16px;
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
    padding: 48px 44px 40px;
    width: 100%;
    max-width: 440px;
    backdrop-filter: blur(24px);
    box-shadow: 0 32px 80px rgba(0,0,0,0.5), inset 0 1px 0 rgba(255,255,255,0.07);
    animation: fadeUp 0.7s cubic-bezier(0.22,1,0.36,1) both;
  }

  .logo {
    width: 46px; height: 46px;
    background: linear-gradient(135deg, #7c4dff, #1eb88c);
    border-radius: 13px;
    margin: 0 auto 24px;
    display: flex; align-items: center; justify-content: center;
    font-size: 20px;
  }

  .tag {
    text-align: center;
    font-size: 12px; font-weight: 500; letter-spacing: 0.1em;
    text-transform: uppercase; color: #1eb88c;
    margin-bottom: 8px;
  }

  h1 {
    font-family: 'Playfair Display', serif;
    font-size: 26px; font-weight: 600;
    color: #f0eeff; text-align: center;
    letter-spacing: -0.3px; margin-bottom: 6px;
  }

  .sub {
    font-size: 13px; color: rgba(255,255,255,0.32);
    text-align: center; font-weight: 300;
    margin-bottom: 28px;
  }

  /* Password output box */
  .pw-box {
    display: flex; align-items: center; gap: 8px;
    background: rgba(255,255,255,0.05);
    border: 1px solid rgba(255,255,255,0.1);
    border-radius: 12px;
    padding: 12px 14px;
    margin-bottom: 16px;
    min-height: 50px;
  }
  .pw-text {
    flex: 1; min-width: 0;
    font-family: 'Courier New', monospace;
    font-size: 14px; color: #c4b5ff;
    letter-spacing: 0.04em;
    word-break: break-all;
    line-height: 1.5;
  }
  .pw-text.empty {
    color: rgba(255,255,255,0.2);
    font-style: italic;
    font-family: 'DM Sans', sans-serif;
    font-size: 13px;
    letter-spacing: 0;
  }
  .copy-btn {
    background: none; border: none; cursor: pointer;
    color: rgba(255,255,255,0.3); font-size: 16px;
    padding: 4px 6px; border-radius: 6px; flex-shrink: 0;
    transition: color 0.2s, background 0.2s;
    line-height: 1;
  }
  .copy-btn:hover { color: #c4b5ff; background: rgba(124,77,255,0.15); }

  /* Strength bar */
  .strength-wrap { margin-bottom: 20px; }
  .strength-label {
    display: flex; justify-content: space-between;
    font-size: 11px; color: rgba(255,255,255,0.28);
    margin-bottom: 6px; letter-spacing: 0.04em; text-transform: uppercase;
  }
  .strength-track {
    height: 4px; background: rgba(255,255,255,0.08);
    border-radius: 99px; overflow: hidden;
  }
  .strength-fill {
    height: 100%; width: 0%;
    border-radius: 99px;
    transition: width 0.5s cubic-bezier(0.22,1,0.36,1), background 0.4s;
  }

  /* Options */
  .options {
    display: grid; grid-template-columns: 1fr 1fr;
    gap: 8px; margin-bottom: 20px;
  }
  .option {
    display: flex; align-items: center; gap: 8px;
    background: rgba(255,255,255,0.04);
    border: 1px solid rgba(255,255,255,0.08);
    border-radius: 10px; padding: 10px 12px;
    cursor: pointer;
    transition: border-color 0.22s, background 0.22s;
  }
  .option:hover { border-color: rgba(124,77,255,0.3); background: rgba(124,77,255,0.06); }
  .option input[type="checkbox"] {
    accent-color: #7c4dff; width: 14px; height: 14px;
    cursor: pointer; flex-shrink: 0;
  }
  .option label { font-size: 13px; color: rgba(255,255,255,0.55); cursor: pointer; }

  /* Length slider */
  .slider-wrap { margin-bottom: 24px; }
  .slider-header {
    display: flex; justify-content: space-between; align-items: center;
    font-size: 11px; color: rgba(255,255,255,0.28);
    margin-bottom: 8px; letter-spacing: 0.04em; text-transform: uppercase;
  }
  .slider-header span {
    font-size: 15px; color: #c4b5ff; font-weight: 500;
    font-family: 'Playfair Display', serif; letter-spacing: 0;
  }
  input[type="range"] {
    -webkit-appearance: none; appearance: none;
    width: 100%; height: 4px;
    background: rgba(255,255,255,0.1);
    border-radius: 99px; outline: none; cursor: pointer;
  }
  input[type="range"]::-webkit-slider-thumb {
    -webkit-appearance: none; appearance: none;
    width: 16px; height: 16px; border-radius: 50%;
    background: #7c4dff; cursor: pointer;
    transition: transform 0.15s;
  }
  input[type="range"]::-webkit-slider-thumb:hover { transform: scale(1.2); }

  /* Generate button */
  .gen-btn {
    width: 100%;
    background: linear-gradient(135deg, #7c4dff 0%, #5b2ee0 100%);
    color: #fff; border: none; outline: none;
    border-radius: 12px; padding: 14px 0;
    font-size: 15px; font-weight: 500;
    font-family: 'DM Sans', sans-serif;
    cursor: pointer; letter-spacing: 0.02em;
    box-shadow: 0 4px 20px rgba(124,77,255,0.4);
    transition: transform 0.18s, box-shadow 0.18s;
    margin-bottom: 0;
  }
  .gen-btn:hover { transform: translateY(-2px); box-shadow: 0 8px 28px rgba(124,77,255,0.55); }
  .gen-btn:active { transform: translateY(0); box-shadow: 0 2px 10px rgba(124,77,255,0.3); }

  .divider { height: 1px; background: rgba(255,255,255,0.07); margin: 22px 0 18px; }

  .back-link {
    display: block; text-align: center;
    font-size: 13px; color: rgba(255,255,255,0.25);
    text-decoration: none; transition: color 0.22s;
    position: relative;
  }
  .back-link::after {
    content: ''; position: absolute; left: 50%; transform: translateX(-50%);
    bottom: -2px; width: 0; height: 1px; background: #7c4dff; transition: width 0.25s;
  }
  .back-link:hover { color: #c4b5ff; }
  .back-link:hover::after { width: 60px; }

  @keyframes fadeUp {
    from { opacity: 0; transform: translateY(24px); }
    to   { opacity: 1; transform: translateY(0); }
  }
</style>
</head>
<body>

<div class="grid-bg"></div>

<div class="card">
  <p class="tag">Security</p>
  <h1>Generate New Password</h1>
  <p class="sub">Create a strong, secure password instantly.</p>

  <div class="pw-box">
    <div class="pw-text empty" id="pw-output">Click Generate to create a password</div>
    <button class="copy-btn" id="copy-btn" onclick="copyPw()">Copy</button>
  </div>

  <div class="strength-wrap">
    <div class="strength-label">
      <span>Strength</span>
      <span id="strength-text" style="color:rgba(255,255,255,0.28);">-</span>
    </div>
    <div class="strength-track"><div class="strength-fill" id="strength-fill"></div></div>
  </div>

  <div class="options">
    <div class="option"><input type="checkbox" id="opt-upper" checked><label for="opt-upper">Uppercase</label></div>
    <div class="option"><input type="checkbox" id="opt-lower" checked><label for="opt-lower">Lowercase</label></div>
    <div class="option"><input type="checkbox" id="opt-num" checked><label for="opt-num">Numbers</label></div>
    <div class="option"><input type="checkbox" id="opt-sym"><label for="opt-sym">Symbols</label></div>
  </div>

  <div class="slider-wrap">
    <div class="slider-header">
      Length
      <span id="len-label">16</span>
    </div>
    <input type="range" min="8" max="32" value="16" id="len-slider"
      oninput="document.getElementById('len-label').textContent=this.value">
  </div>

  <button class="gen-btn" onclick="generatePassword()">Generate</button>

  <div class="divider"></div>
  <a href="login.jsp" class="back-link">Back to Login</a>
</div>

<script>
  function generatePassword() {
    const upper = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const lower = 'abcdefghijklmnopqrstuvwxyz';
    const nums  = '0123456789';
    const syms  = '!@#$%^&*()_+-=[]{}|;:,.<>?';
    let pool = '';
    if (document.getElementById('opt-upper').checked) pool += upper;
    if (document.getElementById('opt-lower').checked) pool += lower;
    if (document.getElementById('opt-num').checked)   pool += nums;
    if (document.getElementById('opt-sym').checked)   pool += syms;
    if (!pool) pool = lower;

    const len = parseInt(document.getElementById('len-slider').value);
    let pw = '';
    for (let i = 0; i < len; i++) pw += pool[Math.floor(Math.random() * pool.length)];

    const out = document.getElementById('pw-output');
    out.textContent = pw;
    out.classList.remove('empty');

    let score = 0;
    if (/[A-Z]/.test(pw)) score++;
    if (/[a-z]/.test(pw)) score++;
    if (/[0-9]/.test(pw)) score++;
    if (/[^A-Za-z0-9]/.test(pw)) score++;
    if (len >= 20) score++;

    const levels = [
      { w:'20%', bg:'#e84040', t:'Weak' },
      { w:'40%', bg:'#e8a838', t:'Fair' },
      { w:'60%', bg:'#e8a838', t:'Good' },
      { w:'80%', bg:'#1eb88c', t:'Strong' },
      { w:'100%',bg:'#1eb88c', t:'Very Strong' },
    ];
    const l = levels[Math.min(score - 1, 4)] || levels[0];
    const fill  = document.getElementById('strength-fill');
    const label = document.getElementById('strength-text');
    fill.style.width = l.w;
    fill.style.background = l.bg;
    label.textContent = l.t;
    label.style.color = l.bg;
  }

  function copyPw() {
    const out = document.getElementById('pw-output');
    if (!out.classList.contains('empty')) {
      navigator.clipboard.writeText(out.textContent);
      const btn = document.getElementById('copy-btn');
      btn.textContent = '✓'; btn.style.color = '#1eb88c';
      setTimeout(() => { btn.textContent = '⧉'; btn.style.color = ''; }, 1500);
    }
  }
</script>

</body>
</html>