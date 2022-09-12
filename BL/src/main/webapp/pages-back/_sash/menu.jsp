<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

 
<ul class="side-menu">
    <li class="sub-category">
        <h3>Main</h3>
    </li>
    <li class="slide">
        <a class="side-menu__item has-link" data-bs-toggle="slide" href="dashboard"><i class="side-menu__icon fe fe-home"></i><span class="side-menu__label">Dashboard</span></a>
        <a class="side-menu__item has-link" data-bs-toggle="slide" href="page_test"><i class="side-menu__icon fe fe-home"></i><span class="side-menu__label">Page Test</span></a>
    </li>
    <li class="sub-category">
        <h3>Documents</h3>
    </li>
    <li class="slide">
        <a class="side-menu__item" data-bs-toggle="slide" href="javascript:void(0)"><i class="side-menu__icon fe fe-slack"></i><span class="side-menu__label">Quotation</span><i class="angle fe fe-chevron-right"></i></a>
        <ul class="slide-menu">
            <li class="side-menu-label1"><a href="javascript:void(0)">Quotation</a></li>
            <li><a href="quotation_list" class="slide-item"> Quotation_list</a></li>
            <li><a href="test" class="slide-item"> test</a></li>
            <li><a href="#" class="slide-item"> Xxxxx Xxxxx</a></li>
            <li><a href="#" class="slide-item"> Xxxxx Xxxxx</a></li>
            <li><a href="#" class="slide-item"> Xxxxx Xxxxx</a></li>
            

        </ul>
    </li>
    
    <li class="slide">
        <a class="side-menu__item" data-bs-toggle="slide" href="javascript:void(0)"><i class="side-menu__icon fe fe-layers"></i><span class="side-menu__label">Invoice</span><i class="angle fe fe-chevron-right"></i></a>
        <ul class="slide-menu">
            <li class="side-menu-label1"><a href="javascript:void(0)">Invoice</a></li>
            <li><a href="#" class="slide-item"> Xxxxx Xxxxx</a></li>
            <li><a href="#" class="slide-item"> Xxxxx Xxxxx</a></li>
            <li><a href="#" class="slide-item"> Xxxxx Xxxxx</a></li>
            <li><a href="#" class="slide-item"> Xxxxx Xxxxx</a></li>
            <li><a href="#" class="slide-item"> Xxxxx Xxxxx</a></li>
            

        </ul>
    </li>
    
    
    <li>
        <a class="side-menu__item has-link" href="#" target="_blank"><i
                class="side-menu__icon fe fe-zap"></i><span
                class="side-menu__label">Landing Page</span><span class="badge bg-green br-5 side-badge blink-text pb-1">New</span></a>
    </li>

    <li class="sub-category">
        <h3>Authority</h3>
    </li>
    <li class="slide">
        <a class="side-menu__item" data-bs-toggle="slide" href="javascript:void(0)"><i class="side-menu__icon fe fe-users"></i><span class="side-menu__label">User</span><i class="angle fe fe-chevron-right"></i></a>
        <ul class="slide-menu">
            <li class="side-menu-label1"><a href="javascript:void(0)">User</a></li>
            <li><a href="SystemUser_list" class="slide-item"> User Management</a></li>
            <li><a href="SystemUser_add" class="slide-item"> User Profile Add</a></li>
            
        </ul>
        <a class="side-menu__item" data-bs-toggle="slide" href="javascript:void(0)"><i class="side-menu__icon fe fe-users"></i><span class="side-menu__label">Role</span><i class="angle fe fe-chevron-right"></i></a>
        <ul class="slide-menu">
            <li class="side-menu-label1"><a href="javascript:void(0)">Role</a></li>
            <li><a href="role_management" class="slide-item"> Role Management</a></li>
            <li><a href="#" class="slide-item"> Add Role</a></li>
            
        </ul>
    </li>
    
    <li>
        <a class="side-menu__item has-link" href="page_menu" ><i
                class="side-menu__icon fe fe-layers"></i><span
                class="side-menu__label">Page Menu</span><span class="badge bg-green br-5 side-badge blink-text pb-1">demo</span></a>
    </li>
    
    <li class="sub-category">
        <h3>------------------</h3>
    </li>
</ul>
         