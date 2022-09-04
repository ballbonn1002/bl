<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://www.kryogenix.org/code/browser/sorttable/sorttable.js"></script>
<script>
				$("tr:not(:first)").each(function (index ) {
					   $(this).css('animation-delay',index *0.01 +'s');
					}); 
								
</script>

<style>
.head-ml{
	margin-left: -10px;
}
/* width */
.tableModal::-webkit-scrollbar {
	width: 5px;
	height:5px
}
/* Track */
.tableModal::-webkit-scrollbar-track {
	background: #f1f1f1;
	border-radius: 2px;
}

/* Handle */
.tableModal::-webkit-scrollbar-thumb {
	background: #888;
	border-radius: 2px;
}

/* Handle on hover */
.tableModal::-webkit-scrollbar-thumb:hover {
	background: #555;
}
.tableModal::-webkit-scrollbar-track-piece:start {
  margin-top: 57px;
}
.tableModal{
  max-height:450px;  
  overflow:scroll;
}

thead.hh tr:nth-child(1) th.page-sticky {
  position: sticky;
  top: 0;
  background: white;
   z-index: 10;
}
 thead.sticky-header tr:nth-child(1) th{
    background: white;
    position: sticky;
    top: 0;
    z-index: 10;
  }
  
  tr.content {
	opacity: 0;
	animation-name: fadeIn;
	animation-duration: 2s;
	animation-iteration-count: 1;
	animation-fill-mode: forwards;
}

@
keyframes fadeIn {from { opacity:0;
	
}

to {
	opacity: 1;
}
}
  
</style>
<body>
<div class="page-header">
    <h1 class="page-title">Role Permission</h1>
    <div>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="javascript:void(0)">Authority</a></li>
            <li class="breadcrumb-item active" aria-current="page">Role Permission</li>
        </ol>
    </div>
</div>
<!-- PAGE-HEADER END -->


<div class="row row-cards">
    <div class="col-lg-12 col-xl-12">
                    <div class="card">
                    
                        <div class="card-header">
                        <h6 class="card-title">Role </h6>
                        </div>
                        <div class="card-body" style="margin-bottom: -15px">
                        <form action="updateSys_role">
                           
                               <!--   <span class="pull-right"  style="text-align: right; ">
								   		
								   </span>
								   <span class="pull-right"  style="text-align: right;margin-right:8px;">
								   		
								   </span><br><br>  -->
								   
								  
								  
                            <div class="row" >
                                <div class="form-group col-sm-6"> 
                                		<div class="mb-2">Name<span style="color:red;"> *</span></div>        
                                        <input type="text" name="Name" id="nem" class="form-control" value="${sys_roleList.name}" onkeyup="myFunction()" required>
                                        
                                   	 
                                </div>
                                <div class="form-group col-sm-6"> 
                                    <div class="mb-2">Discription</div>
                                        <input type="text" class="form-control" id="des" value="${sys_roleList.description}" name="Description"  >
                                </div>
                                <div class="col-6" style="display:none;"> 
                                    <label for="id">ID</label>
                                        <input type="text" class="form-control" value="${sys_roleList.sys_role_id}" name="id"  >
                                </div>
                            </div>
                            
                            <div  style="display:none;" id="error">
											<i class="fa fa-check-circle-o" style="color:#E7505A; ">&nbsp; You can not use this name</i>
							</div>
							<div  style="display:none;" id="pass">
											<i class="fa fa-check-circle-o" style="color:#28A745; ">&nbsp; You can  use this name</i>
							</div>
							<div  style="display:none;" id="empty">
											<i class="fa fa-check-circle-o" style="color:#E7505A; ">&nbsp; Please enter your name</i>
							</div>
							<div class="row" >
							 <div class="form-group col-12" style="text-align:right;display:none;" id="smButton"> 
                                <a href="role_management" class="btn btn-outline-secondary" type="reset" style="width:96px;margin: 0px 4px; ">cancel</a>
                                <button type="submit" class="btn btn-success" style="width:96px;" id="btn1">save</button>
                             </div>
                             </div>
                        </form>
                        </div>
                      </div>
                    </div>
                  </div>
                       
                        
