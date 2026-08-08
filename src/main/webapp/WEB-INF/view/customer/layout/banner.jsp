<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    .hero-banner-container {
        width: 100%;
        max-width: 1240px;
        height: 500px;
        position: relative;
        overflow: hidden;
        margin: 35px auto 30px auto;
        border-radius: 20px;
        box-shadow: 0 12px 35px rgba(107, 23, 0, 0.18);
        cursor: pointer;
        background-color: #1e0802 !important;
    }

    @media (max-width: 1280px) {
        .hero-banner-container {
            max-width: 95%;
            margin-top: 32px;
        }
    }

    @media (max-width: 768px) {
        .hero-banner-container {
            max-width: 100%;
            height: 340px;
            margin-top: 25px;
            border-radius: 0;
        }
    }

    .carousel, .carousel-inner, .carousel-item {
        background-color: #1e0802 !important;
        width: 100%;
        height: 100%;
    }

    /* Crisp, Sharp & Still Banner Image Display */
    .banner-slide-img {
        width: 100%;
        height: 500px;
        object-fit: cover;
        filter: brightness(0.85);
        display: block;
        transform: none !important;
    }

    @media (max-width: 768px) {
        .banner-slide-img {
            height: 340px;
        }
    }

    /* Clean & Crisp Fade Dissolve (1.0 second smooth transition without motion distortion) */
    .carousel-fade .carousel-item {
        opacity: 0;
        transition-property: opacity;
        transition-duration: 1.0s !important;
        transition-timing-function: ease-in-out !important;
    }

    .carousel-fade .carousel-item.active,
    .carousel-fade .carousel-item-next.carousel-item-start,
    .carousel-fade .carousel-item-prev.carousel-item-end {
        z-index: 1;
        opacity: 1;
    }

    .carousel-fade .active.carousel-item-start,
    .carousel-fade .active.carousel-item-end {
        z-index: 0;
        opacity: 0;
        transition-property: opacity;
        transition-duration: 1.0s !important;
        transition-timing-function: ease-in-out !important;
    }

    /* Text overlay in upper-middle area */
    .banner-overlay-text {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 70%;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        text-align: center;
        background: linear-gradient(180deg, rgba(30, 8, 2, 0.7) 0%, rgba(0, 0, 0, 0) 100%);
        padding: 30px 20px 0;
        z-index: 3;
        pointer-events: none;
    }

    .banner-title {
        font-family: 'Raleway', sans-serif;
        font-size: 2.5rem;
        font-weight: 800;
        color: #FFFFFF !important;
        text-shadow: 2px 3px 10px rgba(0, 0, 0, 0.95);
        letter-spacing: 1px;
        margin: 0 0 10px 0;
        line-height: 1.25;
    }

    .banner-subtitle {
        font-size: 1.18rem;
        font-weight: 600;
        color: #FFF1D2 !important;
        text-shadow: 1px 2px 6px rgba(0, 0, 0, 0.95);
        margin: 0 auto;
        max-width: 780px;
        line-height: 1.4;
    }

    /* 100% STATIC & FIXED Yellow button anchored inside image frame, 35px away from bottom edge */
    .banner-fixed-btn-container {
        position: absolute;
        bottom: 35px;
        left: 0;
        width: 100%;
        text-align: center;
        z-index: 25;
        pointer-events: auto;
    }

    .banner-btn {
        display: inline-block;
        background-color: #CEAF95 !important;
        color: #6B1700 !important;
        font-weight: 800;
        padding: 11px 32px;
        border-radius: 30px;
        text-decoration: none;
        box-shadow: 0 6px 20px rgba(0, 0, 0, 0.45);
        transition: background-color 0.3s ease, color 0.3s ease;
        border: 2px solid #FFF1D2;
        font-size: 1rem;
    }

    .banner-btn:hover {
        background-color: #6B1700 !important;
        color: #FFF1D2 !important;
        border-color: #FFF1D2;
        transform: none !important;
    }

    @media (max-width: 768px) {
        .banner-title {
            font-size: 1.5rem;
            margin-bottom: 6px;
        }
        .banner-subtitle {
            font-size: 0.88rem;
        }
        .banner-fixed-btn-container {
            bottom: 22px;
        }
        .banner-btn {
            padding: 8px 22px;
            font-size: 0.84rem;
        }
    }

    /* Hide default controls & indicators visually */
    .carousel-control-prev,
    .carousel-control-next,
    .carousel-indicators {
        display: none !important;
    }
</style>

