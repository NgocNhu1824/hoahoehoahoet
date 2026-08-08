<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    .hero-banner-container {
        width: 100%;
        max-width: 1200px;
        margin: 90px auto 30px;
        position: relative;
        overflow: hidden;
        border-radius: 16px;
        box-shadow: 0 8px 25px rgba(107, 23, 0, 0.12);
        background-color: #2b0e03;
    }

    @media (max-width: 768px) {
        .hero-banner-container {
            margin: 75px 15px 20px;
            border-radius: 12px;
        }
    }

    .banner-slide-img {
        width: 100%;
        height: 420px;
        object-fit: contain;
        background-color: #2b0e03;
        display: block;
    }

    @media (max-width: 768px) {
        .banner-slide-img {
            height: 280px;
        }
    }

    /* Bottom caption strip - stacked text & yellow button below */
    .banner-bottom-strip {
        position: absolute;
        bottom: 0;
        left: 0;
        width: 100%;
        background: linear-gradient(180deg, rgba(0, 0, 0, 0) 0%, rgba(30, 8, 2, 0.88) 100%);
        padding: 20px 20px 25px;
        text-align: center;
        z-index: 3;
        display: flex;
        flex-direction: column;
        align-items: center;
        gap: 8px;
    }

    .banner-title {
        font-family: 'Raleway', sans-serif;
        font-size: 1.8rem;
        font-weight: 800;
        color: #FFFFFF !important;
        text-shadow: 2px 2px 6px rgba(0, 0, 0, 0.9);
        letter-spacing: 0.5px;
        margin: 0;
        line-height: 1.2;
    }

    .banner-subtitle {
        font-size: 1rem;
        font-weight: 500;
        color: #FFF1D2 !important;
        text-shadow: 1px 1px 4px rgba(0, 0, 0, 0.9);
        margin: 0;
        max-width: 700px;
        line-height: 1.35;
    }

    /* Yellow button placed BELOW the text */
    .banner-btn-wrapper {
        margin-top: 6px;
    }

    .banner-btn {
        display: inline-block;
        background-color: #CEAF95 !important;
        color: #6B1700 !important;
        font-weight: 700;
        padding: 8px 24px;
        border-radius: 25px;
        text-decoration: none;
        box-shadow: 0 4px 12px rgba(0,0,0,0.3);
        transition: all 0.3s ease;
        border: 2px solid #CEAF95;
        font-size: 0.95rem;
    }

    .banner-btn:hover {
        background-color: #6B1700 !important;
        color: #FFF1D2 !important;
        border-color: #FFF1D2;
        transform: translateY(-2px);
    }

    @media (max-width: 768px) {
        .banner-bottom-strip {
            padding: 12px 12px 18px;
            gap: 6px;
        }
        .banner-title {
            font-size: 1.25rem;
        }
        .banner-subtitle {
            font-size: 0.82rem;
        }
        .banner-btn {
            padding: 6px 18px;
            font-size: 0.82rem;
        }
    }

    /* Smooth Left-to-Right slide transition */
    .carousel-item {
        transition: transform 0.8s ease-in-out !important;
    }

    /* Carousel Nav Control Buttons */
    .carousel-control-prev,
    .carousel-control-next {
        width: 44px !important;
        height: 44px !important;
        background-color: rgba(107, 23, 0, 0.75) !important;
        border-radius: 50% !important;
        top: 50% !important;
        transform: translateY(-50%) !important;
        border: 2px solid #CEAF95 !important;
        opacity: 0.85 !important;
        transition: all 0.3s ease !important;
        z-index: 10 !important;
    }

    .carousel-control-prev {
        left: 15px !important;
    }

    .carousel-control-next {
        right: 15px !important;
    }

    .carousel-control-prev:hover,
    .carousel-control-next:hover {
        opacity: 1 !important;
        background-color: #6B1700 !important;
        transform: translateY(-50%) scale(1.08) !important;
    }

    .carousel-indicators {
        bottom: 5px;
        z-index: 10;
        margin-bottom: 2px;
    }

    .carousel-indicators [data-bs-target] {
        width: 10px;
        height: 10px;
        border-radius: 50%;
        background-color: #FFF1D2;
        opacity: 0.6;
        border: 2px solid #6B1700;
        margin: 0 4px;
    }
    .carousel-indicators .active {
        opacity: 1;
        background-color: #CEAF95;
        width: 24px;
        border-radius: 10px;
    }
