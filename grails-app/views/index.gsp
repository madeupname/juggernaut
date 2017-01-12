<!doctype html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<link href='http://fonts.googleapis.com/css?family=Neuton:200,400,700,800,400italic' rel='stylesheet' type='text/css'>
    	<title>Orange County Java User Group</title>
	</head>
	<body>
		<div class="container">
			<!-- Main hero unit for a primary marketing message or call to action -->
			<div class="hero-unit">
				<h1>Next Meeting</h1>
				<p>
					Our next meeting is on <strong>${meeting?.meetingDate.format('EEEE, MMMM d, yyyy')}</strong>. The topic
					is <strong>"${meeting.title ?: "TBA"}"</strong>.
				</p>
				<p>
					<g:link class="btn btn-primary btn-large" controller="meeting" action="show" id="${meeting?.id}">More Details &raquo;</g:link>
				</p>
			</div>
		</div>  <!-- /container -->
	</body>
</html>
