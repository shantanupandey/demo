
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">
  <link rel="shortcut icon" href="images/favicon.png" type="image/png">

  <title>Assentisk Admin Theme</title>

  <link href="css/custom.css" rel="stylesheet">

  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->
</head>

<body>


<section>

  <div class="leftpanel">

    <div class="logopanel">
        <h1><img src="images/logo.png"/></h1>
    </div><!-- logopanel -->

    <div class="leftpanelinner">
      <ul class="nav nav-pills nav-stacked nav-bracket">
        <li class="active"><a href="index.html"><i class="fa fa-home"></i> <span>Dashboard</span></a></li>
        <li><a href="#"><i class="fa fa-envelope-o"></i> <span>Company</span></a></li>
        <li><a href="#"><i class="fa fa-edit"></i> <span>Forms</span></a> </li>
        <li><a href="#"><i class="fa fa-suitcase"></i> <span>Admin Users</span></a></li>
        <li><a href="#"><i class="fa fa-th-list"></i> <span>Company Master List</span></a></li>        
        <li><a href="#"><i class="fa fa-map-marker"></i> <span>Assentisk License</span></a></li>
        <li class="nav-parent"><a href=""><i class="fa fa-file-text"></i> <span>Risk Modules</span></a>
          <ul class="children">
            <li><a href="#"><i class="fa fa-caret-right"></i> HIPPA</a></li>
            <li><a href="#"><i class="fa fa-caret-right"></i>SOX</a></li>
            <li><a href="#"><i class="fa fa-caret-right"></i> PCI DSS</a></li>           
          </ul>
        </li>   
         <li><a href="#"><i class="fa fa-map-marker"></i> <span>Assentisk Tests</span></a></li>		
      </ul>
    </div><!-- leftpanelinner -->
  </div><!-- leftpanel -->

  <div class="mainpanel">
    <div class="headerbar">
	   <a href="#" style="" class="logo-thumb"><img src="images/logo-thumb.png"/></a>
      <a class="menutoggle"><i class="fa fa-bars"></i></a>
	   <a href="#" style="" class="ajax-loader"><img src="images/ajax-loader.gif"/></a>
      <form class="searchform" action="index.html" method="post">
        <input type="text" class="form-control" name="keyword" placeholder="Search here..." />
      </form>
      <div class="header-right">
        <ul class="headermenu">
          <li>
            <div class="btn-group">
              <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                <img src="images/loggeduser.png" alt="" />
                John Doe
                <span class="caret"></span>
              </button>
              <ul class="dropdown-menu dropdown-menu-usermenu pull-right">
                <li><a href="#"><i class="glyphicon glyphicon-user"></i> My Profile</a></li>
                <li><a href="#"><i class="glyphicon glyphicon-cog"></i> Account Settings</a></li>
                <li><a href="#"><i class="glyphicon glyphicon-question-sign"></i> Help</a></li>
                <li><a href="#"><i class="glyphicon glyphicon-log-out"></i> Log Out</a></li>
              </ul>
            </div>
          </li>        
        </ul>
      </div><!-- header-right -->

    </div><!-- headerbar -->

    <div class="pageheader">
      <h2>Table View</h2>
      <div class="breadcrumb-wrapper">
        <span class="label">You are here:</span>
        <ol class="breadcrumb">
          <li><a href="index.html">Assentisk</a></li>
          <li class="active">Dashboard</li>
        </ol>
      </div>
    </div>

   <div class="contentpanel">
      <div class="panel panel-default">
        <div class="panel-heading">
          <div class="panel-btns">
            <a href="" class="panel-close">×</a>
            <a href="" class="minimize">−</a>
          </div><!-- panel-btns -->
          <h3 class="panel-title">Data Tables</h3>
          <p>DataTables is a plug-in for the jQuery Javascript library. It is a highly flexible tool, based upon the foundations of progressive enhancement, which will add advanced interaction controls to any HTML table.</p>
        </div>
        <div class="panel-body">
          <div class="table-responsive">
            <div id="table1_wrapper" class="dataTables_wrapper no-footer">
			<div class="dataTables_length" id="table1_length">
			<label>Show <div class="select2-container" id="s2id_autogen1">
			<a href="javascript:void(0)" class="select2-choice" tabindex="-1"> 
      			<span class="select2-chosen" id="select2-chosen-2">10</span>
			</a>			
			</div>
			<select name="table1_length" aria-controls="table1" class="select2-offscreen" tabindex="-1" title="">
			  <option value="10">10</option>
			</select> entries</label>
			
			</div>
			
			<div id="table1_filter" class="dataTables_filter">
			  <label>Search:<input type="search" class="" placeholder="" aria-controls="table1"></label>
			</div>
			
			<table class="table dataTable no-footer" id="table1" role="grid" aria-describedby="table1_info">
              <thead>
                 <tr role="row">
				   <th   rowspan="1" colspan="1"  style="width: 215px;">Username</th>
				   <th   rowspan="1" colspan="1"  style="width: 330px;">Date Registered</th>
				   <th   rowspan="1" colspan="1"  style="width: 203px;">Role</th>
				   <th  rowspan="1" colspan="1"  style="width: 183px;">Status</th>
				   <th   rowspan="1" colspan="1"  style="width: 232px;">Action</th>
				  </tr>
              </thead>
              <tbody>
           
              <tr class="gradeA odd" role="row">
                    <td class="sorting_1">Adam Alister</td>
                    <td>02-01-2015</td>
                    <td>Staff</td>
                    <td class="center"><span class="active">Active</span></td>
                    <td class="center">
						<a class="btn btn-success" href="#"><i class="fa fa-search-plus "></i></a>
						<a class="btn btn-info" href="table.html#"><i class="fa fa-edit "></i></a>
						<a class="btn btn-danger" href="table.html#"><i class="fa fa-trash-o "></i></a>
					</td>
                 </tr>
				 <tr class="gradeA even" role="row">
                    <td class="sorting_1">Adam Alister</td>
                     <td>02-01-2015</td>
                    <td>Admin</td>
                    <td class="center"><span class="active">Active</span></td>
                    <td class="center">
						<a class="btn btn-success" href="#"><i class="fa fa-search-plus "></i></a>
						<a class="btn btn-info" href="table.html#"><i class="fa fa-edit "></i></a>
						<a class="btn btn-danger" href="table.html#"><i class="fa fa-trash-o "></i></a>
					</td>
                 </tr>
				 <tr class="gradeA odd" role="row">
                    <td class="sorting_1">Adam Alister</td>
                    <td>02-01-2015</td>
                    <td>Staff</td>
                    <td class="center"><span class="active">Active</span></td>
                     <td class="center">
						<a class="btn btn-success" href="#"><i class="fa fa-search-plus "></i></a>
						<a class="btn btn-info" href="table.html#"><i class="fa fa-edit "></i></a>
						<a class="btn btn-danger" href="table.html#"><i class="fa fa-trash-o "></i></a>
					</td>
                 </tr>
				 <tr class="gradeA even" role="row">
                    <td class="sorting_1">Adam Alister</td>
                     <td>02-01-2015</td>
                    <td>Staff</td>
                    <td class="center"><span class="active">Active</span></td>
                     <td class="center">
						<a class="btn btn-success" href="#"><i class="fa fa-search-plus "></i></a>
						<a class="btn btn-info" href="table.html#"><i class="fa fa-edit "></i></a>
						<a class="btn btn-danger" href="table.html#"><i class="fa fa-trash-o "></i></a>
					</td>
                 </tr>
				 <tr class="gradeA odd" role="row">
                    <td class="sorting_1">Adam Alister</td>
                     <td>02-01-2015</td>
                    <td>Staff</td>
                    <td class="center"><span class="active">Active</span></td>
                      <td class="center">
						<a class="btn btn-success" href="#"><i class="fa fa-search-plus "></i></a>
						<a class="btn btn-info" href="table.html#"><i class="fa fa-edit "></i></a>
						<a class="btn btn-danger" href="table.html#"><i class="fa fa-trash-o "></i></a>
					</td>
                 </tr>
				 <tr class="gradeA even" role="row">
                    <td class="sorting_1">Adam Alister</td>
                    <td>02-01-2015</td>
                    <td>Admin</td>
                    <td class="center"><span class="pending">Pending</span></td>
                     <td class="center">
						<a class="btn btn-success" href="#"><i class="fa fa-search-plus "></i></a>
						<a class="btn btn-info" href="table.html#"><i class="fa fa-edit "></i></a>
						<a class="btn btn-danger" href="table.html#"><i class="fa fa-trash-o "></i></a>
					</td>
                 </tr>
				 <tr class="gradeA odd" role="row">
                    <td class="sorting_1">Adam Alister</td>
                     <td>02-01-2015</td>
                    <td>Staff</td>
                    <td class="center"><span class="inactive">Inactive</span></td>
                     <td class="center">
						<a class="btn btn-success" href="#"><i class="fa fa-search-plus "></i></a>
						<a class="btn btn-info" href="table.html#"><i class="fa fa-edit "></i></a>
						<a class="btn btn-danger" href="table.html#"><i class="fa fa-trash-o "></i></a>
					</td>
                 </tr>
				 <tr class="gradeA even" role="row">
                    <td class="sorting_1">Adam Alister</td>
                    <td>02-01-2015</td>
                    <td>Staff</td>
                    <td class="center"><span class="active">Active</span></td>
                      <td class="center">
						<a class="btn btn-success" href="#"><i class="fa fa-search-plus "></i></a>
						<a class="btn btn-info" href="table.html#"><i class="fa fa-edit "></i></a>
						<a class="btn btn-danger" href="table.html#"><i class="fa fa-trash-o "></i></a>
					</td>
                 </tr>
				 <tr class="gradeA odd" role="row">
                    <td class="sorting_1">Adam Alister</td>
                    <td>02-01-2015</td>
                    <td>Staff+</td>
                    <td class="center"><span class="pending">Pending</span></td>
                     <td class="center">
						<a class="btn btn-success" href="#"><i class="fa fa-search-plus "></i></a>
						<a class="btn btn-info" href="table.html#"><i class="fa fa-edit "></i></a>
						<a class="btn btn-danger" href="table.html#"><i class="fa fa-trash-o "></i></a>
					</td>
                 </tr>
				 <tr class="gradeA even" role="row">
                    <td class="sorting_1">Adam Alister</td>
                     <td>02-01-2015</td>
                    <td>Staff</td>
                    <td class="center"><span class="active">Active</span></td>
                     <td class="center">
						<a class="btn btn-success" href="#"><i class="fa fa-search-plus "></i></a>
						<a class="btn btn-info" href="table.html#"><i class="fa fa-edit "></i></a>
						<a class="btn btn-danger" href="table.html#"><i class="fa fa-trash-o "></i></a>
					</td>
                 </tr></tbody>
           </table>
				<div class="dataTables_info" id="table1_info" role="status" aria-live="polite">Showing 1 to 10 of 57 entries</div>
				<div class="dataTables_paginate paging_simple_numbers" id="table1_paginate">
				  <a class="paginate_button previous disabled" aria-controls="table1" data-dt-idx="0" tabindex="0" id="table1_previous">Previous</a><span>
				  <a class="paginate_button current" aria-controls="table1" data-dt-idx="1" tabindex="0">1</a>
				  <a class="paginate_button " aria-controls="table1" data-dt-idx="2" tabindex="0">2</a>
				  <a class="paginate_button " aria-controls="table1" data-dt-idx="3" tabindex="0">3</a>
				  <a class="paginate_button " aria-controls="table1" data-dt-idx="4" tabindex="0">4</a>			
				  <a class="paginate_button next" aria-controls="table1" data-dt-idx="7" tabindex="0" id="table1_next">Next</a>
				</div>
			</div>
          </div><!-- table-responsive -->
          <div class="clearfix mb30"></div>
          
        </div><!-- panel-body -->
      </div><!-- panel -->
        
	
        
	<div class="row">
		<div class="col-md-6">
			<div class="panel panel-default">
            <div class="table-responsive">
                <table class="table  mb30">
                    <thead>
                      <tr>
                        <th>#</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Status</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>1</td>
                        <td>Mark</td>
                        <td>Otto</td>
                        <td class="center"><span class="inactive">Inactive</span></td>
                      </tr>
                      <tr>
                        <td>2</td>
                        <td>Jacob</td>
                        <td>Thornton</td>
                        <td class="center"><span class="active">active</span></td>
                      </tr>
                      <tr>
                        <td>3</td>
                        <td>Larry</td>
                        <td>the Bird</td>
                        <td class="center"><span class="pending">Pending</span></td>
                      </tr>
                    </tbody>
                </table>
            </div><!-- table-responsive -->
        </div><!-- panel -->
	   </div>
        
		<div class="col-md-6">
			<div class="panel panel-default">
            <div class="table-responsive">
                <table class="table  mb30">
                    <thead>
                      <tr>
                        <th>#</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Status</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>1</td>
                        <td>Mark</td>
                        <td>Otto</td>
                        <td class="center"><span class="pending">Pending</span></td>
                      </tr>
                      <tr>
                        <td>2</td>
                        <td>Jacob</td>
                        <td>Thornton</td>
                        <td class="center"><span class="pending">Pending</span></td>
                      </tr>
                      <tr>
                        <td>3</td>
                        <td>Larry</td>
                        <td>the Bird</td>
                        <td class="center"><span class="pending">Pending</span></td>
                      </tr>
                    </tbody>
                </table>
            </div><!-- table-responsive -->
        </div><!-- panel -->
	   </div>
		
		
		</div>
       
      
		
		
		
    </div>

  </div><!-- mainpanel -->

  

</section>


<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/jquery-migrate-1.2.1.min.js"></script>
<script src="js/jquery-ui-1.10.3.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/modernizr.min.js"></script>
<script src="js/jquery.custom.min.js"></script>
<script src="js/toggles.min.js"></script>
<script src="js/jquery.cookies.js"></script>
<script src="js/left-menu.js"></script>




</body>
</html>
