package ocjug.juggernaut

class Location {
	
	static constraints = {
		name blank: false
		link url: true
		street blank: false
		unit()
		city blank: false
		state blank: false, minSize: 2, maxSize: 2
		postalCode()
	}
	
	String name
	String link
	String street
	String unit
	String city
	String state
	String postalCode
	
	String toString() {
		name
	}
}
