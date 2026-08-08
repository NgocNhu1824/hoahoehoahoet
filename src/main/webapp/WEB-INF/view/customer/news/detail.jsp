<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${news.title}</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            line-height: 1.6;
            max-width: 900px;
            margin: auto;
            padding: 30px;
            background-color: #FFF1D2;
            color: #6B1700;
        }

        .container {
            background: white;
            padding: 30px;
            box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.15);
            border-radius: 10px;
        }

        h1 {
            font-size: 30px;
            margin-bottom: 10px;
            color: #6B1700;
        }

        .meta {
            color: gray;
            font-size: 14px;
            margin-bottom: 20px;
        }

        .news-image {
            width: 100%;
            height: auto;
            max-height: 650px;
            object-fit: contain;
            border-radius: 8px;
            margin: 20px 0;
            cursor: pointer;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            transition: transform 0.2s ease-in-out;
        }

        .news-image:hover {
            transform: scale(1.01);
        }

        .content {
            text-align: justify;
            font-size: 18px;
            margin-top: 20px;
            white-space: pre-line; /* giữ xuống dòng khi nhập Enter */
        }

        .back-link {
            display: inline-block;
            margin-top: 30px;
            padding: 10px 20px;
            background-color: #6B1700;
            color: #fff;
            font-weight: bold;
            border-radius: 8px;
            text-decoration: none;
            transition: background 0.3s ease;
        }

        .back-link:hover {
            background-color: #CEAF95;
            color: #000;
        }

        /* Modal xem ảnh phóng to */
        .image-modal {
            display: none;
            position: fixed;
            z-index: 9999;
            padding-top: 50px;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0,0,0,0.85);
        }

        .image-modal-content {
            margin: auto;
            display: block;
            max-width: 90%;
            max-height: 85vh;
            border-radius: 6px;
        }

        .image-modal-close {
            position: absolute;
            top: 20px;
            right: 35px;
            color: #fff;
            font-size: 40px;
            font-weight: bold;
            cursor: pointer;
        }

        @media screen and (max-width: 768px) {
            body {
                padding: 15px;
            }

            .container {
                padding: 20px;
            }

            .content {
                font-size: 16px;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <h1>${news.title}</h1>

    <c:choose>
        <c:when test="${not empty news.imageUrl}">
            <img src="${news.imageUrl.startsWith('/') || news.imageUrl.startsWith('http') ? news.imageUrl : '/images/news/'.concat(news.imageUrl)}" 
                 alt="Ảnh tin tức" 
                 class="news-image" 
                 onclick="openImageModal(this.src)" 
                 title="Nhấn để xem ảnh phóng to">
        </c:when>
        <c:otherwise>
            <p><i>Không có hình ảnh</i></p>
        </c:otherwise>
    </c:choose>

    <div class="content">${news.content}</div>

    <a href="/news" class="back-link">&#8592; Quay lại danh sách tin tức</a>
</div>

<!-- Modal xem toàn bộ ảnh -->
<div id="imgModal" class="image-modal" onclick="closeImageModal()">
    <span class="image-modal-close">&times;</span>
    <img class="image-modal-content" id="imgModalSrc">
</div>

<script>
    function openImageModal(src) {
        document.getElementById("imgModalSrc").src = src;
        document.getElementById("imgModal").style.display = "block";
    }
    function closeImageModal() {
        document.getElementById("imgModal").style.display = "none";
    }
</script>
</body>
</html>
