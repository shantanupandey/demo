<%@ taglib uri="/WEB-INF/tld/c-1_0.tld" prefix="c"%>


<select class="form-control" id="cityid" ng-model="cityid" name="city">
	<option value="">
		-- Select City --
	</option>
	<c:if test="${flag == true}">
	<c:forEach var="list" items="${cityList}">
		<option value="<c:out value="${list.CityID}"/>">
			<c:out value="${list.CityName}" />
		</option>
	</c:forEach>
	</c:if>
</select>
