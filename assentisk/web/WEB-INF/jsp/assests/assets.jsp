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

		<link href="css/font-awesome.css" rel="stylesheet">
		
		<script type="text/javascript" charset="utf8" src="js/jquery.js"></script>
		<script src="js/angular.min.js"></script>
		<title>Assentisk</title>

		<link href="css/custom.css" rel="stylesheet">
		<link rel="stylesheet" href="css/jquery.mCustomScrollbar.css">

		<script type="text/javascript">

var rowID;
 var sortingOrder = 'ID';
function assetsController($scope,$http,$filter) {

			$("div.leftpanelinner>ul>li#asset").addClass("nav-parent nav-active");
			$("div.leftpanelinner>ul>li#asset>ul").css("display","block");
			$("div.leftpanelinner>ul>li#asset>ul>li#assets").addClass("active");
		
    $scope.sortingOrder = sortingOrder;
    $scope.reverse = false; 
    $scope.filteredItems = [];
    $scope.groupedItems = [];
    $scope.itemsPerPage = 15;
    $scope.pagedItems = [];
    $scope.currentPage = 0;
  	$http.get('assetsList.assets.htm').
    success(function(data, status, headers, config) {
	
    $scope.items = data.assetsBeans;
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
    
    
    $scope.removeRow = function(stateid) {
    
   
                   
       };
 
}
assetsController.$inject = ['$scope','$http','$filter'];  

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
		$.get("deleteasset.assets.htm?id="+rowID,function(data,status){
			window.location.href = "assets.assets.htm";
		 
		 });
	}
	else
	{
		$('#divConfirmAlert').hide();
	}
}

