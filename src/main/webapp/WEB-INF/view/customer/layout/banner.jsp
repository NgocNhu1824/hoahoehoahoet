<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    .hero-banner-container {
        width: 100%;
        height: 480px;
        position: relative;
        overflow: hidden;
        margin-top: 80px;
        box-shadow: 0 8px 25px rgba(107, 23, 0, 0.15);
        cursor: pointer;
    }

    @media (max-width: 768px) {
        .hero-banner-container {
            height: 360px;
            margin-top: 70px;
        }
    }

    .banner-slide-img {
        width: 100%;
        height: 480px;
        object-fit: cover;
        filter: brightness(0.85);
    }

    @media (max-width: 768px) {
        .banner-slide-img {
            height: 360px;
        }
    }

    /* Top slim header bar for text - keeping center artwork 100% clear */
    .banner-overlay-top-bar {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        padding: 22px 20px 40px;
        background: linear-gradient(180deg, rgba(40, 10, 2, 0.78) 0%, rgba(0, 0, 0, 0) 100%);
        text-align: center;
        z-index: 3;
        pointer-events: none;
    }

    .banner-title {
        font-family: 'Raleway', sans-serif;
        font-size: 2.2rem;
        font-weight: 800;
        color: #FFFFFF !important;
        text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.9);
        letter-spacing: 1px;
        margin: 0 0 6px 0;
        line-height: 1.2;
    }

    .banner-subtitle {
        font-size: 1.1rem;
        font-weight: 600;
        color: #FFF1D2 !important;
        text-shadow: 1px 1px 6px rgba(0, 0, 0, 0.9);
        margin: 0 auto;
        max-width: 750px;
        line-height: 1.35;
    }

    /* Bottom mobile fallback button bar */
    .banner-mobile-btn-bar {
        display: none;
        position: absolute;
        bottom: 25px;
        left: 0;
        width: 100%;
        text-align: center;
        z-index: 4;
    }

    .banner-mobile-btn {
        display: inline-block;
        background-color: #CEAF95 !important;
        color: #6B1700 !important;
        font-weight: 700;
        padding: 8px 22px;
        border-radius: 25px;
        text-decoration: none;
        box-shadow: 0 4px 15px rgba(0,0,0,0.4);
        font-size: 0.88rem;
        border: 2px solid #FFF1D2;
    }

    @media (max-width: 768px) {
        .banner-overlay-top-bar {
            padding: 15px 15px 30px;
        }
        .banner-title {
            font-size: 1.4rem;
        }
        .banner-subtitle {
            font-size: 0.88rem;
        }
        .banner-mobile-btn-bar {
            display: block;
        }
    }

    /* Left-to-Right smooth slide animation */
    .carousel-item {
        transition: transform 0.8s ease-in-out !important;
    }

    /* Carousel Nav Buttons styling */
    .carousel-control-prev,
    .carousel-control-next {
        width: 46px !important;
        height: 46px !important;
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
        left: 20px !important;
    }

    .carousel-control-next {
        right: 20px !important;
    }

    .carousel-control-prev:hover,
    .carousel-control-next:hover {
        opacity: 1 !important;
        background-color: #6B1700 !important;
        transform: translateY(-50%) scale(1.08) !important;
    }

    .carousel-indicators {
        bottom: 12px;
        z-index: 10;
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
        width: 26px;
        border-radius: 10px;
    }

    /* Interactive Floating Cursor Button */
    .cursor-follow-btn {
        position: fixed;
        top: 0;
        left: 0;
        background-color: #CEAF95;
        color: #6B1700;
        font-weight: 800;
        font-size: 13.5px;
        padding: 9px 20px;
        border-radius: 25px;
        box-shadow: 0 8px 25px rgba(0, 0, 0, 0.4);
        border: 2px solid #FFF1D2;
        pointer-events: none;
        z-index: 99999;
        opacity: 0;
        transform: translate(-50%, -50%) scale(0.85);
        transition: opacity 0.2s ease, transform 0.15s ease-out;
        white-space: nowrap;
        letter-spacing: 0.5px;
    }

    .cursor-follow-btn.active {
        opacity: 1;
        transform: translate(-50%, -50%) scale(1);
    }
</style>

<!-- Floating Cursor Button Badge -->
<div id="magneticCursorBtn" class="cursor-follow-btn">
    <span id="cursorBtnText">Khám Phá Sản Phẩm <i class="fas fa-arrow-right ms-1"></i></span>
</div>

