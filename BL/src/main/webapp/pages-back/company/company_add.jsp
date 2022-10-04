<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>
<script src="/assets/plugins/fileuploads/js/fileupload.js"></script>
<script src="/assets/plugins/fileuploads/js/file-upload.js"></script>
<div class="page-header">
    <h1 class="page-title">Company Management</h1>
    <div>
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="javascript:void(0)">Company</a></li>
            <li class="breadcrumb-item active" aria-current="page">Company Management</li>
        </ol>
    </div>
</div>
<form action="add" method="POST" enctype="multipart/form-data">
<div class="card">
	<div class="card-header">
		<div class="card-title">Company Information</div>
	</div>
	<div class="card-body">
		<div class="row">
			<div class="col-lg-4 col-sm-12 mb-4 mb-lg-0" ></div>
			<div class="col-lg-4 col-sm-12 mb-4 mb-lg-0" >
           		<input style="text-align:center;"  name="fileUpload" id="fileUpload" type="file" class="dropify" accept="image/x-png,image/gif,image/jpeg" data-max-width="1000"/>
           		<input style="display:none;" id="filesize" name="filesize" type="text" value="">
    		</div>

    	<div class="col-sm-6 " style="margin-top:30px">
			<div class="form-group">
					<label class="form-label">Company Code<span style="color:red;"> *</span></label> 
					<div class="input-group mb-3">
							<input type="text" id="code" class="form-control" name="code" required>  
                    </div>  
              </div>
         </div>
         <div class="col-sm-6 " style="margin-top:30px">
			<div class="form-group">
					<label class="form-label">Tax ID<span style="color:red;"> *</span></label> 
					<div class="input-group mb-3">
							<input type="text" class="form-control" name="tax" id="tax" required>  
                    </div>  
              </div>
         </div>
         <div class="col-sm-6 ">
			<div class="form-group">
					<label class="form-label">Company Name EN<span style="color:red;"> *</span></label> 
					<div class="input-group mb-3">
							<input type="text" class="form-control" name="name_en" id="name_en" required>  
                    </div>  
              </div>
         </div>
         <div class="col-sm-6 ">
			<div class="form-group">
					<label class="form-label">Company Name TH<span style="color:red;"> *</span></label> 
					<div class="input-group mb-3">
							<input type="text" class="form-control" name="name_th" id="name_th" required>  
                    </div>  
              </div>
         </div>
         <div class="col-sm-6 ">
			<div class="form-group">
					<label class="form-label">Industry<span style="color:red;"> *</span></label> 
					<select class="form-control form-select select2" data-placeholder="Select" name="industry" id="industry" required>
						<option label = "Select"></option>
						<option value="0">Agro & Food Industry</option>
						<option value="1">Consumer Products</option>
						<option value="2">Financials</option>
						<option value="3">Industrials</option>
						<option value="4">Property & Construction</option>
						<option value="5">Resources</option>
						<option value="6">Services</option>
						<option value="7">Technology</option>
					</select> 
              </div>
         </div>
         <div class="col-sm-6 ">
			<div class="form-group">
					<label class="form-label">Status<span style="color:red;"> *</span></label> 
					<select class="form-control select2 form-select" data-placeholder="Select" name="status" id="status" required>
						<option label = "Select"></option>
						<option value="0">Customers</option>
						<option value="1">Partners</option>
						<option value="2">Financial</option>
						<option value="3">Legal</option>
						<option value="4">Leadership and Peer Mentors</option>
						<option value="5">Employees</option>
					</select> 
              </div>
         </div>
         <div class="col-sm-12 ">
			<div class="form-group">
					<label class="form-label">Website</label> 
					<div class="input-group mb-3">
							<input type="text" class="form-control" name="website" id="website">  
                    </div>  
              </div>
         </div>
         <div class="col-sm-2">
         	<label class="custom-control custom-checkbox">
               <input name="is_active" type="checkbox" class="custom-control-input" name="is_active" id="is_active"><span class="form-label">&nbsp;Is_Active</span>
               <span class="custom-control-label"></span>
            </label>
         </div>
	</div>
	</div>
</div>
<div  style="text-align: right; margin-top: 1rem; margin-bottom: 1.5rem;">
	<a href="company_list" type="button" class="btn btn-default" style="min-width: 5%;">Cancel</a>
	<button type="submit" id="submit" class="btn btn-success" onclick="redirect()" style="min-width: 5%;">Save</button>
</div>
</form>
<script>
function redirect(){
    window.location.href = "company_edit.jsp";
    return false;
}
</script>
<script>
$('#fileUpload').bind('change', function() {
	 var fs;
	 var size = this.files[0].size;
	 fs = $("#filesize").val(size);
	 console.log(fs);
})
</script>
<script>
 $('.dropify').dropify();
</script>