<div class="row row-cards">
     	<div class="col-lg-12">
     		<div class="card">
     			 <div class="card-header">
                        <h6 class="card-title">Permission</h6>
                 </div>
                 <div class="card-body">
                 	<div class="table-responsive tablePage">
                                <table class="table  table-custom m-b-0 no-footer" style="bordercolor:#CED4DA" id="table1" class="floatThead-table">
                                    <thead style="text-align:center;" class="hh">
                                        <tr>
                                            <th style="width:30%;text-align:left;" class="page-sticky">Page</th>
                                            <th style="width:14%;" class="page-sticky">Is Active</th>
                                            <th style="width:14%;" class="page-sticky">View</th>
                                            <th style="width:14%;" class="page-sticky">Create & Update</th>
                                            <th style="width:14%;" class="page-sticky">Delete</th>
                                            <th style="width:14%;" class="page-sticky">Approve</th>
                                        </tr>
                                    </thead>
                                  
                                    
                                    <tbody>
                                    	<c:forEach var="page" items="${perList}">
                                    	
                                        <c:set var="count" value="${count+1}"></c:set>
                                    	<tr id="${count }" class="only" style="background-color:#F1F1F1;font-weight:bold;">
                                    	
                                    		<td class="" style="color:#2898CB;" >${page.group_name}
                                    		
                                    		<span id="${count }" class="custom-control custom-switch" style="float:right;">
                                    			<input type="checkbox" class="custom-control-input check-box" role="switch" id="customSwitch${page.page_group_id }" 
                                    			 onclick="tgSwitch('${page.page_group_id}','${page.sys_role_id }'); customSwitch('${page.page_group_id }');" 
                                    			<c:if test="${fn:contains(page.PG_is_active, '0')}">disabled</c:if>
                                    			<c:if test="${fn:contains(page.page_group_active, '1')}">checked</c:if>
                                    			>
  												<label class="custom-control-label" for="customSwitch${page.page_group_id }"></label>
   <script>
 $(document).ready(function () {
	 const js = document.querySelector('#customSwitch${page.page_group_id}');
	 const pt = document.querySelector('#customSwitch${page.page_group_id}');
	// console.log(js.disabled);
	 if(js.disabled==true && (pt.checked==true || pt.checked==false)){
		$("tr#${count}").hide();
 		$("tr.MITH${page.page_group_id}").hide();
 	}if(js.disabled==false){
 		if(pt.checked==true){
 			$("tr#${count}").show();
 		    $("tr.MITH${page.page_group_id}").show();
 		}else{
 			$("tr#${count}").show();
 		    $("tr.MITH${page.page_group_id}").hide();
 		}
 		
 	}
	});
 </script> 		
 <!--   <script>
 $(document).ready(function(){
	 const pt = document.querySelector('#customSwitch${page.page_group_id}');
	 console.log(pt.checked);
	 if(pt.checked==true){
		 $("tr.MITH${page.page_group_id}").show();
	 }else{
		 $("tr.MITH${page.page_group_id}").hide();
	 }
 });
 </script>			--> 			
 			
  											</span>
  											</td>	
                                    		<td></td>
                                    		<td></td>
                                    		<td></td>
                                    		<td></td>	
                                    		<td ></td>	
											 
                                    	
                                    			
                                    		
                                    		
                                    		
                                    		
                                    		
                                    	</tr>
                                    	<c:forEach var="txt" items="${permissionList }">
                                    	
                                    	<c:set var="counter" value="${counter+1}"></c:set>
                                    	<tr class="MITH${txt.page_group_id}">
                                    		<td class="ggg">
                                    		
                                    		<c:choose>
                                    			<c:when test="${(page.page_group_id == txt.page_group_id )}">
                                    				<c:out value="${txt.pname }" />
                                    				<c:if test="${fn:contains(txt.is_page, '0')}">
                                    			<span class="badge badge-default" style="float:right;">Function</span>
                                    				</c:if>
                                    			</c:when>
                                    			
                                    		</c:choose>
                                    		
                                    		</td>
                                    		 <td style="text-align: center; " data-order="${txt.page_active}" class="${txt.page_group_id }">
														<div class="md-checkbox-list ">
															<div >
																<div class="md-checkbox md-checkbox-outline" style="align:center;">
																	<input type="checkbox" id="isActive${txt.permission_id }" class="CheckBox"  onchange="changeActive('${txt.permission_id}','${txt.pid }','${txt.new_id }')" 
																	 
																		<c:if test="${fn:contains(txt.is_active, '0')}">disabled</c:if>
																		<c:if test="${fn:contains(txt.page_active, '1')}">checked</c:if>
																		
																		> 
																		
																</div>
															</div>
														</div>
											</td>
											 <td style="text-align: center; " data-order="${txt.view}" class="${txt.page_group_id }">
														<div class="md-checkbox-list ">
															<div>
																<div class="md-checkbox" style="align:center;">
																	<input type="checkbox" id="view${txt.permission_id}" class="md-check" onchange="changeView('${txt.permission_id}','${txt.pid }','${txt.new_id }')"
																		<c:if test="${fn:contains(txt.check_view, '0')}">disabled</c:if>
																		<c:if test="${fn:contains(txt.view, '1')}">checked</c:if>
																	
																		> 
																		
																		
																</div>
															</div>
														</div>
												</td>
												<td style="text-align: center; " data-order="${txt.create_update}" class="${txt.page_group_id }">
														<div class="md-checkbox-list ">
															<div>
																<div class="md-checkbox" style="align:center;">
																	<input type="checkbox" id="CreateUpdate${txt.permission_id}" class="md-check" 
																	 onchange="changeCreateUpdate('${txt.permission_id}','${txt.pid }','${txt.new_id }')"
																		<c:if test="${fn:contains(txt.check_create_update, '0')}">disabled</c:if>
																		<c:if test="${fn:contains(txt.create_update, '1')}">checked</c:if>
																		
																		> 
																		
																</div>
															</div>
														</div>
												</td>
												<td style="text-align: center; " data-order="${txt.delete_role}" class="${txt.page_group_id }">
														<div class="md-checkbox-list ">
															<div>
																<div class="md-checkbox" style="align:center;">
																	<input type="checkbox" id="Delete${txt.permission_id}" class="md-check" 
																	onchange="changeDelete('${txt.permission_id}','${txt.pid }','${txt.new_id }')"
																		<c:if test="${fn:contains(txt.check_delete, '0')}">disabled</c:if>
																		<c:if test="${fn:contains(txt.delete_role, '1')}">checked</c:if>
																		> 
																		
																</div>
															</div>
														</div>
												</td>
												<td style="text-align: center; " data-order="${txt.approve}" class="${txt.page_group_id }">
													<div class="md-checkbox-list ">
															<div>
																<div class="md-checkbox" style="align:center;">
																	<input type="checkbox" id="Approve${txt.permission_id}" class="md-check" 
																	onchange="changeApprove('${txt.permission_id}','${txt.pid }','${txt.new_id }')"
																		 
																		<c:if test="${fn:contains(txt.check_approve, '0')}">disabled</c:if>
																		<c:if test="${fn:contains(txt.approve, '1')}">checked</c:if>
																		
																		> 
																</div>
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
                      
                    
     			</div>
			</div>
