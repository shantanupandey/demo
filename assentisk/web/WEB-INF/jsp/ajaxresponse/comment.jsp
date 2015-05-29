
<%@ taglib uri="/WEB-INF/tld/c-1_0.tld" prefix="c"%>
<div class="modal-dialog">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
			<h4 class="modal-title" id="exampleModalLabel">
			
			<c:choose>
				<c:when test="${type=='System'}">
					<c:out value="${sessionScope.comment_action_system}" />
				</c:when>
				<c:when test="${type=='Manual'}">
					<c:out value="${sessionScope.comment_action_manual}" />
				</c:when>
				<c:when test="${type=='Support Ticket'}">
					<c:out value="Support Ticket" />
				</c:when>
				<c:otherwise>
					<c:out value="${sessionScope.comment_action_support}" />
				</c:otherwise>
			
			</c:choose>
				
			</h4>
		</div>
		<div class="modal-body">
	
								
			<div class="row">
			
				<div class="col-sm-6">
					<div class="form-group">
						<label class="control-label">
							<c:out value="${sessionScope.comment_assignedBy}" />
							
						</label>
						
						
					</div>
				</div>
				<div class="col-sm-6">
					<div class="form-group">
						
						<label>
							<c:out value="${empname}"/>
						</label>
						
					</div>
				</div>
				
				</div>
				<div class="row">
					
				<div class="col-sm-6">
					<div class="form-group">
						<label class="control-label">
							<c:out value="${sessionScope.Dashboard_Name}" />
							
						</label>
						
						
					</div>
				</div>
				<div class="col-sm-6">
					<div class="form-group">
						
						<label >
						<span style="width:200px;word-wrap: break-word;">
							<c:out value="${amcname}"/>
							</span>
						</label>
						
					</div>
				</div>
			</div>
				<div class="row">
				<div class="col-sm-6">
					<div class="form-group">
						<label class="control-label">
							<c:out value="${sessionScope.comment_schedule}" />
							
						</label>
						
					</div>
				</div>
				<div class="col-sm-6">
					<div class="form-group">
						
						<label >
							<c:choose>
								<c:when test="${startTime== '' || startTime== '0'}"></c:when>
								<c:otherwise><c:out value="${startTime}"/> to <c:out value="${endTime}"/> on</c:otherwise>
							</c:choose>
							 <c:out value="${dateSchedule}"/>
						</label>
						
					</div>
				</div>
				</div>
				<div class="row">
				<div class="col-sm-6">
					<div class="form-group">
						<label class="control-label">
							<c:out value="${sessionScope.Dashboard_Comments}" />
							
						</label>
						<input type="text" name="comment" id="comment"
							class="form-control" ng-model="comment" style="width: 264px;"
							maxlength="250" value="<c:out value="${comment}"/>">
					</div>
				</div>
				<!-- col-sm-6 -->
			</div>
			<!-- row -->
			<c:if test="${assignedBy == userId}">
			<label class="control-label">
				<c:choose>
					<c:when test="${status == 'Approved'}">
						<input type="radio" name="active" value="1" checked>
						<c:out value="${sessionScope.Dashboard_Approved}" />
					</c:when>
					<c:otherwise>
						<input type="radio" name="active" value="1">
						<c:out value="${sessionScope.Dashboard_Approved}" />
					</c:otherwise>
				</c:choose>

			</label>
			</c:if>
			&nbsp;&nbsp;
			<c:if test="${assignedTo == userId}">
			<label class="control-label">
				<c:choose>
					<c:when test="${status=='Completed'}">
						<input type="radio" name="active" value="2" checked>
						<c:out value="${sessionScope.Dashboard_Completed}" />
					</c:when>
					<c:otherwise>
						<input type="radio" name="active" value="2">
						<c:out value="${sessionScope.Dashboard_Completed}" />
					</c:otherwise>
				</c:choose>

			</label>
			</c:if>
			&nbsp;&nbsp;
			<c:if test="${assignedBy == userId}">
			<label class="control-label">
						<input type="radio" name="active" value="3" >
						<c:out value="${sessionScope.Dashboard_Cancelled}" />
			</label>
			</c:if>
		
	
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal" >
				Close
			</button>
			<button type="button" class="btn btn-primary" onclick="savecomment();">
				Save
			</button>
		</div>
		
	
	</div>
</div>
