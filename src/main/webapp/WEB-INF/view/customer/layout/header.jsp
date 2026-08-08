<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Navbar</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap" rel="stylesheet">

    <style>
        body {
            background-color: #FFF1D2;
            color: #6B1700;
            font-family: 'Open Sans', sans-serif;
            padding-top: 85px;
        }

        .navbar {
            background-color: #FFF1D2;
            border-bottom: 2px solid #CEAF95;
            width: 100%;
            padding-left: 20px;
            padding-right: 20px;
            z-index: 1030;
            box-shadow: 0 4px 12px rgba(107, 23, 0, 0.05);
            position: relative;
        }

        .nav-logo {
            width: 48px;
            height: 48px;
            border-radius: 50%;
            object-fit: cover;
            border: 2px solid #CEAF95;
        }

        .brand-title {
            font-family: 'Raleway', sans-serif;
            font-weight: 800;
            color: #6B1700;
            letter-spacing: 0.5px;
        }

        .nav-link {
            font-family: 'Raleway', sans-serif;
            font-weight: 800;
            text-transform: uppercase;
            color: #6B1700 !important;
            white-space: nowrap;
            font-size: 13px;
            padding: 0.5rem 0.75rem;
            border-radius: 6px;
            transition: all 0.25s ease;
        }

        .nav-link:hover, .nav-link.active {
            color: #6B1700 !important;
            background-color: rgba(206, 175, 149, 0.3);
        }

        .nav-item {
            padding: 0 2px;
        }

        .nav-search {
            width: 160px;
            height: 38px;
            padding: 6px 14px;
            border: 2px solid #CEAF95;
            border-radius: 20px;
            outline: none;
            font-size: 13.5px;
            background-color: #FFF8EA;
            transition: width 0.4s ease-in-out, border-color 0.3s ease;
        }

        .nav-search:focus {
            width: 250px;
            border-color: #6B1700;
            background-color: #FFF;
        }

        .nav-search::placeholder {
            color: #999;
            font-style: italic;
        }

        /* Icon */
        .icon-colored {
            color: #6B1700 !important;
            transition: color 0.3s ease, transform 0.2s ease;
        }

        .icon-colored:hover {
            color: #CEAF95 !important;
            transform: scale(1.08);
        }

        /* Dropdown */
        .navbar .dropdown-menu {
            background-color: #FFF8EA;
            border: 1px solid #CEAF95;
            border-radius: 12px;
            padding: 8px 0;
            box-shadow: 0 8px 20px rgba(107, 23, 0, 0.12);
        }

        .navbar .dropdown-item {
            padding: 10px 20px;
            color: #6B1700;
            font-weight: 600;
            font-size: 13.5px;
            transition: all 0.2s ease;
        }

        .navbar .dropdown-item:hover {
            background-color: #CEAF95;
            color: #FFF;
        }

        /* Mobile Menu Toggler */
        .custom-toggler {
            border: 2px solid #CEAF95 !important;
            border-radius: 10px !important;
            background-color: #FFF8EA !important;
            padding: 6px 12px !important;
            outline: none !important;
            box-shadow: none !important;
        }

        .custom-toggler:focus {
            box-shadow: 0 0 0 3px rgba(206, 175, 149, 0.4) !important;
        }

        /* Responsive Mobile Drawer Styling */
        @media (max-width: 1199.98px) {
            body {
                padding-top: 75px;
            }

            .navbar-collapse {
                position: absolute !important;
                top: 100% !important;
                left: 0 !important;
                right: 0 !important;
                width: 100% !important;
                background-color: #FFF1D2 !important; /* 100% Solid Opaque Background */
                border-top: 1px solid #CEAF95 !important;
                border-bottom: 3px solid #CEAF95 !important;
                box-shadow: 0 15px 35px rgba(107, 23, 0, 0.25) !important;
                z-index: 99999 !important;
                padding: 20px 24px !important;
            }

            .navbar-nav {
                flex-direction: column !important;
                align-items: center !important;
                text-align: center !important;
                width: 100% !important;
                gap: 8px !important;
            }

            .nav-item {
                width: 100% !important;
                text-align: center !important;
            }

            .nav-link {
                font-size: 14px !important;
                font-weight: 700 !important;
                padding: 12px 18px !important;
                border-radius: 10px !important;
                display: block !important;
                text-align: center !important;
                background-color: #FFF8EA;
                border: 1px solid #CEAF95;
                color: #6B1700 !important;
                margin-bottom: 4px;
            }

            .nav-link:hover, .nav-link.active {
                background-color: #CEAF95 !important;
                color: #FFF !important;
            }

            .search-wrapper {
                width: 100% !important;
                margin: 12px 0 !important;
                display: flex;
                justify-content: center;
            }

            .search-wrapper form {
                width: 100% !important;
                max-width: 320px;
                margin: 0 auto;
            }

            .nav-search {
                width: 100% !important;
                height: 42px;
                font-size: 14px;
            }

            .nav-search:focus {
                width: 100% !important;
            }

            .user-action-group {
                margin-top: 15px;
                padding-top: 15px;
                border-top: 2px dashed #CEAF95;
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 15px;
                width: 100%;
            }
        }
    </style>