</div>




<div class="row row-cards">
    <div class="col-lg-12 col-xl-12">
        <div class="card">
            <div class="card-header">
        		<h6 class="card-title">System User</h6>
                 
                                    <div class="card-options">
                                        <button data-toggle="modal" data-target="#addSys_role" class="btn btn-info" style="margin-bottom: 30px;" onclick="getModalData()">Add System User</button>
                                    </div>
                   
        	</div>
                
                    <div class="body">
                    <!-- Modal -->
						<div class="modal fade"  id="addSys_role" tabindex="-1" role="dialog">
							<div class="modal-dialog modal-dialog-centered modal-xl" role="document">
								<div class="modal-content" >
								<div class="modal-header">
									<span>
										<h6 class="title">&nbsp;System User</h6>
									</span>
									<span>
										<div class="col-md-3 col-sm-4 " data-dismiss="modal" ><a href="#"><i class="fa fa-times" style="color:#CED4DA;"></i></a></div>
									</span>
								</div>	
									<div class="modal-body">
									<div class="row"
											style="margin: 10px;max-height: 450px;  overflow: auto;">
											
										<div class="table-responsive tableModal">
                              <!--    <table class="table table-hover table-striped js-basic-example table-custom m-b-0 no-footer sortable" id="myTableModal">
                                    <thead class="sticky-header">
                                        <tr>
                                            <th><label class="fancy-checkbox"><input
												class="select-all" type="checkbox" name="checkboxAll"><span></span></label>
                                            <th style="text-align:left;">System User</th>
                                            <th style="text-align:left;">User</th>
                                            <th style="text-align:left;">ชื่อ ภาษาไทย</th>
                                            <th style="text-align:left;">Role ID</th>
                                            <th style="text-align:center;">Is Active</th>
                                        </tr>
                                    </thead>
                                    <tbody id="getSysuser">
                                    <c:forEach var="modal" items="${listModal}">
                                    <c:set var="coun" value="${coun + 1}" />
                                    	<tr class="content">
	                                    	<td style="text-align: left; padding-top: 10px;"><label
												class="fancy-checkbox"><input
												class="checkbox-tick" type="checkbox" name="checkbox"><span></span></label>
	                                    	<td style="text-align:left;" class="getSysuserId">${modal.sys_user_id}</td>
	                                    	<td style="text-align:left;">${modal.user_id}</td>
	                                    	<td style="text-align:left;">${modal.name_th}</td>
	                                    	<td style="text-align:left;" class="getSysroleId">${modal.sys_role_id}</td>
	                                    	<td style="text-align: center; " data-order="${modal.is_active}">
													<div class="md-checkbox-list ">
																<div class="md-checkbox" style="align:center;">
																	<input type="checkbox"  class="md-check" onclick="return false;"
																		<c:if test="${fn:contains(modal.is_active, '1')}">checked</c:if>> 
																</div>
														</div>
											</td>
                                   		</tr>
                                   	</c:forEach>
                                </table>-->
                                <table class="table table-hover table-striped js-basic-example table-custom m-b-0 no-footer " id="myTabletest">
                                    <thead class="sticky-header">
                                        <tr>
                                            <th><label class="fancy-checkbox"><input
												class="select-all" type="checkbox" name="checkboxAll"><span></span></label>
                                            <th style="text-align:left;">System User</th>
                                            <th style="text-align:left;">User</th>
                                            <th style="text-align:left;">ชื่อ ภาษาไทย</th>
                                            <th style="text-align:left;">Role ID</th>
                                            <th style="text-align:center;">Is Active</th>
                                        </tr>
                                    </thead>
                                    <tbody  id="getSysuser">
                                    </tbody>
                                </table>
                            </div>
									</div>
									</div>
									 <div class="modal-footer" >
							                <button type="button" class="btn btn-outline-secondary" data-dismiss="modal" style="width:96px;">cancel</button>
							                <button type="button" class="btn btn-success" onclick="call_submit()" id="btn1" style="width:96px;" >select</button>
							             
    
							         </div>
								</div>
							</div>
						</div>
						<!-- END MODAL -->
                            <div class="table-responsive">
                                <table class="table table-hover table-striped js-basic-example table-custom m-b-0 no-footer" id="myTable">
                                    <thead>
                                        <tr>
                                            <th style="text-align:left;">#</th>
                                            <th style="text-align:left;">System User</th>
                                            <th style="text-align:left;">User</th>
                                            <th style="text-align:left;">ชื่อ ภาษาไทย</th>
                                            <th style="text-align:center;">Is Active</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody id="getData">
                                    <c:forEach var="list" items="${sys_userList}">
                                    <c:set var="coun" value="${coun + 1}" />
                                    	<tr class="remove${list.sys_user_id}">
	                                    	<td style="text-align:left;">${coun}</td>
	                                    	<td style="text-align:left;">${list.sys_user_id}</td>
	                                    	<td style="text-align:left;">${list.user_id}</td>
	                                    	<td style="text-align:left;">${list.name_th}</td>
	                                    	<td style="text-align: center; " data-order="${list.is_active}">
													<div class="md-checkbox-list ">
															<div>
																<div class="md-checkbox" style="align:center;">
																	<input type="checkbox"  class="md-check" onclick="return false;"
																		<c:if test="${fn:contains(list.is_active, '1')}">checked</c:if>> 
																</div>
															</div>
														</div>
											</td>
											<td style="text-align: right;">
												<a class="btn btn-outline-danger sred-intense move${coun}" title="remove">
                                        				<i class="fa fa-unlink"></i></a>	 	
											</td>
                                   		</tr>
                                   		<script>
                                   		$('.move${coun}').on('click',function(){
											swal({
											      title: "Are you sure!",
											      text: "You will remove this user!",
											      type: "info",
											      showCancelButton: true,
											      confirmButtonClass: 'btn-primary',
											      confirmButtonText: 'OK'
										    }, function (inputValue) {
										        if (inputValue === false) return false;
										        if (inputValue === "") {
										          return false
										        }
										        let run  = "${list.sys_user_id}";
										        let role = "${list.sys_role_id}";
										        //const js = document.querySelector('.remove${list.sys_user_id}'); 
										        console.log(run);
										        console.log(role);
										        console.log('.remove${list.sys_user_id}');
										        //console.log(${test.position_id});
										        $.ajax({url: "removeSysuer",method: "POST",
													data: {"sysuerId" : run},
														success:function(data){
															//document.location = "position_list";
															//console.log(data);
															window.location.reload();
															
													}})
										        //document.location = "position_delete?position_id=${test.position_id}";   //?id คือ parameter
										      });
										});
                                   		</script>
                                   	</c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            
                        </div>
                    </div>

                </div>

            </div>
        
