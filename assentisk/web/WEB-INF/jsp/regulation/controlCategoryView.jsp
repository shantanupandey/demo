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

		<title>Assentisk</title>
		<link href="css/custom.css" rel="stylesheet">
		<script src="js/angular.min.js"></script>
		<script src="js/regulations/controlCategory.js"></script>

		<link rel="stylesheet" href="css/jquery-ui.css">
		<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
		<script src="js/jquery-ui.js"></script>
		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->
		<link rel="stylesheet" href="css/style.css">
		<script src="http://code.jquery.com/jquery-1.7.2.min.js"
			type="text/javascript">
	
</script>

		<script type="text/javascript"><!--
	var nodeVal;
	var globalVal=0;
	$(document).ready(function() {
	
	  
	 
	  $("#imageloader").css("display", "none");
      $("#complete").css("display", "block");
      $("div.leftpanelinner>ul>li#controlCat").css("background", "#003366");
		$("div.leftpanelinner>ul>li#controlCat>a").css("color", "white");
		$("div.leftpanelinner>ul>li#controlCat>a>span").css("color", "white");
		$("div.leftpanelinner>ul>li#regulations").addClass("nav-parent nav-active");
		$("div.leftpanelinner>ul>li#regulations>ul").css("display", "block");
		$("div.leftpanelinner>ul>li#regulations>ul>li#controlCat").addClass("active");
      
	 
		$('.tree li').each(function() {
			if ($(this).children('ul').length > 0) {
				$(this).addClass('parent');
			}
		});

		$('.tree li.parent > a').click(function() {
			$(this).parent().toggleClass('active');
			$(this).parent().children('ul').slideToggle('fast');
		});

		$('#all').click(function() {

			$('.tree li').each(function() {
				$(this).toggleClass('active');
				$(this).children('ul').slideToggle('fast');
			});
		});

		$('.tree li').each(function(){
			$(this).toggleClass('active');
			$(this).children('ul').slideToggle('fast');
		});
		
		
		
		 addNodeItem();

	});
	
	  
        
		function addNodeItem(){
		
      
		
	   	}
	   	
	   	
		function addItem(){
		
		var nodeId=document.getElementById("clickIdNode").value;
		var nodeValueId=document.getElementById("clickIdNodeVal").value;
		
		node1Sub=nodeId.substring(0, 5); 
		node2Sub=nodeValueId.substring(0, 5); 
		
		var idParent;
		if(nodeValueId.length == 0){
		idParent=nodeId;
		}else{
		idParent=nodeValueId;
		}
		
		if(node1Sub == node2Sub){
		idParent=nodeValueId;
		}else{
		idParent=nodeId;
		}
		
		
		var counter=$('#'+idParent+' ul li').length+1;
		var id=idParent+counter;
		
		if(idParent == 'node0'){
		
		$("#node0 ul").eq(0).append("<li id='"+idParent+""+counter+"'><img style='visibility: hidden;' src='images/dhtmlgoodies_plus.gif'><img src='images/dhtmlgoodies_folder.gif'><a href='#' id='"+idParent+""+counter+"' onmouseup='mouseDown(event,&apos;"+idParent+''+counter+"&apos;,&apos;"+idParent+""+counter+"&apos;);'>Folder</a></li>");
	
		}else{
		
		$("#"+idParent+"").append("<ul id='tree_ul_2' style='display: block;'><li id='"+idParent+""+counter+"'><img style='visibility: hidden;' src='images/dhtmlgoodies_plus.gif'><img src='images/dhtmlgoodies_folder.gif'><a href='#' id='"+idParent+""+counter+"' onmouseup='mouseDown(event,&apos;"+idParent+''+counter+"&apos;,&apos;"+idParent+""+counter+"&apos;);'>Folder</a></li>");
		
		}
		
		
		$.get("savecontrolCategory.reg.htm?parent=" + id, function(data, status)
														{	
														
															
															loadTreeAjax();
														
														});
		
		
	   	}
	   	
	   	
	   
	   	
	   	function myFunction(nodeId){
	    
        $('#clickIdNode').val(nodeId);
       
        
        }
        
       function mouseDown(e,node,nodeItem){
       
       
		 e = e || window.event;
		
		 $('#clickIdNodeVal').val(nodeItem);
		
		 menuView(e,node);
		  
		}
        
        function menuView(e,id){
        
        this.id=id;
        if(document.all)e = event;		
		var ref = referenceToDHTMLSuiteContextMenu;
	
		
		if(ref.menuObject.style == undefined){
		ref.__createMenuItems();
		}else{
		ref.srcElement = ref.getSrcElement(e);
		
		
		ref.indexCurrentlyDisplayedMenuModel=id;
		
		ref.menuObject.style.left = (e.clientX + 0) + 'px';
		ref.menuObject.style.top = (e.clientY + 0) + 'px';
		ref.menuObject.style.display='block';
		
		if(!ref.indexCurrentlyDisplayedMenuModel || ref.indexCurrentlyDisplayedMenuModel!=this.id){		
		
				
			if(ref.indexCurrentlyDisplayedMenuModel){
				ref.menuObject.innerHTML = '';				
			}else{
				ref.__createDivs();
			}
			ref.menuItems = ref.menuModels[this.id].getItems();			
			ref.__createMenuItems();	
		}
		}
		
		
		
		return false;
        }


