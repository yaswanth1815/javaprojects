<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>Agent Dashboard</title>
<style>
body {
  margin: 0;
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  height: 100vh;
  display: flex;
  flex-direction: column;
  background: #f4f6f8;
  overflow: hidden;
}

/* Navbar */
.navbar {
  width: 100%;
  background-color: #2c3e50;
  padding: 15px 20px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  position: relative; 
  box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

.navbar-left {
  display: flex;
  align-items: center;
  gap: 20px;
  flex: 1;
}

.navbar .left-text {
  font-size: 33px;
  font-weight: bold;
  color: white;
  font-family: Arial, sans-serif;
  white-space: nowrap;
}

.nav-buttons {
  margin-left:30px;
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
  transition: all 0.3s ease;
  white-space: nowrap;
}

.nav-buttons button:hover {
  background: linear-gradient(135deg, #00897b, #00695c);
  transform: scale(1.05);
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
}

.navbar .center-text {
  position: absolute;
  left: 60%;
  transform: translateX(-50%);
  font-size: 20px;
  font-weight: bold;
  color: white;
  white-space: nowrap;
  pointer-events: none;
}

.navbar .right-section {
  display: flex;
  align-items: center;
  gap: 15px;
  color: white;
  font-size: 14px;
  white-space: nowrap;
  flex-shrink: 0;
}

.navbar .logout-btn {
  background-color: #e74c3c;
  border: none;
  margin-right:70px;
  padding: 6px 12px;
  color: white;
  border-radius: 5px;
  cursor: pointer;
  font-size: 14px;
  transition: background-color 0.3s ease;
}

.navbar .logout-btn:hover {
  background-color: #c0392b;
}

/* Main content */
.main-area {
  display: none;
  flex-grow: 1;
  height: calc(100vh - 60px);
}
.main-area1 {
  display: flex;
  flex-grow: 1;
  height: calc(100vh - 60px);
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
  margin: 10px 0;
  padding: 12px;
  font-size: 16px;
  border: none;
  border-radius: 8px;
  background-color: #34495e;
  color: white;
  cursor: pointer;
  transition: background-color 0.3s, transform 0.2s;
}

.sidebar button:hover {
  background-color: #1abc9c;
  transform: translateX(5px);
}

.content {
  flex-grow: 1;
}

iframe {
  width: 100%;
  height: 100%;
  border: none;
}

/* Footer (added) */
.footer {
  position: fixed;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #2c3e50;
  color: #ecf0f1;
  text-align: center;
  padding: 10px 15px;
  font-size: 14px;
  z-index: 1000;
}

@media (max-width: 768px) {
  .main-area {
    flex-direction: column;
  }
  .sidebar {
    width: 100%;
    flex-direction: row;
    flex-wrap: wrap;
    justify-content: center;
    padding: 20px 10px;
  }
  .sidebar button {
    width: 45%;
    margin: 8px;
  }
  iframe {
    height: calc(100vh - 60px - 200px);
  }
}
</style>
</head>
<body>

<!-- Navbar -->
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
    <button class="logout-btn" onclick="window.location.href='loginform.jsp';">Logout</button>
  </div>
</div>

<!-- AGENT SECTION -->
<div class="main-area1" id="agent-buttons">
  <div class="sidebar">
    <button onclick="loadPage('addagent.jsp','agentFrame')">Add Agent</button>
    <button onclick="loadPage('deleteagent.jsp','agentFrame')">Delete Agent</button>
    <button onclick="loadPage('showagentrecordsservlet','agentFrame')">Show All Agents</button>
    <button onclick="loadPage('acquireagents.jsp','agentFrame')">Need for Agents</button>
    <button onclick="loadPage('settledagenttransactions.jsp','agentFrame')">Settled Transactions</button>
    <button onclick="loadPage('ongoingagenttransactions.jsp','agentFrame')">Ongoing Transactions</button>
    <button onclick="loadPage('pendingagnettransactions.jsp','agentFrame')">Pending Transactions</button>
    <button onclick="loadPage('sendagentnotifications.jsp','agentFrame')">Send Notifications</button>
  </div>
  <div class="content">
    <iframe id="agentFrame"></iframe>
  </div>
</div>

<!-- TRANSPORT SECTION -->
<div class="main-area" id="transport-buttons">
  <div class="sidebar">
    <button onclick="loadPage('addvehicle.jsp','transportFrame')">Add Vehicle</button>
    <button onclick="loadPage('deletevehicle.jsp','transportFrame')">Delete Vehicle</button>
    <button onclick="loadPage('showvehiclerecordsservlet','transportFrame')">Show All Vehicles</button>
    <button onclick="loadPage('acquireagents.jsp','transportFrame')">Transaction Requests</button>
    <button onclick="loadPage('settledagenttransactions.jsp','transportFrame')">Settled Transactions</button>
    <button onclick="loadPage('ongoingagenttransactions.jsp','transportFrame')">Ongoing Transactions</button>
    <button onclick="loadPage('pendingagnettransactions.jsp','transportFrame')">Failed Transactions</button>
    <button onclick="loadPage('sendagentnotifications.jsp','transportFrame')">Send Notifications</button>
  </div>
  <div class="content">
    <iframe id="transportFrame"></iframe>
  </div>
</div>

<!-- FARMER SECTION -->
<div class="main-area" id="farmer-buttons">
  <div class="sidebar">
    <button onclick="loadPage('addseller.jsp','farmerFrame')">Add Farmer</button>
    <button onclick="loadPage('deletefarmer.jsp','farmerFrame')">Delete Farmer</button>
    <button onclick="loadPage('showfarmerrecordsservlet','farmerFrame')">Show All Farmers</button>
    <button onclick="loadPage('settledagenttransactions.jsp','farmerFrame')">Settled Transactions</button>
    <button onclick="loadPage('ongoingagenttransactions.jsp','farmerFrame')">Ongoing Transactions</button>
    <button onclick="loadPage('pendingagnettransactions.jsp','farmerFrame')">Pending Transactions</button>
    <button onclick="loadPage('sendagentnotifications.jsp','farmerFrame')">Send Notifications</button>
    <button onclick="loadPage('setcroprates.jsp','farmerFrame')">Set Values</button>
  </div>
  <div class="content">
    <iframe id="farmerFrame"></iframe>
  </div>
</div>

<!-- Footer (added) -->
<div class="footer">
  &copy; 2025 GoldenYield. All Rights Reserved.
</div>

<script>
function closeall(){
  document.getElementById("agent-buttons").style.display="none";
  document.getElementById("transport-buttons").style.display="none";
  document.getElementById("farmer-buttons").style.display="none";
}

document.getElementById("frame-agent").addEventListener("click",function(){
  closeall();
  document.getElementById("agent-buttons").style.display = "flex";
});

document.getElementById("frame-transport").addEventListener("click",function(){
  closeall();
  document.getElementById("transport-buttons").style.display = "flex";
});

document.getElementById("frame-farmers").addEventListener("click",function(){
  closeall();
  document.getElementById("farmer-buttons").style.display = "flex";
});

function loadPage(url, frameId) {
  document.getElementById(frameId).src = url;
}

document.getElementById("login-time").textContent =
  "Login Time: " + new Date().toLocaleTimeString();
</script>

</body>
</html>
