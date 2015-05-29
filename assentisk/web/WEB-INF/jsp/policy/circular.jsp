<%@ taglib uri="/WEB-INF/tld/c-1_0.tld" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport"
			content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
		<meta name="description" content="">
		<meta name="author" content="">
		<link rel="shortcut icon" href="images/favicon.ico">
		<link href="css/jquery.dataTables.css" rel="stylesheet"
			type="text/css" />
		<link href="css/font-awesome.css" rel="stylesheet">
		<script type="text/javascript" charset="utf8" src="js/jquery.js"></script>
		<script src="js/angular.min.js"></script>
		<title>Assentisk</title>

		<link href="css/custom.css" rel="stylesheet">
		<link rel="stylesheet" href="css/jquery.mCustomScrollbar.css">

<style type="text/css">
#mCSB_1_container{
	
	
	
}

</style>
	
		<script type="text/javascript">
window.onload = function()
{
	var message = '<%=request.getAttribute("message")%>';
	if(message!="null")
	{
	    $('#dialog-12').modal('show');
	    $('#ErrorMessage').html(message);
	}
	
}

var rowID;
 var sortingOrder = 'EmpName';
function employeesController($scope,$http,$filter) {

	      
				$("div.leftpanelinner>ul>li#policy").css("background","#012345");


    $scope.sortingOrder = sortingOrder;
    $scope.reverse = false; 
    $scope.filteredItems = [];
    $scope.groupedItems = [];
    $scope.itemsPerPage = 15;
    $scope.pagedItems = [];
    $scope.currentPage = 0;
    var policyno=document.getElementById("policyID").value;
    
    	$http.get("logdetails.assess.htm?policy="+policyno).
    success(function(data, status, headers, config) {
   
    document.getElementById("logDetails").innerHTML = data;
    var sizedata=document.getElementById("sizedata").value;
    
    if(sizedata!='0')
    {
   		 $("#logDetails").css("display","block");
    }
  	 
    });
  	$http.get("circularList.assess.htm?policy="+policyno).
    success(function(data, status, headers, config) {
   
       $scope.items = data.empBeans;
       $("#imageloader").css("display", "none");
       $("#complete").css("display", "block");
       var searchMatch = function (haystack, needle) {
        if (!needle) {
            return true;
        }
        return haystack.toString().toLowerCase().indexOf(needle.toLowerCase()) !== -1;
    };

    // init the filtered items
    $scope.search = function () {
        $scope.filteredItems = $filter('filter')($scope.items, function (item) {
            for(var attr in item) {
                if (searchMatch(item[attr], $scope.query))
                    return true;
            }
            return false;
        });
        // take care of the sorting order
        if ($scope.sortingOrder !== '') {
            $scope.filteredItems = $filter('orderBy')($scope.filteredItems, $scope.sortingOrder, $scope.reverse);
        }
        $scope.currentPage = 0;
        // now group by pages
        $scope.groupToPages();
    };
    
    // calculate page in place
    $scope.groupToPages = function () {
        $scope.pagedItems = [];
        
        for (var i = 0; i < $scope.filteredItems.length; i++) {
            if (i % $scope.itemsPerPage === 0) {
                $scope.pagedItems[Math.floor(i / $scope.itemsPerPage)] = [ $scope.filteredItems[i] ];
            } else {
                $scope.pagedItems[Math.floor(i / $scope.itemsPerPage)].push($scope.filteredItems[i]);
            }
        }
    };
    
    $scope.range = function (start, end) {
        var ret = [];
        if (!end) {
            end = start;
            start = 0;
        }
        for (var i = start; i < end; i++) {
            ret.push(i);
        }
        return ret;
    };
    
    $scope.prevPage = function () {
        if ($scope.currentPage > 0) {
            $scope.currentPage--;
        }
    };
    
    $scope.nextPage = function () {
        if ($scope.currentPage < $scope.pagedItems.length - 1) {
            $scope.currentPage++;
        }
    };
    
    $scope.setPage = function () {
        $scope.currentPage = this.n;
    };

    // functions have been describe process the data for display
    $scope.search();

    // change sorting order
    $scope.sort_by = function(newSortingOrder) {
        if ($scope.sortingOrder == newSortingOrder)
            $scope.reverse = !$scope.reverse;

        $scope.sortingOrder = newSortingOrder;

       
    };
    }).
    error(function(data, status, headers, config) {
      // log error
    });
 
 
 $scope.doClick = function(item,event)
 { 	
 	var license = document.getElementById("licenseuser").checked;
 	$http.get("circularList.assess.htm").
    success(function(data, status, headers, config) {
   
       $scope.items = data.empBeans;
       $("#imageloader").css("display", "none");
       $("#complete").css("display", "block");
       var searchMatch = function (haystack, needle) {
        if (!needle) {
            return true;
        }
        return haystack.toString().toLowerCase().indexOf(needle.toLowerCase()) !== -1;
    };

    // init the filtered items
    $scope.search = function () {
        $scope.filteredItems = $filter('filter')($scope.items, function (item) {
            for(var attr in item) {
                if (searchMatch(item[attr], $scope.query))
                    return true;
            }
            return false;
        });
        // take care of the sorting order
        if ($scope.sortingOrder !== '') {
            $scope.filteredItems = $filter('orderBy')($scope.filteredItems, $scope.sortingOrder, $scope.reverse);
        }
        $scope.currentPage = 0;
        // now group by pages
        $scope.groupToPages();
    };
    
    // calculate page in place
    $scope.groupToPages = function () {
        $scope.pagedItems = [];
        
        for (var i = 0; i < $scope.filteredItems.length; i++) {
            if (i % $scope.itemsPerPage === 0) {
                $scope.pagedItems[Math.floor(i / $scope.itemsPerPage)] = [ $scope.filteredItems[i] ];
            } else {
                $scope.pagedItems[Math.floor(i / $scope.itemsPerPage)].push($scope.filteredItems[i]);
            }
        }
    };
    
    $scope.range = function (start, end) {
        var ret = [];
        if (!end) {
            end = start;
            start = 0;
        }
        for (var i = start; i < end; i++) {
            ret.push(i);
        }
        return ret;
    };
    
    $scope.prevPage = function () {
        if ($scope.currentPage > 0) {
            $scope.currentPage--;
        }
    };
    
    $scope.nextPage = function () {
        if ($scope.currentPage < $scope.pagedItems.length - 1) {
            $scope.currentPage++;
        }
    };
    
    $scope.setPage = function () {
        $scope.currentPage = this.n;
    };

    // functions have been describe process the data for display
    $scope.search();

    // change sorting order
    $scope.sort_by = function(newSortingOrder) {
        if ($scope.sortingOrder == newSortingOrder)
            $scope.reverse = !$scope.reverse;

        $scope.sortingOrder = newSortingOrder;

       
    };
    }).
    error(function(data, status, headers, config) {
      // log error
    });
 	
 }
}
employeesController.$inject = ['$scope','$http','$filter'];  