function openScheduler(){
  		$('#dialog-1').modal('show');
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
			        <h4 class="modal-title" id="exampleModalLabel">Upload Asset Status</h4>
			     	<table id="uploaddataAlert" style="color:black;margin-top:20px;">
			 			<c:forEach var="list" items="${dataStatus}">
			 		 		<tr>
			 		 			<td><c:out value="${list}"></c:out> </td>
			 				 </tr>
			 				</c:forEach>
			 		</table>
			        
			      </div>
			      <div class="modal-body scheduler">
			        
			     <div class="bottomdiv">
			     </div></div></div></div>
			 </div>
			<div class="modal fade" id="dialog-1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title" id="exampleModalLabel">Upload Asset Sheet</h4>
			      <form name="homeForm" id="homeForm" action='importAssetsExcel.org.htm' method="post" enctype="multipart/form-data">
					  &nbsp;
					  <table>
					  <tr>
					  <td>
			          <input type="file" name="myexcel" id="myexcel" style="margin-top: 0px; top: 6px; width: 202px; margin-right: 34px;">
					  </td>
					  </tr>
					  <tr><td>&nbsp;&nbsp;&nbsp;</td></tr>
					  <tr>
					  <td>
					  <input type="button" class="btn btn-primary" value="UPLOAD" style="margin-right: 12px;" onclick="checkValidation();">
					  </td>
					  </tr>
					  </table>
			    	</form>
			        
			      </div>
			      <div class="modal-body scheduler">
			        
			     <div class="bottomdiv">
			     </div></div></div></div>
			 </div>
			<div class="pageheader">
				<h2>
					<c:out value="${sessionScope.Assets_Header}"/>
				</h2>
				<div class="breadcrumb-wrapper">
					<span class="label"><c:out value="${sessionScope.DashBoard_YouAreHere}"/>:</span>
					<ol class="breadcrumb">
						<li>
							<a href="dashboard.login.htm">Assentisk</a>
						</li>
						<li class="active">
							<c:out value="${sessionScope.Assets_Header}"/>
						</li>
					</ol>
				</div>
			</div>

			<div class="contentpanel">
				<div ng-app="" ng-controller="assetsController">
					<c:if test="${sessionScope.add_mod_14=='1'}">
						<a class="btn btn-success" href="addasset.assets.htm" title="<c:out value="${sessionScope.tooltip_add}"/>"
							style="margin-bottom: 10px;"><c:out value="${sessionScope.tooltip_add}"/>&nbsp;&nbsp;<i class="fa fa-plus"></i>
						</a>
					</c:if>
					
					<div style="float:right;">
						<div style="float:left;margin-right:10px;">
						<a class="btn btn-info" href="downloadExcelForAssets.org.htm" title="<c:out value="${sessionScope.download_sample}"/>"
							style="margin-bottom: 10px;"><i class="fa fa-download"></i>
						</a>
						<button class="btn btn-purple" onclick="openScheduler();"  title="<c:out value="${sessionScope.bulk_upload}"/>" style="margin-bottom: 10px;"><i class="fa fa-upload"></i></button>
					</div>
					<div style="float:right;">
							<table><tbody>
						<tr>
<!--				    		<td style="line-height:0px!important;"><span class="label" style="font-size: 14px;"><a href="downloadExcelForAssets.org.htm"  style="color: #4a535e;font-size: 14px;font-weight: normal;">Download Sample Copy</a></span></td>-->
<!--							<td><input type="button" class="btn btn-primary" value="BULK UPLOAD" style="margin-right: 12px;" onclick="openScheduler();"></td>-->
<!--							-->
							<td class="input-append"><input type="text" placeholder="<c:out value="${sessionScope.search}"/>" class="input-large search-query ng-pristine ng-valid" ng-change="search()" ng-model="query">
            				<span class="add-on"><i class="icon-search"></i> </span></td>
            			</tr>
            		</tbody></table>
            		</div>
					</div>
					</br>
						 <div class="content demo-x">
					<table class="table table-striped table-condensed table-hover"
						id="categories">
						<thead>
							<tr>
								<th class="aname" style="min-width:150px;max-width:150px;">
									
									<a ng-click="sort_by('aname')"><i class="icon-sort"></i><c:out value="${sessionScope.assets_asset}"/>
									</a>
								</th>
								
								<th class="cname" style="min-width:100px;max-width:100px;">
									
									<a ng-click="sort_by('cname')"><i class="icon-sort"></i><c:out value="${sessionScope.assets_category}"/>
									</a>
								</th>
								
								<th class="Name" style="min-width:100px;max-width:100px;">
									
									<a ng-click="sort_by('Name')"><i class="icon-sort"></i><c:out value="${sessionScope.assets_location}"/>
									</a>
								</th>
								
								<th class="ApplicationName" style="min-width:100px;max-width:100px;">
								
									<a ng-click="sort_by('ApplicationName')"><i class="icon-sort"></i>	<c:out value="${sessionScope.assets_application}"/>
									</a>
								</th>
								
								<th class="BusinessProcessName" style="min-width:100px;max-width:100px;">
									
									<a ng-click="sort_by('BusinessProcessName')"><i class="icon-sort"></i><c:out value="${sessionScope.assets_buisness_process}"/>
									</a>
								</th>
								
							
								
								<th class="VendorName" style="min-width:100px;max-width:100px;">
								
									<a ng-click="sort_by('vendorId')"><i class="icon-sort"></i><c:out value="${sessionScope.assets_vendor_name}"/>
									</a>
								</th>
								
								<th class="Initial Values" style="min-width:100px;max-width:100px;">
									
									<a ng-click="sort_by('Initial_Values')"><i class="icon-sort"></i><c:out value="${sessionScope.assets__initialvalues}"/>
									</a>
								</th>
								
								<th class="Type" style="min-width:100px;max-width:100px;">
									
									<a ng-click="sort_by('type')"><i class="icon-sort"></i><c:out value="${sessionScope.assets_type}"/>
									</a>
								</th>
								
								<th class="Quantity" style="min-width:100px;max-width:100px;">
									
									<a ng-click="sort_by('quantity')"><i class="icon-sort"></i><c:out value="${sessionScope.assets_quantity}"/>
									</a>
								</th>
																
								<th style="min-width:150px;max-width:150px;">
									<c:out value="${sessionScope.assets_action}"/>
								</th>

							</tr>
						</thead>

						<tfoot>
							<td colspan="11">
								<div class="pagination pull-right"  style="height:auto;"'>
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

								<td style="min-width:150px;max-width:150px;word-wrap:break-word;">
									{{item.aname}}
								</td>
								<td style="min-width:100px;max-width:100px;word-wrap:break-word;">		
										{{item.cname}}
<!--									<div ng-switch on="item.cnamelen"><span ng-switch-when="true">{{item.cname1}}....</span>-->
<!--									<span ng-switch-when="false">{{item.cname1}}</span></div>		-->
								</td>
								
								<td style="min-width:100px;max-width:100px;word-wrap:break-word;">
									{{item.Name}}
								</td>
								<td style="min-width:100px;max-width:100px;word-wrap:break-word;">
									{{item.ApplicationName}}
								</td>
								<td style="min-width:100px;max-width:100px;word-wrap:break-word;">
									{{item.BusinessProcessName}}
								</td>
								
								<td style="min-width:100px;max-width:100px;word-wrap:break-word;">
									{{item.vendorId}}
								</td>
								
								<td style="min-width:100px;max-width:100px;word-wrap:break-word;">
									{{item.Initial_Values}}
								</td>
								<td style="min-width:100px;max-width:100px;word-wrap:break-word;">
									{{item.type}}
								</td>
								<td style="min-width:100px;max-width:100px;word-wrap:break-word;">
									{{item.quantity}}
								</td>
								<td class="center" style="min-width:150px;max-width:150px;">
									<c:if test="${sessionScope.edit_mod_14=='1'}">
										<a class="btn btn-info"
											href="editasset.assets.htm?assetid={{item.ID}}"
											title="<c:out value="${sessionScope.tooltip_edit}"/>"><i class="fa fa-edit "></i>
										</a>
									</c:if>
									<c:if test="${sessionScope.delete_mod_14=='1'}">
										<button class="btn btn-danger"
											onclick="confirmRow({{item.ID}})" title="<c:out value="${sessionScope.tooltip_delete}"/>">
											<i class="fa fa-trash-o "></i>
										</button>
									</c:if>
									<c:if test="${sessionScope.sch_mod_14=='1'}">            		 		
            		 					<a class="btn btn-info"  href="schedule.assets.htm?id={{item.ID}}" title="<c:out value="${sessionScope.tooltip_schedule}"/>"><i class="fa fa-cogs"></i></a>	            		 
            						</c:if>
								</td>
							</tr>
						</tbody>
					</table>
</div>
				</div>

			</div>
			<!-- panel-body -->
		</div>
		<!-- panel -->


        <input type="hidden" id="toggledata" class="form-control" ng-model="toggledata" ng-init='toggledata = "<c:out value="${sessionScope.toggle}"/>"' value="<c:out value="${sessionScope.toggle}"/>">		



 <input type="hidden" name="datasize" id="datasize" value="<c:out value="${datasize}"/>"	>



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
		<script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
<script>
		(function($){
			$(window).load(function(){

			var flag=false;		
				 var datasize=document.getElementById("datasize").value;
				if(datasize== 'true')
  					{
  						 $('#dialog-12').modal('show');
 					
  					}
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
		

		<div id="divConfirmAlert" class="error2">
			<label>
				<c:out value="${sessionScope.deleteRow}"/>
			</label>
			<span> <input type="button" value="Yes"
					onclick="deleteRow('yes')" />
			</span>
			<span> <input type="button" value="No"
					onclick="deleteRow('no')" />
			</span>
		</div>



	</body>
</html>
