<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:if test="${onlineUser == null}">
	<%
		response.sendRedirect("index.jsp");
	%>
</c:if>
<!doctype html>
<html lang="en" dir="ltr">

<head>

    <!-- META DATA -->
    <meta charset="UTF-8">
    <meta name='viewport' content='width=device-width, initial-scale=1.0, user-scalable=0'>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Sash – Bootstrap 5  Admin & Dashboard Template">
    <meta name="author" content="Spruko Technologies Private Limited">
    <meta name="keywords" content="admin,admin dashboard,admin panel,admin template,bootstrap,clean,dashboard,flat,jquery,modern,responsive,premium admin templates,responsive admin,ui,ui kit.">

    <!-- FAVICON -->
    <link rel="shortcut icon" type="image/x-icon" href="/assets/images/brand/favicon.ico" />

    <!-- TITLE -->
    <title><tiles:insertAttribute name="title" ignore="true" /></title>

    <!-- BOOTSTRAP CSS -->
    <link id="style" href="/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" />

    <!-- STYLE CSS -->
    <link href="/assets/css/style.css" rel="stylesheet" />
    <link href="/assets/css/dark-style.css" rel="stylesheet" />
    <link href="/assets/css/transparent-style.css" rel="stylesheet">
    <link href="/assets/css/skin-modes.css" rel="stylesheet" />

    <!--- FONT-ICONS CSS -->
    <link href="/assets/css/icons.css" rel="stylesheet" />

    <!-- COLOR SKIN CSS -->
    <link id="theme" rel="stylesheet" type="text/css" media="all" href="/assets/colors/color1.css" />

</head>

