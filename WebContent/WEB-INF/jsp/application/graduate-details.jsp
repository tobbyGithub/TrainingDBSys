<%@ include file="/common/taglibs.jsp"%>
<%-- <%@ taglib uri="http://java.fckeditor.net" prefix="FCK"%> --%>
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor" %>

<html lang="en">
<head>
    <title>Graduate Training Application</title>
    <style>
    	td > label {
		    display: inline-block;
		    padding: 0.25em 0.4em;
		    font-size: 100%;
		    line-height: 1;
		    color: #FFF;
		    white-space: normal;
		    vertical-align: baseline;
		    border-radius: 0.25rem;
		    background-color: #5BC0DE;
		}
    </style>
</head>
<body>
		
		<s:if test="application.ptEvaluation==null">
			<div class="pull-right">
				<s:form id="" namespace="/" action="post-training" method="get">
				<s:hidden name="applicationId" value="%{application.id}" />
				<s:submit cssClass="btn btn-success" value="Submit Evaluation"/>
				</s:form>
			</div>
		</s:if>
		
<s:if test="application!=null">
<s:push value="application">
<table style="width: 100%">
	<colgroup>
		<col />
		<s:if test="biodata!=null || cdoBioData!=null || application.documents!=null || application.reportdocuments!=null">
			<col width="350" />
		</s:if>
	</colgroup>
	<tbody>  
	<tr>
	<td>
<%--  <h2>Application for: <a href="<s:url namespace="/announcement" action="profile" />?id=<s:property value="announcement.id" />"><s:property value="announcement.title" /></a></h2>
--%>
<s:set name="application" value="application" />

<s:hidden name="announcementId" value="%{announcement.id}" />
<s:hidden name="applicationId" value="%{application.id}" />
<h3>Application Status: <em><s:text name="application.status.%{application.status}" /></em></h3>
<div id="container-fluid">

<s:include value="/WEB-INF/jsp/include/biodata-details.jsp" />

<s:include value="/WEB-INF/jsp/include/projectsummary-details.jsp" />

<s:include value="/WEB-INF/jsp/include/timeschedule-details.jsp" />

<s:include value="/WEB-INF/jsp/include/milestone-details.jsp" />

<s:include value="/WEB-INF/jsp/include/supporttype-details.jsp" />

<s:if test="application.internalApprovals!=null">
	<s:include value="/WEB-INF/jsp/review/include/cdo-processing-details.jsp" />
</s:if>
</div> 
</td>

<s:if test="biodata!=null || cdoBioData!=null || application.documents!=null">
	<td style="padding-left: 10px;">
		<s:if test="application.documents.size>0">
			<h2>Application Supporting Documents</h2>
			
			<ul class="file-list">
				<s:iterator value="application.documents">
					<li class="file"><s:include value="/WEB-INF/jsp/document/entitydocument-application-quick.jsp" /></li>
				</s:iterator>
			</ul>
		</s:if>
		
		<s:if test="user==cdoBioData.user">
			<p>Attach document to application:</p>
			<iita:fileupload action="application-document-details!upload" value="Upload files" queryParams="entityId=${application.id}" />
		</s:if>
		
		<s:if test="application.reportdocuments.size>0">
			<h2>Reporting Documents</h2>
			
			<ul class="file-list">
				<s:iterator value="application.reportdocuments">
					<li class="file"><s:include value="/WEB-INF/jsp/document/entitydocument-applicationreport-quick.jsp" /></li>
				</s:iterator>
			</ul>
		</s:if>
		
		<s:if test="user==cdoBioData.user">
			<p>Attach report document to application:</p>
			<iita:fileupload action="application-reportdocument-details!upload" value="Upload files" queryParams="entityId=${application.id}" />
		</s:if>
		
		<s:if test="cdoBioData!=null && user==cdoBioData.user">
			<s:include value="/WEB-INF/jsp/include/personal-data.jsp" />
		</s:if>
	</td>
</s:if>
</tr>
</tbody>
</table>
</s:push>
</s:if>
</body>
</html>