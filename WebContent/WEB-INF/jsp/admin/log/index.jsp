<%@ include file="/common/taglibs.jsp"%>

<html>
<head>
<title>Log manager</title>
</head>
<body>
<h1>Manage loggers</h1>
<div class="row">
<div iita:helptoc="tools/log" class="col-xs-12 col-md-3"><s:form method="post" action="log!level">
	<s:select name="level" value="INFO" list="{'TRACE', 'DEBUG', 'INFO', 'WARN', 'ERROR', 'FATAL', 'ALL'}" cssClass="form-control" />
	<s:textfield name="name" cssClass="form-control"/>
	<s:submit value="Add logger" cssClass="btn btn-primary btn-md btn-block"/>
</s:form></div>

<div iita:helptoc="tools/log"  class="col-xs-12 col-md-3">
<s:iterator value="loggers.{? #this.level!=null}">
	<div>
	<s:form method="post" action="log!level">
		<s:hidden name="name" value="%{name}" />
		<s:select  cssClass="form-control"  name="level" value="%{level}" list="{'', 'TRACE', 'DEBUG', 'INFO', 'WARN', 'ERROR', 'FATAL', 'ALL'}" onchange="javascript: this.form.submit();" />
	</s:form><b><s:property value="name" /></b> <s:property value="level==null ? 'null' : level" /> <s:property value="parent.name" />
	</div>
</s:iterator>
</div>
</div>
<hr>
<h3>All available loggers</h3>
<table class="table table-responsive table-striped">
<colgroup><col width="50" /><col width="150" /><col /></colgroup>
<thead>
<tr><td>Level</td><td>Group</td><td>Logger name</td></tr>
</thead>
<s:iterator value="loggers.{? #this.level==null }">
	<tr><td><s:property value="effectiveLevel" /></td><td><s:property value="parent.name" /></td><td class="identifying"><s:property value="name" /></td></tr>
</s:iterator>
</table>
</body>
</html>