<div class="hero-banner-container" id="heroBannerWrapper">
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
            <div class="carousel-item active" data-link="/products" data-btn-text="Khám Phá Sản Phẩm ➔">
                <img src="${pageContext.request.contextPath}/client/img/banner01.jpg" class="d-block w-100 banner-slide-img" alt="BloomResin Art 1">
                <div class="banner-overlay-top-bar">
                    <h1 class="banner-title">HOA HOÈ HOA HOẸT - BLOOMRESIN</h1>
                    <p class="banner-subtitle">Trang sức thủ công hoa ép Resin tự nhiên lấp lánh & tinh tế</p>
                </div>
                <div class="banner-mobile-btn-bar">
                    <a href="/products" class="banner-mobile-btn"><i class="fas fa-shopping-bag me-1"></i> Khám Phá Sản Phẩm</a>
                </div>
            </div>

            <!-- Slide 2 -->
            <div class="carousel-item" data-link="/products" data-btn-text="Xem Bộ Sưu Tập ➔">
                <img src="${pageContext.request.contextPath}/client/img/banner02.jpg" class="d-block w-100 banner-slide-img" alt="BloomResin Art 2">
                <div class="banner-overlay-top-bar">
                    <h1 class="banner-title">BỘ SƯU TẬP HOA ÉP VĨNH CỬU</h1>
                    <p class="banner-subtitle">Lưu giữ trọn vẹn nét đẹp tươi tắn và khoảnh khắc kỷ niệm quý giá</p>
                </div>
                <div class="banner-mobile-btn-bar">
                    <a href="/products" class="banner-mobile-btn"><i class="fas fa-gem me-1"></i> Xem Bộ Sưu Tập</a>
                </div>
            </div>

            <!-- Slide 3 -->
            <div class="carousel-item" data-link="/custom-order/form" data-btn-text="Đặt Làm Ngay ➔">
                <img src="${pageContext.request.contextPath}/client/img/banner03.jpg" class="d-block w-100 banner-slide-img" alt="BloomResin Art 3">
                <div class="banner-overlay-top-bar">
                    <h1 class="banner-title">LÀM THEO YÊU CẦU (CUSTOM ORDER)</h1>
                    <p class="banner-subtitle">Gửi hoa cưới & hoa kỷ niệm của bạn – Shop sẽ đúc thành trang sức độc bản</p>
                </div>
                <div class="banner-mobile-btn-bar">
                    <a href="/custom-order/form" class="banner-mobile-btn"><i class="fas fa-magic me-1"></i> Đặt Làm Ngay</a>
                </div>
            </div>

            <!-- Slide 4 -->
            <div class="carousel-item" data-link="/news" data-btn-text="Đọc Tin Tức ➔">
                <img src="${pageContext.request.contextPath}/client/img/banner04.jpg" class="d-block w-100 banner-slide-img" alt="BloomResin Art 4">
                <div class="banner-overlay-top-bar">
                    <h1 class="banner-title">TIN TỨC & BẢO QUẢN SẢN PHẨM</h1>
                    <p class="banner-subtitle">Khám phá các bí quyết chăm sóc trang sức Resin bền đẹp cùng thời gian</p>
                </div>
                <div class="banner-mobile-btn-bar">
                    <a href="/news" class="banner-mobile-btn"><i class="fas fa-newspaper me-1"></i> Đọc Tin Tức</a>
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
        var bannerWrapper = document.getElementById('heroBannerWrapper');
        var magneticBtn = document.getElementById('magneticCursorBtn');
        var btnTextSpan = document.getElementById('cursorBtnText');
        var bannerCarousel = document.querySelector('#bloomBannerCarousel');

        // Init Bootstrap Carousel
        if (bannerCarousel && typeof bootstrap !== 'undefined') {
            new bootstrap.Carousel(bannerCarousel, {
                interval: 3500,
                ride: 'carousel',
                wrap: true
            });
        }

        // Get currently active slide target link & text
        function updateCursorText() {
            var activeItem = document.querySelector('#bloomBannerCarousel .carousel-item.active');
            if (activeItem) {
                var btnText = activeItem.getAttribute('data-btn-text') || 'Khám Phá Sản Phẩm ➔';
                btnTextSpan.innerText = btnText;
            }
        }

        // Update button text when carousel slides
        if (bannerCarousel) {
            bannerCarousel.addEventListener('slid.bs.carousel', updateCursorText);
        }

        // Mousemove effect: Floating magnetic button following cursor over banner
        if (bannerWrapper && magneticBtn) {
            bannerWrapper.addEventListener('mousemove', function (e) {
                magneticBtn.style.left = e.clientX + 'px';
                magneticBtn.style.top = e.clientY + 'px';
                magneticBtn.classList.add('active');
                updateCursorText();
            });

            bannerWrapper.addEventListener('mouseleave', function () {
                magneticBtn.classList.remove('active');
            });

            // Clicking banner navigates to the active slide link
            bannerWrapper.addEventListener('click', function (e) {
                // Ignore if clicked on prev/next carousel controls
                if (e.target.closest('.carousel-control-prev') || e.target.closest('.carousel-control-next') || e.target.closest('.carousel-indicators')) {
                    return;
                }
                var activeItem = document.querySelector('#bloomBannerCarousel .carousel-item.active');
                if (activeItem) {
                    var targetLink = activeItem.getAttribute('data-link');
                    if (targetLink) {
                        window.location.href = targetLink;
                    }
                }
            });
        }
    });
</script>