<body class="app sidebar-mini ltr light-mode">

    <!-- GLOBAL-LOADER -->
    <div id="global-loader">
        <img src="/assets/images/loader.svg" class="loader-img" alt="Loader">
    </div>
    <!-- /GLOBAL-LOADER -->

    <!-- PAGE -->
    <div class="page">
        <div class="page-main">

            <!-- app-Header -->
            <div class="app-header header sticky">
                <div class="container-fluid main-container">
                    <div class="d-flex">
                        <a aria-label="Hide Sidebar" class="app-sidebar__toggle" data-bs-toggle="sidebar" href="javascript:void(0)"></a>
                        <!-- sidebar-toggle-->
                        <a class="logo-horizontal " href="index.html">
                            <img src="/assets/images/brand/logo.png" class="header-brand-img desktop-logo" alt="logo">
                            <img src="/assets/images/brand/logo-3.png" class="header-brand-img light-logo1"
                                alt="logo">
                        </a>
                        <!-- LOGO -->
                        <div class="main-header-center ms-3 d-none d-lg-block">
                            <input type="text" class="form-control" id="typehead" placeholder="Search for results..." autocomplete="off">
                            <button class="btn px-0 pt-2"><i class="fe fe-search" aria-hidden="true"></i></button>
                        </div>
                        <div class="d-flex order-lg-2 ms-auto header-right-icons">
                            <!-- SEARCH -->
                            <button class="navbar-toggler navresponsive-toggler d-lg-none ms-auto" type="button"
                                data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent-4"
                                aria-controls="navbarSupportedContent-4" aria-expanded="false"
                                aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon fe fe-more-vertical"></span>
                            </button>
                            <div class="navbar navbar-collapse responsive-navbar p-0">
                                <div class="collapse navbar-collapse" id="navbarSupportedContent-4">
                                    <div class="d-flex order-lg-2">
                                        <div class="dropdown d-lg-none d-flex">
                                            <a href="javascript:void(0)" class="nav-link icon" data-bs-toggle="dropdown">
                                                <i class="fe fe-search"></i>
                                            </a>
                                            <div class="dropdown-menu header-search dropdown-menu-start">
                                                <div class="input-group w-100 p-2">
                                                    <input type="text" class="form-control" placeholder="Search....">
                                                    <div class="input-group-text btn btn-primary">
                                                        <i class="fa fa-search" aria-hidden="true"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- THEME -->
                                        <div class="d-flex country">
                                            <a class="nav-link icon theme-layout nav-link-bg layout-setting">
                                                <span class="dark-layout"><i class="fe fe-moon"></i></span>
                                                <span class="light-layout"><i class="fe fe-sun"></i></span>
                                            </a>
                                        </div>
                                        <!-- Theme-Layout -->
                                        
                                        <div class="dropdown d-flex">
                                            <a class="nav-link icon full-screen-link nav-link-bg">
                                                <i class="fe fe-minimize fullscreen-button"></i>
                                            </a>
                                        </div>
                                        <!-- FULL-SCREEN -->
                                        <div class="dropdown  d-flex notifications">
                                            <a class="nav-link icon" data-bs-toggle="dropdown"><i
                                                    class="fe fe-bell"></i><span class=" pulse"></span>
                                            </a>
                                            <div class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                                                <div class="drop-heading border-bottom">
                                                    <div class="d-flex">
                                                        <h6 class="mt-1 mb-0 fs-16 fw-semibold text-dark">Notifications
                                                        </h6>
                                                    </div>
                                                </div>
                                                <div class="notifications-menu">
                                                    <a class="dropdown-item d-flex" href="notify-list.html">
                                                        <div class="me-3 notifyimg  bg-primary brround box-shadow-primary">
                                                            <i class="fe fe-mail"></i>
                                                        </div>
                                                        <div class="mt-1 wd-80p">
                                                            <h5 class="notification-label mb-1">New Application received
                                                            </h5>
                                                            <span class="notification-subtext">3 days ago</span>
                                                        </div>
                                                    </a>
                                                    <a class="dropdown-item d-flex" href="notify-list.html">
                                                        <div class="me-3 notifyimg  bg-secondary brround box-shadow-secondary">
                                                            <i class="fe fe-check-circle"></i>
                                                        </div>
                                                        <div class="mt-1 wd-80p">
                                                            <h5 class="notification-label mb-1">Project has been
                                                                approved</h5>
                                                            <span class="notification-subtext">2 hours ago</span>
                                                        </div>
                                                    </a>
                                                    <a class="dropdown-item d-flex" href="notify-list.html">
                                                        <div class="me-3 notifyimg  bg-success brround box-shadow-success">
                                                            <i class="fe fe-shopping-cart"></i>
                                                        </div>
                                                        <div class="mt-1 wd-80p">
                                                            <h5 class="notification-label mb-1">Your Product Delivered
                                                            </h5>
                                                            <span class="notification-subtext">30 min ago</span>
                                                        </div>
                                                    </a>
                                                    <a class="dropdown-item d-flex" href="notify-list.html">
                                                        <div class="me-3 notifyimg bg-pink brround box-shadow-pink">
                                                            <i class="fe fe-user-plus"></i>
                                                        </div>
                                                        <div class="mt-1 wd-80p">
                                                            <h5 class="notification-label mb-1">Friend Requests</h5>
                                                            <span class="notification-subtext">1 day ago</span>
                                                        </div>
                                                    </a>
                                                </div>
                                                <div class="dropdown-divider m-0"></div>
                                                <a href="notify-list.html"
                                                    class="dropdown-item text-center p-3 text-muted">View all
                                                    Notification</a>
                                            </div>
                                        </div>
                                        <!-- NOTIFICATIONS -->
                                        
                                        <div class="dropdown d-flex header-settings">
                                            <a href="javascript:void(0);" class="nav-link icon"
                                                data-bs-toggle="sidebar-right" data-target=".sidebar-right">
                                                <i class="fe fe-align-right"></i>
                                            </a>
                                        </div>
                                        <!-- SIDE-MENU -->
                                        <div class="dropdown d-flex profile-1">
                                            <a href="javascript:void(0)" data-bs-toggle="dropdown" class="nav-link leading-none d-flex">
                                                <img src="/assets/images/users/21.jpg" alt="profile-user"
                                                    class="avatar  profile-user brround cover-image">
                                            </a>
                                            <div class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                                                <div class="drop-heading">
                                                    <div class="text-center">
                                                        <h5 class="text-dark mb-0 fs-14 fw-semibold">Percy Kewshun</h5>
                                                        <small class="text-muted">Senior Admin</small>
                                                    </div>
                                                </div>
                                                <div class="dropdown-divider m-0"></div>
                                                <a class="dropdown-item" href="profile.html">
                                                    <i class="dropdown-icon fe fe-user"></i> Profile
                                                </a>
                                                <a class="dropdown-item" href="email-inbox.html">
                                                    <i class="dropdown-icon fe fe-mail"></i> Inbox
                                                    <span class="badge bg-danger rounded-pill float-end">5</span>
                                                </a>
                                                <a class="dropdown-item" href="lockscreen.html">
                                                    <i class="dropdown-icon fe fe-lock"></i> Lockscreen
                                                </a>
                                                <a class="dropdown-item" href="logout">
                                                    <i class="dropdown-icon fe fe-alert-circle"></i> Sign out
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /app-Header -->

            <!--APP-SIDEBAR-->
            <div class="sticky">
                <div class="app-sidebar__overlay" data-bs-toggle="sidebar"></div>
                <div class="app-sidebar">
                    <div class="side-header">
                        <a class="header-brand1" href="index.html">
                            <img src="/assets/images/brand/logo.png" class="header-brand-img desktop-logo" alt="logo">
                            <img src="/assets/images/brand/logo-1.png" class="header-brand-img toggle-logo" alt="logo">
                            <img src="/assets/images/brand/logo-2.png" class="header-brand-img light-logo" alt="logo">
                            <img src="/assets/images/brand/logo-3.png" class="header-brand-img light-logo1" alt="logo">
                        </a>
                        <!-- LOGO -->
                    </div>
                    <div class="main-sidemenu">
                        <div class="slide-left disabled" id="slide-left"><svg xmlns="http://www.w3.org/2000/svg" fill="#7b8191" width="24" height="24" viewBox="0 0 24 24"><path d="M13.293 6.293 7.586 12l5.707 5.707 1.414-1.414L10.414 12l4.293-4.293z"/></svg></div>
                        
                        
                        <tiles:insertAttribute name="menu" ignore="true" />
                        
                        <div class="slide-right" id="slide-right"><svg xmlns="http://www.w3.org/2000/svg" fill="#7b8191" width="24" height="24" viewBox="0 0 24 24"><path d="M10.707 17.707 16.414 12l-5.707-5.707-1.414 1.414L13.586 12l-4.293 4.293z"/></svg></div>
                    </div>
                </div>
            </div>
            <!--/APP-SIDEBAR-->

            <!--app-content open-->
            <div class="main-content app-content mt-0">
            
                <div class="side-app">
			
                    <!-- CONTAINER -->
                    <div class="main-container container-fluid">
						<tiles:insertAttribute name="body" ignore="true" />
                    </div>
                    <!-- CONTAINER CLOSED -->
                </div>
            </div>
            <!--app-content closed-->
        </div>


