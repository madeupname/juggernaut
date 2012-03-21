package ocjug.juggernaut

/**
 * Meeting location. It is currently US-centric.
 * 
 * TODO: i18n to support provinces, postal codes
 * 
 * @author Philip Yurchuk
 *
 */
class Location {
	
	static constraints = {
		// Name is displayed in the Location option menu when creating a Meeting, so make unique to avoid confusion
		name blank: false, unique: true 
		link url: true, nullable: true
		street blank: false
		unit nullable: true
		city blank: false
		state blank: false, minSize: 2, maxSize: 2
		zipCode nullable: true
	}
	
	String name
	String link
	String street
	String unit
	String city
	String state
	String zipCode
	
	String toString() {
		name
	}
}
