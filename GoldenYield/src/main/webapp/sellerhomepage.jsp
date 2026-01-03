<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GoldenYield Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        /* Reset & base */
        body {
            margin: 0;
            font-family: 'Roboto', sans-serif;
            background: #f4f7fa;
            display: flex;
            min-height: 100vh;
            color: #333;
        }

        /* Sidebar */
        .sidebar {
            width: 250px;
            background-color: #1e293b;
            color: white;
            padding: 20px;
            display: flex;
            flex-direction: column;
            box-shadow: 2px 0 5px rgba(0,0,0,0.1);
        }
        .sidebar-header {
            font-size: 40px;
            font-weight: 700;
            color: #22c55e;
            margin-bottom: 30px;
            text-align: center;
        }
        .sidebar-menu {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        .sidebar-menu li {
            margin-bottom: 10px;
        }
        .sidebar-menu button {
            display: flex;
            align-items: center;
            width: 100%;
            padding: 12px 15px;
            background: none;
            border: none;
            color: #cbd5e1;
            text-align: left;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        .sidebar-menu button:hover {
            background-color: #334155;
            color: white;
            transform: translateX(5px);
        }
        .sidebar-menu i {
            margin-right: 15px;
            font-size: 18px;
            width: 20px;
            text-align: center;
        }

        /* Main content */
        .main {
            flex: 1;
            display: flex;
            flex-direction: column;
        }
        .topbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color:  #1e293b;
            padding: 15px 30px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.05);
        }
        .topbar-welcome {
            margin-top: 10px;
            font-size: 30px;
            font-weight: 500;
            color: #f2f7f4;
        }
        .topbar-right {
            display: flex;
            align-items: center;
            gap: 15px;
        }
        .login-time {
            font-size: 14px;
            color: #dee4eb;
        }
        .btn {
            background-color: #22c55e;
            border: none;
            color: white;
            padding: 10px 20px;
            border-radius: 6px;
            font-size: 14px;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        .btn:hover {
            background-color: #16a34a;
            box-shadow: 0 2px 8px rgba(34,197,94,0.3);
        }
		.content {
            padding: 1px 1px;
            flex: 1;
        }
        /* Content */
        .content {
            padding: 40px 30px;
            flex: 1;
        }
      
        .content h2 {
            font-size: 32px;
            margin-bottom: 15px;
            color: #1e293b;
        }
        .content p {
            font-size: 18px;
            margin-bottom: 40px;
            color: #64748b;
        }
        .quick-stats {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
        }
        .stat-card {
            background: white;
            border-radius: 12px;
            padding: 20px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.05);
            transition: all 0.3s ease;
        }
        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 20px rgba(0,0,0,0.1);
        }
        .stat-card h3 {
            font-size: 16px;
            color: #64748b;
            margin-bottom: 10px;
        }
        .stat-card .value {
            font-size: 28px;
            font-weight: 700;
            color: #22c55e;
        }

        /* Footer */
        footer {
            background-color: #1e293b;
            color: #cbd5e1;
            text-align: center;
            padding: 15px 0;
            font-size: 14px;
            box-shadow: 0 -2px 5px rgba(0,0,0,0.05);
        }
        footer p {
            margin: 5px 0;
        }

        /* Responsive */
        @media (max-width: 768px) {
            body {
                flex-direction: column;
            }
            .sidebar {
                width: 100%;
                height: auto;
                padding: 15px;
            }
            .sidebar-menu {
                display: flex;
                overflow-x: auto;
            }
            .sidebar-menu li {
                margin-right: 10px;
                margin-bottom: 0;
            }
            .sidebar-menu button {
                white-space: nowrap;
            }
            .button-show{
            margin-top:10px;
            margin-bottom:100px;
            display:flex;
            }
            }
           	iframe {
   			 width:100%;
   			 height:100%;
   			 border: none;
			}
           
    </style>
</head>
<body>
    <%
        String name = (String) session.getAttribute("sellername");
        String value = (String) session.getAttribute("cropindex");
    %>
<!-- Sidebar -->
<div class="sidebar">
    <div class="sidebar-header">GoldenYield</div>
    <ul class="sidebar-menu">
        <li><button onclick="loadpage('')"><i class="fas fa-shopping-cart"></i> Sell Now</button></li>
        <li><button onclick="loadpage('')"><i class="fas fa-exchange-alt"></i> Current Transactions</button></li>
        <li><button onclick="loadpage('')"><i class="fas fa-chart-bar"></i> Analytics & Insights</button></li>
        <li><button onclick="loadpage('showcroprates.jsp')"><i class="fas fa-seedling"></i> Crop Rates</button></li>
        <li><button onclick="loadpage('')"><i class="fas fa-money-bill-wave"></i> Your Earnings</button></li>
        <li><button onclick="loadpage('')"><i class="fas fa-history"></i> History</button></li>
        <li><button onclick="loadpage('')"><i class="fas fa-lightbulb"></i> Tips & Guides</button></li>
        <li><button onclick="loadpage('')"><i class="fas fa-bullhorn"></i> Announcements</button></li>
        <li><button onclick="loadpage('')"><i class="fas fa-receipt"></i> Payment History</button></li>
    </ul>
</div>

<!-- Main -->
<div class="main" id="main">
    <!-- Topbar -->
    <div class="topbar">
        <div class="topbar-welcome">Welcome to Dashboard, <%= name %></div>
        <div class="topbar-right">
            <div class="login-time" id="login-time">Login Time: --:--:--</div>
            <button class="btn">My Profile</button>
            <button class="btn">Raise a Ticket</button>
            <button class="btn">Logout</button>
        </div>
    </div>
	<div>

	</div>
    <!-- Content -->
    <div class="content" id="content">
        <h2>Hello <%= name %> 👋</h2>
        <p>Manage your sales, track transactions, view earnings, and explore analytics from a single place.</p>

        <!-- Quick Stats -->
        <div class="quick-stats">
            <div class="stat-card">
                <h3>Total Earnings</h3>
                <div class="value">$12,450</div>
            </div>
            <div class="stat-card">
                <h3>Active Transactions</h3>
                <div class="value">8</div>
            </div>
            <div class="stat-card">
                <h3>Crop Rate Index</h3>
                <div class="value"><%= value %>%</div>
            </div>
        </div>
    </div>
	<iframe class="content1" id="yaswanth" src=""></iframe>
    <!-- Footer -->
    <footer>
        <p>@goldenyield.in</p>
        <p>&copy; 2025 GoldenYield. All Rights Reserved.</p>
    </footer>
</div>

<script>
    const now = new Date();
    document.getElementById('login-time').textContent = "Login Time: " + now.toLocaleTimeString();
    
    function loadpage(page){
    	document.getElementById("content").style.display="none";
    	document.getElementById("yaswanth").src=page;
    }
</script>

</body>
</html>
