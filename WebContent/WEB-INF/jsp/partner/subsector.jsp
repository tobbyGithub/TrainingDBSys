<%@ include file="/common/taglibs.jsp"%>
<div id="subsector_${id}" class="category">
	<s:property value="type" />
</div>
<iita:authorize ifAnyGranted="ROLE_PARTNERADMIN, ROLE_ADMIN">
<iita:inlineeditor id="subsectorForm" targetId="subsector_${id}">
	<s:include value="subsector-inlineform.jsp" />
</iita:inlineeditor>
</iita:authorize>