</head>
<body>
<div class="container-fluid fixed-top px-0">
    <nav class="navbar navbar-expand-xl px-3 px-md-4 py-2">
        <!-- Mobile Top Bar: Logo + Cart + Toggler -->
        <div class="d-flex align-items-center justify-content-between w-100 d-xl-none">
            <a href="/" class="d-flex align-items-center text-decoration-none me-2">
                <img class="nav-logo me-2" src="/client/img/logo.jpg" alt="logo">
                <span class="brand-title fs-5">BloomResin</span>
            </a>

            <div class="d-flex align-items-center gap-3">
                <c:if test="${not empty pageContext.request.userPrincipal}">
                    <a href="/cart" class="position-relative me-1">
                        <i class="fa fa-shopping-bag fa-lg icon-colored"></i>
                        <span class="position-absolute bg-secondary rounded-circle text-dark px-1 d-flex align-items-center justify-content-center"
                              style="top: -6px; right: -8px; height: 18px; min-width: 18px; font-size: 11px;" id="sumCartMobile">
                                ${sessionScope.sum}
                        </span>
                    </a>
                </c:if>
                <button class="navbar-toggler custom-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fa fa-bars fa-lg icon-colored"></i>
                </button>
            </div>
        </div>

        <!-- Desktop Brand Logo (Hidden on Mobile) -->
        <a href="/" class="nav-item d-none d-xl-flex align-items-center me-3 text-decoration-none">
            <img class="nav-logo me-2" src="/client/img/logo.jpg" alt="logo">
            <span class="brand-title fs-4">BloomResin</span>
        </a>

        <!-- Collapsible Navigation Drawer -->
        <div class="collapse navbar-collapse justify-content-between align-items-center" id="navbarCollapse">
            <div class="navbar-nav d-flex align-items-center">
                <a href="/" class="nav-item nav-link active fw-bold">Trang chủ</a>

                <div class="nav-item dropdown d-flex align-items-center w-100">
                    <a href="/products" class="nav-link fw-bold flex-grow-1">Sản phẩm</a>
                    <a href="#" class="nav-link dropdown-toggle px-2" data-bs-toggle="dropdown"></a>
                    <ul class="dropdown-menu">
                        <c:forEach var="category" items="${categories}">
                            <li>
                                <a class="dropdown-item" href="/products?categoryId=${category.id}">
                                        ${category.name}
                                </a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>

                <a href="/careservice" class="nav-item nav-link fw-bold">Dịch vụ hỏi đáp</a>
                <a href="/news" class="nav-item nav-link fw-bold">Tin tức</a>
                <a href="/aboutus" class="nav-item nav-link fw-bold">Giới thiệu</a>

                <!-- Search Input Bar -->
                <div class="nav-item d-flex align-items-center search-wrapper ms-xl-2">
                    <form action="/search" method="get" class="d-flex align-items-center w-100">
                        <input class="nav-search" type="text" name="query" placeholder="Bạn cần tìm gì..." required>
                        <button type="submit" class="btn p-0 ms-2" style="background: none; border: none;">
                            <i class="fas fa-search fa-lg icon-colored"></i>
                        </button>
                    </form>
                </div>
            </div>

            <!-- Right Actions (User Profile / Auth Links) -->
            <div class="d-flex align-items-center gap-3 user-action-group my-2 my-xl-0">
                <c:if test="${not empty pageContext.request.userPrincipal}">
                    <!-- Cart (Desktop) -->
                    <a href="/cart" class="position-relative d-none d-xl-block">
                        <i class="fa fa-shopping-bag fa-2x icon-colored"></i>
                        <span class="position-absolute bg-secondary rounded-circle text-dark px-1 d-flex align-items-center justify-content-center"
                              style="top: -5px; left: 15px; height: 20px; min-width: 20px;" id="sumCart">
                                ${sessionScope.sum}
                        </span>
                    </a>

                    <!-- Wishlist -->
                    <a href="/wishlist" class="position-relative">
                        <i class="fas fa-heart fa-2x icon-colored"></i>
                        <span class="position-absolute bg-secondary rounded-circle text-dark px-1 d-flex align-items-center justify-content-center"
                              style="top: -5px; left: 15px; height: 20px; min-width: 20px;" id="sumWishlist">
                            <c:out value="${sessionScope.wishlistSize != null ? sessionScope.wishlistSize : 0}"/>
                        </span>
                    </a>

                    <!-- User Dropdown -->
                    <div class="dropdown">
                        <a href="#" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="fas fa-user fa-2x icon-colored"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end p-4" aria-labelledby="dropdownMenuLink">
                            <li class="d-flex align-items-center flex-column" style="min-width: 260px;">
                                <img src="/images/avatar/${sessionScope.avatar}" alt="Avatar người dùng"
                                     style="width: 120px; height: 120px; border-radius: 50%; border: 3px solid #CEAF95;" />
                                <div class="text-center my-3 fw-bold fs-6">
                                    <c:out value="${sessionScope.username}" />
                                </div>
                            </li>
                            <li><a class="dropdown-item" href="/customer/profile/${sessionScope.id}"><i class="fas fa-user-circle me-2"></i>Quản lý tài khoản</a></li>
                            <li><a class="dropdown-item" href="/order-tracking"><i class="fas fa-truck me-2"></i>Theo dõi đơn hàng</a></li>
                            <li><a class="dropdown-item" href="/order-history"><i class="fas fa-history me-2"></i>Lịch sử mua hàng</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li>
                                <form method="post" action="/logout">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                    <button class="dropdown-item text-danger"><i class="fas fa-sign-out-alt me-2"></i>Đăng xuất</button>
                                </form>
                            </li>
                        </ul>
                    </div>
                </c:if>

                <c:if test="${empty pageContext.request.userPrincipal}">
                    <a href="/login" class="a-login position-relative fw-bold text-uppercase text-decoration-none btn btn-outline-danger px-3 py-1 rounded-pill" style="color: #6B1700; border-color: #CEAF95;">Đăng nhập</a>
                    <a href="/register" class="a-login position-relative fw-bold text-uppercase text-decoration-none btn btn-danger px-3 py-1 rounded-pill text-white" style="background-color: #6B1700; border-color: #6B1700;">Đăng ký</a>
                </c:if>
            </div>
        </div>
    </nav>
</div>
</body>
</html>