function confirmRow(id)
{
	rowID = id;
	$('#divConfirmAlert').show();


}

function deleteRow(action)
{	
	
	if(action == 'yes')
	{
		$('#divConfirmAlert').delay(1500).fadeOut('slow');		
		$.get("deleteemployee.org.htm?id="+rowID,function(data,status)
		{ 
		window.location.href = 'employees.org.htm';
		});
		
	}
	else
	{
		$('#divConfirmAlert').hide();
	}
}



								function checkValidation(){
								
									
									var myexcel=document.getElementById("myexcel").value;
									var extension = myexcel.split('.').pop().toUpperCase();
									
									if(myexcel==''){
										$('#excelAlert').show();
										$('#excelAlert').delay(1500).fadeOut('slow');	
									
									}else if(extension != 'XLS' && extension != 'XLSX' ){
										$('#formatAlert').show();
										$('#formatAlert').delay(1500).fadeOut('slow');	
											
									}
									else{
										document.getElementById("homeForm").submit();
									}
									
								}
								
	function openScheduler(){
  		$('#dialog-1').modal('show');
  	}							
  
function toggle(source) {
  checkboxes = document.getElementsByName('single');
  for(var i=0, n=checkboxes.length;i<n;i++) {
    checkboxes[i].checked = source.checked;
  }
}

function sendApproval(){
//var checkedValue = $('.single:checked').val();

var policyno=document.getElementById("policyID").value;
var employessID=$("input[name=single]:checked").map(function () {return this.value;}).get().join(",");
if(employessID=='')
{
	$('#selectApproverAlert').show();
	$('#selectApproverAlert').delay(1500).fadeOut('slow');	

}
else
{
	  										$("#imageloader").css("display", "block");
       										$("#complete").css("display", "none");
   $.get("circularEmpID.assess.htm?employeeID=" + employessID +"&policyno="+policyno, function(data, status)
									{
										
													
									  		window.location.href = "circular.assess.htm?policyno="+policyno;
									  		$('#circularsucess').show();
											$('#circularsucess').delay(1500).fadeOut('slow');	
									  		 
									  		 $("#imageloader").css("display", "none");
       										 $("#complete").css("display", "block");	
														
									});	
									}
}

</script>
	</head>

