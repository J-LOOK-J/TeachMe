<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <title>Insert title here</title>--%>
<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">--%>
<%--    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>--%>
<%--    <style type="text/css">--%>
<%--    </style>--%>
<%--</head>--%>
<%--<body>--%>
<%--    <h1>hello world!!</h1>--%>
<%--</body>--%>
<%--</html>--%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <style type="text/css">
        @font-face {
            font-family: 'MICEGothic Bold';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEGothic Bold.woff2') format('woff2');
            font-weight: 700;
            font-style: normal;
        }

        * {
            font-family: 'MICEGothic Bold';
        }
    </style>

<%--    <meta charset="utf-8">--%>
<%--    <meta http-equiv="X-UA-Compatible" content="IE=edge">--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">--%>
<%--    <meta name="description" content="">--%>
<%--    <meta name="author" content="">--%>
<%--    <link href="img/logo/logo.png" rel="icon">--%>
<%--    <title>RuangAdmin - Dashboard</title>--%>
<%--    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">--%>
<%--    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">--%>
<%--    <link href="css/manager/manager.css" rel="stylesheet">--%>

</head>
<c:set var="root" value="<%=request.getContextPath() %>"></c:set>

    <!-- Sidebar -->

    <!-- Sidebar -->
            <!-- TopBar -->
            <!-- Topbar -->

            <!-- Container Fluid-->
            <div class="container-fluid" id="container-wrapper">

                <div class="row mb-3">
                    <!-- Card Example-->

                    <!-- 올 한해의 전체 소득 출력 칸-->
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card h-100">
                            <div class="card-body">
                                <div class="row align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-uppercase mb-1">
                                            Incom (<span id ="nowYear"></span> year)
                                        </div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800" id="print-total-incom"></div>
<%--                                        <div class="mt-2 mb-0 text-muted text-xs">--%>
<%--                                            <span class="text-success mr-2"><i class="fa fa-arrow-up"></i> 3.48%</span>--%>
<%--                                            <span>Since last month</span>--%>
<%--                                        </div>--%>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-calendar fa-2x text-primary"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 일반 회원 수 출력 란 -->
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card h-100">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-uppercase mb-1">User</div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800" id="print-total-user"></div>
<%--                                        <div class="mt-2 mb-0 text-muted text-xs">--%>
<%--                                            <span class="text-success mr-2"><i class="fas fa-arrow-up"></i> 12%</span>--%>
<%--                                            <span>Since last years</span>--%>
<%--                                        </div>--%>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-shopping-cart fa-2x text-success"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 진행중인 강좌 수 출력 란 -->
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card h-100">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-uppercase mb-1">
                                            Lecture (<span id ="nowMonth"></span> month)
                                        </div>
                                        <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800" id="print-total-lectures"></div>