</body>

<script>
$(document).ready(function(){
	//$("#smButton").hide();
	$("#nem, #des").on("keyup",function(){
		$("#smButton").show();
	});
});
</script> 


   <script>
document.querySelectorAll('table tr').forEach(function(e, i) {
    if (e.textContent.trim().length == 0) { // if row is empty
        e.parentNode.removeChild(e);
    }
})
</script>
 <script>
function customSwitch(group_id){
	 const js = document.querySelector('#customSwitch'+group_id);
	 console.log(js.checked);
	 if(js.checked==true){
		 $("tr.MITH"+group_id).fadeIn();
 	}else{
 		$("tr.MITH"+group_id).fadeOut();
 	}
}
</script>
 <script>
function changeActive(permissionId,pageId,sysroleId){
	const x = document.querySelector('#isActive'+permissionId);
	//console.log(x.checked);
	//console.log(x);
	console.log("pageId: "+pageId);
	console.log("roleId: "+sysroleId);
	var pageActive;
	
	if(x.checked){
		pageActive=1;
	}else{
		pageActive=0;
	}
	//console.log(pageActive);
	//console.log(pageId);
	
	console.log(permissionId);
	console.log(pageActive);
     
    	   $.ajax({
  			   url: "changeActive",
  			   method:"POST",
          	   type: "text",
          	   data: {  "permission_Id": permissionId,
    		         	"pId":pageId,
      		        	"roleId":sysroleId,
          		 		"Active":pageActive
          		  	  },
          	 
          	   success: function(data){
          		// alert(data);
          		 console.log(data);
          		 
          	   }
          	}); 
       return false;
        
}
 </script>    
 
 <script>
 function changeView(permissionId,pageId,sysroleId){
	 const x = document.querySelector('#view'+permissionId);
		//console.log(x.checked);
		console.log("pageId: "+pageId);
		console.log("roleId: "+sysroleId);
		var pageView;
		if(x.checked){
			pageView=1;
		}else{
			pageView=0;
		}
		//console.log(pageView);
		//console.log(permissionId);
		
		
	
	    	   $.ajax({
	  			   url: "changeView",
	  			   method:"POST",
	          	   type: "JSON",
	          	   data: {  "permission_Id": permissionId,
	          		         "pId":pageId,
	          		         "roleId":sysroleId,
	          		 		// "Active":pageActive,
	          				"View":pageView
	          				/*"pageCreateUpdate":pageCreateUpdate,
	          				"pageDelete":pageDelete,*/
	          		  	  },
	          	 
	          		  	success: function(data){
	                 		// alert(data);
	                 		 console.log(data);
	          	   }
	          	}); 
	       return false;
	        
	}
 </script>
 <script>
 function changeCreateUpdate(permissionId,pageId,sysroleId){
	 const x = document.querySelector('#CreateUpdate'+permissionId);
		console.log(x.checked);
		var pageCreateUpdate;
		if(x.checked){
			pageCreateUpdate = 1;
		}else{
			pageCreateUpdate = 0;
		}
		console.log(pageCreateUpdate);
		
		
	
	    	   $.ajax({
	  			   url: "changeCreateUpdate",
	  			   method:"POST",
	          	   type: "JSON",
	          	   data: {  "permission_Id": permissionId,
        		         "pId":pageId,
          		         "roleId":sysroleId,
	          		 		
	          				"CreateUpdate":pageCreateUpdate,
	          			//	"pageDelete":pageDelete,
	          		  	  },
	          	 
	          		  	success: function(data){
	                 		// alert(data);
	                 		 console.log(data);
	          	   }
	          	});
	       return false;
	        
	}
 </script>
 <script>
 function changeDelete(permissionId,pageId,sysroleId){
	 const x = document.querySelector('#Delete'+permissionId);
		console.log(x.checked);
		var pageDelete;
		if(x.checked){
			pageDelete = 1;
		}else{
			pageDelete = 0;
		}
		console.log(pageDelete);
		
	
	    	   $.ajax({
	  			   url: "changeDelete",
	  			   method:"POST",
	          	   type: "JSON",
	          	   data: {  "permission_Id": permissionId,
      		         		"pId":pageId,
      		         		"roleId":sysroleId,
	          				"Delete":pageDelete,
	          		  	  },
	          	 
	          		  	success: function(data){
	                 		// alert(data);
	                 		 console.log(data);
	          	   }
	          	}); 
	       return false;
	        
	}
 </script>
 <script>
 function changeApprove(permissionId,pageId,sysroleId){
	 const x = document.querySelector('#Approve'+permissionId);
		console.log(x.checked);
		var pageApprove;
		if(x.checked){
			pageApprove = 1;
		}else{
			pageApprove = 0;
		}
		console.log(pageApprove);
	
	    	   $.ajax({
	  			   url: "changeApprove",
	  			   method:"POST",
	          	   type: "JSON",
	          	   data: {  "permission_Id": permissionId,
 		         		"pId":pageId,
  		         		"roleId":sysroleId,
	          				"Approve":pageApprove,
	          		  	  },
	          	 
	          		  	success: function(data){
	                 		// alert(data);
	                 		 console.log(data);
	          	   }
	          	}); 
	       return false;
	        
	}
 </script>
 <script>
 function tgSwitch(page_group_id,sys_role_id){
	 const x = document.querySelector('#customSwitch'+page_group_id);
		console.log(x.checked);
		console.log(page_group_id);
		console.log(sys_role_id);
		var tg_status;
		if(x.checked){
			tg_status = 1;
		}else{
			tg_status = 0;
		}
		console.log(tg_status);
	
	    	   $.ajax({
	  			   url: "changeStatus",
	  			   method:"POST",
	          	   type: "JSON",
	          	   data: {  "page_group_id": page_group_id,
	          				"sys_role_id":sys_role_id,
	          				"status":tg_status
	          		  	  },
	          	 
	          	   success: function(data){
	                    //  alert(data);
	                      console.log(data);
	          	   }
	          	}); 
	       return false;
	        
	}
 </script>
 <script>
 function myFunction() {
	  var x = $("#nem").val();
	  console.log(x);
	  if(x != ""){
	    	$.ajax({
				url : "findName",
				method : "POST",
				type : "JSON",
				data : {
					"value" : x
				},
				success : function(data) {
					console.log(data);
					if (data.toString().indexOf("1") != -1) {
						$("#pass").hide();
						$("#error").show();
						$("#empty").hide();
						$(':input[type="submit"]').prop('disabled', true);
					}
					 else {
						$("#pass").show();
						$("#error").hide();
						$("#empty").hide();
						$(':input[type="submit"]').prop('disabled', false);
					}

				}
			})
	    }else{
	    	$("#pass").hide();
			$("#error").hide();
			$("#empty").show();
			$(':input[type="submit"]').prop('disabled', false);
		}
	}
 </script>