<body class="<c:out value="${sessionScope.bodyClass}"></c:out>">

		<section>

		<%@include file="/WEB-INF/jsp/leftpanel.jsp"%>
		<div class="mainpanel">
			<%@include file="/WEB-INF/jsp/header.jsp"%>
			
			<div class="modal fade" id="dialog-12" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title" id="exampleModalLabel">Upload Employee Status</h4>
			     	<table id="uploaddataAlert" style="color:black;margin-top:20px;">
			 			<c:forEach var="list" items="${dataStatus}">
			 		 		<tr>
			 		 			<td><c:out value="${list}"></c:out> </td>
			 				 </tr>
			 				</c:forEach>
			 				<tr><td id="ErrorMessage"></td></tr>
			 		</table>
			        
			      </div>
			      <div class="modal-body scheduler">
			        
			     <div class="bottomdiv">
			     </div></div></div></div>
			 </div>
			
			
			
			
			
		

			<div class="pageheader">
				<h2>
					<c:out value="${sessionScope.policyCircular}"/>
				</h2>
				<div class="breadcrumb-wrapper">
					<span class="label"><c:out value="${sessionScope.DashBoard_YouAreHere}"/>:</span>
					<ol class="breadcrumb">
						<li>
							<a href="dashboard.login.htm">Assentisk</a>
						</li>
						<li class="active">
							<c:out value="${sessionScope.policyCircular}"/>
						</li>
					</ol>
				</div>
			</div>

			<div class="contentpanel">
				<div ng-app="" ng-controller="employeesController">
				
				
							<button class="btn btn-success"
										onclick="sendApproval()" title="	<c:out value="${sessionScope.policyCirculartab}"/>">
											<c:out value="${sessionScope.policyCirculartab}"/>&nbsp;&nbsp;<i class="fa fa-share-square-o"></i>
									</button>
					 <div class="input-append">
                <input type="text" ng-model="query" ng-change="search()" class="input-large search-query" placeholder="<c:out value="${sessionScope.toolip_search}"/>">
            <span class="add-on"><i class="icon-search"></i></span>
            </div></br>
            
            </br>
					
				<div class="content demo-x">
					<table class="table table-striped table-condensed table-hover"
						id="company">
						<thead>
							<tr>
								
								<th class="EmpName" style="min-width:250px;max-width:250px;">
									
									<a ng-click="sort_by('EmpName')"><i class="icon-sort"></i> <c:out value="${sessionScope.employeName}"/></a>
								</th>
							
								<th class="Email"  style="min-width:600px;">
									
									<a ng-click="sort_by('Email')"><i class="icon-sort"></i><c:out value="${sessionScope.employeEmail}"/>
									</a>
								</th>
								<th class="all"  style="min-width:200px;max-width:200px;text-align:center;">
										<input type="checkbox" id="all" class="all" onClick="toggle(this)" /> 
								</th>
								
<!--								<th class="IsActive">-->
<!--									IsActive&nbsp;-->
<!--									<a ng-click="sort_by('IsActive')"><i class="icon-sort"></i>-->
<!--									</a>-->
<!--								</th>-->
								

							</tr>
						</thead>

						<tfoot>
							<td colspan="18">
								<div class="pagination pull-right"  style="height:auto;">
									<ul>
										<li ng-class="{disabled: currentPage == 0}">
											<a href ng-click="prevPage()">« <c:out value="${sessionScope.Footer_previous}"/></a>
										</li>
										<li ng-repeat="n in range(pagedItems.length)"
											ng-class="{active: n == currentPage}" ng-click="setPage()">
											<a href ng-bind="n + 1">1</a>
										</li>
										<li
											ng-class="{disabled: currentPage == pagedItems.length - 1}">
											<a href ng-click="nextPage()"><c:out value="${sessionScope.Footer_next}"/> »</a>
										</li>
									</ul>
								</div>
							</td>
						</tfoot>
						<tbody>
							<tr
								data-ng-repeat="item in pagedItems[currentPage] | orderBy:sortingOrder:reverse">
								
								
								
								<td style="min-width:250px;max-width:250px;word-wrap:break-word;">
									{{item.EmpName}}
								</td>
								<td style="min-width:600px;max-width:600px;word-wrap:break-word;">
									{{item.Email}}
								</td>
								
							<td style="min-width:200px;max-width:200px;word-wrap:break-word;text-align:center;">
									<input type="checkbox" id="{{item.EmployeeID}}" class="single" name="single" value="{{item.EmployeeID}}"/> 
								</td>
							
							 
							</tr>
						</tbody>
					</table>
					</div>
					</br></br>
				
					<div id="logDetails" style="display:none;"></div>
