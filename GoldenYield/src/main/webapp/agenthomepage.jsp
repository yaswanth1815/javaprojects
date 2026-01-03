<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>Agent Dashboard</title>
<style>
:root {
  --primary-dark: #2c3e50;
  --accent-teal: #1abc9c;
  --danger-red: #e74c3c;
  --bg-gray: #f4f6f8;
}

body {
  margin: 0;
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  height: 100vh;
  display: flex;
  flex-direction: column;
  background: var(--bg-gray);
  overflow: hidden;
}

/* --- Navbar --- */
.navbar {
  width: 100%;
  background-color: var(--primary-dark);
  padding: 12px 20px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  box-shadow: 0 2px 4px rgba(0,0,0,0.1);
  z-index: 1100;
  box-sizing: border-box;
  position: relative;
}

.navbar-left { display: flex; align-items: center; gap: 15px; }

/* Large Brand Style */
.left-text { 
  font-size: 30px; 
  font-weight: bold; 
  color: white; 
  white-space: nowrap;
}

/* Tagline: Hidden on mobile, visible on laptop */
.tagline {
  color: #bdc3c7;
  font-style: italic;
  font-size: 14px;
  display: none; 
}

/* Desktop Sector Buttons (Center Position) */
.nav-buttons { 
  display: flex; 
  gap: 12px;
}

