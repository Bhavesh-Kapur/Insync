<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>University Project Portal</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        .hero-section {
            background: linear-gradient(135deg, #0d6efd 0%, #0dcaf0 100%);
            color: white;
            padding: 100px 0;
        }
        .feature-card {
            border: none;
            transition: transform 0.3s;
            border-radius: 15px;
            overflow: hidden;
        }
        .feature-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }
        .feature-icon {
            font-size: 2.5rem;
            margin-bottom: 1rem;
            color: #0d6efd;
        }
    </style>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="#">InSync Portal</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="#features">Features</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#how-it-works">How It Works</a>
                    </li>
                    <li class="nav-item">
                        <a class="btn btn-primary ms-2" href="Student/login.jsp">Login</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="hero-section">
        <div class="container text-center">
            <h1 class="display-4 fw-bold mb-4">Welcome to InSync Project Portal</h1>
            <p class="lead mb-4">Connect, Collaborate, and Create Amazing Projects Together</p>
            <div class="d-flex justify-content-center gap-3">
                <a href="register.jsp" class="btn btn-light btn-lg">Get Started</a>
                <a href="#features" class="btn btn-outline-light btn-lg">Learn More</a>
            </div>
        </div>
    </section>

    <!-- Features Section -->
    <section id="features" class="py-5">
        <div class="container">
            <h2 class="text-center mb-5">Key Features</h2>
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="card feature-card h-100">
                        <div class="card-body text-center">
                            <i class="fas fa-users feature-icon"></i>
                            <h3 class="card-title">Team Formation</h3>
                            <p class="card-text">Find and connect with like-minded students to form the perfect project team.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card feature-card h-100">
                        <div class="card-body text-center">
                            <i class="fas fa-chalkboard-teacher feature-icon"></i>
                            <h3 class="card-title">Mentor Matching</h3>
                            <p class="card-text">Get guidance from experienced mentors who can help shape your project.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card feature-card h-100">
                        <div class="card-body text-center">
                            <i class="fas fa-chart-line feature-icon"></i>
                            <h3 class="card-title">Progress Tracking</h3>
                            <p class="card-text">Activity coordinators can monitor and track project progress efficiently.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- How It Works Section -->
    <section id="how-it-works" class="py-5 bg-light">
        <div class="container">
            <h2 class="text-center mb-5">How It Works</h2>
            <div class="row">
                <div class="col-md-3 text-center">
                    <div class="mb-4">
                        <i class="fas fa-user-plus fa-3x text-primary"></i>
                    </div>
                    <h4>1. Register</h4>
                    <p>Create your account and complete your profile</p>
                </div>
                <div class="col-md-3 text-center">
                    <div class="mb-4">
                        <i class="fas fa-search fa-3x text-primary"></i>
                    </div>
                    <h4>2. Find Teams</h4>
                    <p>Browse and join existing teams or create your own</p>
                </div>
                <div class="col-md-3 text-center">
                    <div class="mb-4">
                        <i class="fas fa-handshake fa-3x text-primary"></i>
                    </div>
                    <h4>3. Connect</h4>
                    <p>Match with mentors and start collaborating</p>
                </div>
                <div class="col-md-3 text-center">
                    <div class="mb-4">
                        <i class="fas fa-rocket fa-3x text-primary"></i>
                    </div>
                    <h4>4. Succeed</h4>
                    <p>Track progress and achieve your goals</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="bg-dark text-light py-4">
        <div class="container text-center">
            <p class="mb-0">© 2024 InSync Project Portal. All rights reserved.</p>
        </div>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 