<%-- comment on slide menu on the right 
        <!-- Sidebar-right -->
        <div class="sidebar sidebar-right sidebar-animate">
            <div class="panel panel-primary card mb-0 shadow-none border-0">
                <div class="tab-menu-heading border-0 d-flex p-3">
                    <div class="card-title mb-0"><i class="fe fe-bell me-2"></i><span class=" pulse"></span>Notifications</div>
                    <div class="card-options ms-auto">
                        <a href="javascript:void(0);" class="sidebar-icon text-end float-end me-3 mb-1" data-bs-toggle="sidebar-right" data-target=".sidebar-right"><i class="fe fe-x text-white"></i></a>
                    </div>
                </div>
                <div class="panel-body tabs-menu-body latest-tasks p-0 border-0">
                    <div class="tabs-menu border-bottom">
                        <!-- Tabs -->
                        <ul class="nav panel-tabs">
                            <li class=""><a href="#side1" class="active" data-bs-toggle="tab"><i class="fe fe-settings me-1"></i>Feeds</a></li>
                            <li><a href="#side2" data-bs-toggle="tab"><i class="fe fe-message-circle"></i> Chat</a></li>
                            <li><a href="#side3" data-bs-toggle="tab"><i class="fe fe-anchor me-1"></i>Timeline</a></li>
                        </ul>
                    </div>
                    <div class="tab-content">
                        <div class="tab-pane active" id="side1">
                            <div class="p-3 fw-semibold ps-5">Feeds</div>
                            <div class="card-body pt-2">
                                <div class="browser-stats">
                                    <div class="row mb-4">
                                        <div class="col-sm-2 mb-sm-0 mb-3">
                                            <span class="feeds avatar-circle brround bg-primary-transparent"><i class="fe fe-user text-primary"></i></span>
                                        </div>
                                        <div class="col-sm-10 ps-sm-0">
                                            <div class="d-flex align-items-end justify-content-between ms-2">
                                                <h6 class="">New user registered</h6>
                                                <div>
                                                    <a href="javascript:void(0)"><i class="fe fe-settings me-1"></i></a>
                                                    <a href="javascript:void(0)"><i class="fe fe-x"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-4">
                                        <div class="col-sm-2 mb-sm-0 mb-3">
                                            <span class="feeds avatar-circle avatar-circle-secondary brround bg-secondary-transparent"><i class="fe fe-shopping-cart text-secondary"></i></span>
                                        </div>
                                        <div class="col-sm-10 ps-sm-0">
                                            <div class="d-flex align-items-end justify-content-between ms-2">
                                                <h6 class="">New order delivered</h6>
                                                <div>
                                                    <a href="javascript:void(0)"><i class="fe fe-settings me-1"></i></a>
                                                    <a href="javascript:void(0)"><i class="fe fe-x"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-4">
                                        <div class="col-sm-2 mb-sm-0 mb-3">
                                            <span class="feeds avatar-circle avatar-circle-danger brround bg-danger-transparent"><i class="fe fe-bell text-danger"></i></span>
                                        </div>
                                        <div class="col-sm-10 ps-sm-0">
                                            <div class="d-flex align-items-end justify-content-between ms-2">
                                                <h6 class="">You have pending tasks</h6>
                                                <div>
                                                    <a href="javascript:void(0)"><i class="fe fe-settings me-1"></i></a>
                                                    <a href="javascript:void(0)"><i class="fe fe-x"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-4">
                                        <div class="col-sm-2 mb-sm-0 mb-3">
                                            <span class="feeds avatar-circle avatar-circle-warning brround bg-warning-transparent"><i class="fe fe-gitlab text-warning"></i></span>
                                        </div>
                                        <div class="col-sm-10 ps-sm-0">
                                            <div class="d-flex align-items-end justify-content-between ms-2">
                                                <h6 class="">New version arrived</h6>
                                                <div>
                                                    <a href="javascript:void(0)"><i class="fe fe-settings me-1"></i></a>
                                                    <a href="javascript:void(0)"><i class="fe fe-x"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-4">
                                        <div class="col-sm-2 mb-sm-0 mb-3">
                                            <span class="feeds avatar-circle avatar-circle-pink brround bg-pink-transparent"><i class="fe fe-database text-pink"></i></span>
                                        </div>
                                        <div class="col-sm-10 ps-sm-0">
                                            <div class="d-flex align-items-end justify-content-between ms-2">
                                                <h6 class="">Server #1 overloaded</h6>
                                                <div>
                                                    <a href="javascript:void(0)"><i class="fe fe-settings me-1"></i></a>
                                                    <a href="javascript:void(0)"><i class="fe fe-x"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-2 mb-sm-0 mb-3">
                                            <span class="feeds avatar-circle avatar-circle-info brround bg-info-transparent"><i class="fe fe-check-circle text-info"></i></span>
                                        </div>
                                        <div class="col-sm-10 ps-sm-0">
                                            <div class="d-flex align-items-end justify-content-between ms-2">
                                                <h6 class="">New project launched</h6>
                                                <div>
                                                    <a href="javascript:void(0)"><i class="fe fe-settings me-1"></i></a>
                                                    <a href="javascript:void(0)"><i class="fe fe-x"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="p-3 fw-semibold ps-5">Settings</div>
                            <div class="card-body pt-2">
                                <div class="browser-stats">
                                    <div class="row mb-4">
                                        <div class="col-sm-2 mb-sm-0 mb-3">
                                            <span class="feeds avatar-circle brround bg-primary-transparent"><i class="fe fe-settings text-primary"></i></span>
                                        </div>
                                        <div class="col-sm-10 ps-sm-0">
                                            <div class="d-flex align-items-end justify-content-between ms-2">
                                                <h6 class="">General Settings</h6>
                                                <div>
                                                    <a href="javascript:void(0)"><i class="fe fe-settings me-1"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-4">
                                        <div class="col-sm-2 mb-sm-0 mb-3">
                                            <span class="feeds avatar-circle avatar-circle-secondary brround bg-secondary-transparent"><i class="fe fe-map-pin text-secondary"></i></span>
                                        </div>
                                        <div class="col-sm-10 ps-sm-0">
                                            <div class="d-flex align-items-end justify-content-between ms-2">
                                                <h6 class="">Map Settings</h6>
                                                <div>
                                                    <a href="javascript:void(0)"><i class="fe fe-settings me-1"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-4">
                                        <div class="col-sm-2 mb-sm-0 mb-3">
                                            <span class="feeds avatar-circle avatar-circle-danger brround bg-danger-transparent"><i class="fe fe-headphones text-danger"></i></span>
                                        </div>
                                        <div class="col-sm-10 ps-sm-0">
                                            <div class="d-flex align-items-end justify-content-between ms-2">
                                                <h6 class="">Support Settings</h6>
                                                <div>
                                                    <a href="javascript:void(0)"><i class="fe fe-settings me-1"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-4">
                                        <div class="col-sm-2 mb-sm-0 mb-3">
                                            <span class="feeds avatar-circle avatar-circle-warning brround bg-warning-transparent"><i class="fe fe-credit-card text-warning"></i></span>
                                        </div>
                                        <div class="col-sm-10 ps-sm-0">
                                            <div class="d-flex align-items-end justify-content-between ms-2">
                                                <h6 class="">Payment Settings</h6>
                                                <div>
                                                    <a href="javascript:void(0)"><i class="fe fe-settings me-1"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-4">
                                        <div class="col-sm-2 mb-sm-0 mb-3">
                                            <span class="feeds avatar-circle avatar-circle-pink brround bg-pink-transparent"><i class="fe fe-bell text-pink"></i></span>
                                        </div>
                                        <div class="col-sm-10 ps-sm-0">
                                            <div class="d-flex align-items-end justify-content-between ms-2">
                                                <h6 class="">Notification Settings</h6>
                                                <div>
                                                    <a href="javascript:void(0)"><i class="fe fe-settings me-1"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="side2">
                            <div class="list-group list-group-flush">
                                <div class="pt-3 fw-semibold ps-5">Today</div>
                                <div class="list-group-item d-flex align-items-center">
                                    <div class="me-2">
                                        <span class="avatar avatar-md brround cover-image" data-bs-image-src="/assets/images/users/2.jpg"></span>
                                    </div>
                                    <div class="">
                                        <a href="chat.html">
                                            <div class="fw-semibold text-dark">Addie Minstra</div>
                                            <p class="mb-0 fs-12 text-muted"> Hey! there I' am available.... </p>
                                        </a>
                                    </div>
                                </div>
                                <div class="list-group-item d-flex align-items-center">
                                    <div class="me-2">
                                        <span class="avatar avatar-md brround cover-image" data-bs-image-src="/assets/images/users/11.jpg"><span class="avatar-status bg-success"></span></span>
                                    </div>
                                    <div class="">
                                        <a href="chat.html">
                                            <div class="fw-semibold text-dark">Rose Bush</div>
                                            <p class="mb-0 fs-12 text-muted"> Okay...I will be waiting for you </p>
                                        </a>
                                    </div>
                                </div>
                                <div class="list-group-item d-flex align-items-center">
                                    <div class="me-2">
                                        <span class="avatar avatar-md brround cover-image" data-bs-image-src="/assets/images/users/10.jpg"></span>
                                    </div>
                                    <div class="">
                                        <a href="chat.html">
                                            <div class="fw-semibold text-dark">Claude Strophobia</div>
                                            <p class="mb-0 fs-12 text-muted"> Hi we can explain our new project...... </p>
                                        </a>
                                    </div>
                                </div>
                                <div class="list-group-item d-flex align-items-center">
                                    <div class="me-2">
                                        <span class="avatar avatar-md brround cover-image" data-bs-image-src="/assets/images/users/13.jpg"></span>
                                    </div>
                                    <div class="">
                                        <a href="chat.html">
                                            <div class="fw-semibold text-dark">Eileen Dover</div>
                                            <p class="mb-0 fs-12 text-muted"> New product Launching... </p>
                                        </a>
                                    </div>
                                </div>
                                <div class="list-group-item d-flex align-items-center">
                                    <div class="me-2">
                                        <span class="avatar avatar-md brround cover-image" data-bs-image-src="/assets/images/users/12.jpg"><span class="avatar-status bg-success"></span></span>
                                    </div>
                                    <div class="">
                                        <a href="chat.html">
                                            <div class="fw-semibold text-dark">Willie Findit</div>
                                            <p class="mb-0 fs-12 text-muted"> Okay...I will be waiting for you </p>
                                        </a>
                                    </div>
                                </div>
                                <div class="list-group-item d-flex align-items-center">
                                    <div class="me-2">
                                        <span class="avatar avatar-md brround cover-image" data-bs-image-src="/assets/images/users/15.jpg"></span>
                                    </div>
                                    <div class="">
                                        <a href="chat.html">
                                            <div class="fw-semibold text-dark">Manny Jah</div>
                                            <p class="mb-0 fs-12 text-muted"> Hi we can explain our new project...... </p>
                                        </a>
                                    </div>
                                </div>
                                <div class="list-group-item d-flex align-items-center">
                                    <div class="me-2">
                                        <span class="avatar avatar-md brround cover-image" data-bs-image-src="/assets/images/users/4.jpg"></span>
                                    </div>
                                    <div class="">
                                        <a href="chat.html">
                                            <div class="fw-semibold text-dark">Cherry Blossom</div>
                                            <p class="mb-0 fs-12 text-muted"> Hey! there I' am available....</p>
                                        </a>
                                    </div>
                                </div>
                                <div class="pt-3 fw-semibold ps-5">Yesterday</div>
                                <div class="list-group-item d-flex align-items-center">
                                    <div class="me-2">
                                        <span class="avatar avatar-md brround cover-image" data-bs-image-src="/assets/images/users/7.jpg"><span class="avatar-status bg-success"></span></span>
                                    </div>
                                    <div class="">
                                        <a href="chat.html">
                                            <div class="fw-semibold text-dark">Simon Sais</div>
                                            <p class="mb-0 fs-12 text-muted">Schedule Realease...... </p>
                                        </a>
                                    </div>
                                </div>
                                <div class="list-group-item d-flex align-items-center">
                                    <div class="me-2">
                                        <span class="avatar avatar-md brround cover-image" data-bs-image-src="/assets/images/users/9.jpg"></span>
                                    </div>
                                    <div class="">
                                        <a href="chat.html">
                                            <div class="fw-semibold text-dark">Laura Biding</div>
                                            <p class="mb-0 fs-12 text-muted"> Hi we can explain our new project...... </p>
                                        </a>
                                    </div>
                                </div>
                                <div class="list-group-item d-flex align-items-center">
                                    <div class="me-2">
                                        <span class="avatar avatar-md brround cover-image" data-bs-image-src="/assets/images/users/2.jpg"><span class="avatar-status bg-success"></span></span>
                                    </div>
                                    <div class="">
                                        <a href="chat.html">
                                            <div class="fw-semibold text-dark">Addie Minstra</div>
                                            <p class="mb-0 fs-12 text-muted">Contact me for details....</p>
                                        </a>
                                    </div>
                                </div>
                                <div class="list-group-item d-flex align-items-center">
                                    <div class="me-2">
                                        <span class="avatar avatar-md brround cover-image" data-bs-image-src="/assets/images/users/9.jpg"></span>
                                    </div>
                                    <div class="">
                                        <a href="chat.html">
                                            <div class="fw-semibold text-dark">Ivan Notheridiya</div>
                                            <p class="mb-0 fs-12 text-muted"> Hi we can explain our new project...... </p>
                                        </a>
                                    </div>
                                </div>
                                <div class="list-group-item d-flex align-items-center">
                                    <div class="me-2">
                                        <span class="avatar avatar-md brround cover-image" data-bs-image-src="/assets/images/users/14.jpg"></span>
                                    </div>
                                    <div class="">
                                        <a href="chat.html">
                                            <div class="fw-semibold text-dark">Dulcie Veeta</div>
                                            <p class="mb-0 fs-12 text-muted"> Okay...I will be waiting for you </p>
                                        </a>
                                    </div>
                                </div>
                                <div class="list-group-item d-flex align-items-center">
                                    <div class="me-2">
                                        <span class="avatar avatar-md brround cover-image" data-bs-image-src="/assets/images/users/11.jpg"></span>
                                    </div>
                                    <div class="">
                                        <a href="chat.html">
                                            <div class="fw-semibold text-dark">Florinda Carasco</div>
                                            <p class="mb-0 fs-12 text-muted">New product Launching...</p>
                                        </a>
                                    </div>
                                </div>
                                <div class="list-group-item d-flex align-items-center">
                                    <div class="me-2">
                                        <span class="avatar avatar-md brround cover-image" data-bs-image-src="/assets/images/users/4.jpg"><span class="avatar-status bg-success"></span></span>
                                    </div>
                                    <div class="">
                                        <a href="chat.html">
                                            <div class="fw-semibold text-dark">Cherry Blossom</div>
                                            <p class="mb-0 fs-12 text-muted">cherryblossom@gmail.com</p>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="side3">
                            <ul class="task-list timeline-task">
                                <li class="d-sm-flex mt-4">
                                    <div>
                                        <i class="task-icon1"></i>
                                        <h6 class="fw-semibold">Task Finished<span class="text-muted fs-11 mx-2 fw-normal">09 July 2021</span></h6>
                                        <p class="text-muted fs-12">Adam Berry finished task on<a href="javascript:void(0)" class="fw-semibold"> Project Management</a></p>
                                    </div>
                                    <div class="ms-auto d-md-flex me-3">
                                        <a href="javascript:void(0)" class="text-muted me-2"><span class="fe fe-edit"></span></a>
                                        <a href="javascript:void(0)" class="text-muted"><span class="fe fe-trash-2"></span></a>
                                    </div>
                                </li>
                                <li class="d-sm-flex">
                                    <div>
                                        <i class="task-icon1"></i>
                                        <h6 class="fw-semibold">New Comment<span class="text-muted fs-11 mx-2 fw-normal">05 July 2021</span></h6>
                                        <p class="text-muted fs-12">Victoria commented on Project <a href="javascript:void(0)" class="fw-semibold"> AngularJS Template</a></p>
                                    </div>
                                    <div class="ms-auto d-md-flex me-3">
                                        <a href="javascript:void(0)" class="text-muted me-2"><span class="fe fe-edit"></span></a>
                                        <a href="javascript:void(0)" class="text-muted"><span class="fe fe-trash-2"></span></a>
                                    </div>
                                </li>
                                <li class="d-sm-flex">
                                    <div>
                                        <i class="task-icon1"></i>
                                        <h6 class="fw-semibold">New Comment<span class="text-muted fs-11 mx-2 fw-normal">25 June 2021</span></h6>
                                        <p class="text-muted fs-12">Victoria commented on Project <a href="javascript:void(0)" class="fw-semibold"> AngularJS Template</a></p>
                                    </div>
                                    <div class="ms-auto d-md-flex me-3">
                                        <a href="javascript:void(0)" class="text-muted me-2"><span class="fe fe-edit"></span></a>
                                        <a href="javascript:void(0)" class="text-muted"><span class="fe fe-trash-2"></span></a>
                                    </div>
                                </li>
                                <li class="d-sm-flex">
                                    <div>
                                        <i class="task-icon1"></i>
                                        <h6 class="fw-semibold">Task Overdue<span class="text-muted fs-11 mx-2 fw-normal">14 June 2021</span></h6>
                                        <p class="text-muted mb-0 fs-12">Petey Cruiser finished task <a href="javascript:void(0)" class="fw-semibold"> Integrated management</a></p>
                                    </div>
                                    <div class="ms-auto d-md-flex me-3">
                                        <a href="javascript:void(0)" class="text-muted me-2"><span class="fe fe-edit"></span></a>
                                        <a href="javascript:void(0)" class="text-muted"><span class="fe fe-trash-2"></span></a>
                                    </div>
                                </li>
                                <li class="d-sm-flex">
                                    <div>
                                        <i class="task-icon1"></i>
                                        <h6 class="fw-semibold">Task Overdue<span class="text-muted fs-11 mx-2 fw-normal">29 June 2021</span></h6>
                                        <p class="text-muted mb-0 fs-12">Petey Cruiser finished task <a href="javascript:void(0)" class="fw-semibold"> Integrated management</a></p>
                                    </div>
                                    <div class="ms-auto d-md-flex me-3">
                                        <a href="javascript:void(0)" class="text-muted me-2"><span class="fe fe-edit"></span></a>
                                        <a href="javascript:void(0)" class="text-muted"><span class="fe fe-trash-2"></span></a>
                                    </div>
                                </li>
                                <li class="d-sm-flex">
                                    <div>
                                        <i class="task-icon1"></i>
                                        <h6 class="fw-semibold">Task Finished<span class="text-muted fs-11 mx-2 fw-normal">09 July 2021</span></h6>
                                        <p class="text-muted fs-12">Adam Berry finished task on<a href="javascript:void(0)" class="fw-semibold"> Project Management</a></p>
                                    </div>
                                    <div class="ms-auto d-md-flex me-3">
                                        <a href="javascript:void(0)" class="text-muted me-2"><span class="fe fe-edit"></span></a>
                                        <a href="javascript:void(0)" class="text-muted"><span class="fe fe-trash-2"></span></a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--/Sidebar-right-->
