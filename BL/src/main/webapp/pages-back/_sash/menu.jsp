<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

 
<ul class="side-menu">
    <li class="slide">
        <a class="side-menu__item has-link" data-bs-toggle="slide" href="dashboard"><i class="side-menu__icon fe fe-home"></i><span class="side-menu__label">Dashboard</span></a>
    </li>
    <li class="sub-category">
        <h3>Documents</h3>
    </li>
    
     <li class="slide">
        <a class="side-menu__item" data-bs-toggle="slide" href="javascript:void(0)"><i class="side-menu__icon fe fe-shopping-bag"></i><span class="side-menu__label">Billing</span><i class="angle fe fe-chevron-right"></i></a>
        <ul class="slide-menu">
        	<li><a href="quotation_list" class="slide-item"> Quotation</a></li>
            <li><a href="#" class="slide-item"> Invoice</a></li>
            <li><a href="test" class="slide-item"> test</a></li>
        </ul>
    </li>
    <li class="slide">
        <a class="side-menu__item" data-bs-toggle="slide" href="company_list"><i class="side-menu__icon fe fe-users"></i><span class="side-menu__label">Company</span></a>
 	</li>
 	
    <li class="sub-category">
        <h3>Master</h3>
    </li>
    <li class="slide">
        <a class="side-menu__item" data-bs-toggle="slide" href="javascript:void(0)"><i class="side-menu__icon fe fe-layers"></i><span class="side-menu__label">Master</span><i class="angle fe fe-chevron-right"></i></a>
        <ul class="slide-menu">
            <li><a href="#" class="slide-item"> User</a></li>
            <li><a href="position_list" class="slide-item"> Position</a></li>
            <li><a href="department_list" class="slide-item"> Department</a></li>
        </ul>
     </li>
     
     <li class="sub-category">
        <h3>Authority</h3>
    </li>
    <li class="slide">
    	<a class="side-menu__item" data-bs-toggle="slide" href="SystemUser_list"><i class="side-menu__icon fe fe-layers"></i><span class="side-menu__label">Sys User</span></a>
        <a class="side-menu__item" data-bs-toggle="slide" href="role_management"><i class="side-menu__icon fe fe-layers"></i><span class="side-menu__label">Role</span></a>
        <a class="side-menu__item" data-bs-toggle="slide" href="page_menu"><i class="side-menu__icon fe fe-layers"></i><span class="side-menu__label">Page menu</span></a>
    </li>
</ul>
         