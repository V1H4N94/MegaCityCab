<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MegaCity Admin Panel</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #2c2c2c 0%, #1a1a1a 100%);
            min-height: 100vh;
            display: flex;
        }

        /* Sidebar Styles */
        .sidebar {
            width: 250px;
            background-color: #2c2c2c;
            padding: 2rem 0;
            height: 100vh;
            position: fixed;
            box-shadow: 2px 0 5px rgba(0,0,0,0.1);
        }

        .sidebar-header {
            color: #FFF;
            text-align: center;
            padding-bottom: 2rem;
            border-bottom: 1px solid rgba(255,255,255,0.1);
        }

        .sidebar-logo {
            font-size: 1.5rem;
            font-weight: bold;
            color: #FFF;
            margin-bottom: 0.5rem;
        }

        .sidebar-sublogo {
            color: #FFD700;
            font-size: 0.8rem;
        }

        .sidebar-menu {
            padding: 2rem 0;
        }

        .sidebar-menu a {
            display: flex;
            align-items: center;
            padding: 1rem 2rem;
            color: white;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .sidebar-menu a:hover {
            background-color: rgba(255, 215, 0, 0.1);
            padding-left: 2.5rem;
        }

        .sidebar-menu a.active {
            border-left: 4px solid #FFD700;
            background-color: rgb(80, 80, 80);
        }

        .logout-btn {
            position: absolute;
            bottom: 2rem;
            left: 50%;
            transform: translateX(-50%);
            padding: 0.8rem 2rem;
            background-color: #FFD700;
            color: #2c2c2c;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            transition: all 0.3s ease;
        }

        .logout-btn:hover {
            background-color: white;
            transform: translateX(-50%) translateY(-3px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.3);
        }

        /* Main Content Area */
        .main-content {
            margin-left: 250px;
            padding: 2rem;
            width: calc(100% - 250px);
        }

        .content-header {
            margin-bottom: 2rem;
        }

        .content-header h1 {
            color: white;
            margin-bottom: 0.5rem;
        }

        .content-header p {
            color: #FFD700;
        }

        .cards-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
        }

        .card {
            background: #2c2c2c;
            border-radius: 10px;
            padding: 2rem;
            color: white;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
        }

        .card:hover {
            transform: translateY(-10px);
        }

        .card h2 {
            color: #FFD700;
            margin-bottom: 1rem;
        }

        .card-content {
            min-height: 200px;
            border: 2px dashed rgba(255,215,0,0.3);
            border-radius: 5px;
            padding: 1rem;
            margin-top: 1rem;
        }
        
        .admin-table {
            width: 100%;
            border-collapse: collapse;
            background: #2c2c2c;
            color: white;
            border-radius: 5px;
            overflow: hidden;
        }

        .admin-table th,
        .admin-table td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid rgba(255,255,255,0.1);
        }

        .admin-table th {
            background-color: #FFD700;
            color: #2c2c2c;
            font-weight: bold;
        }

        .admin-table tbody tr:hover {
            background-color: rgba(255,215,0,0.1);
        }

        .loading {
            color: #FFD700;
            text-align: center;
            padding: 20px;
        }

        .error-message {
            color: #ff6b6b;
            text-align: center;
            padding: 20px;
        }
        
        /* Make the Home card full width when active */
        .card.full-width {
            grid-column: 1 / -1;
        }
        
        /* Action buttons styles */
        .action-btn {
            padding: 5px 10px;
            margin-right: 5px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            font-weight: bold;
            transition: all 0.3s ease;
        }

        .edit-btn {
            background-color: #4CAF50;
            color: white;
        }

        .delete-btn {
            background-color: #f44336;
            color: white;
        }

        .action-btn:hover {
            opacity: 0.8;
        }

        .success-message {
            background-color: rgba(76, 175, 80, 0.3);
            color: #4CAF50;
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 5px;
        }

        .error-message {
            background-color: rgba(244, 67, 54, 0.3);
            color: #f44336;
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 5px;
        }

        #message-container {
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <div class="sidebar-header">
            <div class="sidebar-logo">MEGACITY</div>
            <div class="sidebar-sublogo">CONTROL CENTER</div>
        </div>
        <div class="sidebar-menu">
            <a href="#" class="active">Home</a>
            <a href="adminMgt.jsp">Admins</a>
            <a href="userMgt.jsp">Users</a>
            <a href="#">Requests</a>
            <a href="#">Confirms</a>
            <a href="vehiclesMgt.jsp">Vehicles</a>
            
        </div>
        <button onclick="location.href='login.jsp';" class="logout-btn">Logout</button>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="content-header">
            <h1>Dashboard</h1>
            <p>Welcome Back, Administrator!</p>
        </div>

        <div class="cards-grid">
            <!-- Home Card -->
            <div class="card full-width" id="home-card">
                <h2>System Administrators</h2>
                <div class="card-content">
                    <table class="admin-table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Username</th>
                                <th>Full Name</th>
                            </tr>
                        </thead>
                        <tbody id="adminTableBody">
                            <!-- Admin data will be populated here -->
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Users Card -->
            <div class="card full-width" id="users-card">
                <h2>System Users</h2>
                <div class="card-content">
                    <table class="admin-table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Full Name</th>
                                <th>Email</th>
                                <th>Telephone</th>
                                <th>NIC</th>
                            </tr>
                        </thead>
                        <tbody id="userTableBody">
                            <!-- User data will be populated here -->
                        </tbody>
                    </table>
                </div>
            </div>
            
            <!-- Vehicles Card -->
            <div class="card full-width">
                <h2>Vehicles</h2>
                <div class="card-content">
                    <div id="message-container"></div>
                    <table class="admin-table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>License</th>
                                <th>Owner</th>
                                <th>Brand</th>
                                <th>Model</th>
                                <th>Category</th>
                            </tr>
                        </thead>
                        <tbody id="vehicleTableBody">
                            <!-- Vehicle data will be populated here -->
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Requests Card -->
            <div class="card">
                <h2>Requests</h2>
                <div class="card-content">
                    <!-- Your code here -->
                </div>
            </div>

            <!-- Confirms Card -->
            <div class="card">
                <h2>Confirms</h2>
                <div class="card-content">
                    <!-- Your code here -->
                </div>
            </div>

            
        </div>
    </div>
    
    <script>
        function loadAdminData() {
            const tableBody = document.getElementById('adminTableBody');
            console.log('Loading admin data...'); 
            
            
            tableBody.innerHTML = '<tr><td colspan="3" class="loading">Loading administrators...</td></tr>';

            
            fetch('http://localhost:8080/rest_service/api/admins', {
                method: 'GET',
                headers: {
                    'Accept': 'application/json',
                }
            })
            .then(response => {
                console.log('Response status:', response.status); 
                if (!response.ok) {
                    throw new Error(`HTTP error! status: ${response.status}`);
                }
                return response.json();
            })
            .then(admins => {
                console.log('Received data:', admins); 
                
                if (!admins || admins.length === 0) {
                    tableBody.innerHTML = '<tr><td colspan="3" class="loading">No administrators found</td></tr>';
                    return;
                }

                const tableContent = admins.map(admin => {
                    console.log('Processing admin:', admin); 
                    return `
                        <tr>
                            <td>` + admin.id + `</td>
                            <td>` + admin.user + `</td>
                            <td>` + admin.name + `</td>
                        </tr>
                    `;
                }).join('');
                
                console.log('Generated table content:', tableContent); 
                tableBody.innerHTML = tableContent;
            })
            .catch(error => {
                console.error('Error in fetch operation:', error);
                tableBody.innerHTML = `
                    <tr>
                        <td colspan="3" class="error-message">
                            Error loading administrators: ${error.message}
                        </td>
                    </tr>`;
            });
        }
        
        function loadUserData() {
            const tableBody = document.getElementById('userTableBody');
            console.log('Loading user data...'); 
            
            
            tableBody.innerHTML = '<tr><td colspan="5" class="loading">Loading Users...</td></tr>';

            
            fetch('http://localhost:8080/rest_service/api/users', {
                method: 'GET',
                headers: {
                    'Accept': 'application/json',
                }
            })
            .then(response => {
                console.log('Response status:', response.status); 
                if (!response.ok) {
                    throw new Error(`HTTP error! status: ${response.status}`);
                }
                return response.json();
            })
            .then(users => {
                console.log('Received data:', users); 
                
                if (!users || users.length === 0) {
                    tableBody.innerHTML = '<tr><td colspan="5" class="loading">No users found</td></tr>';
                    return;
                }

                const tableContent = users.map(user => {
                    console.log('Processing user:', user); 
                    return `
                        <tr>
                            <td>` + user.id + `</td>
                            <td>` + user.fullName + `</td>
                            <td>` + user.email + `</td>
                            <td>` + user.tel + `</td>
                            <td>` + user.identity + `</td>
                        </tr>
                    `;
                }).join('');
                
                console.log('Generated table content:', tableContent); 
                tableBody.innerHTML = tableContent;
            })
            .catch(error => {
                console.error('Error in fetch operation:', error);
                tableBody.innerHTML = `
                    <tr>
                        <td colspan="3" class="error-message">
                            Error loading administrators: ${error.message}
                        </td>
                    </tr>`;
            });
        }
        
        const VEHICLE_API_URL = 'http://localhost:8080/rest_service/api/cars';
        
        // Function to show message
        function showMessage(message, type) {
            const container = document.getElementById('message-container');
            container.innerHTML = '<div class="' + type + '-message">' + message + '</div>';
            
            // Auto-hide after 5 seconds
            setTimeout(function() {
                container.innerHTML = '';
            }, 5000);
        }
        
        // Function to load vehicle data
        function loadVehicleData() {
            const tableBody = document.getElementById('vehicleTableBody');
            tableBody.innerHTML = '<tr><td colspan="7" class="loading">Loading vehicles...</td></tr>';
            fetch(VEHICLE_API_URL)
                .then(function(response) {
                    if (!response.ok) {
                        throw new Error('HTTP error! status: ' + response.status);
                    }
                    return response.json();
                })
                .then(function(vehicles) {
                    if (!vehicles || vehicles.length === 0) {
                        tableBody.innerHTML = '<tr><td colspan="7" class="loading">No vehicles found</td></tr>';
                        return;
                    }
                    let tableContent = '';
                    for (let i = 0; i < vehicles.length; i++) {
                        const vehicle = vehicles[i];
                        tableContent += '<tr>' +
                            '<td>' + vehicle.id + '</td>' +
                            '<td>' + vehicle.license + '</td>' +
                            '<td>' + vehicle.owner + '</td>' +
                            '<td>' + vehicle.brand + '</td>' +
                            '<td>' + vehicle.model + '</td>' +
                            '<td>' + vehicle.category + '</td>'
                        '</tr>';
                    }
                    
                    tableBody.innerHTML = tableContent;
                })
                .catch(function(error) {
                    console.error('Error loading vehicles:', error);
                    tableBody.innerHTML = '<tr>' +
                        '<td colspan="7" class="error-message">' +
                            'Error loading vehicles: ' + error.message +
                        '</td>' +
                    '</tr>';
                });
        }

        document.addEventListener('DOMContentLoaded', function() {
            console.log('DOM Content Loaded'); 

            const sidebarLinks = document.querySelectorAll('.sidebar-menu a');

            sidebarLinks.forEach(link => {
                link.addEventListener('click', function(e) {
                    // Only prevent default for links without real destinations
                    if (this.getAttribute('href') === '#') {
                        e.preventDefault();
                    }

                    // Update active class
                    sidebarLinks.forEach(l => l.classList.remove('active'));
                    this.classList.add('active');

                    // The href links will work naturally for actual pages
                });
            });

            loadAdminData();
            loadUserData();
            loadVehicleData();
        });
    </script>
</body>
</html>