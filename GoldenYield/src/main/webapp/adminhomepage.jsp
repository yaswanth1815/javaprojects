<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>Agent Dashboard</title>

<style>
/* ================= BASE ================= */
body {
  margin: 0;
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  height: 100vh;
  display: flex;
  flex-direction: column;
  background: #f4f6f8;
  overflow: hidden;
}

/* ================= NAVBAR ================= */
.navbar {
  width: 100%;
  background-color: #2c3e50;
  padding: 14px 20px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  position: relative;
  box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

.navbar-left {
  display: flex;
  align-items: center;
  gap: 20px;
}

.left-text {
  font-size: 30px;
  font-weight: bold;
  color: white;
  white-space: nowrap;
}

.nav-buttons {
  display: flex;
  gap: 12px;
}

.nav-buttons button {
  background: linear-gradient(135deg, #00695c, #00897b);
  color: white;
  border: none;
  padding: 8px 16px;
  border-radius: 8px;
  cursor: pointer;
  font-size: 14px;
  font-weight: 600;
  transition: 0.3s;
  white-space: nowrap;
}

.nav-buttons button:hover {
  transform: scale(1.05);
}

/* Center welcome text */
.center-text {
  position: absolute;
  left: 50%;
  transform: translateX(-50%);
  font-size: 18px;
  font-weight: bold;
  color: white;
  white-space: nowrap;
}

/* Right section */
.right-section {
  display: flex;
  align-items: center;
  gap: 14px;
  color: white;
}

.logout-btn {
  background-color: #e74c3c;
  border: none;
  padding: 6px 14px;
  color: white;
  border-radius: 5px;
  cursor: pointer;
}

/* ================= MOBILE MENU ================= */
.mobile-toggle {
  display: none;
  font-size: 26px;
  color: white;
  cursor: pointer;
}

.mobile-menu {
  display: none;
  position: absolute;
  top: 58px;
  right: 15px;
  background: white;
  border-radius: 8px;
  box-shadow: 0 6px 18px rgba(0,0,0,0.25);
  overflow: hidden;
  z-index: 1000;
}

.mobile-menu button {
  width: 100%;
  padding: 12px 18px;
  border: none;
  background: white;
  font-weight: 600;
  cursor: pointer;
  text-align: left;
}

.mobile-menu button:hover {
  background: #f2f2f2;
}

/* ================= MAIN LAYOUT ================= */
.main-area,
.main-area1 {
  flex-grow: 1;
  display: none;
}

.main-area1 {
  display: flex;
}

.sidebar {
  width: 250px;
  background-color: #2c3e50;
  color: white;
  padding-top: 20px;
  display: flex;
  flex-direction: column;
  align-items: center;
}

.sidebar button {
  width: 200px;
  margin: 8px 0;
  padding: 12px;
  font-size: 15px;
  border: none;
  border-radius: 8px;
  background-color: #34495e;
  color: white;
  cursor: pointer;
}

.sidebar button:hover {
  background-color: #1abc9c;
}

.content {
  flex-grow: 1;
}

iframe {
  width: 100%;
  height: 100%;
  border: none;
}

/* ================= FOOTER ================= */
.footer {
  background-color: #2c3e50;
  color: white;
  text-align: center;
  padding: 10px;
}

/* ================= RESPONSIVE (ONLY MOBILE) ================= */
@media (max-width: 768px) {

  .center-text {
    display: none;
  }

  .nav-buttons {
    display: none;
  }

  .mobile-toggle {
    display: block;
  }

  .sidebar {
    width: 180px;
    padding: 8px;
  }

  .sidebar button {
    width: 160px;
    font-size: 13px;
    padding: 8px;
  }
}
</style>
</head>

<body>

<!-- ================= NAVBAR ================= -->
<div class="navbar">

  <div class="navbar-left">
    <span class="left-text">GoldenYield</span>

    <div class="nav-buttons">
      <button id="frame-agent">Agents</button>
      <button id="frame-transport">Transport</button>
      <button id="frame-farmers">Farmers</button>
    </div>
  </div>

  <span class="center-text">"Welcome — Operations at Your Fingertips"</span>

  <div class="right-section">
    <span id="login-time"></span>
    <button class="logout-btn" onclick="window.location.href='loginform.jsp'">Logout</button>
    <span class="mobile-toggle" onclick="toggleMobileMenu()">☰</span>
  </div>

  <!-- Mobile dropdown -->
  <div class="mobile-menu" id="mobileMenu">
    <button onclick="document.getElementById('frame-agent').click()">Agents</button>
    <button onclick="document.getElementById('frame-transport').click()">Transport</button>
    <button onclick="document.getElementById('frame-farmers').click()">Farmers</button>
  </div>
</div>

<!-- ================= AGENT ================= -->
<div class="main-area1" id="agent-buttons">
  <div class="sidebar">
    <button onclick="loadPage('addagent.jsp','agentFrame')">Add Agent</button>
    <button onclick="loadPage('deleteagent.jsp','agentFrame')">Delete Agent</button>
    <button onclick="loadPage('showagentrecordsservlet','agentFrame')">Show Agents</button>
  </div>
  <div class="content">
    <iframe id="agentFrame"></iframe>
  </div>
</div>

<!-- ================= TRANSPORT ================= -->
<div class="main-area" id="transport-buttons">
  <div class="sidebar">
    <button onclick="loadPage('addvehicle.jsp','transportFrame')">Add Vehicle</button>
    <button onclick="loadPage('showvehiclerecordsservlet','transportFrame')">Show Vehicles</button>
  </div>
  <div class="content">
    <iframe id="transportFrame"></iframe>
  </div>
</div>

<!-- ================= FARMER ================= -->
<div class="main-area" id="farmer-buttons">
  <div class="sidebar">
    <button onclick="loadPage('addseller.jsp','farmerFrame')">Add Farmer</button>
    <button onclick="loadPage('showfarmerrecordsservlet','farmerFrame')">Show Farmers</button>
  </div>
  <div class="content">
    <iframe id="farmerFrame"></iframe>
  </div>
</div>

<div class="footer">
  &copy; 2025 GoldenYield. All Rights Reserved.
</div>

<script>
function closeall(){
  document.getElementById("agent-buttons").style.display="none";
  document.getElementById("transport-buttons").style.display="none";
  document.getElementById("farmer-buttons").style.display="none";
}

document.getElementById("frame-agent").onclick = function(){
  closeall();
  document.getElementById("agent-buttons").style.display="flex";
};

document.getElementById("frame-transport").onclick = function(){
  closeall();
  document.getElementById("transport-buttons").style.display="flex";
};

document.getElementById("frame-farmers").onclick = function(){
  closeall();
  document.getElementById("farmer-buttons").style.display="flex";
};

function loadPage(url, frameId) {
  document.getElementById(frameId).src = url;
}

function toggleMobileMenu(){
  const menu = document.getElementById("mobileMenu");
  menu.style.display = menu.style.display === "block" ? "none" : "block";
}

document.getElementById("login-time").textContent =
  "Login Time: " + new Date().toLocaleTimeString();
</script>

</body>
</html>
