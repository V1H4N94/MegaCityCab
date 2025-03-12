<%-- 
    Document   : userMgt
    Created on : Mar 8, 2025, 7:07:36 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MegaCity User Management</title>
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

            .user-card {
                background: #2c2c2c;
                border-radius: 10px;
                padding: 2rem;
                color: white;
                box-shadow: 0 4px 6px rgba(0,0,0,0.1);
                margin-bottom: 2rem;
            }

            .user-card h2 {
                color: #FFD700;
                margin-bottom: 1rem;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .user-table {
                width: 100%;
                border-collapse: collapse;
                background: #2c2c2c;
                color: white;
                border-radius: 5px;
                overflow: hidden;
            }

            .user-table th,
            .user-table td {
                padding: 12px 15px;
                text-align: left;
                border-bottom: 1px solid rgba(255,255,255,0.1);
            }

            .user-table th {
                background-color: #FFD700;
                color: #2c2c2c;
                font-weight: bold;
            }

            .user-table tbody tr:hover {
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
                    <a href="adminMgt.jsp">Admins</a>
                    <a href="#" class="active">Users</a>
                    <a href="#">Requests</a>
                    <a href="#">Confirms</a>
                    <a href="vehiclesMgt.jsp">Vehicles</a>
                </div>
                <button onclick="location.href='login.jsp';" class="logout-btn">Logout</button>
            </div>

            <!-- Main Content -->
            <div class="main-content">
                <div class="content-header">
                    <div>
                        <h1>User Management</h1>
                        <p>Manage system users</p>
                    </div>
                </div>

                <div class="user-card">
                    <h2>System Users</h2>
                    <div id="message-container"></div>
                    <table class="user-table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Full Name</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th>NIC</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody id="userTableBody">
                            <!-- User data will be populated here -->
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Edit User Modal -->
            <div id="editUserModal" class="modal">
                <div class="modal-content">
                    <span class="close-btn" id="editModalClose">&times;</span>
                    <h2 class="modal-title">Edit User</h2>
                    <form id="editUserForm">
                        <input type="hidden" id="editUserId" class="hidden-id">
                        <div class="form-group">
                            <label for="editUserName">Full Name</label>
                            <input type="text" id="editUserName" required>
                        </div>
                        <div class="form-group">
                            <label for="editUserEmail">Email</label>
                            <input type="email" id="editUserEmail" required>
                        </div>
                        <div class="form-group">
                            <label for="editUserPhone">Phone</label>
                            <input type="text" id="editUserPhone" required>
                        </div>
                        <div class="form-group">
                            <label for="editUserNic">NIC</label>
                            <input type="text" id="editUserNic" required>
                        </div>
                        <div class="form-group">
                            <label for="editUserPassword">Password (leave blank to keep current)</label>
                            <input type="password" id="editUserPassword">
                        </div>
                        <div class="form-actions">
                            <button type="button" class="action-btn delete-btn" id="cancelEditBtn">Cancel</button>
                            <button type="submit" class="action-btn edit-btn">Update User</button>
                        </div>
                    </form>
                </div>
            </div>

            <!-- Delete Confirmation Modal -->
            <div id="deleteUserModal" class="modal">
                <div class="modal-content">
                    <span class="close-btn" id="deleteModalClose">&times;</span>
                    <h2 class="modal-title">Confirm Deletion</h2>
                    <p>Are you sure you want to delete this user?</p>
                    <input type="hidden" id="deleteUserId" class="hidden-id">
                    <div class="form-actions">
                        <button type="button" class="action-btn edit-btn" id="cancelDeleteBtn">Cancel</button>
                        <button type="button" class="action-btn delete-btn" id="confirmDeleteBtn">Delete</button>
                    </div>
                </div>
            </div>
    
    <script>
        // API URL
        const USER_API_URL = 'http://localhost:8080/rest_service/api/users';

        // Function to show message
        function showMessage(message, type) {
            const container = document.getElementById('message-container');
            container.innerHTML = `<div class="${type}-message">${message}</div>`;
            
            // Auto-hide after 5 seconds
            setTimeout(() => {
                container.innerHTML = '';
            }, 5000);
        }

        // Function to load user data
        function loadUserData() {
            const tableBody = document.getElementById('userTableBody');
            tableBody.innerHTML = '<tr><td colspan="6" class="loading">Loading users...</td></tr>';

            fetch(USER_API_URL)
                .then(response => {
                    if (!response.ok) {
                        throw new Error(`HTTP error! status: ${response.status}`);
                    }
                    return response.json();
                })
                .then(users => {
                    if (!users || users.length === 0) {
                        tableBody.innerHTML = '<tr><td colspan="6" class="loading">No users found</td></tr>';
                        return;
                    }

                    const tableContent = users.map(user => {
                        return `
                            <tr>
                                <td>` + user.id + `</td>
                                <td>` + user.fullName + `</td>
                                <td>` + user.email + `</td>
                                <td>` + user.tel + `</td>
                                <td>` + user.identity + `</td>
                                <td>
                                    <button class="action-btn edit-btn" onclick="openEditModal(` + user.id + `,'` + user.fullName + `','` + user.email + `','` + user.tel + `','` + user.identity + `')">Edit</button>
                                    <button class="action-btn delete-btn" onclick="openDeleteModal(` + user.id + `)">Delete</button>
                                </td>
                            </tr>
                        `;
                    }).join('');
                    
                    tableBody.innerHTML = tableContent;
                })
                .catch(error => {
                    console.error('Error loading users:', error);
                    tableBody.innerHTML = `
                        <tr>
                            <td colspan="6" class="error-message">
                                Error loading users: ${error.message}
                            </td>
                        </tr>`;
                });
        }

        // Function to open edit modal
        function openEditModal(id, fullName, email, tel, identity) {
            document.getElementById('editUserId').value = id;
            document.getElementById('editUserName').value = fullName;
            document.getElementById('editUserEmail').value = email;
            document.getElementById('editUserPhone').value = tel;
            document.getElementById('editUserNic').value = identity;
            document.getElementById('editUserPassword').value = '';
            document.getElementById('editUserModal').style.display = 'block';
        }

        // Function to open delete modal
        function openDeleteModal(id) {
            document.getElementById('deleteUserId').value = id;
            document.getElementById('deleteUserModal').style.display = 'block';
        }

        // Function to close all modals
        function closeAllModals() {
            document.getElementById('editUserModal').style.display = 'none';
            document.getElementById('deleteUserModal').style.display = 'none';
        }

        // Function to update a user
        function updateUser(event) {
            event.preventDefault();
            
            const id = document.getElementById('editUserId').value;
            const user = {
                fullName: document.getElementById('editUserName').value,
                email: document.getElementById('editUserEmail').value,
                tel: document.getElementById('editUserPhone').value,
                identity: document.getElementById('editUserNic').value
            };

            // If password is provided, include it
            const password = document.getElementById('editUserPassword').value;
            if (password) {
                user.pass = password;
            }

            fetch(`${USER_API_URL}/${id}`, {
                method: 'PUT',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(user)
            })
            .then(response => {
                if (!response.ok) {
                    throw new Error(`HTTP error! status: ${response.status}`);
                }
                return response.json();
            })
            .then(data => {
                closeAllModals();
                showMessage('User updated successfully!', 'success');
                loadUserData();
            })
            .catch(error => {
                console.error('Error updating user:', error);
                showMessage(`Error updating user: ${error.message}`, 'error');
            });
        }

        // Function to delete a user
        function deleteUser() {
            const id = document.getElementById('deleteUserId').value;
            
            fetch(`${USER_API_URL}/${id}`, {
                method: 'DELETE'
            })
            .then(response => {
                if (!response.ok) {
                    throw new Error(`HTTP error! status: ${response.status}`);
                }
                return response.json();
            })
            .then(data => {
                closeAllModals();
                showMessage('User deleted successfully!', 'success');
                loadUserData();
            })
            .catch(error => {
                console.error('Error deleting user:', error);
                showMessage(`Error deleting user: ${error.message}`, 'error');
            });
        }

        // Event listeners
        document.addEventListener('DOMContentLoaded', function() {
            // Load initial data
            loadUserData();
            
            // Edit User form submission
            document.getElementById('editUserForm').addEventListener('submit', updateUser);
            
            // Delete User confirmation
            document.getElementById('confirmDeleteBtn').addEventListener('click', deleteUser);
            
            // Close modal buttons
            document.getElementById('editModalClose').addEventListener('click', closeAllModals);
            document.getElementById('deleteModalClose').addEventListener('click', closeAllModals);
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