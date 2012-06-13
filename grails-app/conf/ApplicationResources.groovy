modules = {
    application {
        resource url:'js/application.js'
    }
	
	'bootstrap-js' {
		dependsOn 'jquery'
		resource url:'twitter-bootstrap/js/bootstrap-alert.js'
		resource url:'twitter-bootstrap/js/bootstrap-button.js'
		resource url:'twitter-bootstrap/js/bootstrap-carousel.js'
		resource url:'twitter-bootstrap/js/bootstrap-collapse.js'
		resource url:'twitter-bootstrap/js/bootstrap-dropdown.js'
		resource url:'twitter-bootstrap/js/bootstrap-modal.js'
		resource url:'twitter-bootstrap/js/bootstrap-popover.js'
		resource url:'twitter-bootstrap/js/bootstrap-scrollspy.js'
		resource url:'twitter-bootstrap/js/bootstrap-tab.js'
		resource url:'twitter-bootstrap/js/bootstrap-tooltip.js'
		resource url:'twitter-bootstrap/js/bootstrap-transition.js'
		// left out typeahead, no plans for it
	} 

	// includes bootstrap and responsive bootstrap
	'custom-bootstrap' {
		dependsOn 'bootstrap-js'
		resource url:[dir: 'twitter-bootstrap/less', file: 'custom-bootstrap.less'], attrs:[rel: "stylesheet/less", type:'css']
	}
	
	'perifer-timepicker' {
		resource url:'perifer-timepicker/jquery.timePicker.js'
		resource url:'perifer-timepicker/timePicker.css'
	}
}