<script>
$(document).ready(function(){
	var t = $('#myTable').DataTable({
	 	"bPaginate": false,
	  	"bLengthChange": false,
	  	"bFilter": true,
	  	"bInfo": false,
	  	"bAutoWidth": false,
	    "ordering": true,
			language: {
 				search: " ",
	        	searchPlaceholder: "Search" 
	   		} ,
	   	 columnDefs: [
	            {
	                searchable: false,
	                orderable: true,
	                targets: 0,
	            },
	        ],
	        order: [[1, 'asc']],
	    });
	 
	    t.on('order.dt search.dt', function () {
	        let i = 1;
	 
	        t.cells(null, 0, { search: 'applied', order: 'applied' }).every(function (cell) {
	            this.data(i++);
	        });
	    }).draw();
});	
</script>
<script>
function call_submit(){
	let getSysuerList = [];
	var role = $('#nem').val();
	console.log(role);
	$('#getSysuser tr').each(function() {
		$(this).find(".checkbox-tick:checked").each(function() {
			let values = { 'sys_user_id' :  $(this).closest("tr").find('td.getSysuserId').text() }
			getSysuerList.push(values);
		});
	});
	console.log(getSysuerList);
	$.ajax({
		method : "POST",
		url: "updateRole_Sysuser",
		type: "JSON",
		data : {
			"sysuserList" : JSON.stringify(getSysuerList),
			"role" : role
		},
		success : function(data){
			console.log(data);
			window.location.href = "edit_SysRole?sys_role_id=" + data;
		}
	})
}
</script>
<script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTableModal tr.content").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>
<script>
/*$(document).ready(function(){
	  $(".page-sticky").floatThead({top:100});
	});*/