<%--                                        <div class="mt-2 mb-0 text-muted text-xs">--%>
<%--                                            <span class="text-success mr-2"><i class="fas fa-arrow-up"></i> 20.4%</span>--%>
<%--                                            <span>Since last month</span>--%>
<%--                                        </div>--%>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-users fa-2x text-info"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <!-- Area Chart -->
                    <div class="col-xl-8 col-lg-7">
                        <div class="card mb-4">
                            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                <h6 class="m-0 font-weight-bold text-primary">Monthly Recap Report</h6>
                                <div class="dropdown no-arrow">
                                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown"
                                       aria-haspopup="true" aria-expanded="false">
                                        <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                         aria-labelledby="dropdownMenuLink">
                                        <div class="dropdown-header">Dropdown Header:</div>
                                        <a class="dropdown-item" href="#">Action</a>
                                        <a class="dropdown-item" href="#">Another action</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="#">Something else here</a>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="chart-area">
                                    <canvas id="myAreaChart"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Pie Chart -->
                    <div class="col-xl-4 col-lg-5">
                        <div class="card mb-4">
                            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                <h6 class="m-0 font-weight-bold text-primary">Products Sold</h6>
                                <div class="dropdown no-arrow">
                                    <a class="dropdown-toggle btn btn-primary btn-sm" href="#" role="button" id="dropdownMenuLink"
                                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Month <i class="fas fa-chevron-down"></i>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                         aria-labelledby="dropdownMenuLink">
                                        <div class="dropdown-header">Select Periode</div>
                                        <a class="dropdown-item" href="#">Today</a>
                                        <a class="dropdown-item" href="#">Week</a>
                                        <a class="dropdown-item active" href="#">Month</a>
                                        <a class="dropdown-item" href="#">This Year</a>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="mb-3">
                                    <div class="small text-gray-500">Oblong T-Shirt
                                        <div class="small float-right"><b>600 of 800 Items</b></div>
                                    </div>
                                    <div class="progress" style="height: 12px;">
                                        <div class="progress-bar bg-warning" role="progressbar" style="width: 80%" aria-valuenow="80"
                                             aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <div class="small text-gray-500">Gundam 90'Editions
                                        <div class="small float-right"><b>500 of 800 Items</b></div>
                                    </div>
                                    <div class="progress" style="height: 12px;">
                                        <div class="progress-bar bg-success" role="progressbar" style="width: 70%" aria-valuenow="70"
                                             aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <div class="small text-gray-500">Rounded Hat
                                        <div class="small float-right"><b>455 of 800 Items</b></div>
                                    </div>
                                    <div class="progress" style="height: 12px;">
                                        <div class="progress-bar bg-danger" role="progressbar" style="width: 55%" aria-valuenow="55"
                                             aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <div class="small text-gray-500">Indomie Goreng
                                        <div class="small float-right"><b>400 of 800 Items</b></div>
                                    </div>
                                    <div class="progress" style="height: 12px;">
                                        <div class="progress-bar bg-info" role="progressbar" style="width: 50%" aria-valuenow="50"
                                             aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <div class="small text-gray-500">Remote Control Car Racing
                                        <div class="small float-right"><b>200 of 800 Items</b></div>
                                    </div>
                                    <div class="progress" style="height: 12px;">
                                        <div class="progress-bar bg-success" role="progressbar" style="width: 30%" aria-valuenow="30"
                                             aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer text-center">
                                <a class="m-0 small text-primary card-link" href="#">View More <i
                                        class="fas fa-chevron-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <!-- Invoice Example -->
                    <div class="col-xl-8 col-lg-7 mb-4">
                        <div class="card">
                            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                <h6 class="m-0 font-weight-bold text-primary">Invoice</h6>
                                <a class="m-0 float-right btn btn-danger btn-sm" href="#">View More <i
                                        class="fas fa-chevron-right"></i></a>
                            </div>
                            <div class="table-responsive">
                                <table class="table align-items-center table-flush">
                                    <thead class="thead-light">
                                    <tr>
                                        <th>Order ID</th>
                                        <th>Customer</th>
                                        <th>Item</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td><a href="#">RA0449</a></td>
                                        <td>Udin Wayang</td>
                                        <td>Nasi Padang</td>
                                        <td><span class="badge badge-success">Delivered</span></td>
                                        <td><a href="#" class="btn btn-sm btn-primary">Detail</a></td>
                                    </tr>
                                    <tr>
                                        <td><a href="#">RA5324</a></td>
                                        <td>Jaenab Bajigur</td>
                                        <td>Gundam 90' Edition</td>
                                        <td><span class="badge badge-warning">Shipping</span></td>
                                        <td><a href="#" class="btn btn-sm btn-primary">Detail</a></td>
                                    </tr>
                                    <tr>
                                        <td><a href="#">RA8568</a></td>
                                        <td>Rivat Mahesa</td>
                                        <td>Oblong T-Shirt</td>
                                        <td><span class="badge badge-danger">Pending</span></td>
                                        <td><a href="#" class="btn btn-sm btn-primary">Detail</a></td>
                                    </tr>
                                    <tr>
                                        <td><a href="#">RA1453</a></td>
                                        <td>Indri Junanda</td>
                                        <td>Hat Rounded</td>
                                        <td><span class="badge badge-info">Processing</span></td>
                                        <td><a href="#" class="btn btn-sm btn-primary">Detail</a></td>
                                    </tr>
                                    <tr>
                                        <td><a href="#">RA1998</a></td>
                                        <td>Udin Cilok</td>
                                        <td>Baby Powder</td>
                                        <td><span class="badge badge-success">Delivered</span></td>
                                        <td><a href="#" class="btn btn-sm btn-primary">Detail</a></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="card-footer"></div>
                        </div>
                    </div>
                    <!-- Message From Customer-->
                    <div class="col-xl-4 col-lg-5 ">
                        <div class="card">
                            <div class="card-header py-4 bg-primary d-flex flex-row align-items-center justify-content-between">
                                <h6 class="m-0 font-weight-bold text-light">Message From Customer</h6>
                            </div>
                            <div>
                                <div class="customer-message align-items-center">
                                    <a class="font-weight-bold" href="#">
                                        <div class="text-truncate message-title">Hi there! I am wondering if you can help me with a
                                            problem I've been having.</div>
                                        <div class="small text-gray-500 message-time font-weight-bold">Udin Cilok · 58m</div>
                                    </a>
                                </div>
                                <div class="customer-message align-items-center">
                                    <a href="#">
                                        <div class="text-truncate message-title">But I must explain to you how all this mistaken idea
                                        </div>
                                        <div class="small text-gray-500 message-time">Nana Haminah · 58m</div>
                                    </a>
                                </div>
                                <div class="customer-message align-items-center">
                                    <a class="font-weight-bold" href="#">
                                        <div class="text-truncate message-title">Lorem ipsum dolor sit amet, consectetur adipiscing elit
                                        </div>
                                        <div class="small text-gray-500 message-time font-weight-bold">Jajang Cincau · 25m</div>
                                    </a>
                                </div>
                                <div class="customer-message align-items-center">
                                    <a class="font-weight-bold" href="#">
                                        <div class="text-truncate message-title">At vero eos et accusamus et iusto odio dignissimos
                                            ducimus qui blanditiis
                                        </div>
                                        <div class="small text-gray-500 message-time font-weight-bold">Udin Wayang · 54m</div>
                                    </a>
                                </div>
                                <div class="card-footer text-center">
                                    <a class="m-0 small text-primary card-link" href="#">View More <i
                                            class="fas fa-chevron-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--Row-->
                <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabelLogout"
                     aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabelLogout">Ohh No!</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <p>Are you sure you want to logout?</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Cancel</button>
                                <a href="login.html" class="btn btn-primary">Logout</a>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <!---Container Fluid-->
        </div>
        <!-- Footer -->
        <footer class="sticky-footer bg-white">
            <div class="container my-auto">
                <div class="copyright text-center my-auto">
            <span>copyright &copy; <script> document.write(new Date().getFullYear()); </script> - developed by
              <b><a href="https://indrijunanda.gitlab.io/" target="_blank">indrijunanda</a></b>
            </span>
                </div>
            </div>
        </footer>
        <!-- Footer -->
    </div>