<div class="hero-banner-container" id="heroBannerWrapper">
    <div id="bloomBannerCarousel" class="carousel slide carousel-fade">
        <div class="carousel-inner">
            <!-- Slide 1 -->
            <div class="carousel-item active" data-link="/products" data-btn-text="Khám Phá Sản Phẩm" data-btn-icon="fa-shopping-bag">
                <img src="${pageContext.request.contextPath}/client/img/banner01.jpg" class="d-block w-100 banner-slide-img" alt="BloomResin Banner 1">
                <div class="banner-overlay-text">
                    <h1 class="banner-title">HOA HOÈ HOA HOẸT - BLOOMRESIN</h1>
                    <p class="banner-subtitle">Trang sức thủ công hoa ép Resin tự nhiên lấp lánh & tinh tế</p>
                </div>
            </div>

            <!-- Slide 2 -->
            <div class="carousel-item" data-link="/products" data-btn-text="Xem Bộ Sưu Tập" data-btn-icon="fa-gem">
                <img src="${pageContext.request.contextPath}/client/img/banner02.jpg" class="d-block w-100 banner-slide-img" alt="BloomResin Banner 2">
                <div class="banner-overlay-text">
                    <h1 class="banner-title">BỘ SƯU TẬP HOA ÉP VĨNH CỬU</h1>
                    <p class="banner-subtitle">Lưu giữ trọn vẹn nét đẹp tươi tắn và khoảnh khắc kỷ niệm quý giá</p>
                </div>
            </div>

            <!-- Slide 3 -->
            <div class="carousel-item" data-link="/custom-order/form" data-btn-text="Đặt Làm Ngay" data-btn-icon="fa-magic">
                <img src="${pageContext.request.contextPath}/client/img/banner03.jpg" class="d-block w-100 banner-slide-img" alt="BloomResin Banner 3">
                <div class="banner-overlay-text">
                    <h1 class="banner-title">LÀM THEO YÊU CẦU (CUSTOM ORDER)</h1>
                    <p class="banner-subtitle">Gửi hoa cưới & hoa kỷ niệm của bạn – Shop sẽ đúc thành trang sức độc bản</p>
                </div>
            </div>

            <!-- Slide 4 -->
            <div class="carousel-item" data-link="/news" data-btn-text="Đọc Tin Tức" data-btn-icon="fa-newspaper">
                <img src="${pageContext.request.contextPath}/client/img/banner04.jpg" class="d-block w-100 banner-slide-img" alt="BloomResin Banner 4">
                <div class="banner-overlay-text">
                    <h1 class="banner-title">TIN TỨC & BẢO QUẢN SẢN PHẨM</h1>
                    <p class="banner-subtitle">Khám phá các bí quyết chăm sóc trang sức Resin bền đẹp cùng thời gian</p>
                </div>
            </div>
        </div>
    </div>

    <!-- 100% FIXED & STATIC Yellow button anchored inside image frame (35px gap from bottom edge) -->
    <div class="banner-fixed-btn-container">
        <a href="/products" class="banner-btn" id="fixedBannerBtn"><i class="fas fa-shopping-bag me-2"></i>Khám Phá Sản Phẩm</a>
    </div>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        var bannerWrapper = document.getElementById('heroBannerWrapper');
        var bannerCarouselEl = document.querySelector('#bloomBannerCarousel');
        var fixedBtn = document.getElementById('fixedBannerBtn');
        var bsCarouselInstance = null;

        function startSingleCarousel() {
            if (bannerCarouselEl && typeof bootstrap !== 'undefined' && bootstrap.Carousel) {
                var existing = bootstrap.Carousel.getInstance(bannerCarouselEl);
                if (existing) {
                    existing.dispose();
                }
                bsCarouselInstance = new bootstrap.Carousel(bannerCarouselEl, {
                    interval: 4500,
                    pause: false,
                    wrap: true,
                    touch: true
                });
                bsCarouselInstance.cycle();
            } else if (typeof $ !== 'undefined') {
                $('#bloomBannerCarousel').carousel({
                    interval: 4500,
                    pause: false,
                    wrap: true
                });
                $('#bloomBannerCarousel').carousel('cycle');
            }
        }

        startSingleCarousel();

        if (bannerCarouselEl && fixedBtn) {
            function updateButtonContent(targetSlide) {
                if (targetSlide && fixedBtn) {
                    var link = targetSlide.getAttribute('data-link');
                    var text = targetSlide.getAttribute('data-btn-text');
                    var icon = targetSlide.getAttribute('data-btn-icon') || 'fa-shopping-bag';
                    if (link) fixedBtn.setAttribute('href', link);
                    if (text) fixedBtn.innerHTML = '<i class="fas ' + icon + ' me-2"></i>' + text;
                }
            }

            // Fire synchronously at the START of slide transition so button updates simultaneously with image & text
            bannerCarouselEl.addEventListener('slide.bs.carousel', function (e) {
                var targetSlide = e.relatedTarget || bannerCarouselEl.querySelector('.carousel-item.active');
                updateButtonContent(targetSlide);
            });

            // Also support jQuery carousel event fallback
            if (typeof $ !== 'undefined') {
                $('#bloomBannerCarousel').on('slide.bs.carousel', function (e) {
                    var targetSlide = e.relatedTarget;
                    updateButtonContent(targetSlide);
                });
            }
        }

        // Smooth left & right click handler
        if (bannerWrapper) {
            bannerWrapper.addEventListener('click', function (e) {
                if (e.target.closest('#fixedBannerBtn')) {
                    return; // Allow yellow button click
                }
                var rect = bannerWrapper.getBoundingClientRect();
                var clickX = e.clientX - rect.left;
                var halfWidth = rect.width / 2;

                if (bsCarouselInstance) {
                    if (clickX < halfWidth) {
                        bsCarouselInstance.prev();
                    } else {
                        bsCarouselInstance.next();
                    }
                } else if (typeof $ !== 'undefined') {
                    if (clickX < halfWidth) {
                        $('#bloomBannerCarousel').carousel('prev');
                    } else {
                        $('#bloomBannerCarousel').carousel('next');
                    }
                }
            });
        }
    });
</script>
