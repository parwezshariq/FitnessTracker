<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Minutes Page</title>

<script type="text/javascript" src="jquery-3.3.1.js"></script>

<script type="text/javascript">
	$(document).ready(
		function() {
			$.getJSON('<spring:url value="activities.json"/>', {
				ajax : 'true'
			}, function(data){
				var html = '<option value="">--Please select one--</option>';
				var len = data.length;
				for(var i = 0; i < len; i++) {
					html += '<option value"' + data[i].desc + '">'
					 + data[i].desc + '</option>';
				}
				html += '</option>';
				
				$('#activities').html(html);
			});
		});
</script>

</head>
<body>
<h1>Add Minutes Exercised</h1>

Language : <a href="?language=en">English</a> | <a href="?language=es">Spanish</a>

<form:form commandName="exercise">
	<table>
		<tr>
			<td><spring:message code="goal.text" /></td>
			<td><form:input path="minutes"/></td>
			<td><form:select id="activities" path="activity"/></td>
		</tr>
		<tr>
			<td colspan="3">
				<input type="submit" value="Enter Exercise"/>
			</td>
		</tr>
	</table>
</form:form>

<h1>Our goal for the day is: ${goal.minutes}</h1>

</body>
</html>