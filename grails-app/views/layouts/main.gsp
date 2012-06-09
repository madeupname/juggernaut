<!doctype html>
<html lang="en">
	<head>
	    <meta charset="utf-8">
		<title><g:layoutTitle default="Orange County Java User Group"/></title>
		<%--<link href='http://fonts.googleapis.com/css?family=Neuton:200,400,700,800,400italic' rel='stylesheet' type='text/css'> --%>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
	    <!--[if lt IE 9]>
	      <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
	    <![endif]-->
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
		<r:require modules="custom-bootstrap"/>
		<g:layoutHead/>
        <r:layoutResources />
        </head>
	<body>
		
		<div class="navbar">
			<div class="navbar-inner">
				<div class="container">
					<div class="row-fluid">
						<div class="span12">
							<a class="btn btn-navbar" data-toggle="collapse"
								data-target=".nav-collapse"> <span class="icon-bar"></span> <span
								class="icon-bar"></span> <span class="icon-bar"></span>
							</a> 
							<g:link class="brand" controller="index" style="background: url(${resource(dir: 'images', file: 'ocjug-logo-sm.png')}) center no-repeat;">Orange County Java User Group</g:link>
							<div class="nav-collapse">
								<ul class="nav nav-pills">
									<li class="active"><g:link controller="index">Home</g:link></li>
									<li><a href="#about">About</a></li>
									<li><g:link controller="meeting" action="list">Meetings</g:link></li>
									<li><a href="#present">Presentations</a></li>
									<li><a href="#register">Register</a></li>
									<li><a href="#contact">Contact</a></li>
								</ul>
							</div>
							<!--/.nav-collapse -->
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="container">
			<g:layoutBody/>
		</div>
	
		<div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
		<g:javascript library="application"/>
        <r:layoutResources />
	</body>
</html>