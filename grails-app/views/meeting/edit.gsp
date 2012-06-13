<%@ page import="ocjug.juggernaut.Meeting" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'meeting.label', default: 'Meeting')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
		<r:require modules="perifer-timepicker"/>
	</head>
	<body>
		<a href="#edit-meeting" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="edit-meeting" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${meetingInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${meetingInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form method="post" >
				<g:hiddenField name="id" value="${meetingInstance?.id}" />
				<g:hiddenField name="version" value="${meetingInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="btn btn-primary" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					<%--<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />--%>
					<%--<a class="btn btn-primary" href="javascript: submitform()" ><i class="icon-ok icon-white"></i> ${message(code: 'default.button.update.label', default: 'Update')}</a>--%>
					<g:link class="btn btn-danger" action="delete" id="${meetingInstance?.id}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" ><i class="icon-trash icon-white"></i> ${message(code: 'default.button.delete.label', default: 'Delete')}</g:link>
				</fieldset>
			</g:form>
		</div>
	    <script type="text/javascript">
			jQuery(function() {
				// An example how the two helper functions can be used to achieve 
			    // advanced functionality.
			    // - Linking: When changing the first input the second input is updated and the
			    //   duration is kept.
			    // - Validation: If the second input has a time earlier than the firs input,
			    //   an error class is added.
			    
			    // Use default settings
			    $("#startTime, #endTime").timePicker({show24Hours: false});
			        
			    // Store time used by duration.
			    var oldTime = $.timePicker("#startTime").getTime();
			    
			    // Keep the duration between the two inputs.
			    $("#startTime").change(function() {
			      if ($("#endTime").val()) { // Only update when second input has a value.
			        // Calculate duration.
			        var duration = ($.timePicker("#endTime").getTime() - oldTime);
			        var time = $.timePicker("#startTime").getTime();
			        // Calculate and update the time in the second input.
			        $.timePicker("#endTime").setTime(new Date(new Date(time.getTime() + duration)));
			        oldTime = time;
			      }
			    });
			    // Validate.
			    $("#endTime").change(function() {
			      if($.timePicker("#startTime").getTime() > $.timePicker(this).getTime()) {
			        $(this).addClass("error");
			      }
			      else {
			        $(this).removeClass("error");
			      }
			    });
			    
			  });
		  </script>

	</body>
</html>
