<%-- 
    Document   : adminMgt
    Created on : Mar 8, 2025, 2:45:21 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MegaCity Admin Management</title>
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
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .content-header h1 {
                color: white;
                margin-bottom: 0.5rem;
            }

            .content-header p {
                color: #FFD700;
            }

            .admin-card {
                background: #2c2c2c;
                border-radius: 10px;
                padding: 2rem;
                color: white;
                box-shadow: 0 4px 6px rgba(0,0,0,0.1);
                margin-bottom: 2rem;
            }

            .admin-card h2 {
                color: #FFD700;
                margin-bottom: 1rem;
                display: flex;
                justify-content: space-between;
                align-items: center;
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

            .success-message {
                color: #4CAF50;
                text-align: center;
                padding: 20px;
            }

            /* Button styles */
            .action-btn {
                padding: 8px 12px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-weight: bold;
                transition: all 0.3s ease;
                margin-right: 5px;
            }

            .add-btn {
                background-color: #FFD700;
                color: #2c2c2c;
            }

            .add-btn:hover {
                background-color: #e6c200;
            }

            .edit-btn {
                background-color: #3498db;
                color: white;
            }

            .edit-btn:hover {
                background-color: #2980b9;
            }

            .delete-btn {
                background-color: #e74c3c;
                color: white;
            }

            .delete-btn:hover {
                background-color: #c0392b;
            }

            /* Modal styles */
            .modal {
                display: none;
                position: fixed;
                z-index: 10;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0,0,0,0.5);
            }

            .modal-content {
                background-color: #2c2c2c;
                margin: 10% auto;
                padding: 30px;
                border-radius: 10px;
                width: 50%;
                box-shadow: 0 5px 15px rgba(0,0,0,0.3);
                color: white;
                position: relative;
            }

            .close-btn {
                position: absolute;
                top: 15px;
                right: 15px;
                font-size: 24px;
                cursor: pointer;
                color: #FFD700;
            }

            .close-btn:hover {
                color: white;
            }

            .modal-title {
                font-size: 1.5rem;
                margin-bottom: 20px;
                color: #FFD700;
            }

            .form-group {
                margin-bottom: 20px;
            }

            .form-group label {
                display: block;
                margin-bottom: 8px;
                font-weight: bold;
            }

            .form-group input {
                width: 100%;
                padding: 10px;
                border: 1px solid #555;
                border-radius: 5px;
                background-color: #3a3a3a;
                color: white;
            }

            .form-group input:focus {
                outline: none;
                border-color: #FFD700;
            }

            .form-actions {
                display: flex;
                justify-content: flex-end;
                margin-top: 20px;
            }

            .form-actions button {
                margin-left: 10px;
                padding: 10px 15px;
            }

            .hidden-id {
                display: none;
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
                    <a href="administrator.jsp">Home</a>
                    <a href="#" class="active">Admins</a>
                    <a href="userMgt.jsp">Users</a>
                    <a href="bookingReq.jsp">Requests</a>
                    <a href="#">Confirms</a>
                    <a href="vehiclesMgt.jsp">Vehicles</a>
                </div>
                <button onclick="location.href='login.jsp';" class="logout-btn">Logout</button>
            </div>

            <!-- Main Content -->
            <div class="main-content">
                <div class="content-header">
                    <div>
                        <h1>Administrator Management</h1>
                        <p>Manage system administrators</p>
                    </div>
                    <button id="addAdminBtn" class="action-btn add-btn">Add New Admin</button>
                </div>

                <div class="admin-card">
                    <h2>System Administrators</h2>
                    <div id="message-container"></div>
                    <table class="admin-table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Username</th>
                                <th>Full Name</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody id="adminTableBody">
                            <!-- Admin data will be populated here -->
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Add Admin Modal -->
            <div id="addAdminModal" class="modal">
                <div class="modal-content">
                    <span class="close-btn" id="addModalClose">&times;</span>
                    <h2 class="modal-title">Add New Administrator</h2>
                    <form id="addAdminForm">
                        <div class="form-group">
                            <label for="adminUsername">Email</label>
                            <input type="text" id="adminUsername" required>
                        </div>
                        <div class="form-group">
                            <label for="adminName">Full Name</label>
                            <input type="text" id="adminName" required>
                        </div>
                        <div class="form-group">
                            <label for="adminPassword">Password</label>
                            <input type="password" id="adminPassword" required>
                        </div>
                        <div class="form-actions">
                            <button type="button" class="action-btn delete-btn" id="cancelAddBtn">Cancel</button>
                            <button type="submit" class="action-btn add-btn">Add Administrator</button>
                        </div>
                    </form>
                </div>
            </div>

            <!-- Edit Admin Modal -->
            <div id="editAdminModal" class="modal">
                <div class="modal-content">
                    <span class="close-btn" id="editModalClose">&times;</span>
                    <h2 class="modal-title">Edit Administrator</h2>
                    <form id="editAdminForm">
                        <input type="hidden" id="editAdminId" class="hidden-id">
                        <div class="form-group">
                            <label for="editAdminUsername">Username</label>
                            <input type="text" id="editAdminUsername" required>
                        </div>
                        <div class="form-group">
                            <label for="editAdminName">Full Name</label>
                            <input type="text" id="editAdminName" required>
                        </div>
                        <div class="form-group">
                            <label for="editAdminPassword">Password (leave blank to keep current)</label>
                            <input type="password" id="editAdminPassword">
                        </div>
                        <div class="form-actions">
                            <button type="button" class="action-btn delete-btn" id="cancelEditBtn">Cancel</button>
                            <button type="submit" class="action-btn edit-btn">Update Administrator</button>
                        </div>
                    </form>
                </div>
            </div>

            <!-- Delete Confirmation Modal -->
            <div id="deleteAdminModal" class="modal">
                <div class="modal-content">
                    <span class="close-btn" id="deleteModalClose">&times;</span>
                    <h2 class="modal-title">Confirm Deletion</h2>
                    <p>Are you sure you want to delete this administrator?</p>
                    <input type="hidden" id="deleteAdminId" class="hidden-id">
                    <div class="form-actions">
                        <button type="button" class="action-btn add-btn" id="cancelDeleteBtn">Cancel</button>
                        <button type="button" class="action-btn delete-btn" id="confirmDeleteBtn">Delete</button>
                    </div>
                </div>
            </div>
    
    <script>
        // API URL
        const ADMIN_API_URL = 'http://localhost:8080/rest_service/api/admins';

        // Function to show message
        function showMessage(message, type) {
            const container = document.getElementById('message-container');
            container.innerHTML = `<div class="${type}-message">${message}</div>`;
            
            // Auto-hide after 5 seconds
            setTimeout(() => {
                container.innerHTML = '';
            }, 5000);
        }

        // Function to load admin data
        function loadAdminData() {
            const tableBody = document.getElementById('adminTableBody');
            tableBody.innerHTML = '<tr><td colspan="4" class="loading">Loading administrators...</td></tr>';

            fetch(ADMIN_API_URL)
                .then(response => {
                    if (!response.ok) {
                        throw new Error(`HTTP error! status: ${response.status}`);
                    }
                    return response.json();
                })
                .then(admins => {
                    if (!admins || admins.length === 0) {
                        tableBody.innerHTML = '<tr><td colspan="4" class="loading">No administrators found</td></tr>';
                        return;
                    }

                    const tableContent = admins.map(admin => {
                        return `
                            <tr>
                                <td>` + admin.id + `</td>
                                <td>` + admin.user + `</td>
                                <td>` + admin.name + `</td>
                                <td>
                                    <button class="action-btn edit-btn" onclick="openEditModal(${admin.id}, '${admin.user}', '${admin.name}')">Edit</button>
                                    <button class="action-btn delete-btn" onclick="openDeleteModal(${admin.id})">Delete</button>
                                </td>
                            </tr>
                        `;
                    }).join('');
                    
                    tableBody.innerHTML = tableContent;
                })
                .catch(error => {
                    console.error('Error loading administrators:', error);
                    tableBody.innerHTML = `
                        <tr>
                            <td colspan="4" class="error-message">
                                Error loading administrators: ${error.message}
                            </td>
                        </tr>`;
                });
        }

        // Function to open add modal
        function openAddModal() {
            document.getElementById('addAdminForm').reset();
            document.getElementById('addAdminModal').style.display = 'block';
        }

        // Function to open edit modal
        function openEditModal(id, username, name) {
            document.getElementById('editAdminId').value = id;
            document.getElementById('editAdminUsername').value = username;
            document.getElementById('editAdminName').value = name;
            document.getElementById('editAdminPassword').value = '';
            document.getElementById('editAdminModal').style.display = 'block';
        }

        // Function to open delete modal
        function openDeleteModal(id) {
            document.getElementById('deleteAdminId').value = id;
            document.getElementById('deleteAdminModal').style.display = 'block';
        }

        // Function to close all modals
        function closeAllModals() {
            document.getElementById('addAdminModal').style.display = 'none';
            document.getElementById('editAdminModal').style.display = 'none';
            document.getElementById('deleteAdminModal').style.display = 'none';
        }

        // Function to add a new admin
        function addAdmin(event) {
            event.preventDefault();
            
            const admin = {
                id: 0, // ID will be assigned by the server
                user: document.getElementById('adminUsername').value,
                name: document.getElementById('adminName').value,
                pass: document.getElementById('adminPassword').value
            };

            fetch(ADMIN_API_URL, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(admin)
            })
            .then(response => {
                if (!response.ok) {
                    throw new Error(`HTTP error! status: ${response.status}`);
                }
                closeAllModals();
                showMessage('Administrator added successfully!', 'success');
                loadAdminData();
            })
            .catch(error => {
                console.error('Error adding administrator:', error);
                showMessage(`Error adding administrator: ${error.message}`, 'error');
            });
        }

        // Function to update an admin
        function updateAdmin(event) {
            event.preventDefault();
            
            const id = document.getElementById('editAdminId').value;
            const admin = {
                id: parseInt(id),
                user: document.getElementById('editAdminUsername').value,
                name: document.getElementById('editAdminName').value,
                pass: document.getElementById('editAdminPassword').value
            };

            // If password is empty, remove it from the object (to keep the current password)
            if (!admin.pass) {
                delete admin.pass;
            }

            fetch(ADMIN_API_URL, {
                method: 'PUT',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(admin)
            })
            .then(response => {
                if (!response.ok) {
                    throw new Error(`HTTP error! status: ${response.status}`);
                }
                closeAllModals();
                showMessage('Administrator updated successfully!', 'success');
                loadAdminData();
            })
            .catch(error => {
                console.error('Error updating administrator:', error);
                showMessage(`Error updating administrator: ${error.message}`, 'error');
            });
        }

        // Function to delete an admin
        function deleteAdmin() {
            const id = document.getElementById('deleteAdminId').value;
            
            fetch(`${ADMIN_API_URL}/${id}`, {
                method: 'DELETE'
            })
            .then(response => {
                if (!response.ok) {
                    throw new Error(`HTTP error! status: ${response.status}`);
                }
                closeAllModals();
                showMessage('Administrator deleted successfully!', 'success');
                loadAdminData();
            })
            .catch(error => {
                console.error('Error deleting administrator:', error);
                showMessage(`Error deleting administrator: ${error.message}`, 'error');
            });
        }

        // Event listeners
        document.addEventListener('DOMContentLoaded', function() {
            // Load initial data
            loadAdminData();
            
            // Add Admin button
            document.getElementById('addAdminBtn').addEventListener('click', openAddModal);
            
            // Add Admin form submission
            document.getElementById('addAdminForm').addEventListener('submit', addAdmin);
            
            // Edit Admin form submission
            document.getElementById('editAdminForm').addEventListener('submit', updateAdmin);
            
            // Delete Admin confirmation
            document.getElementById('confirmDeleteBtn').addEventListener('click', deleteAdmin);
            
            // Close modal buttons
            document.getElementById('addModalClose').addEventListener('click', closeAllModals);
            document.getElementById('editModalClose').addEventListener('click', closeAllModals);
            document.getElementById('deleteModalClose').addEventListener('click', closeAllModals);
            document.getElementById('cancelAddBtn').addEventListener('click', closeAllModals);
            document.getElementById('cancelEditBtn').addEventListener('click', closeAllModals);
            document.getElementById('cancelDeleteBtn').addEventListener('click', closeAllModals);
            
            // Close modals when clicking outside
            window.addEventListener('click', function(event) {
                if (event.target.classList.contains('modal')) {
                    closeAllModals();
                }
            });
        });
    </script>
</body>
</html>