</style>

<div class="hero-banner-container">
    <div id="bloomBannerCarousel" class="carousel slide" data-bs-ride="carousel" data-bs-interval="3500">
        <!-- Indicators -->
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#bloomBannerCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#bloomBannerCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#bloomBannerCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
            <button type="button" data-bs-target="#bloomBannerCarousel" data-bs-slide-to="3" aria-label="Slide 4"></button>
        </div>

        <div class="carousel-inner">
            <!-- Slide 1 -->
            <div class="carousel-item active">
                <img src="${pageContext.request.contextPath}/client/img/banner01.jpg" class="d-block w-100 banner-slide-img" alt="BloomResin Banner 1">
                <div class="banner-bottom-strip">
                    <h2 class="banner-title">HOA HOÈ HOA HOẸT - BLOOMRESIN</h2>
                    <p class="banner-subtitle">Trang sức thủ công hoa ép Resin tự nhiên lấp lánh & tinh tế</p>
                    <div class="banner-btn-wrapper">
                        <a href="/products" class="banner-btn"><i class="fas fa-shopping-bag me-2"></i>Khám Phá Sản Phẩm</a>
                    </div>
                </div>
            </div>

            <!-- Slide 2 -->
            <div class="carousel-item">
                <img src="${pageContext.request.contextPath}/client/img/banner02.jpg" class="d-block w-100 banner-slide-img" alt="BloomResin Banner 2">
                <div class="banner-bottom-strip">
                    <h2 class="banner-title">BỘ SƯU TẬP HOA ÉP VĨNH CỬU</h2>
                    <p class="banner-subtitle">Lưu giữ trọn vẹn nét đẹp tươi tắn và khoảnh khắc kỷ niệm quý giá</p>
                    <div class="banner-btn-wrapper">
                        <a href="/products" class="banner-btn"><i class="fas fa-gem me-2"></i>Xem Bộ Sưu Tập</a>
                    </div>
                </div>
            </div>

            <!-- Slide 3 -->
            <div class="carousel-item">
                <img src="${pageContext.request.contextPath}/client/img/banner03.jpg" class="d-block w-100 banner-slide-img" alt="BloomResin Banner 3">
                <div class="banner-bottom-strip">
                    <h2 class="banner-title">LÀM THEO YÊU CẦU (CUSTOM ORDER)</h2>
                    <p class="banner-subtitle">Gửi hoa cưới & hoa kỷ niệm của bạn – Shop sẽ đúc thành trang sức độc bản</p>
                    <div class="banner-btn-wrapper">
                        <a href="/custom-order/form" class="banner-btn"><i class="fas fa-magic me-2"></i>Đặt Làm Ngay</a>
                    </div>
                </div>
            </div>

            <!-- Slide 4 -->
            <div class="carousel-item">
                <img src="${pageContext.request.contextPath}/client/img/banner04.jpg" class="d-block w-100 banner-slide-img" alt="BloomResin Banner 4">
                <div class="banner-bottom-strip">
                    <h2 class="banner-title">TIN TỨC & BẢO QUẢN SẢN PHẨM</h2>
                    <p class="banner-subtitle">Khám phá các bí quyết chăm sóc trang sức Resin bền đẹp cùng thời gian</p>
                    <div class="banner-btn-wrapper">
                        <a href="/news" class="banner-btn"><i class="fas fa-newspaper me-2"></i>Đọc Tin Tức</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Controls -->
        <button class="carousel-control-prev" type="button" data-bs-target="#bloomBannerCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true" style="filter: drop-shadow(0 2px 4px rgba(0,0,0,0.6));"></span>
            <span class="visually-hidden">Trước</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#bloomBannerCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true" style="filter: drop-shadow(0 2px 4px rgba(0,0,0,0.6));"></span>
            <span class="visually-hidden">Tiếp</span>
        </button>
    </div>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        var bannerCarousel = document.querySelector('#bloomBannerCarousel');
        if (bannerCarousel && typeof bootstrap !== 'undefined') {
            new bootstrap.Carousel(bannerCarousel, {
                interval: 3500,
                ride: 'carousel',
                wrap: true
            });
        }
    });
</script>
