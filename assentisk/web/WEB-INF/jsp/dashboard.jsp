<%@ taglib uri="/WEB-INF/tld/c-1_0.tld" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">
  	<link rel="shortcut icon" href="images/favicon.ico">
  
   <link href="css/font-awesome.css" rel="stylesheet">
   <script type="text/javascript" charset="utf8" src="js/jquery.js"></script>        
  <title>Assentisk</title>

  <link href="css/custom.css" rel="stylesheet">
  <link rel="stylesheet" href="css/jquery.mCustomScrollbar.css">
  <script src="js/angular.min.js"></script>
  
  <script type="text/javascript" charset="utf8" src="js/jquery.js"></script>
  <link href="css/jquery-ui.css" rel="stylesheet">
  <script src="js/jquery-1.10.2.js"></script>
  <script src="js/jquery-ui.js"></script>
  <script type="text/javascript" src="https://www.google.com/jsapi?autoload={'modules':[{'name':'visualization','version':'1.1','packages':['corechart']}]}"></script>
  <style type="text/css">
  .highcharts-title{
  color:#333333!important;
  font-size:12px!important;
  fill:#333333!important;
  width:136px!important;
  
  }
  .piechartremark {
  
   padding: 15px; 
   margin: 8px;
    width: 100%;
  }
  .tdclass{
  width:20px;
  margin:2px;
  border-top-left-radius: 6px;
  border-top-right-radius: 6px;
  border-bottom-right-radius: 6px;
  border-bottom-left-radius: 6px;
  }
  .tdspace{padding-left:3px;color: grey;}
  
  </style>
 <script type="text/javascript">

  
  
  var rowID;
 var sortingOrder = 'id';
function personController($scope,$http,$filter) {
			
		
   				
    $scope.sortingOrder = sortingOrder;
    $scope.reverse = false; 
    $scope.filteredItems = [];
    $scope.groupedItems = [];
    $scope.itemsPerPage = 5;
    $scope.pagedItems = [];
    $scope.currentPage = 0;
  	$http.get('amcList.assets.htm').
    success(function(data, status, headers, config) {
    $scope.items = data.amcAssetBeans;

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
    

    $scope.sort_by = function(predicate) {
    
    
 $scope.predicate = predicate;
 $scope.reverse = !$scope.reverse;
 };
 
    }).
    error(function(data, status, headers, config) {
      // log error
    });
 
}
personController.$inject = ['$scope','$http','$filter'];  
 var globalid="";
 var globalstatus="";
  function callAction (id,status,type){
  
            globalid="";
            globalstatus="";
            	$.get("getcommentValue.htm?id=" + id+"&type="+type, function(data, status) {	
            			document.getElementById("dialog-1").innerHTML=data;
            	});
            		 //savecomment(id,status);
            globalid = id;
          	globalstatus = status;
            }

  function savecomment(){
 		var id=globalid;
 		var status=globalstatus;
 		
  		var active = $("input:radio[name=active]:checked").val();
  		var comment=document.getElementById("comment").value;
  		
  		if(active== undefined){
  		
  			active = status;
  		}
  		if(comment=='')
  		{
  					 $('#divcommentAlert').show();
					 $('#divcommentAlert').delay(1500).fadeOut('slow');
  		
  		}
  		else 
  		{
  			$.get("addcomment.htm?id=" + id+"&status="+active+"&comment="+comment, function(data, status) {
  			 		$("#cldailog").trigger( "click" );
  			 		
  			 		$.get("pendingStatus.htm", function(data, status) {
  						 location.reload();
  					 });
  			});
  		}
  }
  
  function reset()
	{
	
			document.getElementById("comment").value="";
			document.getElementById("newPassword").value="";
			document.getElementById("retypePassword").value="";
	}
	
	
	          
	
</script>

</head>

<body class="<c:out value="${sessionScope.bodyClass}"></c:out>" onload="javascript:window.history.forward(1);">

<section>
 
