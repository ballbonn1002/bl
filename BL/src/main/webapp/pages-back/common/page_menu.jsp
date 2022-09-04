<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<script src="js/app-ajax.js" type="text/javascript"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style>
	input[type="checkbox"] {
		accent-color: #0275d8;
	}
	#page_group{
     	font-weight: bold;
	}
	.head-ml{
		margin-left: -10px;
	}
	
</style>
<div class="container-fluid">

<!-- PAGE-HEADER -->
<div class="page-header">
    <h1 class="page-title">Page Menu</h1>
    <div>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="javascript:void(0)">Authority</a></li>
            <li class="breadcrumb-item active" aria-current="page">Page Menu</li>
        </ol>
    </div>
</div>
<!-- PAGE-HEADER END -->
<div class="row row-cards">
    <div class="col-lg-12 col-xl-12">
		<!-- Table -->
		<div class="col-lg-12">
		<perm:permission object="authority.page_menu.view">
                    <div class="card">
                        <div class="card-body">
                        	<table class="table table-hover border-top table-bordered mb-0">
                        		<thead>
                        			<tr>
                        				<th class="col-lg-10">Page</th>
                        				<th style="text-align:center">Is Active</th>
                        			</tr>
                        		</thead>
                        		<tbody>
                        		<!-- page_group -->
                        			<c:forEach var="page_group" items="${pagemenuList}">
                        			<tr class="table-info" >
                        				<td id="page_group" style="background-color:#F1F1F1; color:#2898CB;">${page_group.group_name}</td>
                        				<td style="align-item: center; background-color:#F1F1F1;" data-order="${page_group.is_active}">
											<div class="md-checkbox-list test">
													<div class="md-checkbox" style="margin-left: 45%;">
														<input id="check${page_group.page_group_id}" type="checkbox" class="md-check" onchange="Changestatus('${page_group.page_group_id}')"
														<c:if test="${fn:contains(page_group.is_active, '1')}">checked</c:if>> 
													</div>
												</div>
										</td>
									</tr>
									
									<!-- page -->
                        			<c:forEach var="page" items="${pageList}">
                        			<tr>
							 			<td><c:if test="${(page_group.page_group_id == page.page_group_id) !=  not empty page_group_id}">${page.page_name}
							 						<c:if test="${fn:contains(page.is_page, '0')}"> 
                                                			<span class="badge badge-default" style="float:right;">Function</span>
                                                    </c:if>

                                             </c:if>
							 			</td>
										<td style="align-item: center;" data-order="${page.is_active}">
												<div class="md-checkbox-list test">
														<div class="md-checkbox" style="margin-left: 45%;">
															<input id="chk${page.page_id}" type="checkbox" class="md-check status" onchange = "Change('${page.page_id}')" 
															<c:if test="${fn:contains(page.is_active, '1')}">checked</c:if>> 
														</div>
												</div>
										</td>
									</tr>	
                        			</c:forEach>  
                        		</c:forEach>
                        		</tbody>
                        	</table>
                       </div>
                     </div>
        </perm:permission>
		</div>
</div>

</div>
</div>	
</div>	

<script>
document.querySelectorAll('table tr').forEach(function(e, i) {
    if (e.textContent.trim().length == 0) { 
        e.parentNode.removeChild(e);
    }
})
</script>

<script>
function Changestatus(pagegroup_id){
	console.log(pagegroup_id);
	const y = document.querySelector('#check'+pagegroup_id);
	console.log(y.checked);
	var pagegroup_Isactive;
	if(y.checked){
		pagegroup_Isactive = 1; 
	}
	else{
		pagegroup_Isactive = 0;	
	}
	console.log(pagegroup_Isactive);
	
        $.ajax({
        	url: "StatusCheckbox",
        	method : "POST",
			type : "JSON",
            data: {	
            			"id"	: pagegroup_id , 
            			"active" : pagegroup_Isactive,
            		},
            success: function(data){
            	//location.reload();
                //alert('Data Updated Successfully');
                console.log(data);
               // alert(data);
            }
        });
    return false;     
}
</script>

<script>
 function Change(pageid){
	  
	console.log(pageid);
	const x = document.querySelector('#chk'+pageid);
	console.log(x.checked);
	var page_Isactive;
	if(x.checked){
		page_Isactive = 1; 
	}
	else{
		page_Isactive = 0;	
	}
	console.log(page_Isactive);
        $.ajax({
        	url: "StatusCheckbox1",
        	method : "POST",
			type : "JSON",
            data: {	
            			"pageid"	: pageid , 
            			"pageactive" : page_Isactive,
            		},
            success: function(data){
                console.log(data); 
                //alert(data.page_name);
            	//alert(data);
                //alert('Data Updated Successfully');
            }
        });
    return false;    
} 

/*	$('.status').on('change',function(){
		this.value = this.checked ? 1:0;
		console.log(this.value);
	}) */
</script> 