</div>
				
		<input type="hidden" id="policyID" name="policyID" value="<c:out value="${param.policyno}"/>"/>
			</div>
			<!-- panel-body -->
		</div>
		<!-- panel -->
   <input type="hidden" id="toggledata" class="form-control" ng-model="toggledata" ng-init='toggledata = "<c:out value="${sessionScope.toggle}"/>"' value="<c:out value="${sessionScope.toggle}"/>">		
		</section>
 <input type="hidden" name="datasize" id="datasize" value="<c:out value="${datasize}"/>"	>


		<script src="js/jquery-1.11.1.min.js"></script>
		<script src="js/jquery-migrate-1.2.1.min.js"></script>
		<script src="js/jquery-ui-1.10.3.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/modernizr.min.js"></script>
		<script src="js/jquery.custom.min.js"></script>
		<script src="js/toggles.min.js"></script>
		<script src="js/jquery.cookies.js"></script>
		<script src="js/left-menu.js"></script>
		<script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
<script>
		(function($){
			$(window).load(function(){
	
				$.mCustomScrollbar.defaults.theme="light-2"; //set "light-2" as the default theme
				
				$(".demo-y").mCustomScrollbar();
				
				$(".demo-x").mCustomScrollbar({
					axis:"x",
					advanced:{autoExpandHorizontalScroll:true}
				});
				
				$(".demo-yx").mCustomScrollbar({
					axis:"yx"
				});
				
				$(".scrollTo a").click(function(e){
					e.preventDefault();
					var $this=$(this),
						rel=$this.attr("rel"),
						el=rel==="content-y" ? ".demo-y" : rel==="content-x" ? ".demo-x" : ".demo-yx",
						data=$this.data("scroll-to"),
						href=$this.attr("href").split(/#(.+)/)[1],
						to=data ? $(el).find(".mCSB_container").find(data) : el===".demo-yx" ? eval("("+href+")") : href,
						output=$("#info > p code"),
						outputTXTdata=el===".demo-yx" ? data : "'"+data+"'",
						outputTXThref=el===".demo-yx" ? href : "'"+href+"'",
						outputTXT=data ? "$('"+el+"').find('.mCSB_container').find("+outputTXTdata+")" : outputTXThref;
					$(el).mCustomScrollbar("scrollTo",to);
					output.text("$('"+el+"').mCustomScrollbar('scrollTo',"+outputTXT+");");
				});
			var value= document.getElementById("toggledata").value;
					
					
            		if(value==1){  			
            			if(flag == false)
            			{            			
            				flag = true;
            				
            		  		$('div#mCSB_1_container').removeAttr('style');
            		        $('div#mCSB_1_container').removeAttr('id');
            		        $('div#mCSB_1_container').removeAttr('ltr');
            		        	$('div#mCSB_1_dragger_horizontal').css('display','block');
            		        	   $('div#mCSB_1_container').css('display','block');			
            			}
            			
            			else if(flag  == true)
            			{            				
            				flag = false;
            				$('#mCSB_1>div').attr('id', 'mCSB_1_container');
            				
	 			  				$('div#mCSB_1_dragger_horizontal').css('display','block');
	 			  				   $('div#mCSB_1_container').css('display','block');
            			}
            			}
            			else if(value==0){  			
            			if(flag == true)
            			{            			
            				flag = false;
            					
            		  		 $('div#mCSB_1_container').removeAttr('style');
            		   		 $('div#mCSB_1_container').removeAttr('id');
            		  		 $('div#mCSB_1_container').removeAttr('ltr');	
            		  		 $('div#mCSB_1_dragger_horizontal').css('display','block');	
            		  		    $('div#mCSB_1_container').css('display','block');	
            			}
            			
            			else if(flag  == false)
            			{            				
            				flag = true;
            				 			  				   
	 			  				   	$('#mCSB_1>div').attr('id', 'mCSB_1_container');
	 			  			$('div#mCSB_1_dragger_horizontal').css('display','block');
	 			  			 $('div#mCSB_1_container').css('display','block');
	 			  				   
            			}
            			}
            			
            		
				
			});
		})(jQuery);
	</script>

<div  id="divConfirmAlert" class="error2">
 		<label><c:out value="${sessionScope.deleteRow}"/></label>
         <span > <input type="button" value="Yes" onclick="deleteRow('yes')"/></span>
         <span > <input type="button" value="No" onclick="deleteRow('no')"/></span>
 </div>
 
 
  <div  id="excelAlert" class="error2">
         <span><c:out value="${sessionScope.addImportUploadValid}"/> </span>
 </div>
 
 <div  id="formatAlert" class="error2">
         <span><c:out value="${sessionScope.addImportFormatValid}"/></span>
 </div>
  <div  id="selectApproverAlert" class="error2">
         <span><c:out value="${sessionScope.selectApproverAlert}"/></span>
 </div>
 
 <div  id="circularsucess" class="success">
		<span><c:out value="${sessionScope.circularSuccess}"/></span>
 </div>
 
											
<script type="text/javascript">

</script>
	</body>
</html>