.nav-buttons button {
  background: linear-gradient(135deg, #00695c, #00897b);
  color: white; 
  border: none; 
  padding: 10px 20px;
  border-radius: 8px; 
  cursor: pointer; 
  font-weight: 600;
  font-size: 15px;
  transition: 0.3s;
}

.nav-buttons button:hover {
  transform: scale(1.05);
  background: #004d40;
}

/* Mobile Toggle Buttons */
.menu-btn {
  display: none; 
  background: var(--accent-teal);
  color: white; border: none; padding: 8px 12px;
  border-radius: 4px; cursor: pointer; font-weight: bold;
}

.logout-btn {
  background-color: var(--danger-red);
  border: none; padding: 8px 15px;
  color: white; border-radius: 5px; cursor: pointer;
}

/* --- Responsive Laptop/Desktop (min-width: 851px) --- */
@media (min-width: 851px) {
  .tagline { display: block; margin-left: 10px; }
  
  /* Center the main buttons */
  .nav-buttons {
    position: absolute;
    left: 50%;
    transform: translateX(-50%);
  }
  
  .sidebar { width: 280px; }
  .sidebar button { font-size: 16px; }
}

/* --- Responsive Mobile (max-width: 850px) --- */
@media (max-width: 850px) {
  .left-text { font-size: 22px; }
  .nav-buttons { display: none; } 
  .menu-btn { display: block; }    
  
  .sidebar {
    position: absolute; left: 0; top: 0; bottom: 0;
    transform: translateX(-100%);
  }
  .sidebar.show { transform: translateX(0); }
}

/* --- Layout --- */
.main-container {
  display: flex;
  flex-grow: 1;
  height: calc(100vh - 60px);
  position: relative;
}

.sidebar {
  width: 250px;
  background-color: #34495e;
  padding: 15px;
  display: flex;
  flex-direction: column;
  overflow-y: auto;
  transition: transform 0.3s ease;
  z-index: 1001;
}

.sidebar button {
  width: 100%; margin-bottom: 8px; padding: 12px;
  font-size: 14px; border: none; border-radius: 6px;
  background-color: #2c3e50; color: white; text-align: left; cursor: pointer;
}
.sidebar button:hover { background-color: var(--accent-teal); padding-left: 20px; }

/* Mobile Sector Dropdown Content */
.sector-menu {
  position: absolute; right: 0; top: 0; bottom: 0;
  width: 220px; background: #1e2b37;
  display: flex; flex-direction: column; padding: 20px 15px;
  transform: translateX(100%); transition: transform 0.3s ease;
  z-index: 1002;
  box-shadow: -5px 0 15px rgba(0,0,0,0.3);
}
.sector-menu.show { transform: translateX(0); }
.sector-menu button {
  margin-bottom: 12px; padding: 15px; background: #00897b;
  color: white; border: none; border-radius: 6px; font-weight: bold;
}

.content { flex-grow: 1; background: white; }
iframe { width: 100%; height: 100%; border: none; }
.footer { background: var(--primary-dark); color: #bdc3c7; text-align: center; padding: 8px; font-size: 12px; }
</style>
</head>
<body>

<div class="navbar">
  <div class="navbar-left">
    <button class="menu-btn" onclick="toggleElement('leftSidebar')">☰ Actions</button>
    
    <span class="left-text">GoldenYield</span>
    
    <span class="tagline">"Operations at Your Fingertips"</span>
  </div>

  <div class="nav-buttons">
    <button onclick="switchModule('agent')">Agents</button>
    <button onclick="switchModule('transport')">Transport</button>
    <button onclick="switchModule('farmer')">Farmers</button>
  </div>

  <div class="right-section" style="display: flex; gap: 10px;">
    <button class="menu-btn" onclick="toggleElement('rightSectorMenu')">Sector ▾</button>
    <button class="logout-btn" onclick="window.location.href='loginform.jsp';">Logout</button>
  </div>
</div>

<div class="main-container">
  <div class="sidebar" id="leftSidebar">
    <div id="actions-agent" class="action-group">
      <button onclick="loadPage('addagent.jsp')">Add Agent</button>
      <button onclick="loadPage('deleteagent.jsp')">Delete Agent</button>
      <button onclick="loadPage('showagentrecordsservlet')">Show All Agents</button>
      <button onclick="loadPage('acquireagents.jsp')">Need for Agents</button>
      <button onclick="loadPage('settledagenttransactions.jsp')">Settled Transactions</button>
      <button onclick="loadPage('ongoingagenttransactions.jsp')">Ongoing Transactions</button>
      <button onclick="loadPage('pendingagnettransactions.jsp')">Pending Transactions</button>
      <button onclick="loadPage('sendagentnotifications.jsp')">Send Notifications</button>
    </div>
    <div id="actions-transport" class="action-group" style="display:none;">
      <button onclick="loadPage('addvehicle.jsp')">Add Vehicle</button>
      <button onclick="loadPage('deletevehicle.jsp')">Delete Vehicle</button>
      <button onclick="loadPage('showvehiclerecordsservlet')">Show All Vehicles</button>
      <button onclick="loadPage('settledagenttransactions.jsp')">Settled Transactions</button>
    </div>
    <div id="actions-farmer" class="action-group" style="display:none;">
      <button onclick="loadPage('addseller.jsp')">Add Farmer</button>
      <button onclick="loadPage('deletefarmer.jsp')">Delete Farmer</button>
      <button onclick="loadPage('showfarmerrecordsservlet')">Show All Farmers</button>
      <button onclick="loadPage('setcroprates.jsp')">Set Values</button>
    </div>
  </div>

  <div class="sector-menu" id="rightSectorMenu">
    <h3 style="color:white; margin-top:0;">Switch Sector</h3>
    <button onclick="switchModule('agent')">Agents</button>
    <button onclick="switchModule('transport')">Transport</button>
    <button onclick="switchModule('farmer')">Farmers</button>
  </div>

  <div class="content">
    <iframe id="mainFrame"></iframe>
  </div>
</div>

<div class="footer">© 2025 GoldenYield. All Rights Reserved.</div>

<script>
function toggleElement(id) {
  const el = document.getElementById(id);
  el.classList.toggle('show');
  
  // Close the other menu if one is opened
  if(id === 'leftSidebar') document.getElementById('rightSectorMenu').classList.remove('show');
  if(id === 'rightSectorMenu') document.getElementById('leftSidebar').classList.remove('show');
}

function switchModule(mod) {
  document.querySelectorAll('.action-group').forEach(group => group.style.display = 'none');
  document.getElementById('actions-' + mod).style.display = 'block';
  
  document.getElementById('rightSectorMenu').classList.remove('show');
  document.getElementById('leftSidebar').classList.add('show'); 
}

function loadPage(url) {
  document.getElementById('mainFrame').src = url;
  if(window.innerWidth <= 850) {
    document.getElementById('leftSidebar').classList.remove('show');
  }
}
</script>
</body>
</html>