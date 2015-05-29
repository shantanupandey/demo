
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
      <h2>Dashboard</h2>
      <div class="breadcrumb-wrapper">
        <span class="label">You are here:</span>
        <ol class="breadcrumb">
          <li><a href="index.html">Assentisk</a></li>
          <li class="active">Dashboard</li>
        </ol>
      </div>
    </div>

    <div class="contentpanel">

      

      <div class="row">
        <div class="col-md-12">
          <div class="panel panel-default">
            <div class="panel-heading">
              <div class="panel-btns">
                <a href="" class="panel-close">×</a>
                <a href="" class="minimize">−</a>
              </div>
              <h4 class="panel-title">Block Styled Form</h4>
              <p>This is an example of form with block styled label.</p>
            </div>
            <div class="panel-body">
              <div class="row">               
                <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label">Lastname</label>
                    <input type="text" name="lastname" class="form-control">
                  </div>
                </div><!-- col-sm-6 -->
              </div><!-- row -->
              
              <div class="row">
                <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label">Email</label>
                    <input type="email" name="email" class="form-control">
                  </div>
                </div><!-- col-sm-6 -->              
              </div><!-- row -->
			   <div class="row">
                <div class="col-sm-6">
                  <div class="form-group">
                    <label class="control-label">Phone</label>
                    <input type="email" name="email" class="form-control">
                  </div>
                </div><!-- col-sm-6 -->              
              </div><!-- row -->
			  <div class="row">
                <div class="col-sm-4">
                  <div class="form-group">
                    <label class="control-label">City</label>
                    <input type="email" name="email" class="form-control">
                  </div>
                </div><!-- col-sm-8 -->   
                  <div class="col-sm-2">
                  <div class="form-group">
                    <label class="control-label">Postal Code</label>
                    <input type="email" name="email" class="form-control">
                  </div>
                </div><!-- col-sm-4 --> 				
              </div><!-- row -->		
              <div class="row">
                <div class="col-sm-12">
                  <div class="form-group">
                    <label class="control-label">Address</label>
                     <textarea class="form-control" rows="5" placeholder="Address"></textarea>
                  </div>
                </div><!-- col-sm-12 --> 

            </div><!-- panel-body -->
            <div class="panel-footer">
              <button class="btn btn-primary">Submit</button>
			  <button type="reset" class="btn btn-default">Reset</button>
            </div>
          </div>
        </div>
        
      </div>

      

      

    </div><!-- contentpanel -->

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
