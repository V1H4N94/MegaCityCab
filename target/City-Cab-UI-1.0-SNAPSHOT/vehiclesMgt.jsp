<%-- 
    Document   : vehiclesMgt
    Created on : Mar 12, 2025, 11:24:43 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MegaCity Vehicle Management</title>
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

            .vehicle-card {
                background: #2c2c2c;
                border-radius: 10px;
                padding: 2rem;
                color: white;
                box-shadow: 0 4px 6px rgba(0,0,0,0.1);
                margin-bottom: 2rem;
            }

            .vehicle-card h2 {
                color: #FFD700;
                margin-bottom: 1rem;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .vehicle-table {
                width: 100%;
                border-collapse: collapse;
                background: #2c2c2c;
                color: white;
                border-radius: 5px;
                overflow: hidden;
            }

            .vehicle-table th,
            .vehicle-table td {
                padding: 12px 15px;
                text-align: left;
                border-bottom: 1px solid rgba(255,255,255,0.1);
            }

            .vehicle-table th {
                background-color: #FFD700;
                color: #2c2c2c;
                font-weight: bold;
            }

            .vehicle-table tbody tr:hover {
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

            .form-group input, .form-group select {
                width: 100%;
                padding: 10px;
                border: 1px solid #555;
                border-radius: 5px;
                background-color: #3a3a3a;
                color: white;
            }

            .form-group select option {
                background-color: #3a3a3a;
                color: white;
            }

            .form-group input:focus, .form-group select:focus {
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
                    <a href="userMgt.jsp">Users</a>
                    <a href="#">Requests</a>
                    <a href="#">Confirms</a>
                    <a href="#" class="active">Vehicles</a>
                </div>
                <button onclick="location.href='login.jsp';" class="logout-btn">Logout</button>
            </div>

            <!-- Main Content -->
            <div class="main-content">
                <div class="content-header">
                    <div>
                        <h1>Vehicle Management</h1>
                        <p>Register and manage vehicles</p>
                    </div>
                    <button id="addVehicleBtn" class="action-btn add-btn">Register New Vehicle</button>
                </div>

                <div class="vehicle-card">
                    <h2>Registered Vehicles</h2>
                    <div id="message-container"></div>
                    <table class="vehicle-table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>License Plate</th>
                                <th>Owner's Name</th>
                                <th>Brand</th>
                                <th>Model</th>
                                <th>Category</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody id="vehicleTableBody">
                            <!-- Vehicle data will be populated here -->
                            <tr>
                                <td colspan="7" class="loading">No vehicles registered yet</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Add Vehicle Modal -->
            <div id="addVehicleModal" class="modal">
                <div class="modal-content">
                    <span class="close-btn" id="addModalClose">&times;</span>
                    <h2 class="modal-title">Register New Vehicle</h2>
                    <form id="addVehicleForm">
                        <div class="form-group">
                            <label for="licensePlate">License Plate</label>
                            <input type="text" id="licensePlate" required>
                        </div>
                        <div class="form-group">
                            <label for="ownerName">Owner's Name</label>
                            <input type="text" id="ownerName" required>
                        </div>
                        <div class="form-group">
                            <label for="brand">Brand</label>
                            <input type="text" id="brand" required>
                        </div>
                        <div class="form-group">
                            <label for="model">Model</label>
                            <input type="text" id="model" required>
                        </div>
                        <div class="form-group">
                            <label for="category">Category</label>
                            <select id="category" required>
                                <option value="">Select a category</option>
                                <option value="Sedan">Sedan</option>
                                <option value="Luxury Sedan">Luxury Sedan</option>
                                <option value="Compact SUV">Compact SUV</option>
                                <option value="Subcompact SUV">Subcompact SUV</option>
                                <option value="Rugged SUV">Rugged SUV</option>
                                <option value="Minibus">Minibus</option>
                                <option value="Pickup Truck">Pickup Truck</option>
                                <option value="Sport">Sport</option>
                            </select>
                        </div>
                        <div class="form-actions">
                            <button type="button" class="action-btn delete-btn" id="cancelAddBtn">Cancel</button>
                            <button type="submit" class="action-btn add-btn">Register Vehicle</button>
                        </div>
                    </form>
                </div>
            </div>

            <!-- Edit Vehicle Modal -->
            <div id="editVehicleModal" class="modal">
                <div class="modal-content">
                    <span class="close-btn" id="editModalClose">&times;</span>
                    <h2 class="modal-title">Edit Vehicle</h2>
                    <form id="editVehicleForm">
                        <input type="hidden" id="editVehicleId" class="hidden-id">
                        <div class="form-group">
                            <label for="editLicensePlate">License Plate</label>
                            <input type="text" id="editLicensePlate" required>
                        </div>
                        <div class="form-group">
                            <label for="editOwnerName">Owner's Name</label>
                            <input type="text" id="editOwnerName" required>
                        </div>
                        <div class="form-group">
                            <label for="editBrand">Brand</label>
                            <input type="text" id="editBrand" required>
                        </div>
                        <div class="form-group">
                            <label for="editModel">Model</label>
                            <input type="text" id="editModel" required>
                        </div>
                        <div class="form-group">
                            <label for="editCategory">Category</label>
                            <select id="editCategory" required>
                                <option value="">Select a category</option>
                                <option value="Sedan">Sedan</option>
                                <option value="Luxury Sedan">Luxury Sedan</option>
                                <option value="Compact SUV">Compact SUV</option>
                                <option value="Subcompact SUV">Subcompact SUV</option>
                                <option value="Rugged SUV">Rugged SUV</option>
                                <option value="Minibus">Minibus</option>
                                <option value="Pickup Truck">Pickup Truck</option>
                                <option value="Sport">Sport</option>
                            </select>
                        </div>
                        <div class="form-actions">
                            <button type="button" class="action-btn delete-btn" id="cancelEditBtn">Cancel</button>
                            <button type="submit" class="action-btn edit-btn">Update Vehicle</button>
                        </div>
                    </form>
                </div>
            </div>

            <!-- Delete Confirmation Modal -->
            <div id="deleteVehicleModal" class="modal">
                <div class="modal-content">
                    <span class="close-btn" id="deleteModalClose">&times;</span>
                    <h2 class="modal-title">Confirm Deletion</h2>
                    <p>Are you sure you want to delete this vehicle?</p>
                    <input type="hidden" id="deleteVehicleId" class="hidden-id">
                    <div class="form-actions">
                        <button type="button" class="action-btn add-btn" id="cancelDeleteBtn">Cancel</button>
                        <button type="button" class="action-btn delete-btn" id="confirmDeleteBtn">Delete</button>
                    </div>
                </div>
            </div>
    
    <script>
        // API URL for the REST service
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
                            '<td>' + vehicle.category + '</td>' +
                            '<td>' +
                                '<button class="action-btn edit-btn" onclick="openEditModal(' + vehicle.id + ', \'' + vehicle.license + '\', \'' + vehicle.owner + '\', \'' + vehicle.brand + '\', \'' + vehicle.model + '\', \'' + vehicle.category + '\')">Edit</button>' +
                                '<button class="action-btn delete-btn" onclick="openDeleteModal(' + vehicle.id + ')">Delete</button>' +
                            '</td>' +
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

        // Function to open add modal
        function openAddModal() {
            document.getElementById('addVehicleForm').reset();
            document.getElementById('addVehicleModal').style.display = 'block';
        }

        // Function to open edit modal
        function openEditModal(id, license, owner, brand, model, category) {
            document.getElementById('editVehicleId').value = id;
            document.getElementById('editLicensePlate').value = license;
            document.getElementById('editOwnerName').value = owner;
            document.getElementById('editBrand').value = brand;
            document.getElementById('editModel').value = model;
            document.getElementById('editCategory').value = category;
            document.getElementById('editVehicleModal').style.display = 'block';
        }

        // Function to open delete modal
        function openDeleteModal(id) {
            document.getElementById('deleteVehicleId').value = id;
            document.getElementById('deleteVehicleModal').style.display = 'block';
        }

        // Function to close all modals
        function closeAllModals() {
            document.getElementById('addVehicleModal').style.display = 'none';
            document.getElementById('editVehicleModal').style.display = 'none';
            document.getElementById('deleteVehicleModal').style.display = 'none';
        }

        // Function to add a new vehicle
        function addVehicle(event) {
            event.preventDefault();
            
            const vehicle = {
                license: document.getElementById('licensePlate').value,
                owner: document.getElementById('ownerName').value,
                brand: document.getElementById('brand').value,
                model: document.getElementById('model').value,
                category: document.getElementById('category').value
            };

            fetch(VEHICLE_API_URL, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(vehicle)
            })
            .then(function(response) {
                if (!response.ok) {
                    throw new Error('HTTP error! status: ' + response.status);
                }
                closeAllModals();
                showMessage('Vehicle registered successfully!', 'success');
                loadVehicleData();
            })
            .catch(function(error) {
                console.error('Error registering vehicle:', error);
                showMessage('Error registering vehicle: ' + error.message, 'error');
            });
        }

        // Function to update a vehicle
        function updateVehicle(event) {
            event.preventDefault();
            
            const id = document.getElementById('editVehicleId').value;
            const vehicle = {
                id: parseInt(id),
                license: document.getElementById('editLicensePlate').value,
                owner: document.getElementById('editOwnerName').value,
                brand: document.getElementById('editBrand').value,
                model: document.getElementById('editModel').value,
                category: document.getElementById('editCategory').value
            };

            fetch(VEHICLE_API_URL, {
                method: 'PUT',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(vehicle)
            })
            .then(function(response) {
                if (!response.ok) {
                    throw new Error('HTTP error! status: ' + response.status);
                }
                closeAllModals();
                showMessage('Vehicle updated successfully!', 'success');
                loadVehicleData();
            })
            .catch(function(error) {
                console.error('Error updating vehicle:', error);
                showMessage('Error updating vehicle: ' + error.message, 'error');
            });
        }

        // Function to delete a vehicle
        function deleteVehicle() {
            const id = document.getElementById('deleteVehicleId').value;
            
            fetch(VEHICLE_API_URL + '/' + id, {
                method: 'DELETE'
            })
            .then(function(response) {
                if (!response.ok) {
                    throw new Error('HTTP error! status: ' + response.status);
                }
                closeAllModals();
                showMessage('Vehicle deleted successfully!', 'success');
                loadVehicleData();
            })
            .catch(function(error) {
                console.error('Error deleting vehicle:', error);
                showMessage('Error deleting vehicle: ' + error.message, 'error');
            });
        }

        // Event listeners
        document.addEventListener('DOMContentLoaded', function() {
            // Load initial data
            loadVehicleData();
            
            // Add Vehicle button
            document.getElementById('addVehicleBtn').addEventListener('click', openAddModal);
            
            // Add Vehicle form submission
            document.getElementById('addVehicleForm').addEventListener('submit', addVehicle);
            
            // Edit Vehicle form submission
            document.getElementById('editVehicleForm').addEventListener('submit', updateVehicle);
            
            // Delete Vehicle confirmation
            document.getElementById('confirmDeleteBtn').addEventListener('click', deleteVehicle);
            
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