</div>

<!-- Scroll to top -->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<script>

    var date = new Date();
    var year = date.getFullYear();
    var month = date.getMonth();
    document.getElementById("nowMonth").innerText=month;
    document.getElementById("nowYear").innerText=year;


    //페이지 로드 되자마자 출력되는 함수들
    $(function () {
        // totalIncom();      //올해의 수익
        totalUser();       //전체 학생수
        totalLecture();
    });

    // //올해의 수익
    // function totalIncom() {
    //     $.ajax({
    //         type:"get",
    //         url:"/mini/manager/totalIncom",
    //         dataType:"json",
    //         success:function(res) {
    //             alert("print-total-incom");
    //             alert(res.result);
    //             $("#print-total-incom").html(res.result);
    //             }
    //     })
    // }
    function totalUser() {
        $.ajax({
            type:"get",
            url:"${root}/manager/usertotalCount",
            dataType:"json",
            success:function(res) {
                $("#print-total-user").html(res);
            }
        })
    }
    function totalLecture() {
        $.ajax({
            type:"get",
            url:"${root}/manager/totalLectureCount",
            dataType:"json",
            data:{"lecyear":year,"lecmonth":month},
            success:function(res) {
                $("#print-total-lectures").html(res);
            }
        })
    };
</script>

<%--<script src="vendor/jquery/jquery.min.js"></script>--%>
<%--<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>--%>
<%--<script src="vendor/jquery-easing/jquery.easing.min.js"></script>--%>
<%--<script src="js/ruang-admin.min.js"></script>--%>
<%--<script src="vendor/chart.js/Chart.min.js"></script>--%>
<%--<script src="js/manager/manager.js"></script>--%>
</body>

</html>