<%@ page import="ocjug.juggernaut.Location" %>



<div class="fieldcontain ${hasErrors(bean: locationInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="location.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${locationInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: locationInstance, field: 'link', 'error')} ">
	<label for="link">
		<g:message code="location.link.label" default="Link" />
		
	</label>
	<g:field type="url" name="link" value="${locationInstance?.link}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: locationInstance, field: 'street', 'error')} required">
	<label for="street">
		<g:message code="location.street.label" default="Street" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="street" required="" value="${locationInstance?.street}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: locationInstance, field: 'unit', 'error')} ">
	<label for="unit">
		<g:message code="location.unit.label" default="Unit" />
		
	</label>
	<g:textField name="unit" value="${locationInstance?.unit}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: locationInstance, field: 'city', 'error')} required">
	<label for="city">
		<g:message code="location.city.label" default="City" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="city" required="" value="${locationInstance?.city}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: locationInstance, field: 'state', 'error')} required">
	<label for="state">
		<g:message code="location.state.label" default="State" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="state" maxlength="2" required="" value="${locationInstance?.state}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: locationInstance, field: 'zipCode', 'error')} ">
	<label for="zipCode">
		<g:message code="location.zipCode.label" default="Zip Code" />
		
	</label>
	<g:textField name="zipCode" value="${locationInstance?.zipCode}"/>
</div>

