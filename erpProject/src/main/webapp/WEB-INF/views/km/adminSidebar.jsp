<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
    function checkUserRole(url) {
        <%-- 서버측 세션 정보를 JavaScript 변수에 할당 --%>
        var userRole = "${sessionScope.emp_role}";

        <%-- 사용자의 권한을 확인하고 알림을 표시 또는 페이지 이동 --%>
        if ("${sessionScope.emp_role}" !== 'role_admin') {
            alert("관리자만 접근 가능합니다.");
        } else {
            window.location.href = url;
        }
    }
</script>
    
<!-- 사이드바 -->
  <aside class="sidenav bg-white navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-4" id="sidenav-main">
    <div class="sidenav-header">
      <i class="fas fa-times p-3 cursor-pointer text-secondary opacity-5 position-absolute end-0 top-0 d-none d-xl-none" aria-hidden="true" id="iconSidenav"></i>
      <a class="navbar-brand m-0" href="/adminHome">
        <img src="./assets/img/logo-ct-dark.png" class="navbar-brand-img h-100" alt="main_logo">
        <span class="ms-1 font-weight-bold">ERP PROJECT </span>
      </a>
    </div>
    <hr class="horizontal dark mt-0 mb-1">
    <div class="collapse navbar-collapse w-auto " id="sidenav-collapse-main" style="height: 890px;">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" href="/adminHome">
            <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
              <i class="ni ni-tv-2 text-primary text-sm opacity-10"></i>
            </div>
            <span class="nav-link-text ms-1">Home</span>
          </a>
        </li>
        <li class="nav-item mt-3">
          <h6 class="ps-4 ms-2 text-uppercase text-xs font-weight-bolder opacity-6">인사</h6>
        </li>
        <li class="nav-item">
          <a class="nav-link " href="/employeeRegistForm">
            <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
              <i class="ni ni-single-02 text-dark text-sm opacity-10"></i>
            </div>
            <span class="nav-link-text ms-1">사원등록</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link " href="/listEmployeeProc">
            <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
              <i class="ni ni-badge text-dark text-sm opacity-10"></i>
            </div>
            <span class="nav-link-text ms-1">사원조회</span>
          </a>
        </li>
        <li class="nav-item mt-3">
          <h6 class="ps-4 ms-2 text-uppercase text-xs font-weight-bolder opacity-6">등록</h6>
        </li>
        <li class="nav-item">
          <a class="nav-link " href="#" onclick="checkUserRole('/lhsFormRegistStockNewItem')">
            <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
              <i class="ni ni-box-2 text-sm opacity-10" style="color: #75b798;"></i>
            </div>
            <span class="nav-link-text ms-1">창고 기초재고등록</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link " href="#" onclick="checkUserRole('/lhsFormRegistStockSurvey')">
            <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
              <i class="ni ni-box-2 text-sm opacity-10" style="color: #75b798;"></i>
            </div>
            <span class="nav-link-text ms-1">실사 재고조사등록</span>
          </a>
        </li>
        <li class="nav-item mt-3">
          <h6 class="ps-4 ms-2 text-uppercase text-xs font-weight-bolder opacity-6">재고</h6>
        </li>
        <li class="nav-item">
          <a class="nav-link " href="#" onclick="checkUserRole('/lhsListRnPCondBuy')">
            <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
              <i class="ni ni-chart-pie-35 text-sm opacity-10" style="color:#3d8bfd"></i>
            </div>
            <span class="nav-link-text ms-1">수불마감/해제</span>
          </a>
        </li>
<!--         <li class="nav-item">
          <a class="nav-link " href="./pages/tables.html">
            <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
              <i class="ni ni-chart-pie-35 text-sm opacity-10" style="color:#3d8bfd"></i>
            </div>
            <span class="nav-link-text ms-1">수불마감관리</span>
          </a>
        </li> -->
        <li class="nav-item mt-3">
          <h6 class="ps-4 ms-2 text-uppercase text-xs font-weight-bolder opacity-6">관리</h6>
        </li>
        <li class="nav-item">
          <a class="nav-link " href="productU">
            <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
              <i class="ni ni-chart-bar-32 text-sm opacity-10" style="color:#bf360c"></i>
            </div>
            <span class="nav-link-text ms-1">제품관리</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link " href="factoryU">
            <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
              <i class="ni ni-chart-bar-32 text-sm opacity-10" style="color:#bf360c"></i>
            </div>
            <span class="nav-link-text ms-1">공장관리</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link " href="customerU">
            <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
              <i class="ni ni-chart-bar-32 text-sm opacity-10" style="color:#bf360c"></i>
            </div>
            <span class="nav-link-text ms-1">거래처 관리</span>
          </a>
        </li>
      </ul>
    </div>
  </aside>
 