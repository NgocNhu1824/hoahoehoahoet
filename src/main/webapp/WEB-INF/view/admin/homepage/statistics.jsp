<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Thống kê doanh thu theo ngày</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
    <link rel="stylesheet" href="/css/ewstyle.css">
    <style>
        body { background-color: #f8f9fa; }
        .table thead { background-color: #007bff; color: white; }
        .card { border: none; border-radius: 16px; box-shadow: 0 4px 10px rgba(0,0,0,0.05); }
        .form-select { max-width: 150px; display: inline-block; margin-right: 10px; }
        .breadcrumb { background-color: transparent; }
        #chart_div, #pie_chart_div { width: 100%; height: 400px; }
    </style>
</head>
<body>
<div class="container-fluid d-flex p-0">
    <jsp:include page="../layout/navbar.jsp" />
    <div class="main-content p-0">
        <jsp:include page="../layout/header.jsp" />

        <div class="p-4">
            <h1 class="mb-4 mt-4 text-center fw-bold text-primary">📊 Thống kê doanh thu theo ngày</h1>
            <ol class="breadcrumb mb-4">
                <li class="breadcrumb-item"><a href="/admin">Trang quản trị</a></li>
                <li class="breadcrumb-item active">Thống kê theo ngày</li>
            </ol>

            <!-- Form lọc năm & tháng -->
            <form method="get" action="/admin/revenue/day" class="text-center mb-4">
                <label for="yearSelection" class="form-label fw-semibold">Chọn năm:</label>
                <select id="yearSelection" name="year" class="form-select" onchange="this.form.submit()">
                    <c:forEach var="y" items="${yearsWithData}">
                        <option value="${y}" <c:if test="${y == selectedYear}">selected</c:if>>${y}</option>
                    </c:forEach>
                </select>

                <label for="monthSelection" class="form-label fw-semibold ms-3">Chọn tháng:</label>
                <select id="monthSelection" name="month" class="form-select" onchange="this.form.submit()">
                    <c:forEach begin="1" end="12" var="m">
                        <option value="${m}" <c:if test="${m == selectedMonth}">selected</c:if>>Tháng ${m}</option>
                    </c:forEach>
                </select>
            </form>

            <!-- Biểu đồ cột doanh thu -->
            <div class="card p-4 mb-4">
                <div id="chart_div"></div>
            </div>

            <!-- Bảng doanh thu theo ngày -->
            <div class="card p-4 mb-4">
                <div class="table-responsive">
                    <table class="table table-bordered table-hover align-middle text-center">
                        <thead>
                        <tr>
                            <th>Ngày</th>
                            <th>Doanh thu (VNĐ)</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="entry" items="${revenueByDay}">
                            <tr>
                                <td>${entry.key}</td>
                                <td><fmt:formatNumber type="number" value="${entry.value}" /></td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty revenueByDay}">
                            <tr>
                                <td colspan="2" class="text-muted">Không có dữ liệu cho tháng này</td>
                            </tr>
                        </c:if>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Biểu đồ tròn sản phẩm bán chạy -->
            <div class="card p-4 mb-4">
                <h5 class="text-center fw-bold text-primary mb-3">🍰 Top 5 sản phẩm bán chạy trong tháng</h5>
                <div id="pie_chart_div"></div>
            </div>
        </div>
    </div>
</div>

<!-- Google Charts -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
    google.charts.load('current', { packages: ['corechart'] });
    google.charts.setOnLoadCallback(drawCharts);

    function drawCharts() {
        drawColumnChart();
        drawPieChart();
    }

    function drawColumnChart() {
        var data = google.visualization.arrayToDataTable([
            ['Ngày', 'Doanh thu (VNĐ)'],
            <c:forEach var="entry" items="${revenueByDay}" varStatus="loop">
            ['${entry.key}', ${entry.value}]<c:if test="${!loop.last}">,</c:if>
            </c:forEach>
        ]);

        var options = {
            title: 'Biểu đồ doanh thu theo ngày',
            hAxis: { title: 'Ngày', showTextEvery: 1, textStyle: { fontSize: 10 } },
            vAxis: { title: 'Doanh thu (VNĐ)', format: 'short', minValue: 0, textStyle: { fontSize: 12 } },
            legend: { position: 'none' },
            colors: ['#007bff'],
            backgroundColor: 'transparent',
            chartArea: { width: '85%', height: '70%' },
            bar: { groupWidth: '70%' }
        };

        if (data.getNumberOfRows() === 0) {
            document.getElementById('chart_div').innerHTML = "<p class='text-center text-muted'>Không có dữ liệu cho tháng này.</p>";
        } else {
            var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
            chart.draw(data, options);
        }
    }

    function drawPieChart() {
        var pieData = google.visualization.arrayToDataTable([
            ['Sản phẩm', 'Số lượng bán'],
            <c:forEach var="entry" items="${topProducts}" varStatus="loop">
            ['${entry.key}', ${entry.value}]<c:if test="${!loop.last}">,</c:if>
            </c:forEach>
        ]);

        var options = {
            title: 'Sản phẩm bán chạy trong tháng',
            pieHole: 0.4,
            colors: ['#007bff', '#28a745', '#ffc107', '#dc3545', '#6f42c1', '#fd7e14', '#20c997', '#6610f2', '#6c757d', '#e83e8c'],
            legend: { position: 'right', textStyle: { fontSize: 12 } },
            chartArea: { width: '80%', height: '70%' },
            backgroundColor: 'transparent',
            pieSliceText: 'percentage',
            pieSliceTextStyle: { fontSize: 12, color: 'black' }
        };

        if (pieData.getNumberOfRows() === 0) {
            document.getElementById('pie_chart_div').innerHTML = "<p class='text-center text-muted'>Không có dữ liệu sản phẩm.</p>";
        } else {
            var pieChart = new google.visualization.PieChart(document.getElementById('pie_chart_div'));
            pieChart.draw(pieData, options);
        }
    }

    // Vẽ lại khi resize
    window.addEventListener('resize', drawCharts);
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
