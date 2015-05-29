<%@ taglib uri="/WEB-INF/tld/c-1_0.tld" prefix="c"%>
<div class="leftpanel">

	<div class="logopanel">
		<h1>
			<a href="dashboard.htm"><img src="images/logo.png" /></a>
		</h1>
	</div>
	<!-- logopanel -->

	<div class="leftpanelinner">
		<ul class="nav nav-pills nav-stacked nav-bracket">
			<c:if test="${sessionScope.view_mod_1=='1'}">			
			 <li class="active" id="dashboard"><a href="dashboard.login.htm" title="<c:out value="${sessionScope.LeftPannel_Dashboard}"/>"><i class="fa fa-home"></i> <span> <c:out value="${sessionScope.LeftPannel_Dashboard}"/></span></a></li>			
			</c:if>
			<c:if test="${sessionScope.view_mod_3=='1'}">
				<li class="nav-parent" id="organization">
					<a href="#" title="<c:out value="${sessionScope.LeftPannel_Organization}"/>"><i class="fa fa-envelope-o"></i> <span> <c:out value="${sessionScope.LeftPannel_Organization}"/></span>
					</a>
					<ul class="children">
						<c:if test="${sessionScope.view_mod_4=='1'}">
							<li id="company">
								<a href="companyview.org.htm" title="<c:out value="${sessionScope.LeftPannel_Details}"/>"><i
									class="fa fa-caret-right"></i> <c:out value="${sessionScope.LeftPannel_Details}"/></a>
							</li>
						</c:if>
						<c:if test="${sessionScope.view_mod_5=='1'}">
							<li id="division">
								<a href="legalentities.org.htm" title="<c:out value="${sessionScope.LeftPannel_Divisions}"/>"><i
									class="fa fa-caret-right"></i> <c:out value="${sessionScope.LeftPannel_Divisions}"/></a>
							</li>
						</c:if>
						<c:if test="${sessionScope.view_mod_6=='1'}">
							<li id="locations">
								<a href="locations.org.htm" title="<c:out value="${sessionScope.LeftPannel_Locations}"/>"><i
									class="fa fa-caret-right"></i> <c:out value="${sessionScope.LeftPannel_Locations}"/></a>
							</li>
						</c:if>
					   <c:if test="${sessionScope.view_mod_7=='1'}">
						<li id="department">
								<a href="department.org.htm" title="<c:out value="${sessionScope.LeftPannel_Departments}"/>"><i
									class="fa fa-caret-right"></i> <c:out value="${sessionScope.LeftPannel_Departments}"/></a>
						</li>
						</c:if>
						<c:if test="${sessionScope.view_mod_8=='1'}">
							<li id="busiprocess">
								<a href="businessprocesses.org.htm" title="<c:out value="${sessionScope.LeftPannel_BuisnessProcess}"/>"><i
									class="fa fa-caret-right"></i> <c:out value="${sessionScope.LeftPannel_BuisnessProcess}"/></a>
							</li>
						</c:if>
						<c:if test="${sessionScope.view_mod_9=='1'}">
							<li id="applications">
								<a href="applications.org.htm" title="<c:out value="${sessionScope.LeftPannel_Applications}"/>"><i
									class="fa fa-caret-right"></i> <c:out value="${sessionScope.LeftPannel_Applications}"/></a>
							</li>
						</c:if>
						
						<c:if test="${sessionScope.view_mod_10=='1'}">

							<li id="employee">
								<a href="employees.org.htm" title="<c:out value="${sessionScope.LeftPannel_Employees}"/>"><i class="fa fa-caret-right"></i>
									<c:out value="${sessionScope.LeftPannel_Employees}"/>
									</a>
							</li>
						</c:if>
						<c:if test="${sessionScope.view_mod_11=='1'}">
							<li id="usergroup">
								<a href="group.group.htm" title="<c:out value="${sessionScope.LeftPannel_UserGroup}"/>"><i class="fa fa-caret-right"></i> 
									<c:out value="${sessionScope.LeftPannel_UserGroup}"/>
								</a>
							</li>
						</c:if>
						<c:if test="${sessionScope.view_mod_12=='1'}">
							<li id="vendor">
								<a href="vendor.org.htm" title="<c:out value="${sessionScope.LeftPannel_VendorCat}"/>"><i
									class="fa fa-caret-right"></i> <c:out value="${sessionScope.LeftPannel_VendorCat}"/></a>
							</li>
						</c:if>
						
						
					</ul>
				</li>
			</c:if>


			<c:if test="${sessionScope.view_mod_13=='1'}">
				<li class="nav-parent" id="asset">
					<a href="#"><i class="fa fa-suitcase"></i> <span><c:out value="${sessionScope.LeftPannel_Assets}"/></span> </a>
					<ul class="children">
						<c:if test="${sessionScope.view_mod_14=='1'}">
							<li id="assets">
								<a href="assets.assets.htm" title="<c:out value="${sessionScope.LeftPannel_Assets}"/>"><i class="fa fa-caret-right"></i>
									<c:out value="${sessionScope.LeftPannel_Assets}"/></a>
							</li>
						</c:if>
						<c:if test="${sessionScope.view_mod_15=='1'}">
							<li id="categories">
								<a href="categories.assets.htm" title="<c:out value="${sessionScope.LeftHandPanel_Category}"/>"><i class="fa fa-caret-right"></i>
									<c:out value="${sessionScope.LeftHandPanel_Category}"/></a>
							</li>
						</c:if>
						<c:if test="${sessionScope.view_mod_16=='1'}">
							<li id="returns">
								<a href="#" title="<c:out value="${sessionScope.LeftPannel_Returns}"/>"><i class="fa fa-caret-right"></i>
									<c:out value="${sessionScope.LeftPannel_Returns}"/></a>
							</li>
						</c:if>
						
					</ul>

				</li>
			</c:if>
			<c:if test="${sessionScope.view_mod_17=='1'}">
				<li class="nav-parent" id="assestment">
					<a href="#" title="<c:out value="${sessionScope.LeftPannel_Assessment}"/>"><i class="fa fa-file-text"></i> <span>
					<c:out value="${sessionScope.LeftPannel_Assessment}"/>
					</span>
					</a>
					<ul class="children">
						<c:if test="${sessionScope.view_mod_18=='1'}">
							<li id="auditplan">
								<a href="auditplan.assess.htm" title="<c:out value="${sessionScope.LeftPannel_Audit}"/>"><i class="fa fa-caret-right"></i>
									<c:out value="${sessionScope.LeftPannel_Audit}"/>
									</a>
							
							</li>
						</c:if>
						<c:if test="${sessionScope.view_mod_19=='1'}">
							<li id="deficiency">
								<a href="#" title="<c:out value="${sessionScope.LeftPannel_defeciency}"/>"><i class="fa fa-caret-right"></i>
									<c:out value="${sessionScope.LeftPannel_defeciency}"/>
									</a>
							
							</li>
						</c:if>
					</ul>
				</li>
			</c:if>
			<c:if test="${sessionScope.view_mod_20=='1'}">
				<li class="nav-parent" id="regulations">
					<a href="#" title="<c:out value="${sessionScope.LeftPannel_Regulations}"/>"><i class="fa fa-map-marker"></i> <span>
					
					<c:out value="${sessionScope.LeftPannel_Regulations}"/>
					</span>
					</a>
					<ul class="children">
						<c:if test="${sessionScope.view_mod_21=='1'}">
							<li id="library">
								<a href="risklibrary.reg.htm" title="<c:out value="${sessionScope.LeftPannel_Risk}"/>"><i
									class="fa fa-caret-right"></i>
									<c:out value="${sessionScope.LeftPannel_Risk}"/>
									</a>
							</li>
						</c:if>
						<c:if test="${sessionScope.view_mod_22=='1'}">
							<li id="controls">
								<a href="controls.reg.htm" title="<c:out value="${sessionScope.LeftPannel_Controls}"/>"><i class="fa fa-caret-right"></i>
									
									<c:out value="${sessionScope.LeftPannel_Controls}"/>
									
									</a>
							</li>
						</c:if>
						<c:if test="${sessionScope.view_mod_23=='1'}">
							<li id="tests">
								<a href="test.reg.htm" title="<c:out value="${sessionScope.LeftPannel_Tests}"/>"><i class="fa fa-caret-right"></i>
									<c:out value="${sessionScope.LeftPannel_Tests}"/>
									</a>
							</li>
						</c:if>
						
							<c:if test="${sessionScope.view_mod_24=='1'}">
							<li id="controlCat">
								<a href="controlCategory.reg.htm" title="<c:out value="${sessionScope.LeftPannel_ControlCategory}"/>"><i
									class="fa fa-caret-right"></i>
									<c:out value="${sessionScope.LeftPannel_ControlCategory}"/>
									</a>
							</li>
						</c:if>
					</ul>
				</li>
			</c:if>
			<c:if test="${sessionScope.view_mod_25=='1'}">
				<li id="test">
					<a href="test.assess.htm" title="<c:out value="${sessionScope.LeftPannel_Testdata}"/>"><i class="fa fa-file-text"></i> 
					<span>
						<c:out value="${sessionScope.LeftPannel_Testdata}"/>
					</span>
					</a>
				</li>
				</c:if>
			
			<c:if test="${sessionScope.view_mod_26=='1'}">
				<li id="task">
					<a href="task.assets.htm" title="<c:out value="${sessionScope.LeftPannel_Tasks}"/>"><i class="fa fa-file-text"></i> <span>
					
					<c:out value="${sessionScope.LeftPannel_Tasks}"/>
					</span>
					</a>
				</li>
			</c:if>
				<c:if test="${sessionScope.view_mod_27=='1'}">
				<li id="policy">
					<a href="policy.assess.htm" title="<c:out value="${sessionScope.LeftPannel_Policies}"/>"><i class="fa fa-file-text"></i> <span>
					
					<c:out value="${sessionScope.LeftPannel_Policies}"/>
					</span>
					</a>
				</li>
			</c:if>
				
			
			<c:if test="${sessionScope.view_mod_29=='1'}">
				<li class="nav-parent" id="support">
					<a href="#" title="<c:out value="${sessionScope.LeftPannel_Supports}"/>"><i class="fa fa-map-marker"></i> <span><c:out value="${sessionScope.LeftPannel_Supports}"/></span>
					</a>
					<ul class="children">
						<c:if test="${sessionScope.view_mod_30=='1'}">
							<li id="ticket">
								<a href="ticket.assets.htm" title="<c:out value="${sessionScope.LeftPannel_Tickets}"/>"><i class="fa fa-caret-right"></i>
								   <c:out value="${sessionScope.LeftPannel_Tickets}"/>
									</a>
							</li>
							</c:if>
							<c:if test="${sessionScope.view_mod_31=='1'}">
							<li id="ticketCat">
								<a href="ticketcategory.assets.htm" title="<c:out value="${sessionScope.ticket_Category}"/>"><i
									class="fa fa-caret-right"></i> <c:out value="${sessionScope.ticket_Category}"/></a>
							</li>
						</c:if>
						
						
						

					</ul>
				</li>
			</c:if>
			<c:if test="${sessionScope.view_mod_32=='1'}">
				<li id="report">
					<a href="#" title="<c:out value="${sessionScope.LeftPannel_Reports}"/>"><i class="fa fa-file-text"></i> <span>
					
					<c:out value="${sessionScope.LeftPannel_Reports}"/>
					</span>
					</a>
				</li>
			</c:if>

			<c:if test="${sessionScope.view_mod_33=='1'}">
				<li class="nav-parent" id="master">
					<a href="#" title="<c:out value="${sessionScope.LeftPannel_Masters}"/>"><i class="fa fa-th-list"></i> <span>
					
					<c:out value="${sessionScope.LeftPannel_Masters}"/>
					
					</span>
					</a>
					<ul class="children">
						<c:if test="${sessionScope.view_mod_34=='1'}">
							<li id="country">
								<a href="country.master.htm" title="<c:out value="${sessionScope.LeftPannel_Country}"/>"><i
									class="fa fa-caret-right"></i> 
									<c:out value="${sessionScope.LeftPannel_Country}"/>
									</a>
							</li>
						</c:if>
						<c:if test="${sessionScope.view_mod_35=='1'}">
							<li id="state">
								<a href="state.master.htm" title="<c:out value="${sessionScope.LeftPannel_State}"/>"><i
									class="fa fa-caret-right"></i> 
									<c:out value="${sessionScope.LeftPannel_State}"/>
									</a>
							</li>
						</c:if>
						<c:if test="${sessionScope.view_mod_36=='1'}">
							<li id="vendorCat">
								<a href="vendorcategory.master.htm" title="<c:out value="${sessionScope.LeftPannel_Vendore}"/>"><i
									class="fa fa-caret-right"></i> <c:out value="${sessionScope.LeftPannel_Vendore}"/></a>
							</li>
						</c:if>	
					</ul>
				</li>
			</c:if>



		</ul>
	</div>
	<!-- leftpanelinner -->
</div>
<!-- leftpanel -->