</script>
<script>
var table;
$(document).ready(function() {
	$.fn.dataTable.ext.errMode = 'none';
	table =	$('#myTabletest').DataTable({
		"bPaginate": false,
	  	"bLengthChange": false,
	  	"bFilter": true,
	  	"bInfo": false,
	  	"bAutoWidth": true,
			language: {
 				search: " ",
	        	searchPlaceholder: "Search" 
	   		},
	   		columns: [
	            	{data : ""},
	            	{data:  "sys_user_id"},
	            	{data : "user_id" },
	            	{data : "name_th" },
	            	{data : "sys_role_id" },
	            	{data : "is_active" }
	                ],
	                columnDefs:
	 	                 [{
	 	                     "targets": 0,
	 	                      "className": 'text-left',
	 	                     "render": function (data, type, row, meta) {
	 	                             return '<label class="fancy-checkbox"><input class="checkbox-tick" type="checkbox" name="checkbox"><span></span></label>';
										
	 	                     }			
	 	                       },
	 	                      {
	 		 	                "targets": 1,
	 		 	                 "className": 'text-left getSysuserId'	
	 		 	                },
	 		 	                {
	 		 	                	"targets" : [2,3,4],
	 		 	                	"className": 'text-left'
	 		 	                	
		 	                     }	,	
	 		 	              {
		 		 	           "targets": 5,
		 		 	           "data": 'is_active',
		 		 	           "className": 'text-center',
		 		 	           "render": function (data, type, row, meta) {
		 		 	        	 if(data == "0"){
		 		 	               return '<input type="checkbox" class="checkbox_check" onclick="return false;">';
		 		 	        	 }else if(data =="1"){
		 		 	               return '<input type="checkbox" checked class="checkbox_check" onclick="return false;">';
		 		 	           }else{
		 		 	        	 return '<input type="checkbox" class="checkbox_check" onclick="return false;">';
		 		 	           }
		 		 	        	 
 	                     }	
		 		 	                }]
	});
});
</script>
<script>
function getModalData(){
	var name = $("#nem").val();
	table.clear().draw();
	console.log(name);
	$.ajax({
		url:"listofNotEqualSysuser",
		method:"POST",
		type:"JSON",
		data:{
			"name":name
		},
		success:function(data){
			console.log(data);
			console.log(data.length);
			if(data.length > 0){
				table.clear().rows.add(data).draw(); 
			}
		}
	})
}
</script>