<%@include file="leftpanel.jsp" %>
  <div class="mainpanel">
   <%@include file="header.jsp" %>

    <div class="pageheader">
      <h2><c:out value="${sessionScope.DashBoard_Dashboard}"/></h2>
      <div class="breadcrumb-wrapper">
        <span class="label"><c:out value="${sessionScope.DashBoard_YouAreHere}"/>:</span>
        <ol class="breadcrumb">
         <li><a href="dashboard.login.htm">Assentisk</a></li>
          <li class="active"><c:out value="${sessionScope.DashBoard_Dashboard}"/></li>
        </ol>
      </div>
    </div>

    <div class="contentpanel">
       <div class="row">

					<div class="col-sm-6 col-md-3"  style="font-weight: bold;color:grey;" align="center">
						
						<c:out value="${sessionScope.piehart_manual}" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</div>
					<!-- col-sm-6 -->

					<div class="col-sm-6 col-md-3"  style="font-weight: bold;color:grey;" align="center">
						
						<c:out value="${sessionScope.piechart_system}" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

					</div>
					<!-- col-sm-6 -->

					<div class="col-sm-6 col-md-3"  style="font-weight: bold;color:grey;" align="center">
					
						<c:out value="${sessionScope.piechart_support}" />&nbsp;&nbsp;&nbsp;&nbsp;
						</div>
						<!-- panel -->
					
					<!-- col-sm-6 -->

					<div class="col-sm-6 col-md-3"  style="font-weight: bold;color:grey;" align="center">
						<c:out value="${sessionScope.piechart_test}" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						
					</div>
					<!-- col-sm-6 -->
				</div>
				<!-- row -->
   <div class="row">

					<div class="col-sm-6 col-md-3">
						<div id="container1" style="width: 225px; height: 150px; margin: 0 auto"></div>
						<!-- Piechart -->
					</div>
					<!-- col-sm-6 -->

					<div class="col-sm-6 col-md-3">
						<div id="container2" style="width: 225px; height: 150px;  margin: 0 auto"></div>
						<!-- Piechart -->

					</div>
					<!-- col-sm-6 -->

					<div class="col-sm-6 col-md-3">
						<div id="container3" style="width: 225px; height: 150px;  margin: 0 auto"></div>
						<!-- Piechart -->

						</div>
						<!-- panel -->
					
					<!-- col-sm-6 -->

					<div class="col-sm-6 col-md-3">
						<div id="container4" style="width: 225px; height: 150px;  margin: 0 auto"></div>
						<!-- Piechart -->

					</div>
					<!-- col-sm-6 -->
				</div>
				<!-- row -->
				
				
			<div class="row">
				
				<div class="col-sm-4" style="float:right;">
					<table class="piechartremark">
						<tr>	
								
								<td style="background-color:#993333;" title="Pending" class="tdclass">&nbsp;</td>
								<td class="tdspace" title="Pending"><c:out value="${sessionScope.piechart_status_pending}"/></td>
								<td style="background-color:#669900;" title="Completed" class="tdclass">&nbsp;</td>
								<td class="tdspace" title="Completed"><c:out value="${sessionScope.piechart_status_completed}"/></td>
								<td style="background-color:#003366;" title="Created" class="tdclass"></td>
								<td class="tdspace" title="Created"><c:out value="${sessionScope.piechart_status_created}"/></td>
						</tr>
					</table>
				</div>
			</div>
				<div class="row">
					<div class="col-sm-12 col-md-12">
						<div ng-app="" ng-controller="personController">

            <div class="input-append">
                <input type="text" ng-model="query" ng-change="search()" class="input-large search-query" placeholder="Search" style="display:none;">
            
            </div></br>
            
            	<div class="content demo-x">
    		 <table class="table table-striped table-condensed table-hover" id="country">
      			  <thead>
           			 <tr>
                       <th class="amcname" style="width: 200px;"><a ng-click="sort_by('amcname')"><i class="icon-sort"></i><c:out value="${sessionScope.Dashboard_Name}" /></a></th>
                       <th class="generatedBy" style="width: 100px;"><a ng-click="sort_by('generatedBy')"><i class="icon-sort"></i><c:out value="${sessionScope.Dashboard_AssignedBy}" /></a></th>
                  		<th class="assignedTo" style="width: 100px;"><a ng-click="sort_by('assignedTo')"><i class="icon-sort"></i><c:out value="${sessionScope.Dashboard_AssignedTo}" /></a></th>
                  		<th class="startdate" style="width: 100px;"><a ng-click="sort_by('startdate')"><i class="icon-sort"></i><c:out value="${sessionScope.Dashboard_FromDate}" /></a></th>
           			    <th class="enddate" style="width: 100px;"><a ng-click="sort_by('enddate')"><i class="icon-sort"></i><c:out value="${sessionScope.Dashboard_ToDate}" /></a></th>
           			    <th class="dateSchedule" style="width: 150px;"><a ng-click="sort_by('dateSchedule')"><i class="icon-sort"></i><c:out value="${sessionScope.Dashboard_Schedule_time}" /></a></th>
           				<th class="status" style="width: 100px;"><a ng-click="sort_by('status')"><i class="icon-sort"></i><c:out value="${sessionScope.Dashboard_Status}" /></a></th>
           				<th class="generatedBy" style="width: 100px;"><c:out value="${sessionScope.dashboard_type}" /></th>
           			 </tr>
       			</thead> 
       
        		<tfoot>
                    <td colspan="8">
                        <div class="pagination pull-right"  style="height:auto;">
                            <ul>
                                <li ng-class="{disabled: currentPage == 0}">
                                    <a href ng-click="prevPage()">« <c:out value="${sessionScope.Footer_previous}"/></a>
                                </li>
                                <li ng-repeat="n in range(pagedItems.length)"
                                    ng-class="{active: n == currentPage}"
                                    ng-click="setPage()">
                                    <a href ng-bind="n + 1">1</a>
                                </li>
                                <li ng-class="{disabled: currentPage == pagedItems.length - 1}">
                                    <a href ng-click="nextPage()"><c:out value="${sessionScope.Footer_next}"/> »</a>
                                </li>
                            </ul>
                        </div>
                    </td>
                </tfoot> 
       <tbody>
            <tr ng-repeat="item in pagedItems[currentPage] | orderBy:sortingOrder:reverse">            	
            		<td style="width: 200px;word-wrap: break-word;">
            					<span style="float: left;width: 300px;word-wrap: break-word;"><a id="opener"  data-toggle="modal" data-target="#dialog-1"
												onclick="callAction({{item.id}},'{{item.status}}','{{item.generatedBy}}')"
												cursor="pointer"><b>{{item.amcname}}</b>
											</a>
							  </span>
            		</td>
					<td  style="width: 100px;word-wrap: break-word;">
					<div ng-switch on="item.generatedBy">
							<span ng-switch-when="System">{{item.generatedBy}}</span>
            			  <span  ng-switch-default>{{item.assignedBy}}</span>
					</div>
            				
            		</td>
            		<td style="width: 100px;word-wrap: break-word;">
            					{{item.assignedTo}}
            		</td>
            		<td style="width: 100px;word-wrap: break-word;">
            					{{item.startdate}}
            		</td>
					<td style="width: 100px;word-wrap: break-word;">
            					{{item.enddate}}
            		</td>
            		<td style="width: 150px;word-wrap: break-word;">
            			<div ng-switch on="item.startTime">
            			  <span ng-switch-when="0">{{item.dateSchedule}}</span>
            			  <span  ng-switch-default>{{item.startTime}} - {{item.endTime}} on  {{item.dateSchedule}}</span>
            			
            			</div>
            		</td>
            		<td style="width: 100px;word-wrap: break-word;">
            					            					
            				<div ng-switch on="item.status">
   							 <span ng-switch-when="Created">Created</span>
  							 <span ng-switch-when="Completed">Completed</span>
  							 <span ng-switch-when="Approved">Approved</span>
  							 <span ng-switch-when="Pending" style="color:red;">Pending</span>
						</div>
						
            					
            		</td>
            		 <td class="center" style="width: 100px;word-wrap: break-word;">  
            		 		{{item.generatedBy}}
            		 </td>
            </tr>
         </tbody>    
    </table>