function doSomething(e,node){
 
    
    
    var ul = document.getElementById('dhtmlgoodies_tree2');
    var valueId=e.target.id;
    var n = valueId.search("ATag");
    
    if(n > 0){
    valueId = valueId.replace("ATag", "");
    }
  

    var rightclick;
    if (!e) var e = window.event;
    if (e.which) rightclick = (e.which == 3);
    else if (e.button) rightclick = (e.button == 2);
    
     $('#clickIdNode').val(valueId);
     $('#clickIdNodeVal').val(valueId);
     return false;
}


	function renameItem(renameVal){
	
	
	if(renameVal.length < 20){
	var myDivObj = document.getElementById("treeData");	
		
		var treeValue=$('#treeData').html();
		
		var nodeId=document.getElementById("clickIdNode").value;
		
		
		
		$.get("updatecontrolCategory.reg.htm?treeNodeId=" + nodeId+"&renameVal="+renameVal, function(data, status)
														{	
														
															loadTreeAjax();
														
														});
													
       
														
      
								
   
		
	
	}else{
	$('#lengthError').show();
    $('#lengthError').delay(1500).fadeOut('slow');
    refresh();
	}
	
		
	   	}
	   	

	
    </script>

    <script type="text/javascript" src="js/ajax.js"></script>
	<script type="text/javascript" src="js/context-menu.js"></script><!-- IMPORTANT! INCLUDE THE context-menu.js FILE BEFORE drag-drop-folder-tree.js -->
	<script type="text/javascript" src="js/drag-drop-folder-tree.js"></script>
	<link rel="stylesheet" href="css/drag-drop-folder-tree.css" type="text/css"></link>
	<link rel="stylesheet" href="css/context-menu.css" type="text/css"></link>
	<style type="text/css">
	/* CSS for the demo */
	img{
		border:0px;
	}
	</style>
	<script type="text/javascript">
	//--------------------------------
	// Save functions
	//--------------------------------
	
	  
   
    
      
	var ajaxObjects = new Array();
	
	
	// Use something like this if you want to save data by Ajax.
	
	
	
	function saveMyTree()
	{


    $("#saveTheTree").one('click', function (event) {  
           event.preventDefault();
           $(this).prop('disabled', true);
     });
	$('#saveTheTree').attr('disabled',true);
	
	var treeValue=$('#treeData').html();
			  $.ajax(
	 				{
	 			   		type: "POST",
	 			   		url: 'saveTree.reg.htm',	
	 			   		data: {htmlVal:treeValue.trim()},
 					    dataType: 'html', 			   			 			   	
	 			  		success: function(data)
	 			  				{
	 			  				 
	 			  					$('#treeData').html("");
	 			  					$('#treeData').html(data);
	 			  					    treeObj = new JSDragDropTree();
										treeObj.setTreeId('dhtmlgoodies_tree2');
										treeObj.setMaximumDepth(1000);
										treeObj.setMessageMaximumDepthReached('Maximum depth reached'); // If you want to show a message when maximum depth is reached, i.e. on drop.
										treeObj.initTree();
										treeObj.expandAll();
										$('#submitSucess').show();
				                        $('#submitSucess').delay(1500).fadeOut('slow');
				                       	$('#saveTheTree').removeAttr("disabled");
								}
								}).responseText;
							
			
	 	
	}
	function refresh(){
	
		var data=document.getElementById("treeValues").value;
     	$('#treeData').html(data);
	 	treeObj = new JSDragDropTree();
		treeObj.setTreeId('dhtmlgoodies_tree2');
		treeObj.setMaximumDepth(1000);
		treeObj.setMessageMaximumDepthReached('Maximum depth reached'); // If you want to show a message when maximum depth is reached, i.e. on drop.
		treeObj.initTree();
		treeObj.expandAll();
	}
	
	function saveComplete(index)
	{
		alert(ajaxObjects[index].response);			
	}


    function colapse(idOfTree){
    
    	var menuItems = document.getElementById(idOfTree).getElementsByTagName('LI');
			for(var no=0;no<menuItems.length;no++){
				var subItems = menuItems[no].getElementsByTagName('UL');
				if(subItems.length>0 && subItems[0].style.display=='block'){
					JSTreeObj.showHideNode(false,menuItems[no].id);
				}			
			}	
    }
    
    function expand(idOfTree){
    var menuItems = document.getElementById(idOfTree).getElementsByTagName('LI');
			for(var no=0;no<menuItems.length;no++){
				var subItems = menuItems[no].getElementsByTagName('UL');
				if(subItems.length>0 && subItems[0].style.display!='block'){
					JSTreeObj.showHideNode(false,menuItems[no].id);
				}			
			}
    
    }
	
	// Call this function if you want to save it by a form.
	function saveMyTree_byForm()
	{
		document.myForm.elements['saveString'].value = treeObj.getNodeOrders();
		document.myForm.submit();		
	}
	
	
	
	function deleteNodes(id){
	
	$.get("deleteControlCategory.reg.htm?Nodeid=" + id, function(data, status){
	});
	$('#'+id+'').remove();
   
   	}


   function loadTreeAjax(){
   
   var treeValue=$('#treeData').html();
   
   
   
    $.ajax(
	 				{
	 			   		type: "POST",
	 			   		url: 'saveTree.reg.htm',	
	 			   		data: {htmlVal:treeValue.trim()},
 					    dataType: 'html', 			   			 			   	
	 			  		success: function(data)
	 			  				{
	 			  														
									$('#treeData').empty().append(data);
	 			  					
	 			  					    treeObj = new JSDragDropTree();
										treeObj.setTreeId('dhtmlgoodies_tree2');
										treeObj.setMaximumDepth(1000);
										treeObj.setMessageMaximumDepthReached('Maximum depth reached'); // If you want to show a message when maximum depth is reached, i.e. on drop.
										treeObj.initTree();
										treeObj.expandAll();
										
								}
								}).responseText;
   }
	</script>
	<script>   
      $(document).ready(function(){
     
		var data=document.getElementById("treeValues").value;
     	$('#treeData').html(data);
	 	treeObj = new JSDragDropTree();
		treeObj.setTreeId('dhtmlgoodies_tree2');
		treeObj.setMaximumDepth(1000);
		treeObj.setMessageMaximumDepthReached('Maximum depth reached'); // If you want to show a message when maximum depth is reached, i.e. on drop.
		treeObj.initTree();
		treeObj.expandAll();	
								
										
	});
      </script>
	</head>

	<body oncontextmenu="return false;" class="<c:out value="${sessionScope.bodyClass}"></c:out>">


		<section>

		<%@include file="/WEB-INF/jsp/leftpanel.jsp"%>
		

		<div class="mainpanel">
			<%@include file="/WEB-INF/jsp/header.jsp"%>
			
			 <div class="modal fade" id="dialog-12" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title" id="exampleModalLabel">Add Node</h4>
			     	<table id="uploaddataAlert" style="color:black;margin-top:20px;">
			 			
			 				<tr><td id="ErrorMessage"></td></tr>
			 				<tr><td id="SuccessMessage"></td></tr>
			 		</table>
			        
			      </div>
			      <div class="modal-body scheduler">
			        
			     <div class="bottomdiv">
			     </div></div></div></div>
			 </div>
			

			<div class="pageheader">
				<h2 id="header">
					<c:out value="${sessionScope.addcontrol_page_header}" />
					<input type="hidden" id="clickIdNode" />
					<input type="hidden" id="clickIdNodeVal" />
					<input type="hidden" id="treeValues" value="<c:out value="${treeView}"/>"/>
					
				</h2>
				<div class="breadcrumb-wrapper">
					<span class="label"><c:out
							value="${sessionScope.DashBoard_YouAreHere}" />:</span>
					<ol class="breadcrumb">
						<li>
							<a href="dashboard.login.htm">Assentisk</a>
						</li>
						<li class="active">
							<c:out value="${sessionScope.addcontrol_page_header}" />
						</li>
					</ol>
				</div>
			</div>
            <input type="hidden" id="formStatus" value=""/>
            <input type="hidden" id="controlId" value=""/>
            
			<div class="contentpanel">
		
		<div  class="panel panel-default" style="overflow:auto;">
		<div id="treeData" style="margin-left:20px;padding-top:20px;">
	       <ul id="dhtmlgoodies_tree2" class="dhtmlgoodies_tree">
			<li id="node0" nodrag="true" nosiblings="true" onmouseup="doSomething(event,'node1');"><a id="nodeATag0" href="#">Test controll</a>
				<ul style="display: block;" id="tree_ul_0">
					<li id="node1" onmouseup="doSomething(event,'node1');">
					<a id="nodeATag1" href="#">Controlls</a>
						
					</li>
				
				</ul>
			
			
			</li>
		  </ul>
	</div>
	
	<form>
	<input type="button" id="saveTheTree" onclick="saveMyTree()"  title="Save" value="Save" class="btn btn-primary" style="margin-bottom: 5px;margin-left: 10px;">
	</Form>
	</div>
	<script type="text/javascript">	
	treeObj = new JSDragDropTree();
	treeObj.setTreeId('dhtmlgoodies_tree2');
	treeObj.setMaximumDepth(1000);
	treeObj.setMessageMaximumDepthReached('Maximum depth reached'); // If you want to show a message when maximum depth is reached, i.e. on drop.
	treeObj.initTree();
	treeObj.expandAll();
	
	
	</script>
	<!--<a href="#" onclick="treeObj.collapseAll()">Collapse all</a> | 
	<a href="#" onclick="treeObj.expandAll()">Expand all</a>
	
	-->
	<!-- Form - if you want to save it by form submission and not Ajax -->
	<form name="myForm" method="post" action="saveNodes.php">
		<input type="hidden" name="saveString">
	</form>

				<!-- contentpanel -->

			</div>
			<!-- mainpanel -->

		</div>

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

		<div id="submitSucess" class="success">
			<span> <c:out value="${sessionScope.SubmitAlert}" /> </span>
		</div>

		<div id="controlidAlert" class="error2">
			<span> <c:out value="${sessionScope.controlidalert}" /> </span>
		</div>

		<div id="controlidconfirmAlert" class="error2">
			<span> <c:out value="${sessionScope.controlidconfirmalert}" />
			</span>
		</div>

		<div id="buisnessProcessDiv" class="error2">
			<span> <c:out value="${sessionScope.buisnessProcessMessage}" /> </span>
		</div>
		
		<div id="lengthError" class="error2">
			<span>Length Of Control Category Exceeded.</span>
		</div>
		

	</body>
</html>