--%>

        <!-- FOOTER -->
        <footer class="footer">
            <div class="container">
                <div class="row align-items-center flex-row-reverse">
                    <div class="col-md-12 col-sm-12 text-center">
                        Copyright © <span id="year"></span> <a href="javascript:void(0)">Cube Billing System</a>. Designed with <span class="fa fa-heart text-danger"></span> by <a href="javascript:void(0)"> Cube SoftTech Co., Ltd. </a> All rights reserved.
                    </div>
                </div>
            </div>
        </footer>
        <!-- FOOTER CLOSED -->
    </div>

    <!-- BACK-TO-TOP -->
    <a href="#top" id="back-to-top"><i class="fa fa-angle-up"></i></a>

    <!-- JQUERY JS -->
    <script src="/assets/js/jquery.min.js"></script>

    <!-- BOOTSTRAP JS -->
    <script src="/assets/plugins/bootstrap/js/popper.min.js"></script>
    <script src="/assets/plugins/bootstrap/js/bootstrap.min.js"></script>

    <!-- INPUT MASK JS-->
    <script src="/assets/plugins/input-mask/jquery.mask.min.js"></script>

    <!-- SIDE-MENU JS -->
    <script src="/assets/plugins/sidemenu/sidemenu.js"></script>

	<!-- TypeHead js -->
	<script src="/assets/plugins/bootstrap5-typehead/autocomplete.js"></script>
    <script src="/assets/js/typehead.js"></script>

    <!-- SIDEBAR JS -->
    <script src="/assets/plugins/sidebar/sidebar.js"></script>
    
    <!-- DATA TABLE JS-->
	<script src="/assets/plugins/datatable/js/jquery.dataTables.min.js"></script>
	<script src="/assets/plugins/datatable/js/dataTables.bootstrap5.js"></script>
	<script src="/assets/plugins/datatable/js/dataTables.buttons.min.js"></script>
	<script src="/assets/plugins/datatable/js/buttons.bootstrap5.min.js"></script>
	<script src="/assets/plugins/datatable/js/jszip.min.js"></script>
	<script src="/assets/plugins/datatable/pdfmake/pdfmake.min.js"></script>
	<script src="/assets/plugins/datatable/pdfmake/vfs_fonts.js"></script>
	<script src="/assets/plugins/datatable/js/buttons.html5.min.js"></script>
	<script src="/assets/plugins/datatable/js/buttons.print.min.js"></script>
	<script src="/assets/plugins/datatable/js/buttons.colVis.min.js"></script>
	<script src="/assets/plugins/datatable/dataTables.responsive.min.js"></script>
	<script src="/assets/plugins/datatable/responsive.bootstrap5.min.js"></script>
	<script src="/assets/js/table-data.js"></script>

    <!-- Select2 JS-->
    <script src="/assets/plugins/select2/select2.full.min.js"></script>
    <script src="/assets/js/select2.js"></script>

    <!-- Perfect SCROLLBAR JS-->
    <script src="/assets/plugins/p-scroll/perfect-scrollbar.js"></script>
    <script src="/assets/plugins/p-scroll/pscroll.js"></script>
    <script src="/assets/plugins/p-scroll/pscroll-1.js"></script>

    <!-- Color Theme js -->
    <script src="/assets/js/themeColors.js"></script>

    <!-- Sticky js -->
    <script src="/assets/js/sticky.js"></script>

    <!-- CUSTOM JS -->
    <script src="/assets/js/custom.js"></script>
    
    <!-- Edit table -->
    <script src="/assets/plugins/edit-table/bst-edittable.js"></script>
    <script src="/assets/plugins/edit-table/edit-table.js"></script>

	
	<!-- SWEET-ALERT JS -->
    <script src="/assets/plugins/sweet-alert/sweetalert.min.js"></script>
    <script src="/assets/js/sweet-alert.js"></script>
    
    <!-- file upload -->
    <script src="/assets/plugins/fileuploads/js/fileupload.js"></script>
    <script src="/assets/plugins/fileuploads/js/file-upload.js"></script>
    <script src="/assets/plugins/fancyuploder/jquery.ui.widget.js"></script>
    <script src="/assets/plugins/fancyuploder/jquery.fileupload.js"></script>
    <script src="/assets/plugins/fancyuploder/jquery.iframe-transport.js"></script>
    <script src="/assets/plugins/fancyuploder/jquery.fancy-fileupload.js"></script>
    <script src="/assets/plugins/fancyuploder/fancy-uploader.js"></script>
    
     <!-- INTERNAL Bootstrap-Datepicker js-->
    <script src="/assets/plugins/bootstrap-daterangepicker/daterangepicker.js"></script>
    <script src="/assets/plugins/bootstrap-datepicker/bootstrap-datepicker.js"></script>
    
    <!-- BOOTSTRAP-DATERANGEPICKER JS -->
    <script src="/assets/plugins/bootstrap-daterangepicker/moment.min.js"></script>
    <script src="/assets/plugins/bootstrap-daterangepicker/daterangepicker.js"></script>
    
    <!-- TIMEPICKER JS -->
    <script src="/assets/plugins/time-picker/jquery.timepicker.js"></script>
    <script src="/assets/plugins/time-picker/toggles.min.js"></script>
    
    <!-- DATEPICKER JS -->
    <script src="/assets/plugins/date-picker/date-picker.js"></script>
    <script src="/assets/plugins/date-picker/jquery-ui.js"></script>
    <script src="/assets/plugins/input-mask/jquery.maskedinput.js"></script>
    
    <!-- FORMELEMENTS JS -->
    <script src="../assets/js/formelementadvnced.js"></script>
    <script src="../assets/js/form-elements.js"></script>
    

</body>

</html>