</div>
</div>
					</div>
					<!-- col-sm-9 -->

					

				</div>
				<!-- row -->



				<div class="row">
					<div class="col-sm-12 col-md-12">
						<div class="panel panel-default panel-alt widget-graph">
							<div class="panel-heading">
								<div class="panel-btns">
									<a href="" class="panel-edit"><i class="fa "></i>
									</a>
								</div>
								<!-- panel-btns -->
								<h3 class="panel-title">
									<c:out value="${sessionScope.DashBoard_Graph}" />
								</h3>
							</div>
							<div class="panel-body">
								<img src="images/graph.jpg" />
							</div>
							<!-- panel-body -->
						</div>
						<!-- panel -->
					</div>



				</div>
     
            </div><!-- panel-body -->
          </div><!-- panel -->
       
       
<div class="modal fade" id="dialog-1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
 
</div>
       

      <input type="hidden" name="systemComplete" id="systemComplete" value="<c:out value="${sessionScope.systemComplete}" />"/> 
 	  <input type="hidden" name="systemPending" id="systemPending" value="<c:out value="${sessionScope.systemPending}" />"/>
 	  <input type="hidden" name="manualComplete" id="manualComplete" value="<c:out value="${sessionScope.manualComplete}" />"/> 
 	  <input type="hidden" name="manualPending" id="manualPending" value="<c:out value="${sessionScope.manualPending}" />"/>
 	  <input type="hidden" name="supportComplete" id="supportComplete" value="<c:out value="${sessionScope.supportComplete}" />"/> 
 	  <input type="hidden" name="supportPending" id="supportPending" value="<c:out value="${sessionScope.supportPending}" />"/>
      <input type="hidden" name="systemCreated" id="systemCreated" value="<c:out value="${sessionScope.systemCreated}" />"/>
 	  <input type="hidden" name="manualCreated" id="manualCreated" value="<c:out value="${sessionScope.manualCreated}" />"/> 
 	  <input type="hidden" name="supportCreated" id="supportCreated" value="<c:out value="${sessionScope.supportCreated}" />"/>
         
