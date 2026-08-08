<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Navbar</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
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
            border: none !important;
            outline: none !important;
            box-shadow: none !important;
        }

        .nav-link:hover, .nav-link.active, .nav-link:focus, .dropdown-toggle:focus, .dropdown-toggle.show {
            color: #6B1700 !important;
            background-color: rgba(206, 175, 149, 0.3) !important;
            outline: none !important;
            box-shadow: none !important;
            border: none !important;
        }

        .dropdown-toggle:after {
            vertical-align: 0.15em;
            margin-left: 0.4em;
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

        /* Dropdown Positioning & Styling */
        .navbar .dropdown {
            position: relative;
        }

        .navbar .dropdown-menu {
            position: absolute;
            top: 100% !important;
            margin-top: 6px !important;
            background-color: #FFF8EA;
            border: 1px solid #CEAF95;
            border-radius: 12px;
            padding: 8px 0;
            min-width: 240px;
            box-shadow: 0 10px 25px rgba(107, 23, 0, 0.15);
            z-index: 1050;
        }

        .navbar .dropdown-menu:not(.dropdown-menu-end) {
            left: 0 !important;
            right: auto !important;
        }

        .navbar .dropdown-menu.dropdown-menu-end {
            right: 0 !important;
            left: auto !important;
        }

        .navbar .dropdown-item {
            padding: 10px 18px;
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
            cursor: pointer !important;
        }

        .custom-toggler:focus {
            box-shadow: 0 0 0 3px rgba(206, 175, 149, 0.4) !important;
        }

        /* Responsive Mobile Drawer Styling */
        @media (max-width: 1199.98px) {
            body {
                padding-top: 75px;
            }

            .navbar-collapse:not(.show) {
                display: none !important;
            }

            .navbar-collapse.show {
                display: block !important;
                position: fixed !important;
                top: 72px !important;
                left: 0 !important;
                right: 0 !important;
                width: 100% !important;
                max-height: calc(100vh - 72px) !important;
                height: auto !important;
                overflow-y: auto !important;
                overscroll-behavior: contain !important;
                -webkit-overflow-scrolling: touch !important;
                background-color: #FFF8EA !important;
                border-bottom: 3px solid #CEAF95 !important;
                border-bottom-left-radius: 20px !important;
                border-bottom-right-radius: 20px !important;
                box-shadow: 0 20px 40px rgba(107, 23, 0, 0.25) !important;
                z-index: 99999 !important;
                padding: 18px 20px 30px 20px !important;
            }

            .navbar-collapse::-webkit-scrollbar {
                width: 6px;
            }

            .navbar-collapse::-webkit-scrollbar-thumb {
                background-color: #CEAF95;
                border-radius: 10px;
            }

            .navbar-nav {
                flex-direction: column !important;
                align-items: stretch !important;
                width: 100% !important;
                gap: 6px !important;
            }

            .nav-item {
                width: 100% !important;
            }

            .nav-link {
                font-size: 14.5px !important;
                font-weight: 700 !important;
                padding: 12px 18px !important;
                border-radius: 12px !important;
                display: flex !important;
                align-items: center !important;
                justify-content: flex-start !important;
                background-color: #FFFFFF !important;
                border: 1px solid #CEAF95 !important;
                color: #6B1700 !important;
                margin-bottom: 4px;
                box-shadow: 0 2px 4px rgba(107, 23, 0, 0.03);
                transition: all 0.2s ease !important;
                outline: none !important;
            }

            .nav-link i {
                color: inherit !important;
            }

            .nav-link:hover, .nav-link:hover i,
            .nav-link.active, .nav-link.active i {
                background-color: #6B1700 !important;
                color: #FFF1D2 !important;
                border-color: #6B1700 !important;
                outline: none !important;
                box-shadow: none !important;
            }

            .navbar .dropdown-menu {
                position: static !important;
                float: none !important;
                width: 100% !important;
                margin-top: 6px !important;
                box-shadow: none !important;
                border: 1px solid #CEAF95 !important;
                border-radius: 12px !important;
                background-color: #FFF1D2 !important;
                padding: 8px !important;
            }

            .navbar .dropdown-item {
                border-radius: 8px !important;
                padding: 10px 14px !important;
                font-size: 13.5px !important;
            }

            .search-wrapper {
                width: 100% !important;
                margin: 12px 0 !important;
                display: flex;
                justify-content: center;
            }

            .search-wrapper form {
                width: 100% !important;
                max-width: 100%;
                margin: 0 auto;
            }

            .nav-search {
                width: 100% !important;
                height: 44px;
                font-size: 14px;
                border-radius: 22px;
            }

            .nav-search:focus {
                width: 100% !important;
            }

            .user-action-group {
                margin-top: 15px;
                padding-top: 15px;
                border-top: 2px dashed #CEAF95;
                display: flex;
                flex-direction: column;
                align-items: center;
                gap: 10px;
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
                <button class="navbar-toggler custom-toggler" type="button" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
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
                <a href="/" class="nav-item nav-link active fw-bold"><i class="fas fa-home me-2 opacity-75"></i>Trang chủ</a>

                <div class="nav-item dropdown">
                    <a href="/products" class="nav-link fw-bold dropdown-toggle" id="productDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fas fa-boxes me-2 opacity-75"></i>Sản phẩm
                    </a>
                    <ul class="dropdown-menu shadow" aria-labelledby="productDropdown">
                        <li>
                            <a class="dropdown-item fw-bold border-bottom" href="/products">
                                <i class="fas fa-th-large me-2"></i>Tất cả sản phẩm
                            </a>
                        </li>
                        <c:forEach var="category" items="${categories}">
                            <li>
                                <a class="dropdown-item" href="/products?categoryId=${category.id}">
                                    <i class="fas fa-angle-right me-2 opacity-50"></i>${category.name}
                                </a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>

                <a href="/careservice" class="nav-item nav-link fw-bold"><i class="fas fa-comments me-2 opacity-75"></i>Dịch vụ hỏi đáp</a>
                <a href="/news" class="nav-item nav-link fw-bold"><i class="fas fa-newspaper me-2 opacity-75"></i>Tin tức</a>
                <a href="/aboutus" class="nav-item nav-link fw-bold"><i class="fas fa-info-circle me-2 opacity-75"></i>Giới thiệu</a>

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

            <!-- Right Actions (User Profile / Auth Links - Desktop Only for Profile & Wishlist) -->
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

                    <!-- Wishlist (Desktop Only) -->
                    <a href="/wishlist" class="position-relative d-none d-xl-block">
                        <i class="fas fa-heart fa-2x icon-colored"></i>
                        <span class="position-absolute bg-secondary rounded-circle text-dark px-1 d-flex align-items-center justify-content-center"
                              style="top: -5px; left: 15px; height: 20px; min-width: 20px;" id="sumWishlist">
                            <c:out value="${sessionScope.wishlistSize != null ? sessionScope.wishlistSize : 0}"/>
                        </span>
                    </a>

                    <!-- User Profile Dropdown (Desktop Only) -->
                    <div class="dropdown d-none d-xl-block">
                        <a href="#" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="fas fa-user fa-2x icon-colored"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end p-4" aria-labelledby="dropdownMenuLink">
                            <li class="d-flex align-items-center flex-column" style="min-width: 260px;">
                                <img src="/images/avatar/${sessionScope.avatar}" alt="Avatar người dùng"
                                     style="width: 100px; height: 100px; border-radius: 50%; border: 3px solid #CEAF95; object-fit: cover;" />
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

                    <!-- Mobile Account Links inside Drawer -->
                    <div class="d-xl-none w-100 text-center">
                        <a href="/customer/profile/${sessionScope.id}" class="nav-link"><i class="fas fa-user-circle me-2"></i>Tài khoản (${sessionScope.username})</a>
                        <a href="/wishlist" class="nav-link"><i class="fas fa-heart me-2"></i>Danh sách yêu thích</a>
                        <a href="/order-history" class="nav-link"><i class="fas fa-history me-2"></i>Lịch sử mua hàng</a>
                        <form method="post" action="/logout" class="mt-2">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            <button class="btn btn-outline-danger w-100 rounded-pill"><i class="fas fa-sign-out-alt me-2"></i>Đăng xuất</button>
                        </form>
                    </div>
                </c:if>

                <c:if test="${empty pageContext.request.userPrincipal}">
                    <a href="/login" class="a-login position-relative fw-bold text-uppercase text-decoration-none btn btn-outline-danger px-3 py-1 rounded-pill w-100 w-xl-auto mb-2 mb-xl-0" style="color: #6B1700; border-color: #CEAF95;">Đăng nhập</a>
                    <a href="/register" class="a-login position-relative fw-bold text-uppercase text-decoration-none btn btn-danger px-3 py-1 rounded-pill text-white w-100 w-xl-auto" style="background-color: #6B1700; border-color: #6B1700;">Đăng ký</a>
                </c:if>
            </div>
        </div>
    </nav>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        var toggler = document.querySelector(".custom-toggler");
        var collapseMenu = document.getElementById("navbarCollapse");

        if (toggler && collapseMenu) {
            toggler.addEventListener("click", function(e) {
                e.preventDefault();
                e.stopPropagation();
                collapseMenu.classList.toggle("show");
                var isExpanded = collapseMenu.classList.contains("show");
                toggler.setAttribute("aria-expanded", isExpanded ? "true" : "false");
            });
        }
    });
</script>
</body>
</html>
