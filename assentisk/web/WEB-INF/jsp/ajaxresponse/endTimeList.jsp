<%@ taglib uri="/WEB-INF/tld/c-1_0.tld" prefix="c"%>


<select style="width:100px;" id="endreflectTime" onchange="callDifference(this.value);">
							<c:forEach var="list" items="${timeList}"  varStatus="stat">
							<c:choose>
									<c:when test="${stat.first}">
																	<option value="<c:out value="${list.id}"/>" selected><c:out value="${list.time}"/><c:out value="${list.AM_PM}"/></option>
									
									</c:when>
									<c:otherwise>
																	<option value="<c:out value="${list.id}"/>"><c:out value="${list.time}"/><c:out value="${list.AM_PM}"/></option>
									
									
									</c:otherwise>
							
							</c:choose>
							 </c:forEach>
</select>