<input type="hidden" name="pendingstatus" id="pendingstatus" value="<c:out value="${sessionScope.piechart_status_pending}" />"/>
 <input type="hidden" name="createdstatus" id="createdstatus" value="<c:out value="${sessionScope.piechart_status_created}" />"/>   
 <input type="hidden" name="completedstatus" id="completedstatus" value="<c:out value="${sessionScope.piechart_status_completed}" />"/> 
   <input type="hidden" id="toggledata" class="form-control" ng-model="toggledata" ng-init='toggledata = "<c:out value="${sessionScope.toggle}"/>"' value="<c:out value="${sessionScope.toggle}"/>">		
  

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
 		<label> Do you want to delete this row?</label>
         <span > <input type="button" value="Yes" onclick="deleteRow('yes')"/></span>
         <span > <input type="button" value="No" onclick="deleteRow('no')"/></span>
 </div>

<div  id="divcommentAlert" class="error2">
 	    <span >Add comment</span>
 </div>
 
 <script src="js/highcharts.js"></script>
<script src="js/exporting.js"></script>
 <script type="text/javascript">

$(function () {

    $(document).ready(function () {
    
    google.setOnLoadCallback(drawChart);
      function drawChart() {
 		var systemComplete=document.getElementById("systemComplete").value;
 		var systemPending=document.getElementById("systemPending").value;
 		var manualComplete=document.getElementById("manualComplete").value;
 		var manualPending=document.getElementById("manualPending").value;
 		var supportComplete=document.getElementById("supportComplete").value;
 		var supportPending=document.getElementById("supportPending").value;
 		var systemCreated=document.getElementById("systemCreated").value;
 		var manualCreated=document.getElementById("manualCreated").value;
 		var supportCreated=document.getElementById("supportCreated").value;
 		var pendingstatus=document.getElementById("pendingstatus").value;
 		var createdstatus=document.getElementById("createdstatus").value;
 		var completedstatus=document.getElementById("completedstatus").value;
 		
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          [pendingstatus,     Math.round(parseInt(manualPending)) ],
          [completedstatus,     Math.round( parseInt(manualComplete))],
            [createdstatus,    Math.round(  parseInt(manualCreated))]
        ]);

        var options = {
          title: '',
          legend: {position: 'none'},
          'width': 200,
           'height': 150,
           'chartArea': {'width': '100%', 'height': '80%'},
           colors: ['#993333', '#669900','#003366'],
            backgroundColor: '#e4e7ea',
        
        };


  		 var data1 = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          [pendingstatus,     parseInt(systemPending) ],
          [completedstatus,      parseInt(systemComplete)],
          [createdstatus,      parseInt(systemCreated)]
        ]);

       
        
         var data2 = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
           [pendingstatus,     parseInt(supportPending) ],
          [completedstatus,      parseInt(supportComplete)],
           [createdstatus,      parseInt(supportCreated)]
        ]);

     
          var data3 = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          [pendingstatus,     15],
          [completedstatus,      2],
           [createdstatus,      4]
        ]);

       
        var chart = new google.visualization.PieChart(document.getElementById('container1'));
  		var chart1 = new google.visualization.PieChart(document.getElementById('container2'));	
  		var chart2 = new google.visualization.PieChart(document.getElementById('container3'));	
  		var chart3 = new google.visualization.PieChart(document.getElementById('container4'));	
        chart.draw(data, options);
        chart1.draw(data1, options);
        chart2.draw(data2, options);
        chart3.draw(data3, options);
      }
    });

});

</script>
</body>
</html>
